if keyboard_check_pressed(vk_f5) { 
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

if (mouse_check_button_pressed(mb_left) && instance_exists(o_level)){
	var _x = mouse_x div CELL_WIDTH,
		_y = mouse_y div CELL_HEIGHT;
		cell_x = _x * CELL_WIDTH;
		cell_y = _y * CELL_HEIGHT;
	
	if (o_level.grid_[# _x, _y] == VOID) {
		with (o_level) {
			// This is a wall tile, but which wall
			var	_nw_tile	= grid_[# _x - 1, _y - 1]	== VOID,
				_n_tile		= grid_[# _x,	  _y - 1]	== VOID,
				_ne_tile	= grid_[# _x + 1, _y - 1]	== VOID,
				_w_tile		= grid_[# _x - 1, _y	]	== VOID,
				_e_tile		= grid_[# _x + 1, _y	]	== VOID,
				_sw_tile	= grid_[# _x - 1, _y + 1]	== VOID,
				_s_tile		= grid_[# _x,	  _y + 1]	== VOID,
				_se_tile	= grid_[# _x + 1, _y + 1]	== VOID;
		}
				
		cell_tile_index = NORTH_WEST * _nw_tile + NORTH * _n_tile + NORTH_EAST * _ne_tile + 
						  WEST * _w_tile + EAST * _e_tile + 
						  SOUTH_WEST * _sw_tile + SOUTH * _s_tile + SOUTH_EAST * _se_tile;
		cell_mapped_index = tile_index_map_get(cell_tile_index);
	}
	else {
		cell_tile_index = noone;
		cell_mapped_index = noone;
	}
}