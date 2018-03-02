/// @func grid_place_meeting(grid, object, target_tile)
/// @arg grid Grid to check
/// @arg object The object
/// @arg target_tile The tile that we look for

var _grid = argument0,
	_object = argument1,
	_target = argument2;
	
return  _grid[#  _object.bbox_left		div CELL_WIDTH,  _object.bbox_top		div CELL_HEIGHT] == _target or
		_grid[# (_object.bbox_right-1)	div CELL_WIDTH,  _object.bbox_top		div CELL_HEIGHT] == _target or
		_grid[#  _object.bbox_left		div CELL_WIDTH, (_object.bbox_bottom-1)	div CELL_HEIGHT] == _target or
		_grid[# (_object.bbox_right-1)	div CELL_WIDTH, (_object.bbox_bottom-1)	div CELL_HEIGHT] == _target;