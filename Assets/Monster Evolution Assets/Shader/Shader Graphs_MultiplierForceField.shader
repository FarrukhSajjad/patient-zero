Shader "Shader Graphs/MultiplierForceField" {
	Properties {
		Vector1_5CDD049 ("Intersection Offset", Float) = 0
		Color_813E239F ("Emission", Vector) = (0,0.8401954,0.8490566,0)
		Vector1_213B2491 ("Fresnel Power", Float) = 5
		[NoScaleOffset] Texture2D_BFF17AF6 ("Pattern", 2D) = "white" {}
		Vector1_80BCB61E ("ScrollSpeed", Float) = 0.05
		Vector1_B07B61C1 ("Fill", Float) = 0.01
		[HideInInspector] _QueueOffset ("_QueueOffset", Float) = 0
		[HideInInspector] _QueueControl ("_QueueControl", Float) = -1
		[HideInInspector] [NoScaleOffset] unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
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
	Fallback "Hidden/Shader Graph/FallbackError"
	//CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
}