///@func draw_text_outline(x, y, string, textColor1, textColor2, textAlpha, outlineColor1, outlineColor2, outlineAlpha, width, quality, xScale, yScale, angle);
///@param {number} x X coordinate of the text
///@param {number} y Y coordinate of the text
///@param {string} string The text to draw
///@param {number} width The width of the outline
///@param {number} quality The quality of the outline
///@param {color} textColor1 First color of the text
///@param {color} textColor2 Second color of the text
///@param {float} textAlpha The transparency of the text
///@param {color} outlineColor1 First color of the outline
///@param {color} outlineColor2 Second color of the outline
///@param {float} outlineAlpha The transparency of the text
///@param {float} xScale The X scale of the text
///@param {float} yScale The Y scale of the text
///@param {float} angle The angle of the text
var _x = argument[0],
	_y = argument[1],
	_text = argument[2],
	_width = (argument_count > 3) ? argument[3] : 1,
	_quality = (argument_count > 4) ? argument[4] : 4,
	_tC1 = (argument_count > 5) ? argument[5] : draw_get_color(),
	_tC2 = (argument_count > 6) ? argument[6] : _tC1,
	_tAlpha = (argument_count > 7) ? argument[7] : 1,
	_oC1 = (argument_count > 8) ? argument[8] : c_black,
	_oC2 = (argument_count > 9) ? argument[9] : _oC1,
	_oAlpha = (argument_count > 10) ? argument[10] : 1,
	_xScale = (argument_count > 11) ? argument[11] : 1,
	_yScale = (argument_count > 12) ? argument[12] : 1,
	_angle = (argument_count > 13) ? argument[13] : 0;

for (var i = 0; i < 360; i += 360 / _quality){
    draw_text_transformed_color(_x + lengthdir_x(_width, i), _y + lengthdir_y(_width, i), string(_text), _xScale, _yScale, _angle, _oC1, _oC1, _oC2, _oC2, _oAlpha);
}
draw_text_transformed_color(_x, _y, string(_text), _xScale, _yScale, _angle, _tC1, _tC1, _tC2, _tC2, _tAlpha);