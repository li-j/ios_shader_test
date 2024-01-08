#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"

// 外描边基本宽度[m]
#define _OUTLINE_WIDTH_BASE 0.003

// Z方向推出最大距离[m]
#define _OUTLINE_SHOVE_BASE 0.0007

struct a2v
{
	float4 vertex : POSITION;
	float3 normal : NORMAL;
	float4 tangent : TANGENT;
	float4 color : COLOR;
	//missing float2 uv0 : TEXCOORD0 for adjust tangent
	float2 uv1 : TEXCOORD1;
};

struct v2f
{
	half4 pos : SV_POSITION;
	half2 uv : TEXCOORD0;
};

CBUFFER_START(UnityPerMaterial)
half4 _Color;

TEXTURE2D(_MainTex);
SAMPLER(sampler_MainTex);
float4 _MainTex_ST;

TEXTURE2D(_Mask);
SAMPLER(sampler_Mask);
float4 _Mask_ST;

float _Outline;
half4 _OutlineColor;

#ifdef ALPHA_TEST
half _Cutoff;
#endif
CBUFFER_END


inline void ShoveOutlineDepth(inout float depth, float shoveVal)
{
#if defined(UNITY_REVERSED_Z)
	depth -= _OUTLINE_SHOVE_BASE * saturate(1.0 - shoveVal);
#else
	depth += _OUTLINE_SHOVE_BASE * saturate(1.0 - shoveVal);
#endif
}

inline float3 TransformViewToProjection (float3 v) {
    return mul((float3x3)UNITY_MATRIX_P, v);
}

v2f vert(a2v v)
{
	v2f o;
	VertexPositionInputs vertexInput = GetVertexPositionInputs(v.vertex.xyz);

	o.pos = vertexInput.positionCS;
	
	o.uv = v.uv1;
	
	float4 pos = vertexInput.positionCS;

#if defined(TANGENT_EXTEND)
	float3 viewNormal = mul((float3x3)UNITY_MATRIX_IT_MV, v.tangent.xyz);
	// float3 worldNormal = TransformObjectToWorldNormal(v.tangent);
	// float4 ndcNormal = float4(TransformWorldToHClipDir(worldNormal, true), 0);
#else //NORMAL_EXTEND
	float3 viewNormal = mul((float3x3)UNITY_MATRIX_IT_MV, v.normal.xyz);
	// float3 worldNormal = TransformObjectToWorldNormal(v.normal);
	// float4 ndcNormal = float4(TransformWorldToHClipDir(worldNormal, true), 0);
#endif

	float3 ndcNormal = normalize(TransformViewToProjection(viewNormal.xyz)) * vertexInput.positionNDC.w;
	float4 nearUpperRight = mul(unity_CameraInvProjection, float4(1, 1, UNITY_NEAR_CLIP_VALUE, _ProjectionParams.y));
	float aspect = abs(nearUpperRight.y / nearUpperRight.x);
	float2 offset = 0;
	if (aspect < 1.0)
	{
		offset = float2(ndcNormal.x * aspect, ndcNormal.y);
	}
	else
	{
		offset = float2(ndcNormal.x, ndcNormal.y / aspect);
	}
	o.pos.xy += offset * v.color.r * _Outline * _OUTLINE_WIDTH_BASE;
	ShoveOutlineDepth(o.pos.z, v.color.g);


	return o;
}

half4 frag(v2f i, half facing : VFACE) : COLOR
{

	half4 col = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, i.uv);
#ifdef ALPHA_TEST
	clip(col.a - _Cutoff);
#endif
	//col.a = 1.0 - _Color.a;
	col.rgb *= lerp(1.0, _OutlineColor.rgb, _OutlineColor.a) * _Color.rgb * _MainLightColor.rgb;


	return col;
}