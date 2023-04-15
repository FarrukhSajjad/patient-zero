Shader "TidalFlask/Top Projection Noise Normal URP" {
	Properties {
		[HideInInspector] _AlphaCutoff ("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HideInInspector] _EmissionColor ("Emission Color", Vector) = (1,1,1,1)
		[ASEBegin] [NoScaleOffset] _BaseTexture ("Base Texture", 2D) = "white" {}
		[Toggle(COVERAGE_BASE_SCALE_GLOBAL)] _CoverageBaseScaleGlobal ("Coverage Base Scale Global", Float) = 1
		_CoverageBaseScale ("Coverage Base Scale", Range(0, 5)) = 0.85
		_BaseTextureTint ("Base Texture Tint", Vector) = (1,1,1,0)
		_BaseTextureSaturation ("Base Texture Saturation", Range(0, 2)) = 1
		[NoScaleOffset] _BaseNormal ("Base Normal", 2D) = "white" {}
		[NoScaleOffset] _TopTexture ("Top Texture", 2D) = "white" {}
		_TopTextureTint ("Top Texture Tint", Vector) = (1,1,1,0)
		_TopTextureTiling ("Top Texture Tiling", Float) = 1
		[NoScaleOffset] _TopNormal ("Top Normal", 2D) = "white" {}
		_NormalStrength ("Normal Strength", Float) = 1
		_CoverageAmount ("Coverage Amount", Range(-2, 1)) = -1
		_CoverageFalloff ("Coverage Falloff", Range(0.01, 2)) = 0.15
		_CoverageNoiseScale ("Coverage Noise Scale", Range(0, 5)) = 0.85
		[ASEEnd] _Smoothness ("Smoothness", Range(0, 1)) = 0
		[HideInInspector] _texcoord ("", 2D) = "white" {}
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			o.Albedo = 1;
		}
		ENDCG
	}
	Fallback "Hidden/InternalErrorShader"
	//CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
}