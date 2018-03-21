/// @description Draw debug text
if (!debug_ or !debug_info_) exit;

// Draw debug info
var _text_row = 1;
draw_text(5, (_text_row++) * str_height, "need_redraw:" + (need_redraw_ ? "true":"false"));
draw_text(5, (_text_row++) * str_height, "auto_generate:" + (auto_generate ? "true":"false"));
_text_row++;
if (instance_exists(o_level)) {
	draw_text(5, (_text_row++) * str_height, "orphan_walls:" + (o_level.orphan_walls ? "true":"false"));
}
_text_row++;
if (instance_exists(Camera)) {
	draw_text(5, (_text_row++) * str_height, "zoom:" + string(Camera.zoom));
	draw_text(5, (_text_row++) * str_height, "zoom_target:" + string(Camera.zoom_target));
}
_text_row++;
if (instance_exists(o_player)) {
	draw_text(5, (_text_row++) * str_height, "h_input:" + string(o_player.h_input));
	draw_text(5, (_text_row++) * str_height, "v_input:" + string(o_player.v_input));
	draw_text(5, (_text_row++) * str_height, "xSpeed:" + string(o_player.xSpeed));
	draw_text(5, (_text_row++) * str_height, "ySpeed:" + string(o_player.ySpeed));
	draw_text(5, (_text_row++) * str_height, "maxSpeed:" + string(o_player.maxSpeed));
	_text_row++;
	draw_text(5, (_text_row++) * str_height, "position: [" + string(o_player.x) + "," + string(o_player.y) + "]");
	draw_text(5, (_text_row++) * str_height, "tile: [" + string(o_player.x div CELL_WIDTH) + "," + string(o_player.y div CELL_HEIGHT) + "]");
}
_text_row++;
draw_text(5, (_text_row++) * str_height, "above_layer_alpha:" + string(o_level.above_layer_alpha));