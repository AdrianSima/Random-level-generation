/// @desc This will print all the arguments in the console
/// @param [1, ...] Values to print

if (argument_count == 0) exit;

var str = "";

for(var _i = 0; _i < argument_count; _i += 1) {
	if (str != "") str += ", ";
	str += string(argument[_i]);
}

show_debug_message(str);