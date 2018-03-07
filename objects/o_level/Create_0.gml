/// @description Generate the level
randomize();

// get the tile layer ID
tile_map_id_above = layer_tilemap_get_id("WallTilesAbove");
tile_map_id_below = layer_tilemap_get_id("WallTilesBelow");
shadow_surface = noone;
shadow_need_redraw = false;

// set up the grid
width_ = room_width div CELL_WIDTH;
height_ = room_height div CELL_HEIGHT;
grid_ = ds_grid_create(width_, height_);

orphan_walls = true;
double_walls = true;

#region Build a test level first
/*
// Clean the room first
ds_grid_set_region(grid_, 0, 0, width_, height_, WALL);
ds_grid_set_region(grid_, 1, 1, width_, height_, FLOOR);
ds_grid_set_region(grid_, 2, 2, 19, 10, WALL);

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

ds_grid_set_region(grid_, 20, 4, 24, 4, WALL);
ds_grid_set_region(grid_, 22, 2, 22, 6, WALL);
grid_[# 22, 4] = FLOOR;

grid_[# 26, 4] = WALL;
grid_[# 27, 3] = WALL;
grid_[# 27, 5] = WALL;
grid_[# 28, 2] = WALL;
grid_[# 28, 6] = WALL;
grid_[# 29, 3] = WALL;
grid_[# 29, 5] = WALL;
grid_[# 30, 4] = WALL;

grid_[# 22, 8] = WALL;
grid_[# 22, 10] = WALL;
grid_[# 21, 9] = WALL;
grid_[# 23, 9] = WALL;

grid_[# 26, 8] = WALL;
grid_[# 26, 9] = WALL;
grid_[# 26, 10] = WALL;
grid_[# 25, 9] = WALL;
grid_[# 27, 9] = WALL;

grid_[# 2, 12] = WALL;
grid_[# 3, 12] = WALL;
grid_[# 4, 13] = WALL;
grid_[# 2, 14] = WALL;
grid_[# 3, 15] = WALL;
grid_[# 4, 15] = WALL;

grid_[# 16, 13] = WALL;
grid_[# 17, 12] = WALL;
grid_[# 18, 12] = WALL;
grid_[# 16, 15] = WALL;
grid_[# 17, 15] = WALL;
grid_[# 18, 14] = WALL;

grid_[# 6, 12] = WALL;
grid_[# 6, 13] = WALL;
grid_[# 7, 14] = WALL;
grid_[# 8, 12] = WALL;
grid_[# 9, 13] = WALL;
grid_[# 9, 14] = WALL;

grid_[# 12, 12] = WALL;
grid_[# 11, 13] = WALL;
grid_[# 11, 14] = WALL;
grid_[# 13, 14] = WALL;
grid_[# 14, 13] = WALL;
grid_[# 14, 12] = WALL;

ds_grid_set_region(grid_, 2, 17, 3, 18, WALL);
grid_[# 3, 18] = FLOOR;
ds_grid_set_region(grid_, 5, 17, 6, 18, WALL);
grid_[# 5, 18] = FLOOR;
ds_grid_set_region(grid_, 2, 20, 3, 21, WALL);
grid_[# 3, 20] = FLOOR;
ds_grid_set_region(grid_, 5, 20, 6, 21, WALL);
grid_[# 5, 20] = FLOOR;
grid_[# 4, 19] = WALL;

ds_grid_set_region(grid_, 8, 17, 11, 19, WALL);
grid_[# 9, 17] = FLOOR;
grid_[# 9, 18] = FLOOR;
grid_[# 10, 18] = FLOOR;
grid_[# 10, 19] = FLOOR;

ds_grid_set_region(grid_, 13, 17, 17, 19, WALL);
ds_grid_set_region(grid_, 13, 17, 14, 17, FLOOR);
ds_grid_set_region(grid_, 14, 18, 16, 18, FLOOR);
ds_grid_set_region(grid_, 16, 19, 17, 19, FLOOR);

ds_grid_set_region(grid_, 20, 12, 26, 18, WALL);
grid_[# 20, 12] = FLOOR;
grid_[# 20, 18] = FLOOR;
grid_[# 26, 12] = FLOOR;
grid_[# 26, 18] = FLOOR;
grid_[# 23, 15] = FLOOR;

ds_grid_set_region(grid_, 8, 21, 12, 22, WALL);
grid_[# 8, 21] = FLOOR;
grid_[# 12, 21] = FLOOR;

ds_grid_set_region(grid_, 14, 21, 18, 22, WALL);
grid_[# 14, 22] = FLOOR;
grid_[# 18, 22] = FLOOR;

ds_grid_set_region(grid_, 20, 20, 21, 22, WALL);
grid_[# 21, 20] = FLOOR;

ds_grid_set_region(grid_, 23, 20, 24, 22, WALL);
grid_[# 23, 20] = FLOOR;

ds_grid_set_region(grid_, 26, 20, 27, 22, WALL);
grid_[# 27, 22] = FLOOR;

ds_grid_set_region(grid_, 29, 20, 30, 22, WALL);
grid_[# 29, 22] = FLOOR;

// place tiles on the tile layer
for (var _y = 1; _y < height_ -1; _y += 1) {
	for (var _x = 1; _x < width_ -1; _x += 1) {
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
			
			tilemap_set(tile_map_id, _mapped_index, _x, _y);
		}
	}
}

with Debugger { need_redraw_ = true; }
*/
#endregion

if (room == rm_test)
	generate_test_level();
else
	generate_random_level(!orphan_walls, double_walls);
