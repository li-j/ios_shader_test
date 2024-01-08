// Shader created with Shader Forge v1.38
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34209,y:32650,varname:node_3138,prsc:2|emission-459-OUT,alpha-6087-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32403,y:32800,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:7346,x:32403,y:32624,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_7346,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3b91ce8420f68754c95a24d2c2d518cc,ntxv:0,isnm:False|UVIN-3134-OUT;n:type:ShaderForge.SFN_Multiply,id:4981,x:32913,y:32582,varname:node_4981,prsc:2|A-7241-RGB,B-7346-RGB;n:type:ShaderForge.SFN_Tex2d,id:5952,x:32503,y:33175,ptovrint:False,ptlb:TextureMask,ptin:_TextureMask,varname:node_5952,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0ffdb3449b5116447b0050017818366a,ntxv:0,isnm:False|UVIN-7862-OUT;n:type:ShaderForge.SFN_TexCoord,id:5380,x:31327,y:32485,varname:node_5380,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ValueProperty,id:608,x:31186,y:32840,ptovrint:False,ptlb:T1_USpeed,ptin:_T1_USpeed,varname:node_608,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:9098,x:31186,y:32915,ptovrint:False,ptlb:T1_VSpeed,ptin:_T1_VSpeed,varname:node_9098,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Append,id:3583,x:31418,y:32840,varname:node_3583,prsc:2|A-608-OUT,B-9098-OUT;n:type:ShaderForge.SFN_Time,id:781,x:31015,y:32677,varname:node_781,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3496,x:31602,y:32687,varname:node_3496,prsc:2|A-781-T,B-3583-OUT;n:type:ShaderForge.SFN_Add,id:2844,x:31839,y:32517,varname:node_2844,prsc:2|A-3280-OUT,B-3496-OUT;n:type:ShaderForge.SFN_ScreenPos,id:902,x:31043,y:32343,varname:node_902,prsc:2,sctp:0;n:type:ShaderForge.SFN_Multiply,id:3280,x:31592,y:32342,varname:node_3280,prsc:2|A-902-UVOUT,B-5380-UVOUT;n:type:ShaderForge.SFN_SwitchProperty,id:3134,x:32080,y:32581,ptovrint:False,ptlb:T1ScreenUV,ptin:_T1ScreenUV,varname:node_3134,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-4637-OUT,B-2844-OUT;n:type:ShaderForge.SFN_Add,id:4637,x:31839,y:32669,varname:node_4637,prsc:2|A-5380-UVOUT,B-3496-OUT;n:type:ShaderForge.SFN_Clamp01,id:4732,x:33826,y:33067,varname:node_4732,prsc:2|IN-4960-OUT;n:type:ShaderForge.SFN_VertexColor,id:9859,x:33826,y:32811,varname:node_9859,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6087,x:34006,y:32957,varname:node_6087,prsc:2|A-9859-A,B-4732-OUT;n:type:ShaderForge.SFN_Multiply,id:459,x:34015,y:32693,varname:node_459,prsc:2|A-9028-OUT,B-9859-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:6352,x:32855,y:33246,ptovrint:False,ptlb:MaskRChannel,ptin:_MaskRChannel,varname:node_6352,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-5952-A,B-5952-R;n:type:ShaderForge.SFN_Multiply,id:7238,x:33283,y:32293,varname:node_7238,prsc:2|A-6878-OUT,B-4981-OUT,C-5462-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8267,x:32056,y:32287,ptovrint:False,ptlb:TwinkleFrequency,ptin:_TwinkleFrequency,varname:node_8267,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Relay,id:9680,x:32056,y:32393,varname:node_9680,prsc:2|IN-781-T;n:type:ShaderForge.SFN_Sin,id:3796,x:32430,y:32300,varname:node_3796,prsc:2|IN-3430-OUT;n:type:ShaderForge.SFN_Abs,id:534,x:32782,y:32387,varname:node_534,prsc:2|IN-1495-OUT;n:type:ShaderForge.SFN_Multiply,id:3430,x:32245,y:32300,varname:node_3430,prsc:2|A-8267-OUT,B-9680-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5462,x:33000,y:32207,ptovrint:False,ptlb:TwinkleIntensity,ptin:_TwinkleIntensity,varname:node_5462,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_SwitchProperty,id:5451,x:33319,y:32578,ptovrint:False,ptlb:Twinkle,ptin:_Twinkle,varname:node_5451,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-4981-OUT,B-7238-OUT;n:type:ShaderForge.SFN_OneMinus,id:1495,x:32605,y:32387,varname:node_1495,prsc:2|IN-3796-OUT;n:type:ShaderForge.SFN_Add,id:6878,x:32982,y:32303,varname:node_6878,prsc:2|A-5715-OUT,B-534-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5715,x:32735,y:32249,ptovrint:False,ptlb:TwinkleMinIntensity,ptin:_TwinkleMinIntensity,varname:node_5715,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:4552,x:33541,y:32756,varname:node_4552,prsc:2|A-5451-OUT,B-9462-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8600,x:31338,y:33405,ptovrint:False,ptlb:Mask_USpeed,ptin:_Mask_USpeed,varname:_T1_USpeed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:1428,x:31338,y:33480,ptovrint:False,ptlb:Mask_VSpeed,ptin:_Mask_VSpeed,varname:_T1_VSpeed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Append,id:8335,x:31570,y:33405,varname:node_8335,prsc:2|A-8600-OUT,B-1428-OUT;n:type:ShaderForge.SFN_Multiply,id:2282,x:31754,y:33252,varname:node_2282,prsc:2|A-781-T,B-8335-OUT;n:type:ShaderForge.SFN_TexCoord,id:2270,x:31622,y:33050,varname:node_2270,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:7307,x:32060,y:33173,varname:node_7307,prsc:2|A-2270-UVOUT,B-2282-OUT;n:type:ShaderForge.SFN_Multiply,id:1567,x:31849,y:32936,varname:node_1567,prsc:2|A-902-UVOUT,B-2270-UVOUT;n:type:ShaderForge.SFN_Add,id:3685,x:32060,y:33016,varname:node_3685,prsc:2|A-1567-OUT,B-2282-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:7862,x:32298,y:33173,ptovrint:False,ptlb:MaskScreenUV,ptin:_MaskScreenUV,varname:node_7862,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-7307-OUT,B-3685-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:9028,x:33722,y:32633,ptovrint:False,ptlb:TextureBlend,ptin:_TextureBlend,varname:node_9028,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-5451-OUT,B-4552-OUT;n:type:ShaderForge.SFN_Multiply,id:7140,x:33410,y:32994,varname:node_7140,prsc:2|A-9542-OUT,B-1529-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:4960,x:33628,y:33067,ptovrint:False,ptlb:TextureAlphaBlend,ptin:_TextureAlphaBlend,varname:node_4960,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1529-OUT,B-7140-OUT;n:type:ShaderForge.SFN_Color,id:1441,x:32503,y:32982,ptovrint:False,ptlb:MaskColor,ptin:_MaskColor,varname:node_1441,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:9542,x:32834,y:32833,varname:node_9542,prsc:2|A-7346-B,B-7241-A;n:type:ShaderForge.SFN_Multiply,id:1529,x:33201,y:33211,varname:node_1529,prsc:2|A-1441-A,B-6352-OUT;n:type:ShaderForge.SFN_Multiply,id:9462,x:32874,y:32982,varname:node_9462,prsc:2|A-1441-RGB,B-5952-RGB;proporder:7241-7346-1441-5952-608-9098-3134-6352-5451-8267-5462-5715-9028-4960-7862-8600-1428;pass:END;sub:END;*/

Shader "Mason/Effect/WeaMaskBlend" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.5,0.5,0.5,1)
        _Texture ("Texture", 2D) = "white" {}
        [HDR]_MaskColor ("MaskColor", Color) = (0.5,0.5,0.5,1)
        _TextureMask ("TextureMask", 2D) = "white" {}
        _T1_USpeed ("T1_USpeed", Float ) = 0
        _T1_VSpeed ("T1_VSpeed", Float ) = 0
        [MaterialToggle] _T1ScreenUV ("T1ScreenUV", Float ) = 0
        [MaterialToggle] _MaskRChannel ("MaskRChannel", Float ) = 0
        [MaterialToggle] _Twinkle ("Twinkle", Float ) = 0
        _TwinkleFrequency ("TwinkleFrequency", Float ) = 5
        _TwinkleIntensity ("TwinkleIntensity", Float ) = 2
        _TwinkleMinIntensity ("TwinkleMinIntensity", Float ) = 0
        [MaterialToggle] _TextureBlend ("TextureBlend", Float ) = 0
        [MaterialToggle] _TextureAlphaBlend ("TextureAlphaBlend", Float ) = 0
        [MaterialToggle] _MaskScreenUV ("MaskScreenUV", Float ) = 0
        _Mask_USpeed ("Mask_USpeed", Float ) = 0
        _Mask_VSpeed ("Mask_VSpeed", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
            "ForceNoShadowCasting" = "True"
            "RenderPipeline" = "UniversalPipeline"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="UniversalForward"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
            //#pragma only_renderers d3d9 d3d11 glcore gles
            #pragma target 3.0

            CBUFFER_START(UnityPerMaterial)
            uniform half4 _Color;
            TEXTURE2D(_Texture);
            SAMPLER(sampler_Texture);
            uniform half4 _Texture_ST;
            TEXTURE2D(_TextureMask);
            SAMPLER(sampler_TextureMask);
            uniform half4 _TextureMask_ST;
            uniform half _T1_USpeed;
            uniform half _T1_VSpeed;
            uniform half _T1ScreenUV;
            uniform half _MaskRChannel;
            uniform half _TwinkleFrequency;
            uniform half _TwinkleIntensity;
            uniform half _Twinkle;
            uniform half _TwinkleMinIntensity;
            uniform half _Mask_USpeed;
            uniform half _Mask_VSpeed;
            uniform half _MaskScreenUV;
            uniform half _TextureBlend;
            uniform half _TextureAlphaBlend;
            uniform half4 _MaskColor;

            CBUFFER_END
            struct VertexInput {
                float4 vertex : POSITION;
                half2 texcoord0 : TEXCOORD0;
                half4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                half2 uv0 : TEXCOORD0;
                half2 sceneUVs : TEXCOORD1;
                half2 T1ScreenUV : TEXCOORD2;
                half2 MaskUV : TEXCOORD3;
                half4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                
                VertexPositionInputs vertexInput = GetVertexPositionInputs(v.vertex.xyz);

	            o.pos = vertexInput.positionCS;
                half4 projPos = ComputeScreenPos (o.pos);
                
                o.sceneUVs = ((projPos.xy / projPos.w)*2-1).rg*o.uv0;
                o.T1ScreenUV = (_Time.g*half2(_T1_USpeed,_T1_VSpeed));
                o.MaskUV = (_Time.g*half2(_Mask_USpeed,_Mask_VSpeed));
                return o;
            }
            half4 frag(VertexOutput i) : COLOR {
                half4 _Texture_var = SAMPLE_TEXTURE2D(_Texture, sampler_Texture, TRANSFORM_TEX(lerp( (i.uv0+i.T1ScreenUV), (i.sceneUVs+i.T1ScreenUV), _T1ScreenUV ), _Texture));
                
                
                half3 node_4981 = (_Color.rgb*_Texture_var.rgb);
                half3 _Twinkle_var = lerp( node_4981, ((_TwinkleMinIntensity+(1.0 - sin((_TwinkleFrequency*_Time.g))))*node_4981*_TwinkleIntensity), _Twinkle );
                half4 _TextureMask_var = SAMPLE_TEXTURE2D(_TextureMask, sampler_TextureMask, TRANSFORM_TEX(lerp( (i.uv0+i.MaskUV), (i.sceneUVs+i.MaskUV), _MaskScreenUV ), _TextureMask));
                half3 emissive = (lerp( _Twinkle_var, (_Twinkle_var*(_MaskColor.rgb*_TextureMask_var.rgb)), _TextureBlend )*i.vertexColor.rgb);
                half _MaskRChannel_var = lerp( _TextureMask_var.a, _TextureMask_var.r, _MaskRChannel );
                half node_1529 = (_MaskColor.a*_MaskRChannel_var);
                return half4(emissive,(i.vertexColor.a*saturate(lerp( node_1529, ((_Texture_var.b*_Color.a)*node_1529), _TextureAlphaBlend ))));
            }
            ENDHLSL
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
