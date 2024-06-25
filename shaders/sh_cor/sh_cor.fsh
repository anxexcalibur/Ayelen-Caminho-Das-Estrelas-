//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 cor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	cor.rgb = vec3(.82,0.53,1.0);
    gl_FragColor = cor;
}
