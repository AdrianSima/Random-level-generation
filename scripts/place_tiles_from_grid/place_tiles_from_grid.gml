///@func place_tiles_from_grid(grid, [tile_type], [is_wall], [layer_id_below], [layer_id_above])
///@desc This will place tiles automatically in the tile layer, autotiling them
///@param {grid_id} grid The grid from which to check for walls
///@param {number} [tile_type] (optional, default is WALL) The type of the tile to check for in the grid
///@param {boolean} [is_wall] (optional, default false) If this tile_type is a wall so it needs the "WallLayerAbove" too.
///@paras {layer_id} [layer_id_below] (optional, default 'tile_map_id_below') The layer id of the below tile layer
///@paras {layer_id} [layer_id_above] (optional, default 'tile_map_id_above') The layer id of the above tile layer

var _grid = argument[0],
	_height = ds_grid_height(_grid),
	_width = ds_grid_width(_grid),
	_tile_type = (argument_count >= 2) ? argument[1] : WALL,
	_is_wall = (argument_count >= 3) ? argument[2] : false,
	_layer_id_below = (argument_count >= 4) ? argument[3] : tile_map_id_below,
	_layer_id_above = (argument_count >= 5) ? argument[4] : tile_map_id_above;

for (var _y = 0; _y < _height; _y += 1) {
	for (var _x = 0; _x < _width; _x += 1) {
		if (_grid[# _x, _y] == _tile_type) {
			// This is a wall tile, but which wall
			var	_nw_tile	= _grid[# _x - 1, _y - 1]	== _tile_type,
				_n_tile		= _grid[# _x,	  _y - 1]	== _tile_type,
				_ne_tile	= _grid[# _x + 1, _y - 1]	== _tile_type,
				_w_tile		= _grid[# _x - 1, _y	]	== _tile_type,
				_e_tile		= _grid[# _x + 1, _y	]	== _tile_type,
				_sw_tile	= _grid[# _x - 1, _y + 1]	== _tile_type,
				_s_tile		= _grid[# _x,	  _y + 1]	== _tile_type,
				_se_tile	= _grid[# _x + 1, _y + 1]	== _tile_type;
				
			var _tile_index = NORTH_WEST * _nw_tile + NORTH * _n_tile + NORTH_EAST * _ne_tile + 
							  WEST * _w_tile + EAST * _e_tile + 
							  SOUTH_WEST * _sw_tile + SOUTH * _s_tile + SOUTH_EAST * _se_tile,
				_mapped_index = tile_index_map_get(_tile_index);
			
			//show_debug_message("tilemap_set("+string(_mapped_index)+","+string(_x)+","+string(_y)+")");
			tilemap_set(_layer_id_above, 0, _x, _y);
			tilemap_set(_layer_id_below, _mapped_index, _x, _y);
			if (_is_wall && _grid[# _x, _y - 1] != _tile_type) {
				var _tile_id = 7;
				if (_grid[# _x - 1, _y] == _tile_type and _grid[# _x + 1, _y] == _tile_type) _tile_id = 5;
				else if (_grid[# _x - 1, _y] != _tile_type and _grid[# _x + 1, _y] == _tile_type) _tile_id = 4;
				else if (_grid[# _x - 1, _y] == _tile_type and _grid[# _x + 1, _y] != _tile_type) _tile_id = 6;
				tilemap_set(_layer_id_above, _tile_id, _x, _y - 1);
			}
		}
		else {
			//show_debug_message("tilemap_set(FLOOR,"+string(_x)+","+string(_y)+")");
			
			// This sets a transparent tile as the floor
			tilemap_set(_layer_id_above, 0, _x, _y);
			tilemap_set(_layer_id_below, 0, _x, _y);
			
			// This removes the tile if there was one
			//var data = tilemap_get(tile_map_id, _x, _y);
		    //if (!tile_get_empty(data))
		    //{
			//	data = tile_set_empty(data);
			//	tilemap_set(tile_map_id, data, _x, _y);
			//}
		}
	}
}