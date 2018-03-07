/// @description 
if keyboard_check_pressed(ord("R")) {
	if (room = rm_test) room_goto_next();
	else generate_random_level(!orphan_walls);
}
else if keyboard_check_pressed(ord("Y")) {
	orphan_walls = !orphan_walls;
}