/// @description Initializing the camera

width_default = 320;
height_default = 180;
width = width_default;
height = height_default;

half_width = width / 2;
half_height = height / 2;

zoom = 1;
zoom_target = 1;
zoom_min = 1;
zoom_max = 4;

main_camera = camera_create_view(0, 0, width, height, 0, self, -1, -1, -1, -1);
view_set_camera(0, main_camera);

target = noone;
