///@func grid_tile_meeting(grid, object, target_tile)
///@desc Returns true if object is colliding with target tile, false if not
///@param {ds_grid} grid The grid in which we check for collision
///@param {object} object The object that is checking
///@param {integer} target_tile The tile ID that we look to collide with

var _grid = argument0,
	_object = argument1,
	_target = argument2;
	
return  _grid[#  _object.bbox_left		div CELL_WIDTH,  _object.bbox_top		div CELL_HEIGHT] == _target or
		_grid[# (_object.bbox_right-1)	div CELL_WIDTH,  _object.bbox_top		div CELL_HEIGHT] == _target or
		_grid[#  _object.bbox_left		div CELL_WIDTH, (_object.bbox_bottom-1)	div CELL_HEIGHT] == _target or
		_grid[# (_object.bbox_right-1)	div CELL_WIDTH, (_object.bbox_bottom-1)	div CELL_HEIGHT] == _target;