#include "objectHF.hlsli"


float4 main(PixelInputType input) : SV_TARGET
{
	OBJECT_PS_DITHER

	OBJECT_PS_MAKE

	OBJECT_PS_DEGAMMA

	OBJECT_PS_NORMALMAPPING

	OBJECT_PS_DIRECTIONALLIGHT
	
	OBJECT_PS_FOG

	OBJECT_PS_OUT_FORWARD
}

