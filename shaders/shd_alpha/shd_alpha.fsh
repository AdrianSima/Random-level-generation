//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_alpha;

void main()
{
	float _x = (v_vTexcoord.x * 2047.0 - 1.0);
	float _y = (v_vTexcoord.y * 2047.0 - 1.0);
	float _alpha = u_alpha;
	
	if (mod((_x + mod(_y, 2.0)), 2.0) >= 0.5) {
		_alpha = 0.0;
	}
	
    vec4 _color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if (_color.a == 0.0 || u_alpha == 0.0) discard;
	//_color.r = mod(_x, 2.0);
	//_color.g = 0.0;
	//_color.b = mod(_y, 2.0);
	
	_color.a = _alpha;
	gl_FragColor = _color;
}
