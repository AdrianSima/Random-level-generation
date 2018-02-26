/// @description 
if keyboard_check_pressed(ord("R")) {
	generate_random_level(!orphan_walls, double_walls);
}
else if keyboard_check_pressed(ord("T")) {
	double_walls = !double_walls;
}
else if keyboard_check_pressed(ord("Y")) {
	orphan_walls = !orphan_walls;
}