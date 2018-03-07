/// @description Draw debug info
if (!debug_) exit;

if (instance_exists(o_level)) {
	if (need_redraw_) {
		var _has_unknown_tile = false;
		if (!surface_exists(debug_surface_id_)) {
			// Create the debug surface
			debug_surface_id_ = surface_create(room_width, room_height);
		}
		surface_set_target(debug_surface_id_);
		draw_clear_alpha(c_white, 0);
		draw_set_color(c_aqua);
		draw_set_font(f_debug);
		with (o_level) {
			for (var _y = 1; _y < height_ - 1; _y += 1) {
				for (var _x = 1; _x < width_ - 1; _x += 1) {
					var _cell_pos_x = _x * CELL_WIDTH,
						_cell_pos_y = _y * CELL_HEIGHT;
						
					if (grid_[# _x, _y] != FLOOR) {
						// This is a wall tile, but which wall
						var	_nw_tile	= grid_[# _x - 1, _y - 1]	== WALL,
							_n_tile		= grid_[# _x,	  _y - 1]	== WALL,
							_ne_tile	= grid_[# _x + 1, _y - 1]	== WALL,
							_w_tile		= grid_[# _x - 1, _y	]	== WALL,
							_e_tile		= grid_[# _x + 1, _y	]	== WALL,
							_sw_tile	= grid_[# _x - 1, _y + 1]	== WALL,
							_s_tile		= grid_[# _x,	  _y + 1]	== WALL,
							_se_tile	= grid_[# _x + 1, _y + 1]	== WALL;
				
						var _tile_index = NORTH_WEST * _nw_tile + NORTH * _n_tile + NORTH_EAST * _ne_tile + 
										  WEST * _w_tile + EAST * _e_tile + 
										  SOUTH_WEST * _sw_tile + SOUTH * _s_tile + SOUTH_EAST * _se_tile,
							_mapped_index = tile_index_map_get(_tile_index);
						
						if (_mapped_index == -1) {
							_has_unknown_tile = true;
							//audio_play_sound(snd_alert, 1, true);
							draw_text(_cell_pos_x, _cell_pos_y, string(_tile_index) + "\r\n" + string(_mapped_index));
						}
						if (other.draw_floor_area){
							// This tile collision
							draw_sprite(s_debug_walls, 0, _cell_pos_x, _cell_pos_y);
						}
					}
					else if (other.draw_floor_area){
						// This is a floor tile
						//draw_sprite(s_debug, 0, _cell_pos_x, _cell_pos_y);
					}
				}
			}
		}
		if (draw_floor_area){
			// This tile collision
			draw_sprite(s_numbers_overlay, 0, 0, 0);
		}
		surface_reset_target();
		need_redraw_ = false;
		
		if (auto_generate and !_has_unknown_tile)
			alarm[0] = room_speed / 10;
	}
}

// Draw the debug surface to the screen
if (surface_exists(debug_surface_id_)) {
	draw_surface(debug_surface_id_, 0, 0);
}
else need_redraw_ = true;

if (cell_mapped_index != noone) {
	draw_text(cell_x, cell_y, string(cell_tile_index) + "\r\n" + string(cell_mapped_index));
}

with o_player {
	draw_set_color(c_red);
	draw_set_alpha(0.5);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
}