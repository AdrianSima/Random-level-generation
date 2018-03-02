/// @description Player logic

h_input = (keyboard_check(vk_right) or keyboard_check(ord("D"))) - (keyboard_check(vk_left) or keyboard_check(ord("A")));
v_input = (keyboard_check(vk_down) or keyboard_check(ord("S"))) - (keyboard_check(vk_up) or keyboard_check(ord("W")));

move_direction = point_direction(0, 0, h_input, v_input);
xSpeed += lengthdir_x(acceleration, move_direction) * abs(h_input);
ySpeed += lengthdir_y(acceleration, move_direction) * abs(v_input);

xSpeed = clamp(lerp(xSpeed, 0, 0.3), -maxSpeed, maxSpeed);
ySpeed = clamp(lerp(ySpeed, 0, 0.3), -maxSpeed, maxSpeed);

if (h_input == 0) {
	xSpeed = lerp(xSpeed, 0, 0.3);
}
if (v_input == 0) {
	ySpeed = lerp(ySpeed, 0, 0.3);
}

if (h_input == 0 and v_input == 0) {
	image_speed = 0;
	image_index = 0;
}
else {
	image_speed = 0.7;
}

x += xSpeed;
if (xSpeed > 0) {
	if (grid_place_meeting(o_level.grid_, self, VOID)) {
		x = bbox_right &~ (CELL_WIDTH - 1);
		x-= bbox_right - x;
		xSpeed = 0;
	}
}
else if (xSpeed < 0) {
	if (grid_place_meeting(o_level.grid_, self, VOID)) {
		x = bbox_left &~ (CELL_WIDTH - 1);
		x+= CELL_WIDTH + x - bbox_left;
		xSpeed = 0;
	}
}

y += ySpeed;
if (ySpeed > 0) {
	if (grid_place_meeting(o_level.grid_, self, VOID)) {
		y = bbox_bottom &~ (CELL_HEIGHT - 1);
		y-= bbox_bottom - y;
		ySpeed = 0;
	}
}
else if (ySpeed < 0) {
	if (grid_place_meeting(o_level.grid_, self, VOID)) {
		y = bbox_top &~ (CELL_HEIGHT - 1);
		y+= CELL_HEIGHT + y - bbox_top;
		ySpeed = 0;
	}
}