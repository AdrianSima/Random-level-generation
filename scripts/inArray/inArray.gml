///@func inArray(array, needle)
///@desc Retuns true if the needle is found in the array
///@arg {array} array The haystack in which we search the needle
///@arg {any} needle The needle that we search

var _len = array_length_1d(argument0);

for (var _i = 0; _i < _len; _i += 1) {
	if (argument0[_i] == argument1) return true;
}

return false;