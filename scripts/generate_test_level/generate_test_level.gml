///@func generate_test_level();
///@desc This will generate a level with all tile combinations

// Clean the room first
ds_grid_set_region(grid_, 0, 0, width_, height_, WALL);
ds_grid_set_region(grid_, 2, 2, width_-3, height_-3, FLOOR);

var	_player_start_x = 4 * CELL_WIDTH,
	_player_start_y = 4 * CELL_HEIGHT;

// Create the player or move him to spawn
if (instance_exists(o_player)) {
	o_player.x = _player_start_x;
	o_player.y = _player_start_y;
}
else {
	instance_create_layer(_player_start_x, _player_start_y, "Instances", o_player);
}

// Set values acceptable for level testing
with o_player {
	maxSpeed = 20;
	camera.zoom_target = 5;
}

// Generate the tile values
// First we generate sets of 3x3 tiles at 1 tile apart
for (var _i = 1; _i < 14; _i += 1) {
	for (var _j = 1; _j < 14; _j += 1) {
		if !(_i == 1 and _j == 1) {
			ds_grid_set_region(grid_, _i*4+1, _j*4+1, _i*4+3, _j*4+3, WALL);
		}
	}
}
// Then we carve out each set to the desired combination
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

// 96
grid_[# 25, 33] = FLOOR;
grid_[# 26, 33] = FLOOR;
grid_[# 27, 33] = FLOOR;
grid_[# 27, 34] = FLOOR;
grid_[# 27, 35] = FLOOR;

// 97
grid_[# 30, 33] = FLOOR;
grid_[# 31, 33] = FLOOR;
grid_[# 31, 34] = FLOOR;
grid_[# 31, 35] = FLOOR;
grid_[# 30, 35] = FLOOR;

// 98
grid_[# 35, 33] = FLOOR;
grid_[# 35, 34] = FLOOR;
grid_[# 35, 35] = FLOOR;
grid_[# 34, 35] = FLOOR;
grid_[# 33, 35] = FLOOR;

// 99
grid_[# 37, 34] = FLOOR;
grid_[# 39, 34] = FLOOR;
grid_[# 37, 35] = FLOOR;
grid_[# 38, 35] = FLOOR;
grid_[# 39, 35] = FLOOR;

// 100
grid_[# 41, 33] = FLOOR;
grid_[# 41, 34] = FLOOR;
grid_[# 41, 35] = FLOOR;
grid_[# 42, 35] = FLOOR;
grid_[# 43, 35] = FLOOR;

// 101
grid_[# 45, 33] = FLOOR;
grid_[# 46, 33] = FLOOR;
grid_[# 45, 34] = FLOOR;
grid_[# 45, 35] = FLOOR;
grid_[# 46, 35] = FLOOR;

// 102
grid_[# 49, 33] = FLOOR;
grid_[# 50, 33] = FLOOR;
grid_[# 51, 33] = FLOOR;
grid_[# 49, 34] = FLOOR;
grid_[# 49, 35] = FLOOR;

// 103
grid_[# 53, 33] = FLOOR;
grid_[# 54, 33] = FLOOR;
grid_[# 55, 33] = FLOOR;
grid_[# 53, 34] = FLOOR;
grid_[# 55, 34] = FLOOR;

// 104
grid_[# 5, 37] = FLOOR;
grid_[# 6, 37] = FLOOR;
grid_[# 7, 37] = FLOOR;
grid_[# 6, 39] = FLOOR;
grid_[# 7, 39] = FLOOR;

// 105
grid_[# 10, 37] = FLOOR;
grid_[# 11, 37] = FLOOR;
grid_[# 11, 38] = FLOOR;
grid_[# 9, 39] = FLOOR;
grid_[# 10, 39] = FLOOR;

// 106
grid_[# 15, 37] = FLOOR;
grid_[# 13, 38] = FLOOR;
grid_[# 15, 38] = FLOOR;
grid_[# 13, 39] = FLOOR;
grid_[# 15, 39] = FLOOR;

// 107
grid_[# 17, 37] = FLOOR;
grid_[# 18, 37] = FLOOR;
grid_[# 19, 38] = FLOOR;
grid_[# 18, 39] = FLOOR;
grid_[# 19, 39] = FLOOR;

// 108
grid_[# 21, 37] = FLOOR;
grid_[# 22, 37] = FLOOR;
grid_[# 21, 39] = FLOOR;
grid_[# 22, 39] = FLOOR;
grid_[# 23, 39] = FLOOR;

// 109
grid_[# 26, 37] = FLOOR;
grid_[# 27, 37] = FLOOR;
grid_[# 25, 38] = FLOOR;
grid_[# 25, 39] = FLOOR;
grid_[# 26, 39] = FLOOR;

// 110
grid_[# 29, 37] = FLOOR;
grid_[# 31, 37] = FLOOR;
grid_[# 29, 38] = FLOOR;
grid_[# 31, 38] = FLOOR;
grid_[# 29, 39] = FLOOR;

// 111
grid_[# 33, 37] = FLOOR;
grid_[# 34, 37] = FLOOR;
grid_[# 33, 38] = FLOOR;
grid_[# 35, 38] = FLOOR;
grid_[# 35, 39] = FLOOR;

// 112
grid_[# 37, 37] = FLOOR;
grid_[# 38, 37] = FLOOR;
grid_[# 39, 38] = FLOOR;
grid_[# 38, 39] = FLOOR;
grid_[# 39, 39] = FLOOR;

// 113
grid_[# 42, 37] = FLOOR;
grid_[# 43, 37] = FLOOR;
grid_[# 41, 39] = FLOOR;
grid_[# 42, 39] = FLOOR;
grid_[# 43, 39] = FLOOR;

// 114
grid_[# 47, 37] = FLOOR;
grid_[# 45, 38] = FLOOR;
grid_[# 47, 38] = FLOOR;
grid_[# 45, 39] = FLOOR;
grid_[# 46, 39] = FLOOR;

// 115
grid_[# 49, 37] = FLOOR;
grid_[# 49, 38] = FLOOR;
grid_[# 51, 38] = FLOOR;
grid_[# 49, 39] = FLOOR;
grid_[# 51, 39] = FLOOR;

// 116
grid_[# 53, 37] = FLOOR;
grid_[# 54, 37] = FLOOR;
grid_[# 53, 38] = FLOOR;
grid_[# 54, 39] = FLOOR;
grid_[# 55, 39] = FLOOR;

// 117
grid_[# 5, 41] = FLOOR;
grid_[# 6, 41] = FLOOR;
grid_[# 7, 41] = FLOOR;
grid_[# 5, 43] = FLOOR;
grid_[# 6, 43] = FLOOR;

// 118
grid_[# 10, 41] = FLOOR;
grid_[# 11, 41] = FLOOR;
grid_[# 9, 42] = FLOOR;
grid_[# 11, 42] = FLOOR;
grid_[# 9, 43] = FLOOR;

// 119
grid_[# 13, 41] = FLOOR;
grid_[# 15, 41] = FLOOR;
grid_[# 13, 42] = FLOOR;
grid_[# 15, 42] = FLOOR;
grid_[# 15, 43] = FLOOR;

// 120
grid_[# 17, 41] = FLOOR;
grid_[# 18, 41] = FLOOR;
grid_[# 19, 41] = FLOOR;
grid_[# 19, 42] = FLOOR;
grid_[# 18, 43] = FLOOR;

// 121
grid_[# 22, 41] = FLOOR;
grid_[# 23, 41] = FLOOR;
grid_[# 23, 42] = FLOOR;
grid_[# 21, 43] = FLOOR;
grid_[# 23, 42] = FLOOR;

// 122
grid_[# 27, 41] = FLOOR;
grid_[# 25, 42] = FLOOR;
grid_[# 27, 42] = FLOOR;
grid_[# 26, 43] = FLOOR;
grid_[# 27, 43] = FLOOR;

// 123
grid_[# 29, 41] = FLOOR;
grid_[# 31, 42] = FLOOR;
grid_[# 29, 43] = FLOOR;
grid_[# 30, 43] = FLOOR;
grid_[# 31, 43] = FLOOR;

// 124
grid_[# 34, 41] = FLOOR;
grid_[# 33, 42] = FLOOR;
grid_[# 33, 43] = FLOOR;
grid_[# 34, 43] = FLOOR;
grid_[# 35, 43] = FLOOR;

// 125
grid_[# 37, 41] = FLOOR;
grid_[# 39, 41] = FLOOR;
grid_[# 37, 42] = FLOOR;
grid_[# 37, 43] = FLOOR;
grid_[# 38, 43] = FLOOR;

// 126
grid_[# 41, 41] = FLOOR;
grid_[# 42, 41] = FLOOR;
grid_[# 41, 42] = FLOOR;
grid_[# 43, 42] = FLOOR;
grid_[# 41, 43] = FLOOR;

// 127
grid_[# 45, 41] = FLOOR;
grid_[# 46, 41] = FLOOR;
grid_[# 47, 41] = FLOOR;
grid_[# 45, 42] = FLOOR;
grid_[# 47, 43] = FLOOR;

// 128
grid_[# 49, 41] = FLOOR;
grid_[# 51, 41] = FLOOR;
grid_[# 51, 42] = FLOOR;
grid_[# 50, 43] = FLOOR;
grid_[# 51, 43] = FLOOR;

// 129
grid_[# 54, 41] = FLOOR;
grid_[# 55, 42] = FLOOR;
grid_[# 53, 43] = FLOOR;
grid_[# 54, 43] = FLOOR;
grid_[# 55, 43] = FLOOR;

// 130
grid_[# 7, 45] = FLOOR;
grid_[# 5, 46] = FLOOR;
grid_[# 5, 47] = FLOOR;
grid_[# 6, 47] = FLOOR;
grid_[# 7, 47] = FLOOR;

// 131
grid_[# 9, 45] = FLOOR;
grid_[# 9, 46] = FLOOR;
grid_[# 11, 46] = FLOOR;
grid_[# 9, 47] = FLOOR;
grid_[# 10, 47] = FLOOR;

// 132
grid_[# 13, 45] = FLOOR;
grid_[# 14, 45] = FLOOR;
grid_[# 13, 46] = FLOOR;
grid_[# 13, 47] = FLOOR;
grid_[# 15, 47] = FLOOR;

// 133
grid_[# 17, 45] = FLOOR;
grid_[# 18, 45] = FLOOR;
grid_[# 19, 45] = FLOOR;
grid_[# 17, 46] = FLOOR;
grid_[# 18, 47] = FLOOR;

// 134
grid_[# 21, 45] = FLOOR;
grid_[# 22, 45] = FLOOR;
grid_[# 23, 45] = FLOOR;
grid_[# 23, 46] = FLOOR;
grid_[# 21, 47] = FLOOR;

// 135
grid_[# 26, 45] = FLOOR;
grid_[# 27, 45] = FLOOR;
grid_[# 25, 46] = FLOOR;
grid_[# 27, 46] = FLOOR;
grid_[# 27, 47] = FLOOR;

// 136
grid_[# 29, 45] = FLOOR;
grid_[# 30, 45] = FLOOR;
grid_[# 31, 45] = FLOOR;
grid_[# 29, 47] = FLOOR;
grid_[# 30, 47] = FLOOR;
grid_[# 31, 47] = FLOOR;

// 137
grid_[# 34, 45] = FLOOR;
grid_[# 35, 45] = FLOOR;
grid_[# 33, 46] = FLOOR;
grid_[# 35, 46] = FLOOR;
grid_[# 33, 47] = FLOOR;
grid_[# 34, 47] = FLOOR;

// 138
grid_[# 37, 45] = FLOOR;
grid_[# 39, 45] = FLOOR;
grid_[# 37, 46] = FLOOR;
grid_[# 39, 46] = FLOOR;
grid_[# 37, 47] = FLOOR;
grid_[# 39, 47] = FLOOR;

// 139
grid_[# 41, 45] = FLOOR;
grid_[# 42, 45] = FLOOR;
grid_[# 41, 46] = FLOOR;
grid_[# 43, 46] = FLOOR;
grid_[# 42, 47] = FLOOR;
grid_[# 43, 47] = FLOOR;

// 140
grid_[# 45, 45] = FLOOR;
grid_[# 47, 45] = FLOOR;
grid_[# 47, 46] = FLOOR;
grid_[# 45, 47] = FLOOR;
grid_[# 46, 47] = FLOOR;
grid_[# 47, 47] = FLOOR;

// 141
grid_[# 50, 45] = FLOOR;
grid_[# 49, 46] = FLOOR;
grid_[# 51, 46] = FLOOR;
grid_[# 49, 47] = FLOOR;
grid_[# 50, 47] = FLOOR;
grid_[# 51, 47] = FLOOR;

// 142
grid_[# 53, 45] = FLOOR;
grid_[# 55, 45] = FLOOR;
grid_[# 55, 46] = FLOOR;
grid_[# 53, 47] = FLOOR;
grid_[# 54, 47] = FLOOR;
grid_[# 55, 47] = FLOOR;

// 143
grid_[# 5, 49] = FLOOR;
grid_[# 6, 49] = FLOOR;
grid_[# 5, 50] = FLOOR;
grid_[# 7, 50] = FLOOR;
grid_[# 5, 51] = FLOOR;
grid_[# 6, 51] = FLOOR;

// 144
grid_[# 9, 49] = FLOOR;
grid_[# 10, 49] = FLOOR;
grid_[# 11, 49] = FLOOR;
grid_[# 9, 50] = FLOOR;
grid_[# 9, 51] = FLOOR;
grid_[# 11, 51] = FLOOR;

// 145
grid_[# 13, 49] = FLOOR;
grid_[# 14, 49] = FLOOR;
grid_[# 15, 49] = FLOOR;
grid_[# 13, 50] = FLOOR;
grid_[# 15, 50] = FLOOR;
grid_[# 14, 51] = FLOOR;

// 146
grid_[# 17, 49] = FLOOR;
grid_[# 18, 49] = FLOOR;
grid_[# 19, 49] = FLOOR;
grid_[# 19, 50] = FLOOR;
grid_[# 17, 51] = FLOOR;
grid_[# 19, 51] = FLOOR;

// 147
grid_[# 22, 49] = FLOOR;
grid_[# 23, 49] = FLOOR;
grid_[# 21, 50] = FLOOR;
grid_[# 23, 50] = FLOOR;
grid_[# 22, 51] = FLOOR;
grid_[# 23, 51] = FLOOR;

// 148
grid_[# 25, 49] = FLOOR;
grid_[# 26, 49] = FLOOR;
grid_[# 27, 50] = FLOOR;
grid_[# 25, 51] = FLOOR;
grid_[# 26, 51] = FLOOR;
grid_[# 27, 51] = FLOOR;

// 149
grid_[# 30, 49] = FLOOR;
grid_[# 31, 49] = FLOOR;
grid_[# 29, 50] = FLOOR;
grid_[# 29, 51] = FLOOR;
grid_[# 30, 51] = FLOOR;
grid_[# 31, 51] = FLOOR;

// 150
grid_[# 33, 49] = FLOOR;
grid_[# 35, 49] = FLOOR;
grid_[# 33, 50] = FLOOR;
grid_[# 35, 50] = FLOOR;
grid_[# 33, 51] = FLOOR;
grid_[# 34, 51] = FLOOR;

// 151
grid_[# 37, 49] = FLOOR;
grid_[# 38, 49] = FLOOR;
grid_[# 37, 50] = FLOOR;
grid_[# 39, 50] = FLOOR;
grid_[# 37, 51] = FLOOR;
grid_[# 39, 51] = FLOOR;

// 152
grid_[# 41, 49] = FLOOR;
grid_[# 42, 49] = FLOOR;
grid_[# 43, 49] = FLOOR;
grid_[# 41, 50] = FLOOR;
grid_[# 42, 51] = FLOOR;
grid_[# 43, 51] = FLOOR;

// 153
grid_[# 45, 49] = FLOOR;
grid_[# 46, 49] = FLOOR;
grid_[# 47, 49] = FLOOR;
grid_[# 47, 50] = FLOOR;
grid_[# 45, 51] = FLOOR;
grid_[# 46, 51] = FLOOR;

// 154
grid_[# 50, 49] = FLOOR;
grid_[# 51, 49] = FLOOR;
grid_[# 49, 50] = FLOOR;
grid_[# 51, 50] = FLOOR;
grid_[# 49, 51] = FLOOR;
grid_[# 51, 51] = FLOOR;

// 155
grid_[# 53, 49] = FLOOR;
grid_[# 55, 49] = FLOOR;
grid_[# 53, 50] = FLOOR;
grid_[# 55, 50] = FLOOR;
grid_[# 54, 51] = FLOOR;
grid_[# 55, 51] = FLOOR;

// 156
grid_[# 5, 53] = FLOOR;
grid_[# 6, 53] = FLOOR;
grid_[# 7, 53] = FLOOR;
grid_[# 7, 54] = FLOOR;
grid_[# 5, 55] = FLOOR;
grid_[# 6, 55] = FLOOR;
grid_[# 7, 55] = FLOOR;

// 157
grid_[# 10, 53] = FLOOR;
grid_[# 11, 53] = FLOOR;
grid_[# 9, 54] = FLOOR;
grid_[# 11, 54] = FLOOR;
grid_[# 9, 55] = FLOOR;
grid_[# 10, 55] = FLOOR;
grid_[# 11, 55] = FLOOR;

// 158
grid_[# 13, 53] = FLOOR;
grid_[# 15, 53] = FLOOR;
grid_[# 13, 54] = FLOOR;
grid_[# 15, 54] = FLOOR;
grid_[# 13, 55] = FLOOR;
grid_[# 14, 55] = FLOOR;
grid_[# 15, 55] = FLOOR;

// 159
grid_[# 17, 53] = FLOOR;
grid_[# 18, 53] = FLOOR;
grid_[# 17, 54] = FLOOR;
grid_[# 19, 54] = FLOOR;
grid_[# 17, 55] = FLOOR;
grid_[# 18, 55] = FLOOR;
grid_[# 19, 55] = FLOOR;

// 160
grid_[# 21, 53] = FLOOR;
grid_[# 22, 53] = FLOOR;
grid_[# 23, 53] = FLOOR;
grid_[# 21, 54] = FLOOR;
grid_[# 21, 55] = FLOOR;
grid_[# 22, 55] = FLOOR;
grid_[# 23, 55] = FLOOR;

// 161
grid_[# 25, 53] = FLOOR;
grid_[# 26, 53] = FLOOR;
grid_[# 27, 53] = FLOOR;
grid_[# 25, 54] = FLOOR;
grid_[# 27, 54] = FLOOR;
grid_[# 25, 55] = FLOOR;
grid_[# 26, 55] = FLOOR;

// 162
grid_[# 29, 53] = FLOOR;
grid_[# 30, 53] = FLOOR;
grid_[# 31, 53] = FLOOR;
grid_[# 29, 54] = FLOOR;
grid_[# 31, 54] = FLOOR;
grid_[# 29, 55] = FLOOR;
grid_[# 31, 55] = FLOOR;

// 163
grid_[# 33, 53] = FLOOR;
grid_[# 34, 53] = FLOOR;
grid_[# 35, 53] = FLOOR;
grid_[# 33, 54] = FLOOR;
grid_[# 35, 54] = FLOOR;
grid_[# 34, 55] = FLOOR;
grid_[# 35, 55] = FLOOR;

// 164
grid_[# 37, 53] = FLOOR;
grid_[# 38, 53] = FLOOR;
grid_[# 39, 53] = FLOOR;
grid_[# 37, 54] = FLOOR;
grid_[# 39, 54] = FLOOR;
grid_[# 37, 55] = FLOOR;
grid_[# 38, 55] = FLOOR;
grid_[# 39, 55] = FLOOR;



#endregion


// Place the tiles in the room
place_tiles_from_grid(grid_, WALL, true);

// Redraw the shadow surface
shadow_need_redraw = true;

// flag the debug overlay for redrawing
with (Debugger) {
	need_redraw_ = true;
}