//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const vec3 weight = vec3(0.2125,0.7154,0.0721);

void main()
{
	vec4 irgba = texture2D(gm_BaseTexture,v_vTexcoord);
	float luminance = dot(irgba.rgb, weight);
	gl_FragColor = vec4(luminance, luminance,luminance, irgba.a);
}
