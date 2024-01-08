Shader "Lapis/Character/Body Feature Cutout"
{
    Properties
    {
		[HideInInspector] _Color("Color", Color) = (1,1,1,1)

        _MainTex("Main Texture(RGB:Color)", 2D) = "white" {}
		_ShadeTex("Shade Texture(RGB:Color, A:Ambient Occlusion)", 2D) = "white" {}
		_SpecularTex("Specular Texture(RGB:Color, A:Power)", 2D) = "black" {}
		_FeatureTex("Featrue (R:Ramp(Soft:0, Hard:1) G:Aniso(Off:0, On:1) B:Rim A:Emission)", 2D) = "white" {}
		[KeywordEnum(CIRCLE,KAJIYAKAY_T)]ANISOMODE("Aniso Mode", Float) = 0
		_AnisoOffset("Aniso Offset",Range(-1, 1)) = 0
		[HDR]_Emission("Emission", Color) = (0,0,0,0)
		_RimParam("Rim Param(x:bias,y:scale,z:power,w:strength)", Vector) = (-1, 10, 5, 1)
		_Cutoff("Alpha Cutoff", Range(0.0, 1.0)) = 0.5

		_Outline("Outline", float) = 1.2
		[HDR]_OutlineColor("OutlineColor", Color) = (0.1098, 0.0625, 0.023, 1.0)
    }

    SubShader//LOD400
    {
        Tags { "RenderType"="TransparentCutout" "Queue" = "AlphaTest" "LightMode"="UniversalPipeline"}

        Pass
        {
            Name "BASE"
            Tags { "LightMode" = "UniversalForward" }

            HLSLPROGRAM
			#pragma target 3.0
			#pragma skip_variants LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON
			#pragma multi_compile_local ANISOMODE_CIRCLE ANISOMODE_KAJIYAKAY_T
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
            #pragma vertex vert
            #pragma fragment frag
			#define ALPHA_TEST
			#define SPECULARLIGHT
			#define RIMLIGHT
			#include "Cgincs/Body Feature.hlsl"
            ENDHLSL
        }

		Pass//Outline
		{
			Name "OUTLINE"
			Tags { "LightMode" = "SRPDefaultUnlit" }

			Cull Front

			HLSLPROGRAM
			#pragma target 3.0
			#pragma vertex vert
			#pragma fragment frag
			#define ALPHA_TEST
			#include "Cgincs/Outline.hlsl"
			ENDHLSL
		}
    }

	FallBack "Mason/ShadowCaster"
}
