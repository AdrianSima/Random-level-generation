/// @description update animations

if (move != 0) {
	sprite_index = s_player_walk;
	image_xscale = move;
}
else {
	sprite_index = s_player_idle;
}

if (key_down)
	sprite_index = s_player_crouch;
else if (!place_meeting(x, y + 1, obj_grass))
	sprite_index = s_player_jump;
