/// @description Init
debug_ = true;
debug_info_ = false;
debug_overlay_ = false;

debug_surface_id_ = noone;

draw_floor_area = true;
auto_generate = false;
need_redraw_ = false;

cell_x = noone;
cell_y = noone;
cell_tile_index = noone;
cell_mapped_index = noone;
cell_tile_x = noone;
cell_tile_y = noone;

draw_set_font(f_debug);
str_height = string_height("M");
