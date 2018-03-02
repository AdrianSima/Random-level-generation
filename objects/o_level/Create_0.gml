/// @description Generate the level
randomize();

// get the tile layer ID
_tile_map_id = layer_tilemap_get_id("WallTiles");

// set up the grid
width_ = room_width div CELL_WIDTH;
height_ = room_height div CELL_HEIGHT;
grid_ = ds_grid_create(width_, height_);

orphan_walls = true;
double_walls = true;

#region Build a test level first
/*
// Clean the room first
ds_grid_set_region(grid_, 0, 0, width_, height_, VOID);
ds_grid_set_region(grid_, 1, 1, width_, height_, FLOOR);
ds_grid_set_region(grid_, 2, 2, 19, 10, VOID);

ds_grid_set_region(grid_, 3, 2, 3, 6, FLOOR);
ds_grid_set_region(grid_, 7, 2, 7, 6, FLOOR);
ds_grid_set_region(grid_, 13, 2, 13, 6, FLOOR);
ds_grid_set_region(grid_, 19, 2, 19, 6, FLOOR);
ds_grid_set_region(grid_, 2, 3, 6, 3, FLOOR);
ds_grid_set_region(grid_, 12, 3, 14, 5, FLOOR);
ds_grid_set_region(grid_, 8, 3, 8, 5, FLOOR);
ds_grid_set_region(grid_, 18, 3, 18, 5, FLOOR);
ds_grid_set_region(grid_, 9, 2, 11, 2, FLOOR);
ds_grid_set_region(grid_, 15, 2, 17, 2, FLOOR);
ds_grid_set_region(grid_, 9, 6, 11, 6, FLOOR);
ds_grid_set_region(grid_, 15, 6, 17, 6, FLOOR);
grid_[# 16, 4] = FLOOR;

ds_grid_set_region(grid_, 2, 7, 19, 7, FLOOR);
ds_grid_set_region(grid_, 5, 8, 5, 10, FLOOR);
ds_grid_set_region(grid_, 9, 8, 9, 10, FLOOR);
ds_grid_set_region(grid_, 14, 8, 14, 10, FLOOR);
grid_[# 3, 9] = FLOOR;
grid_[# 6, 9] = FLOOR;
grid_[# 8, 9] = FLOOR;
grid_[# 7, 8] = FLOOR;
grid_[# 7, 10] = FLOOR;
grid_[# 11, 9] = FLOOR;
grid_[# 11, 10] = FLOOR;
grid_[# 12, 8] = FLOOR;
grid_[# 12, 9] = FLOOR;
grid_[# 15, 10] = FLOOR;
grid_[# 16, 9] = FLOOR;
grid_[# 17, 9] = FLOOR;
grid_[# 18, 9] = FLOOR;
grid_[# 16, 10] = FLOOR;
grid_[# 18, 8] = FLOOR;
grid_[# 19, 8] = FLOOR;

ds_grid_set_region(grid_, 20, 4, 24, 4, VOID);
ds_grid_set_region(grid_, 22, 2, 22, 6, VOID);
grid_[# 22, 4] = FLOOR;

grid_[# 26, 4] = VOID;
grid_[# 27, 3] = VOID;
grid_[# 27, 5] = VOID;
grid_[# 28, 2] = VOID;
grid_[# 28, 6] = VOID;
grid_[# 29, 3] = VOID;
grid_[# 29, 5] = VOID;
grid_[# 30, 4] = VOID;

grid_[# 22, 8] = VOID;
grid_[# 22, 10] = VOID;
grid_[# 21, 9] = VOID;
grid_[# 23, 9] = VOID;

grid_[# 26, 8] = VOID;
grid_[# 26, 9] = VOID;
grid_[# 26, 10] = VOID;
grid_[# 25, 9] = VOID;
grid_[# 27, 9] = VOID;

grid_[# 2, 12] = VOID;
grid_[# 3, 12] = VOID;
grid_[# 4, 13] = VOID;
grid_[# 2, 14] = VOID;
grid_[# 3, 15] = VOID;
grid_[# 4, 15] = VOID;

grid_[# 16, 13] = VOID;
grid_[# 17, 12] = VOID;
grid_[# 18, 12] = VOID;
grid_[# 16, 15] = VOID;
grid_[# 17, 15] = VOID;
grid_[# 18, 14] = VOID;

grid_[# 6, 12] = VOID;
grid_[# 6, 13] = VOID;
grid_[# 7, 14] = VOID;
grid_[# 8, 12] = VOID;
grid_[# 9, 13] = VOID;
grid_[# 9, 14] = VOID;

grid_[# 12, 12] = VOID;
grid_[# 11, 13] = VOID;
grid_[# 11, 14] = VOID;
grid_[# 13, 14] = VOID;
grid_[# 14, 13] = VOID;
grid_[# 14, 12] = VOID;

ds_grid_set_region(grid_, 2, 17, 3, 18, VOID);
grid_[# 3, 18] = FLOOR;
ds_grid_set_region(grid_, 5, 17, 6, 18, VOID);
grid_[# 5, 18] = FLOOR;
ds_grid_set_region(grid_, 2, 20, 3, 21, VOID);
grid_[# 3, 20] = FLOOR;
ds_grid_set_region(grid_, 5, 20, 6, 21, VOID);
grid_[# 5, 20] = FLOOR;
grid_[# 4, 19] = VOID;

ds_grid_set_region(grid_, 8, 17, 11, 19, VOID);
grid_[# 9, 17] = FLOOR;
grid_[# 9, 18] = FLOOR;
grid_[# 10, 18] = FLOOR;
grid_[# 10, 19] = FLOOR;

ds_grid_set_region(grid_, 13, 17, 17, 19, VOID);
ds_grid_set_region(grid_, 13, 17, 14, 17, FLOOR);
ds_grid_set_region(grid_, 14, 18, 16, 18, FLOOR);
ds_grid_set_region(grid_, 16, 19, 17, 19, FLOOR);

ds_grid_set_region(grid_, 20, 12, 26, 18, VOID);
grid_[# 20, 12] = FLOOR;
grid_[# 20, 18] = FLOOR;
grid_[# 26, 12] = FLOOR;
grid_[# 26, 18] = FLOOR;
grid_[# 23, 15] = FLOOR;

ds_grid_set_region(grid_, 8, 21, 12, 22, VOID);
grid_[# 8, 21] = FLOOR;
grid_[# 12, 21] = FLOOR;

ds_grid_set_region(grid_, 14, 21, 18, 22, VOID);
grid_[# 14, 22] = FLOOR;
grid_[# 18, 22] = FLOOR;

ds_grid_set_region(grid_, 20, 20, 21, 22, VOID);
grid_[# 21, 20] = FLOOR;

ds_grid_set_region(grid_, 23, 20, 24, 22, VOID);
grid_[# 23, 20] = FLOOR;

ds_grid_set_region(grid_, 26, 20, 27, 22, VOID);
grid_[# 27, 22] = FLOOR;

ds_grid_set_region(grid_, 29, 20, 30, 22, VOID);
grid_[# 29, 22] = FLOOR;

// place tiles on the tile layer
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

with Debugger { need_redraw_ = true; }
*/
#endregion

generate_random_level(!orphan_walls, double_walls);
