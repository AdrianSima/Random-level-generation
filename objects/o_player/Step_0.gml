/// @description Player logic

h_input = (keyboard_check(vk_right) or keyboard_check(ord("D"))) - (keyboard_check(vk_left) or keyboard_check(ord("A")));
v_input = (keyboard_check(vk_down) or keyboard_check(ord("S"))) - (keyboard_check(vk_up) or keyboard_check(ord("W")));

xSpeed += h_input * acceleration;
ySpeed += v_input * acceleration;

var _move_angle = point_direction(0, 0, xSpeed, ySpeed),
	_move_speed = point_distance(0, 0, xSpeed, ySpeed);
if (_move_speed > maxSpeed) {
	xSpeed = lengthdir_x(maxSpeed, _move_angle);
	ySpeed = lengthdir_y(maxSpeed, _move_angle);
}

if (h_input == 0) {
	xSpeed = lerp(xSpeed, 0, friction_);
	if (abs(xSpeed) < 0.01) then xSpeed = 0;
}
if (v_input == 0) {
	ySpeed = lerp(ySpeed, 0, friction_);
	if (abs(ySpeed) < 0.01) then ySpeed = 0;
}

// Re-apply speed fractions
xSpeed += xSpeedFraction;
ySpeed += ySpeedFraction;

// Remove speed fractions
xSpeedFraction = xSpeed - (floor(abs(xSpeed)) * sign(xSpeed));
xSpeed -= xSpeedFraction;
ySpeedFraction = ySpeed - (floor(abs(ySpeed)) * sign(ySpeed));
ySpeed -= ySpeedFraction;

if (xSpeed != 0 and ySpeed != 0)
	show_debug_message("speed = ["+string(xSpeed)+","+string(ySpeed)+"]");

var bbox_side;
// Horizontal Collision
if (!Debugger.debug_) {
	if (xSpeed > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	if (tilegrid_get_at_pixel(o_level.grid_, bbox_side+xSpeed, bbox_top) != FLOOR) || (tilegrid_get_at_pixel(o_level.grid_, bbox_side+xSpeed, bbox_bottom) != FLOOR)
	{
		if (xSpeed > 0) x = x - (x mod CELL_WIDTH) + CELL_WIDTH-1 - (bbox_right - x);
		else x = x - (x mod CELL_WIDTH) - (bbox_left - x);
		xSpeed = 0;
	}
}
x += xSpeed;

// Vertical Collision
if (!Debugger.debug_) {
	if (ySpeed > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	if (tilegrid_get_at_pixel(o_level.grid_, bbox_left, bbox_side+ySpeed) != FLOOR) || (tilegrid_get_at_pixel(o_level.grid_, bbox_right, bbox_side+ySpeed) != FLOOR)
	{
		if (ySpeed > 0) y = y - (y mod CELL_HEIGHT) + CELL_HEIGHT-1 - (bbox_bottom - y);
		else y = y - (y mod CELL_HEIGHT) - (bbox_top - y);
		ySpeed = 0;
	}
}
y += ySpeed;