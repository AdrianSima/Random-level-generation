/// @description Draw the shadows
if (!surface_exists(shadow_surface)) {
	shadow_surface = surface_create(room_width, room_height);
}
// Draw the shadows to the surface
if (shadow_need_redraw) {
	show_debug_message("drawing the shadows surface");
	surface_set_target(shadow_surface);
	draw_clear_alpha(c_black, 0);
	
	for (var _y = 0; _y < height_ - 1; _y += 1) {
		for (var _x = 0; _x < width_ - 1; _x += 1) {
			if (grid_[# _x, _y] == FLOOR and grid_[# _x, _y-1] == WALL) {
				draw_sprite_ext(
					s_shadow, 0,
					_x * CELL_WIDTH,
					_y * CELL_HEIGHT,
					1, 1, 0, c_white, 0.5
				)
			}
		}
	}
	
	surface_reset_target();
	shadow_need_redraw = false;
}
// Draw the shadows to the game
draw_surface(shadow_surface, 0, 0);
