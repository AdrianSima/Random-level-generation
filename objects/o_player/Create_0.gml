/// @description Init player
xSpeedFraction = 0;
ySpeedFraction = 0;
xSpeed = 0;
ySpeed = 0;
maxSpeed = 2;
acceleration = 0.5;
friction_ = 0.2;

// Create the camera for the player
camera = instance_create_layer(x, y, "Instances", Camera);
with camera {
	target = other;
}
