/// @description Init
debug_ = true;
debug_overlay_ = false;

auto_generate = false;

debug_surface_id_ = noone;
need_redraw_ = false;

cell_x = noone;
cell_y = noone;
cell_tile_index = noone;
cell_mapped_index = noone;

draw_set_font(f_debug);
str_height = string_height("M");
