/// @description 
var garbage_id = instance_position(x, y, garbage);
if (garbage_id == noone) {
	instance_create_layer((x div CELL_WIDTH) * CELL_WIDTH, (y div CELL_HEIGHT) * CELL_HEIGHT, "Level", garbage);
}
else {
	instance_destroy(garbage_id);
}