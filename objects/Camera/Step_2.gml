/// @description Follow the target

if (!instance_exists(target)) exit;

if (zoom != zoom_target) {
	// apply smooth zooming
	zoom = lerp(zoom, zoom_target, .1);
	// reach the target when close enough
	if (zoom > zoom_target - 0.001 and zoom < zoom_target + 0.001) {
		zoom = zoom_target;
	}
	width = width_default * zoom;
	height = height_default * zoom;
	half_width = width / 2;
	half_height = height / 2;
	camera_set_view_size(main_camera, width, height);
}

x = lerp(x, target.x, .1);
y = lerp(y, target.y, .1);

x = clamp(x, half_width + CELL_WIDTH, room_width - half_width - CELL_WIDTH);
y = clamp(y, half_height + CELL_HEIGHT, room_height - half_height - CELL_HEIGHT);

camera_set_view_pos(main_camera, x - half_width, y - half_height);

