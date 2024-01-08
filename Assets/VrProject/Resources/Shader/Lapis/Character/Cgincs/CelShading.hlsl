#include "Common.hlsl"

#define UNITY_PI 3.14159265359f

inline float RimLight(float ndv, float4 rimParam)
{
	float rim = FresnelEmpricial(rimParam.x, rimParam.y, saturate(ndv), rimParam.z) * rimParam.w;

	return rim;
}

inline float DirectionalRimLight(float ndl, float ndv, float4 rimParam)
{
	float rim = max(0, ndl) * RimLight(ndv, rimParam);

	return rim;
}

//cel shaing

inline half3 CelShading(float ramp, float ao, half3 baseColor, half3 shadeColor)
{
	half3 color = lerp(baseColor * shadeColor, baseColor, min(ramp, ao));

	return color;
}

inline float3 MasonWorldSpaceLightDir(float3 ws)
{
	return normalize(_MainLightPosition.xyz - ws * _MainLightPosition.w);
}

inline float3 MasonWorldSpaceViewtDir(float3 ws)
{
	return normalize( _WorldSpaceCameraPos.xyz - ws ).xyz;
}



//inline fixed3 CelShading(half ramp, half ao, fixed3 baseColor, fixed3 shadeColor)
//{
//	fixed3 color = lerp(baseColor * shadeColor, baseColor, ramp) * lerp(shadeColor, 1, ao);
//
//	return color;
//}