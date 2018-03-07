if keyboard_check_pressed(vk_f1) {
	debug_info_ = !debug_info_;
}
else if keyboard_check_pressed(vk_f5) { 
	game_restart();
}
else if keyboard_check_pressed(vk_escape) { 
	game_end();
}
else if keyboard_check_pressed(vk_f2) { 
	debug_ = !debug_;
}
else if keyboard_check_pressed(vk_f3) { 
	debug_overlay_ = !debug_overlay_; 
	show_debug_overlay(debug_overlay_);
}
else if keyboard_check_pressed(vk_f4) { 
	auto_generate = !auto_generate;
}
else if (debug_ and keyboard_check_pressed(ord("F"))) {
	draw_floor_area = !draw_floor_area;
	need_redraw_ = true;
}
else if(keyboard_check_pressed(vk_add)) with o_player { maxSpeed += .5; }
else if(keyboard_check_pressed(vk_subtract)) with o_player { maxSpeed -= .5; }
else if(keyboard_check_pressed(ord("M"))) {
	var _layer_above = layer_get_id("WallTilesAbove"),
		_layer_below = layer_get_id("WallTilesBelow");
	layer_set_visible(_layer_above, !layer_get_visible(_layer_above));
	layer_set_visible(_layer_below, !layer_get_visible(_layer_below));
}

if (mouse_check_button_pressed(mb_left) && instance_exists(o_level)){
	var _x = mouse_x div CELL_WIDTH,
		_y = mouse_y div CELL_HEIGHT;
		cell_x = _x * CELL_WIDTH;
		cell_y = _y * CELL_HEIGHT;
	
	if (o_level.grid_[# _x, _y] == WALL) {
		with (o_level) {
			// This is a wall tile, but which wall
			var	_nw_tile	= grid_[# _x - 1, _y - 1]	== WALL,
				_n_tile		= grid_[# _x,	  _y - 1]	== WALL,
				_ne_tile	= grid_[# _x + 1, _y - 1]	== WALL,
				_w_tile		= grid_[# _x - 1, _y	]	== WALL,
				_e_tile		= grid_[# _x + 1, _y	]	== WALL,
				_sw_tile	= grid_[# _x - 1, _y + 1]	== WALL,
				_s_tile		= grid_[# _x,	  _y + 1]	== WALL,
				_se_tile	= grid_[# _x + 1, _y + 1]	== WALL;
		}
				
		cell_tile_index = NORTH_WEST * _nw_tile + NORTH * _n_tile + NORTH_EAST * _ne_tile + 
						  WEST * _w_tile + EAST * _e_tile + 
						  SOUTH_WEST * _sw_tile + SOUTH * _s_tile + SOUTH_EAST * _se_tile;
		cell_mapped_index = tile_index_map_get(cell_tile_index);
	}
	else {
		cell_tile_index = noone;
		cell_mapped_index = noone;
		cell_x = _x * noone;
		cell_y = _y * noone;
		cell_tile_x = noone;
		cell_tile_y = noone;
	}
	cell_tile_x = noone;
	cell_tile_y = noone;
}
else if (mouse_check_button_pressed(mb_right) && instance_exists(o_level)){
	var _x = mouse_x div CELL_WIDTH,
		_y = mouse_y div CELL_HEIGHT;
		
	if (cell_tile_x == _x and cell_tile_y == _y) {
		cell_x = _x * noone;
		cell_y = _y * noone;
		cell_tile_x = noone;
		cell_tile_y = noone;
	}
	else {
		cell_x = _x * CELL_WIDTH;
		cell_y = _y * CELL_HEIGHT;
		cell_tile_x = _x;
		cell_tile_y = _y;
	}
	cell_tile_index = noone;
	cell_mapped_index = noone;
		
}
else if (mouse_check_button_pressed(mb_middle)) {
	var garbage_id = instance_position(mouse_x, mouse_y, garbage);
	if (garbage_id == noone) {
		instance_create_layer((mouse_x div CELL_WIDTH) * CELL_WIDTH, (mouse_y div CELL_HEIGHT) * CELL_HEIGHT, "Level", garbage);
	}
	else {
		instance_destroy(garbage_id);
	}
}