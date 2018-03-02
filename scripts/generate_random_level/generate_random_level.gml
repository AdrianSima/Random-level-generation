/// @desc This will generate a random level
/// @func generate_random_level(remove_orphan_walls)
/// @param rm_walls:boolean If true will replace any orpha walls with floors
var _rm_walls = (argument_count > 0) ? argument[0] : false,
	_double_walls = (argument_count > 1) ? argument[1] : false;

// Clean the room first
ds_grid_set_region(grid_, 0, 0, width_, height_, VOID);

// create the controller (this will move randomly and place floor tiles)
var _controller_x = width_ div 2,
	_controller_y = height_ div 2,
	_controller_direction = irandom(3),
	_steps = 500,

	_direction_change_odds = 1,
	
	player_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH / 2,
	player_start_y = _controller_y * CELL_HEIGHT + CELL_HEIGHT / 2;

// Create the player or move him to spawn
if (instance_exists(o_player)) {
	o_player.x = player_start_x;
	o_player.y = player_start_y;
}
else {
	instance_create_layer(player_start_x, player_start_y, "Instances", o_player);
}

repeat (_steps) {
	grid_[# _controller_x, _controller_y] = FLOOR;
	
	// Randomize the direction
	if (irandom(_direction_change_odds) == _direction_change_odds) {
		_controller_direction = irandom(3);
	}
	
	// Move the controller
	var _x_direction = lengthdir_x(1, _controller_direction * 90),
		_y_direction = lengthdir_y(1, _controller_direction * 90);
	_controller_x += _x_direction;
	_controller_y += _y_direction;
	
	// Make sure that we stay inside the level boundary
	if (_controller_x < 2 or _controller_x >= width_ - 2) {
		_controller_x += -_x_direction * 2;
	}
	if (_controller_y < 2 or _controller_y >= height_ - 2) {
		_controller_y += -_y_direction * 2;
	}
}

// Clear the area around the spawn
ds_grid_set_disk(grid_, player_start_x div CELL_WIDTH, player_start_y div CELL_HEIGHT, 2, FLOOR);

// Apply modifiers to the generations
if (_rm_walls or _double_walls) {
	for (var _y = 1; _y < height_ -1; _y += 1) {
		for (var _x = 1; _x < width_ -1; _x += 1) {
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
								  SOUTH_WEST * _sw_tile + SOUTH * _s_tile + SOUTH_EAST * _se_tile;
								  
				//if (_rm_walls and _tile_index == 0) print_r("adiacent tiles", _nw_tile, _n_tile, _ne_tile, _w_tile, _e_tile, _sw_tile, _s_tile, _se_tile);
				
				// Replace orphan wall tiles with floor tiles
				if (_rm_walls and !_n_tile and !_s_tile and !_w_tile and !_e_tile) {
					show_debug_message("removing orphan wall at tile ["+string(_x)+","+string(_y)+"]");
					grid_[# _x, _y] = FLOOR;
				}
				// If we find a wall that has no neighbour above or below, we add one or remove the wall if we can't add wall
				if (_double_walls and !_n_tile and !_s_tile) {
					// We check if we close off access to other rooms
					if (grid_[# _x, _y - 2] == FLOOR) {
						grid_[# _x, _y - 1] = VOID; // Place wall above
					}
					else if (grid_[# _x, _y + 2] == FLOOR) {
						grid_[# _x, _y + 1] = VOID; // Place wall below
					}
					else {
						grid_[# _x, _y] = FLOOR; // Remove the wall
					}
				}
			}
		}
	}
}

// Place the tiles in the room
for (var _y = 0; _y < height_; _y += 1) {
	for (var _x = 0; _x < width_; _x += 1) {
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
			
			//show_debug_message("tilemap_set("+string(_mapped_index)+","+string(_x)+","+string(_y)+")");
			tilemap_set(_tile_map_id, _mapped_index == -1 ? 12 : _mapped_index, _x, _y);
		}
		else {
			//show_debug_message("tilemap_set(FLOOR,"+string(_x)+","+string(_y)+")");
			
			// This sets a transparent tile as the floor
			tilemap_set(_tile_map_id, 0, _x, _y);
			
			// This removes the tile if there was one
			/*var data = tilemap_get(_tile_map_id, _x, _y);
		    if (!tile_get_empty(data))
		    {
				data = tile_set_empty(data);
				tilemap_set(_tile_map_id, data, _x, _y);
			}*/
		}
	}
}

// flag the debug overlay for redrawing
with (Debugger) {
	need_redraw_ = true;
}