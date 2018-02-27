/// @description Player movement
/*
//Get the player's input
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_left  = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_jump  = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
key_jump_held   = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down        = keyboard_check(vk_down) || keyboard_check(ord("S"));

//React to inputs
move = key_right - key_left;

//Smooth Movement
if(move != 0)
{	// This will limit our speed and apply the direction by multiplying with 'move'
    movespeed = clamp(movespeed + acc * move, -movespeed_max, movespeed_max);
}
else
{ // If we are not moving left or right, we need to slow down
	if (abs(movespeed) > 0.5) // If we are still moving too fast, we slow down
	{
		// This will slow you down with 10% every frame, but will never reach exactly 0
		// That is why we have the 0.5 as a margin. If we get below that, we are essentially stopped
		// so we manually set movespeed = 0
		movespeed *= 0.9;
	}
	else // This means we are below 0.5 speed so we can stop completely
	{
		movespeed = 0;
	}
		
}

x += movespeed;*/

//Get the player's input
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_up);
key_jump_held = keyboard_check(vk_up)
key_down = keyboard_check(vk_down);
global.key_bite = keyboard_check(vk_space);

//React to inputs
move = key_right - key_left;

if (vsp < 10) vsp += global.grav;

if (place_meeting(x,y+1,obj_grass)) {
	if (key_jump) {
		vsp = -jumpspeed;
		if (key_down) vsp -= jumpspeed * 0.5;
	}
}

if (vsp < 0) && (!key_jump_held)
	vsp = max(vsp,-jumpspeed/4);
	
if (!place_meeting(x, y + vsp, obj_grass))
	y += vsp;
else {
	var ySign = sign(vsp);
	while (!place_meeting(x, y + ySign, obj_grass)) {
		y += ySign;
	}
	vsp = 0;
}

//var hsp_final = hsp + hsp_carry;

//Smooth Movement
if (move != 0 && !key_down)
{   // This will limit our speed and apply the direction by multiplying with 'move'
	movespeed = clamp(movespeed + acc * move, -movespeed_max, 
	movespeed_max);
}
else // If we are not moving left or right, we need to slow down
{
	if (abs(movespeed) > 0.5) // If we are still moving too fast, we slow down
	{
	    // This will slow you down with 10% every frame, but will never reach exactly 0
	    // That is why we have the 0.5 as a margin. If we get below that, we are essentially stopped
	    // so we manually set movespeed = 0
	    movespeed *= 0.95;
	}
	else // This means we are below 0.5 speed so we can stop completely
	{
	    movespeed = 0;
	}
}

//==================
//x += movespeed;

// First we check to see that the place where we want to move is empty
if (!place_meeting(x + movespeed, y, obj_grass)) {
	// If it is empty, we can move there
	x += movespeed;
}
else {

	// If it is not empty, we store in xSpeedSign the sign of our speed
	// (which is -1 for left and 1 for right)
	var xSpeedSign = sign(movespeed);

	// While there is no collision 1 pixel away in the direction of movement,
	// we move 1 pixel ahead, until we reach the solid object
	while( !place_meeting(x + xSpeedSign, y, obj_grass)) {
	    x += xSpeedSign;
	}

	// After we reached the solid object we stop
	movespeed= 0;
}
/*
//Wall jump &  Wall climb
if global.energy > 0.99
{
	if (place_meeting(x+1,y,obj_grass)) && (key_jump) || (place_meeting(x-1,y,obj_grass)) && (key_jump) {
		vsp = -jumpspeed; 
		global.energy += -1;
	}
}

global.energy += global.energyregenrate;
*/