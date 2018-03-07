///@func generate_test_level();
///@desc This will generate a level with all tile combinations

// Clean the room first
ds_grid_set_region(grid_, 0, 0, width_, height_, WALL);
ds_grid_set_region(grid_, 2, 2, width_-3, height_-3, FLOOR);

var	player_start_x = 4 * CELL_WIDTH,
	player_start_y = 4 * CELL_HEIGHT;

// Create the player or move him to spawn
if (instance_exists(o_player)) {
	o_player.x = player_start_x;
	o_player.y = player_start_y;
}
else {
	instance_create_layer(player_start_x, player_start_y, "Instances", o_player);
}

with o_player {
	maxSpeed = 20;
	camera.zoom_target = 4;
}

// Generate the tile values
for (var _i = 1; _i < 14; _i += 1) {
	for (var _j = 1; _j < 14; _j += 1) {
		if !(_i == 1 and _j == 1) {
			ds_grid_set_region(grid_, _i*4+1, _j*4+1, _i*4+3, _j*4+3, WALL);
		}
	}
}

#region Manually carve the level
// 2
grid_[# 13, 5] = FLOOR;

// 3
grid_[# 18, 5] = FLOOR;

// 4
grid_[# 23, 5] = FLOOR;

// 5
grid_[# 25, 7] = FLOOR;

// 6
grid_[# 30, 7] = FLOOR;

// 7
grid_[# 35, 7] = FLOOR;

// 8
grid_[# 37, 6] = FLOOR;

// 9
grid_[# 43, 6] = FLOOR;

// 10
grid_[# 45, 5] = FLOOR;
grid_[# 47, 5] = FLOOR;

// 11
grid_[# 51, 5] = FLOOR;
grid_[# 51, 7] = FLOOR;

// 12
grid_[# 53, 7] = FLOOR;
grid_[# 55, 7] = FLOOR;

// 13
grid_[# 5, 9] = FLOOR;
grid_[# 5, 11] = FLOOR;

// 14
grid_[# 9, 9] = FLOOR;
grid_[# 10, 9] = FLOOR;

// 15
grid_[# 14, 9] = FLOOR;
grid_[# 15, 9] = FLOOR;

// 16
grid_[# 19, 9] = FLOOR;
grid_[# 19, 10] = FLOOR;

// 17
grid_[# 23, 10] = FLOOR;
grid_[# 23, 11] = FLOOR;

// 18
grid_[# 26, 11] = FLOOR;
grid_[# 27, 11] = FLOOR;

// 19
grid_[# 29, 11] = FLOOR;
grid_[# 30, 11] = FLOOR;

// 20
grid_[# 33, 10] = FLOOR;
grid_[# 33, 11] = FLOOR;

// 21
grid_[# 37, 9] = FLOOR;
grid_[# 37, 10] = FLOOR;

// 22
grid_[# 41, 9] = FLOOR;
grid_[# 43, 10] = FLOOR;

// 23
grid_[# 46, 9] = FLOOR;
grid_[# 47, 11] = FLOOR;

// 24
grid_[# 51, 9] = FLOOR;
grid_[# 50, 11] = FLOOR;

// 25
grid_[# 55, 10] = FLOOR;
grid_[# 53, 11] = FLOOR;

// 26
grid_[# 5, 14] = FLOOR;
grid_[# 7, 15] = FLOOR;

// 27
grid_[# 9, 13] = FLOOR;
grid_[# 10, 15] = FLOOR;

// 28
grid_[# 14, 13] = FLOOR;
grid_[# 13, 15] = FLOOR;

// 29
grid_[# 19, 13] = FLOOR;
grid_[# 17, 14] = FLOOR;

// 30
grid_[# 21, 13] = FLOOR;
grid_[# 23, 15] = FLOOR;

// 31
grid_[# 26, 13] = FLOOR;
grid_[# 26, 15] = FLOOR;

// 32
grid_[# 31, 13] = FLOOR;
grid_[# 29, 15] = FLOOR;

// 33
grid_[# 33, 14] = FLOOR;
grid_[# 35, 14] = FLOOR;

// 34
grid_[# 37, 13] = FLOOR;
grid_[# 38, 13] = FLOOR;
grid_[# 39, 13] = FLOOR;

// 35
grid_[# 42, 13] = FLOOR;
grid_[# 43, 13] = FLOOR;
grid_[# 43, 13] = FLOOR;

// 36
grid_[# 47, 13] = FLOOR;
grid_[# 47, 14] = FLOOR;
grid_[# 47, 15] = FLOOR;

// 37
grid_[# 51, 14] = FLOOR;
grid_[# 50, 15] = FLOOR;
grid_[# 51, 15] = FLOOR;

// 38
grid_[# 53, 15] = FLOOR;
grid_[# 54, 15] = FLOOR;
grid_[# 55, 15] = FLOOR;

// 39
grid_[# 5, 18] = FLOOR;
grid_[# 5, 19] = FLOOR;
grid_[# 6, 19] = FLOOR;

// 40
grid_[# 9, 17] = FLOOR;
grid_[# 9, 18] = FLOOR;
grid_[# 9, 19] = FLOOR;

// 41
grid_[# 13, 17] = FLOOR;
grid_[# 14, 17] = FLOOR;
grid_[# 13, 18] = FLOOR;

// 42
grid_[# 17, 17] = FLOOR;
grid_[# 18, 17] = FLOOR;
grid_[# 19, 18] = FLOOR;

// 43
grid_[# 22, 17] = FLOOR;
grid_[# 23, 17] = FLOOR;
grid_[# 23, 19] = FLOOR;

// 44
grid_[# 27, 17] = FLOOR;
grid_[# 27, 18] = FLOOR;
grid_[# 26, 19] = FLOOR;

// 45
grid_[# 31, 18] = FLOOR;
grid_[# 29, 19] = FLOOR;
grid_[# 31, 19] = FLOOR;

// 46
grid_[# 33, 18] = FLOOR;
grid_[# 34, 19] = FLOOR;
grid_[# 35, 19] = FLOOR;

// 47
grid_[# 37, 17] = FLOOR;
grid_[# 37, 19] = FLOOR;
grid_[# 38, 19] = FLOOR;

// 48
grid_[# 42, 17] = FLOOR;
grid_[# 41, 18] = FLOOR;
grid_[# 41, 19] = FLOOR;

// 49
grid_[# 45, 17] = FLOOR;
grid_[# 47, 17] = FLOOR;
grid_[# 45, 18] = FLOOR;

// 50
grid_[# 49, 17] = FLOOR;
grid_[# 51, 17] = FLOOR;
grid_[# 51, 18] = FLOOR;

// 51
grid_[# 54, 17] = FLOOR;
grid_[# 55, 18] = FLOOR;
grid_[# 55, 19] = FLOOR;

// 52
grid_[# 7, 21] = FLOOR;
grid_[# 6, 23] = FLOOR;
grid_[# 7, 23] = FLOOR;

// 53
grid_[# 11, 22] = FLOOR;
grid_[# 9, 23] = FLOOR;
grid_[# 10, 23] = FLOOR;

// 54
grid_[# 13, 22] = FLOOR;
grid_[# 13, 23] = FLOOR;
grid_[# 15, 23] = FLOOR;

// 55
grid_[# 17, 21] = FLOOR;
grid_[# 17, 22] = FLOOR;
grid_[# 18, 23] = FLOOR;

// 56
grid_[# 21, 21] = FLOOR;
grid_[# 22, 21] = FLOOR;
grid_[# 21, 23] = FLOOR;

// 57
grid_[# 26, 21] = FLOOR;
grid_[# 27, 21] = FLOOR;
grid_[# 25, 22] = FLOOR;

// 58
grid_[# 29, 21] = FLOOR;
grid_[# 30, 21] = FLOOR;
grid_[# 30, 23] = FLOOR;
grid_[# 31, 23] = FLOOR;

// 59
grid_[# 34, 21] = FLOOR;
grid_[# 35, 21] = FLOOR;
grid_[# 33, 23] = FLOOR;
grid_[# 34, 23] = FLOOR;

// 60
grid_[# 39, 21] = FLOOR;
grid_[# 37, 22] = FLOOR;
grid_[# 39, 22] = FLOOR;
grid_[# 37, 23] = FLOOR;

// 61
grid_[# 41, 21] = FLOOR;
grid_[# 41, 22] = FLOOR;
grid_[# 43, 22] = FLOOR;
grid_[# 43, 23] = FLOOR;

// 62
grid_[# 45, 21] = FLOOR;
grid_[# 46, 21] = FLOOR;
grid_[# 47, 21] = FLOOR;
grid_[# 47, 22] = FLOOR;

// 63
grid_[# 50, 21] = FLOOR;
grid_[# 51, 21] = FLOOR;
grid_[# 51, 22] = FLOOR;
grid_[# 51, 23] = FLOOR;

// 64
grid_[# 55, 21] = FLOOR;
grid_[# 55, 22] = FLOOR;
grid_[# 54, 23] = FLOOR;
grid_[# 55, 23] = FLOOR;

// 65
grid_[# 7, 26] = FLOOR;
grid_[# 5, 27] = FLOOR;
grid_[# 6, 27] = FLOOR;
grid_[# 7, 27] = FLOOR;

// 66
grid_[# 9, 26] = FLOOR;
grid_[# 9, 27] = FLOOR;
grid_[# 10, 27] = FLOOR;
grid_[# 11, 27] = FLOOR;

// 67
grid_[# 13, 25] = FLOOR;
grid_[# 13, 26] = FLOOR;
grid_[# 13, 27] = FLOOR;
grid_[# 14, 27] = FLOOR;

// 68
grid_[# 17, 25] = FLOOR;
grid_[# 18, 25] = FLOOR;
grid_[# 17, 26] = FLOOR;
grid_[# 17, 27] = FLOOR;

// 69
grid_[# 21, 25] = FLOOR;
grid_[# 22, 25] = FLOOR;
grid_[# 23, 25] = FLOOR;
grid_[# 21, 26] = FLOOR;

// 70
grid_[# 25, 25] = FLOOR;
grid_[# 26, 25] = FLOOR;
grid_[# 27, 26] = FLOOR;
grid_[# 27, 27] = FLOOR;

// 71
grid_[# 30, 25] = FLOOR;
grid_[# 31, 25] = FLOOR;
grid_[# 30, 27] = FLOOR;
grid_[# 31, 27] = FLOOR;

// 72
grid_[# 35, 25] = FLOOR;
grid_[# 35, 26] = FLOOR;
grid_[# 33, 27] = FLOOR;
grid_[# 34, 27] = FLOOR;

// 73
grid_[# 37, 26] = FLOOR;
grid_[# 39, 26] = FLOOR;
grid_[# 37, 27] = FLOOR;
grid_[# 39, 27] = FLOOR;

// 74
grid_[# 41, 25] = FLOOR;
grid_[# 41, 26] = FLOOR;
grid_[# 42, 27] = FLOOR;
grid_[# 43, 27] = FLOOR;

// 75
grid_[# 45, 25] = FLOOR;
grid_[# 46, 25] = FLOOR;
grid_[# 45, 27] = FLOOR;
grid_[# 46, 27] = FLOOR;

//76
grid_[# 50, 25] = FLOOR;
grid_[# 51, 25] = FLOOR;
grid_[# 49, 26] = FLOOR;
grid_[# 49, 27] = FLOOR;

// 77
grid_[# 53, 25] = FLOOR;
grid_[# 55, 25] = FLOOR;
grid_[# 53, 26] = FLOOR;
grid_[# 55, 26] = FLOOR;

// 78
grid_[# 5, 29] = FLOOR;
grid_[# 6, 29] = FLOOR;
grid_[# 7, 30] = FLOOR;
grid_[# 6, 31] = FLOOR;

// 79
grid_[# 10, 29] = FLOOR;
grid_[# 11, 29] = FLOOR;
grid_[# 9, 31] = FLOOR;
grid_[# 11, 31] = FLOOR;

// 80
grid_[# 15, 29] = FLOOR;
grid_[# 13, 30] = FLOOR;
grid_[# 15, 30] = FLOOR;
grid_[# 14, 31] = FLOOR;

// 81
grid_[# 17, 29] = FLOOR;
grid_[# 19, 30] = FLOOR;
grid_[# 17, 31] = FLOOR;
grid_[# 19, 31] = FLOOR;

// 82
grid_[# 22, 29] = FLOOR;
grid_[# 21, 30] = FLOOR;
grid_[# 22, 31] = FLOOR;
grid_[# 23, 31] = FLOOR;

// 83
grid_[# 25, 29] = FLOOR;
grid_[# 27, 29] = FLOOR;
grid_[# 25, 31] = FLOOR;
grid_[# 26, 31] = FLOOR;

// 84
grid_[# 30, 29] = FLOOR;
grid_[# 29, 30] = FLOOR;
grid_[# 31, 30] = FLOOR;
grid_[# 29, 31] = FLOOR;

// 85
grid_[# 33, 29] = FLOOR;
grid_[# 35, 29] = FLOOR;
grid_[# 33, 30] = FLOOR;
grid_[# 35, 31] = FLOOR;

// 86
grid_[# 37, 29] = FLOOR;
grid_[# 39, 29] = FLOOR;
grid_[# 38, 31] = FLOOR;
grid_[# 39, 31] = FLOOR;

// 87
grid_[# 42, 29] = FLOOR;
grid_[# 43, 30] = FLOOR;
grid_[# 41, 31] = FLOOR;
grid_[# 42, 31] = FLOOR;

// 88
grid_[# 47, 29] = FLOOR;
grid_[# 45, 30] = FLOOR;
grid_[# 45, 31] = FLOOR;
grid_[# 47, 31] = FLOOR;

// 89
grid_[# 49, 29] = FLOOR;
grid_[# 49, 30] = FLOOR;
grid_[# 51, 30] = FLOOR;
grid_[# 50, 31] = FLOOR;

// 90
grid_[# 53, 29] = FLOOR;
grid_[# 54, 29] = FLOOR;
grid_[# 53, 31] = FLOOR;
grid_[# 55, 31] = FLOOR;

// 91
grid_[# 6, 33] = FLOOR;
grid_[# 7, 33] = FLOOR;
grid_[# 5, 34] = FLOOR;
grid_[# 6, 35] = FLOOR;

// 92
grid_[# 9, 33] = FLOOR;
grid_[# 11, 33] = FLOOR;
grid_[# 11, 34] = FLOOR;
grid_[# 9, 35] = FLOOR;

// 93
grid_[# 14, 33] = FLOOR;
grid_[# 13, 34] = FLOOR;
grid_[# 15, 34] = FLOOR;
grid_[# 15, 35] = FLOOR;

// 94
grid_[# 17, 33] = FLOOR;
grid_[# 19, 33] = FLOOR;
grid_[# 17, 35] = FLOOR;
grid_[# 19, 35] = FLOOR;

// 95
grid_[# 22, 33] = FLOOR;
grid_[# 21, 34] = FLOOR;
grid_[# 23, 34] = FLOOR;
grid_[# 22, 35] = FLOOR;




#endregion



// Place the tiles in the room
for (var _y = 0; _y < height_; _y += 1) {
	for (var _x = 0; _x < width_; _x += 1) {
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
			
			//show_debug_message("tilemap_set("+string(_mapped_index)+","+string(_x)+","+string(_y)+")");
			tilemap_set(tile_map_id_above, 0, _x, _y);
			tilemap_set(tile_map_id_below, _mapped_index, _x, _y);
			if (grid_[# _x, _y - 1] == FLOOR) {
				var _tile_id = 7;
				if (grid_[# _x - 1, _y] == WALL and grid_[# _x + 1, _y] == WALL) _tile_id = 5;
				else if (grid_[# _x - 1, _y] == FLOOR and grid_[# _x + 1, _y] == WALL) _tile_id = 4;
				else if (grid_[# _x - 1, _y] == WALL and grid_[# _x + 1, _y] == FLOOR) _tile_id = 6;
				tilemap_set(tile_map_id_above, _tile_id, _x, _y - 1);
			}
		}
		else {
			//show_debug_message("tilemap_set(FLOOR,"+string(_x)+","+string(_y)+")");
			
			// This sets a transparent tile as the floor
			tilemap_set(tile_map_id_above, 0, _x, _y);
			tilemap_set(tile_map_id_below, 0, _x, _y);
			
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

shadow_need_redraw = true;

// flag the debug overlay for redrawing
with (Debugger) {
	need_redraw_ = true;
}