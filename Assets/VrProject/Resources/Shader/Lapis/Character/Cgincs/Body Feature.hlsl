// Upgrade NOTE: replaced 'defined RIMLIGHT' with 'defined (RIMLIGHT)'

#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
#include "Cgincs/CelShading.hlsl"

struct appdata
{
	float4 vertex : POSITION;
	float2 uv : TEXCOORD1;
	float3 normal : NORMAL;
#if defined(ANISOMODE_KAJIYAKAY_T) || defined(ANISOMODE_KAJIYAKAY_B)
	float3 tangent : TANGENT;
#endif
};

struct v2f
{
	float4 pos : SV_POSITION;
	float2 uv : TEXCOORD0;
	float3 position : TEXCOORD1;
	float3 light : TEXCOORD2;
	float3 view : TEXCOORD3;
	float3 normal : TEXCOORD4;
#if defined(ANISOMODE_KAJIYAKAY_T) || defined(ANISOMODE_KAJIYAKAY_B)
	float3 tangent : TEXCOORD5;
	float3 binormal : TEXCOORD6;
#endif
	float4 shadowCoord : TEXCOORD7;
};

CBUFFER_START(UnityPerMaterial)
TEXTURE2D(_MainTex);
SAMPLER(sampler_MainTex);

TEXTURE2D(_ShadeTex);
SAMPLER(sampler_ShadeTex);

TEXTURE2D(_SpecularTex);
SAMPLER(sampler_SpecularTex);

TEXTURE2D(_FeatureTex);
SAMPLER(sampler_FeatureTex);

half4 _Color;
half _AnisoOffset;
half4 _Emission;
half4 _RimParam;
half _SceneRim;
half4 _RimColor;
#ifdef ALPHA_TEST
half _Cutoff;
#endif
half _LightRadiance = 1.0;

CBUFFER_END

v2f vert(appdata v)
{
	v2f o;
	VertexPositionInputs vertexInput = GetVertexPositionInputs(v.vertex.xyz);

	o.pos = vertexInput.positionCS;
	o.uv = v.uv;
	o.position = mul(unity_ObjectToWorld, v.vertex).xyz;

	o.view = MasonWorldSpaceViewtDir(o.position.xyz);
	o.light = MasonWorldSpaceLightDir(o.position.xyz);
	

	VertexNormalInputs vertexNormalInput = GetVertexNormalInputs(v.normal);
	o.normal = NormalizeNormalPerVertex(vertexNormalInput.normalWS);
#if defined(ANISOMODE_KAJIYAKAY_T) || defined(ANISOMODE_KAJIYAKAY_B)
	VertexNormalInputs verTangentInput = GetVertexNormalInputs(v.tangent);
	o.tangent = NormalizeNormalPerVertex(verTangentInput.normalWS);
	o.binormal = cross(o.normal, o.tangent);
#endif
	o.shadowCoord = GetShadowCoord(vertexInput);

	return o;
}

float4 frag(v2f i) : SV_Target
{
	half4 main = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, i.uv);
#ifdef ALPHA_TEST
	clip(main.a - _Cutoff);
#endif
	half4 shade = SAMPLE_TEXTURE2D( _ShadeTex, sampler_ShadeTex, i.uv);
	half4 specular = SAMPLE_TEXTURE2D( _SpecularTex, sampler_SpecularTex, i.uv);
	half4 feature = SAMPLE_TEXTURE2D( _FeatureTex, sampler_FeatureTex, i.uv);

	half3 N = normalize(i.normal);
	half3 V = normalize(i.view);
	half3 L = normalize(i.light);
#if defined(ANISOMODE_KAJIYAKAY_T) || defined(ANISOMODE_KAJIYAKAY_B)
	half3 T = normalize(i.tangent);
	half3 B = normalize(i.binormal);
#endif
	half3 H = normalize(V + L);

	half NdotL = dot(N, L);
	half NdotV = dot(N, V);
	half NdotH = dot(N, H);

#if defined(ANISOMODE_KAJIYAKAY_T)
	half TdotH = dot(T + N * _AnisoOffset, H);
#elif defined(ANISOMODE_KAJIYAKAY_B)
	half BdotH = dot(B + N * _AnisoOffset, H);
#endif

	half ao = shade.a;
	half ramp = feature.r * 0.5;
	half oneMinusRamp = 1.0 - ramp;
	half aniso = feature.g;
	half rim = feature.b;
	half emission = feature.a;
	half shiness = specular.a * 128.0;

	//shadow
	Light mainLight = GetMainLight(i.shadowCoord);

	//Celshading
	half halfLambert = NdotL * 0.5 + 0.5;
	half diffuseRamp = smoothstep(ramp, oneMinusRamp, halfLambert) * mainLight.shadowAttenuation;
	half3 baseColor = CelShading(diffuseRamp, ao, main.rgb, shade.rgb);

	//Rim
	half rimTerm = DirectionalRimLight(NdotL, NdotV, _RimParam);
	half3 rimColor = lerp(baseColor, _RimColor, _SceneRim) * rimTerm * rim;

	//Specular(BlinnPhong/Anisotropic)
	half blinnPhongTerm = saturate(NdotH);
#if defined(ANISOMODE_KAJIYAKAY_T)
	half anisoTerm = sqrt(1.0 - TdotH * TdotH);
	half specularTerm = saturate(lerp(1.0, smoothstep(-1.0, 0.0, TdotH), aniso) * pow(max(0.01, lerp(blinnPhongTerm, anisoTerm, aniso)), shiness));
#elif defined(ANISOMODE_KAJIYAKAY_B)
	half anisoTerm = sqrt(1.0 - BdotH * BdotH);
	half specularTerm = saturate(lerp(1.0, smoothstep(-1.0, 0.0, BdotH), aniso) * pow(max(0.01, lerp(blinnPhongTerm, anisoTerm, aniso)), shiness));
#else//CIRCLE
	half anisoTerm = max(0, sin((NdotH + _AnisoOffset) * UNITY_PI));
	half specularTerm = saturate(pow(max(0.01, lerp(blinnPhongTerm, anisoTerm, aniso)), shiness));
#endif
	half specularRamp = smoothstep(ramp, oneMinusRamp, specularTerm);
	half3 specColor = specularRamp * specular.rgb * 2.0;

	//Final
	half4 color = 0;
	color.rgb = baseColor;

#if defined (SPECULARLIGHT)
	color.rgb += specColor;
#endif

#if defined (RIMLIGHT)
	color.rgb += rimColor;
#endif
	color.rgb *= _MainLightColor.rgb * _LightRadiance;

	//Emission	
	color.rgb += baseColor.rgb * _Emission.rgb * emission;
	color.rgb *= _Color.rgb;

#ifdef ALPHA_BLEND
	color.a = main.a * _Color.a;
#else
	color.a = main.a;
#endif


	return color;
}