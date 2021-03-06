#include "envMapHF.hlsli"

CBUFFER(CubemapRenderCB, CBSLOT_RENDERER_CUBEMAPRENDER)
{
	float4x4 xCubeShadowVP[6];
}

[maxvertexcount(18)]
void main(triangle VSOut_Sky input[3], inout TriangleStream< PSIn_Sky > CubeMapStream)
{
	for (int f = 0; f < 6; ++f)
	{
		PSIn_Sky output;
		output.RTIndex = f;
		for (uint v = 0; v < 3; v++)
		{
			output.pos = mul(input[v].pos, xCubeShadowVP[f]);
			output.nor = input[v].nor;
			CubeMapStream.Append(output);
		}
		CubeMapStream.RestartStrip();
	}
}