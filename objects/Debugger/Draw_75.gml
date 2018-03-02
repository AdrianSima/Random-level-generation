/// @description Draw debug text
if (!debug_) exit;

// Draw debug info
var _text_row = 1;
draw_text(5, (_text_row++) * str_height, "need_redraw:" + (need_redraw_ ? "true":"false"));
draw_text(5, (_text_row++) * str_height, "auto_generate:" + (auto_generate ? "true":"false"));
if (instance_exists(o_level)) {
	draw_text(5, (_text_row++) * str_height, "orphan_walls:" + (o_level.orphan_walls ? "true":"false"));
	draw_text(5, (_text_row++) * str_height, "double_walls:" + (o_level.double_walls ? "true":"false"));
}
if (instance_exists(Camera)) {
	draw_text(5, (_text_row++) * str_height, "zoom:" + string(Camera.zoom));
	draw_text(5, (_text_row++) * str_height, "zoom_target:" + string(Camera.zoom_target));
}