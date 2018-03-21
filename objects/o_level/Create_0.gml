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

// Generate the first level
if (room == rm_test)
	generate_test_level();
else
	generate_random_level(!orphan_walls);
