/// @description Delete the grid to free memory
if (ds_exists(grid_, ds_type_grid)) ds_grid_destroy(grid_);
if (surface_exists(shadow_surface)) surface_free(shadow_surface);
