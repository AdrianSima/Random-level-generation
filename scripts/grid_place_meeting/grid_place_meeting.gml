///@func grid_place_meeting(grid, x, y, target_tile)
///@desc Returns true if object is colliding with target tile, false if not
///@param {ds_grid} grid The grid in which we check for collision
///@param {int} x x coordinate of place
///@param {int} y y coordinate of place
///@param {int} target_tile The tile ID that we look to collide with

var _grid	= argument0,
	_x		= argument1,
	_y		= argument2,
	_target = argument3,
	_x_offset = x - _x,
	_y_offset = y - _y;
	
return  _grid[#  _x_offset + self.bbox_left		div CELL_WIDTH,  _y_offset + self.bbox_top			div CELL_HEIGHT] == _target or
		_grid[# (_x_offset + self.bbox_right-1)	div CELL_WIDTH,  _y_offset + self.bbox_top			div CELL_HEIGHT] == _target or
		_grid[#  _x_offset + self.bbox_left		div CELL_WIDTH, (_y_offset + self.bbox_bottom-1)	div CELL_HEIGHT] == _target or
		_grid[# (_x_offset + self.bbox_right-1)	div CELL_WIDTH, (_y_offset + self.bbox_bottom-1)	div CELL_HEIGHT] == _target;