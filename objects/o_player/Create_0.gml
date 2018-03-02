/// @description Init player

xSpeed = 0;
ySpeed = 0;
maxSpeed = 2;
acceleration = 0.5;

// Create the camera for the player
var camera = instance_create_layer(x, y, "Instances", Camera);
with camera {
	target = other;
}