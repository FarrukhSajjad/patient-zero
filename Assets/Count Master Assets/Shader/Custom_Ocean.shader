Shader "Custom/Ocean" {
	Properties {
		_MainTex ("MainTex", 2D) = "white" {}
		_Amplitude ("Amplitude", Range(0, 1)) = 0.2
		_MinFog ("MinFog", Float) = 0
		_MaxFog ("MaxFog", Float) = 0
		_FogColor ("FogColor", Vector) = (1,1,1,1)
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		sampler2D _MainTex;
		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	//CustomEditor "ASEMaterialInspector"
}