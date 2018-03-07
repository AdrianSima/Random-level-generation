/// @func Print(value1, value2, ...)
/// @desc This will print all the arguments separated by a space in the console
/// @param value1 First value to print
/// @param value2 Second value to print
/// @param ... rest of value to print

if (argument_count == 0) exit;

var str = "";

for(var _i = 0; _i < argument_count; _i += 1) {
	if (str != "") str += " ";
	str += string(argument[_i]);
}

show_debug_message(str);