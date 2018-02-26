/// @desc This will generate a random level
/// @func generate_random_level(remove_orphan_walls)
/// @param rm_walls:boolean If true will replace any orpha walls with floors
var rm_walls = (argument_count > 0) ? argument[0] : false;

// Clean the room first
ds_grid_set_region(grid_, 0, 0, width_, height_, VOID);

// create the controller (this will move randomly and place floor tiles)
var _controller_x = width_ div 2,
	_controller_y = height_ div 2,
	_controller_direction = irandom(3),
	_steps = 500,

	_direction_change_odds = 1;

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

// Replace orphan wall tiles with floor tiles
if (rm_walls) {
	for (var _y = 1; _y < height_ -1; _y += 1) {
		for (var _x = 1; _x < width_ -1; _x += 1) {
			if (grid_[# _x, _y] != FLOOR) {
				var _north_tile = grid_[# _x, _y - 1] == VOID,
					_west_tile  = grid_[# _x - 1, _y] == VOID,
					_east_tile  = grid_[# _x + 1, _y] == VOID,
					_south_tile = grid_[# _x, _y + 1] == VOID;
				
				var _tile_index = 1 + NORTH * _north_tile + WEST * _west_tile + EAST * _east_tile + SOUTH * _south_tile;
				if (_tile_index == 1) {
					grid_[# _x, _y] = FLOOR;
				}
			}
		}
	}
}

// Place the tiles in the room
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
							  SOUTH_WEST * _sw_tile + SOUTH * _s_tile + SOUTH_EAST * _se_tile,
				_mapped_index = tile_index_map_get(_tile_index);
			
			tilemap_set(_tile_map_id, _mapped_index, _x, _y);
		}
	}
}

// flag the debug overlay for redrawing
with (Debugger) {
	need_redraw_ = true;
}