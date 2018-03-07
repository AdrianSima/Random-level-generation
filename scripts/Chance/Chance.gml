/// @func Chance(percent[0-1])
/// @param {float} percent[0-1] The percent of returning true
 
/// @desc Returns true or false depending on RNG
// ex:
//      Chance(0.7);    -> Returns true 70% of the time
 
return argument0 > random(1);