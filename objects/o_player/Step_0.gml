/// @description Player movement

//Get the player's input
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_left  = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_jump  = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
key_jump_held   = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down        = keyboard_check(vk_down) || keyboard_check(ord("S"));

//React to inputs
move = key_right - key_left;

//Smooth Movement
/*if(move != 0)
{ // accelerate
    movespeed = clamp(movespeed + acc, 0, movespeed_max);
}
else if (movespeed > 0) {
	if (movespeed < 0.1)
		movespeed = 0;
	else
		movespeed -= .1;
}

hsp = movespeed * image_xscale;*/

//Get the player's input
key_right = keyboard_check(vk_right);
key_left  = keyboard_check(vk_left);
key_jump  = keyboard_check_pressed(vk_up);
key_jump_held   = keyboard_check(vk_up);
key_down        = keyboard_check(vk_down);
global.key_bite = keyboard_check(vk_space);

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

x += movespeed;