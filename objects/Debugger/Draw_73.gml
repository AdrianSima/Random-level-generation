/// @description Draw debug info
if (!debug_) exit;

if (instance_exists(o_level)) {
	if (need_redraw_) {
		if (!surface_exists(debug_surface_id_)) {
			// Create the debug surface
			debug_surface_id_ = surface_create(room_width, room_height);
		}
		surface_set_target(debug_surface_id_);
		draw_clear_alpha(c_white, 0);
		draw_set_color(c_aqua);
		draw_set_font(f_debug);
		with (o_level) {
			for (var _y = 1; _y < height_; _y += 1) {
				for (var _x = 1; _x < width_; _x += 1) {
					var _cell_pos_x = _x * CELL_WIDTH,
						_cell_pos_y = _y * CELL_HEIGHT;
						
					if (grid_[# _x, _y] != FLOOR) {
						// This is a wall tile, but which wall
						var	_nw_tile	= grid_[# _x - 1, _y - 1]	== VOID,
							_n_tile		= grid_[# _x,	  _y - 1]	== VOID,
							_ne_tile	= grid_[# _x + 1, _y - 1]	== VOID,
							_w_tile		= grid_[# _x - 1, _y	]	== VOID,
							_e_tile		= grid_[# _x + 1, _y	]	== VOID,
							_sw_tile	= grid_[# _x - 1, _y + 1]	== VOID,
							_s_tile		= grid_[# _x,	  _y + 1]	== VOID,
							_se_tile	= grid_[# _x + 1, _y + 1]	== VOID;
				
						var _tile_index = NORTH_WEST * _nw_tile + NORTH * _n_tile + NORTH_EAST * _ne_tile + 
										  WEST * _w_tile + EAST * _e_tile + 
										  SOUTH_WEST * _sw_tile + SOUTH * _s_tile + SOUTH_EAST * _se_tile,
							_mapped_index = tile_index_map_get(_tile_index);
						
						if (_mapped_index == -1) 
						draw_text(_cell_pos_x, _cell_pos_y, string(_tile_index) + "\r\n" + string(_mapped_index));
					}
					else {
						// This is a floor tile
						draw_sprite(s_debug, 0, _cell_pos_x, _cell_pos_y);
					}
				}
			}
		}
		surface_reset_target();
		need_redraw_ = false;
	}
}
draw_text(5, 5, "need_redraw_:" + string(need_redraw_));

// Draw the debug surface to the screen
if (surface_exists(debug_surface_id_)) {
	draw_surface(debug_surface_id_, 0, 0);
}
else need_redraw_ = true;


if (cell_mapped_index != noone) {
	draw_text(cell_x, cell_y, string(cell_tile_index) + "\r\n" + string(cell_mapped_index));
}

