/// @description 
if keyboard_check_pressed(ord("R")) {
	if (room = rm_test) room_goto_next();
	else generate_random_level(!orphan_walls);
}
else if keyboard_check_pressed(ord("Y")) {
	orphan_walls = !orphan_walls;
}

if (above_layer_alpha != above_layer_alpha_target) {
	above_layer_alpha += sign(above_layer_alpha_target - above_layer_alpha) * 0.05;
}

if (instance_exists(o_player)) {
	var new_alpha = 0.0;
	if (tilemap_get_at_pixel(tile_map_id_above, o_player.x, o_player.y-16) != 0) {
		new_alpha = 0.5;
	}
	else new_alpha = 1.0;
	if (new_alpha != above_layer_alpha_target) {
		above_layer_alpha_target = new_alpha;
	}
}