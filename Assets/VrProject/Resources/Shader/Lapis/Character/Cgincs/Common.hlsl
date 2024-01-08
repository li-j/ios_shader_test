
//Fresnel Empricial Approximation
inline half FresnelEmpricial(float Bias, float Scale, float d, float Power)
{
	return max(0, min(1, Bias + Scale * pow(1.0 - d, Power)));
}

//specular

inline float PhongSpecular(float3 viewDir, float3 lightDir, float3 normal, float shininess)
{
	float3 reflectDir = normalize(reflect(-lightDir, normal));
	float rdv = max(0, dot(reflectDir, viewDir));
	float specular = pow(rdv, shininess * 0.25);
	return specular;
}

inline float BlinnPhongSpecular(float3 viewDir, float3 lightDir, float3 normal, float shininess)
{
	half3 halfDir = normalize(lightDir + viewDir);
	float ndh = max(0, dot(normal, halfDir));
	float specular = pow(ndh, shininess);
	return specular;
}

//defined in URP
// inline float3 ShiftTangent(float3 T, float3 N, float shift)
// {
// 	float3 shiftedT = T + shift * N;
// 	return normalize(shiftedT);
// }

//Kajiya-Kay
inline float StrandSpecular(float3 viewDir, float3 lightDir, float3 tangent, float shininess)
{
	float3 halfDir = normalize(lightDir + viewDir);
	float tdh = dot(tangent, halfDir);
	float sinTH = sqrt(1.0 - tdh * tdh);
	float dirAtten = smoothstep(-1.0, 0.0, tdh);
	float specular = dirAtten * pow(sinTH, shininess);
	return specular;
}

//Circle
inline float AnisotropicSpecular(float3 viewDir, float3 lightDir, float3 normal, float3 anisoDir, float anisoOffset, float shininess)
{
	float3 halfDir = normalize(lightDir + viewDir);
	float ndh = dot(normalize(normal + anisoDir), halfDir);
	float aniso = max(0, sin(radians((ndh + anisoOffset) * 180)));
	float specular = saturate(pow(aniso, shininess));
	return specular;
}