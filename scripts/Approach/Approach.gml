///@func Approach(current, target, amount)
///@param {number} current Start value
///@param {number} target End value
///@param {number} amount The amount it goes from "current" to "target" each frame

///@desc Moves "current" towards "target" by "amount" and returns the result
// Nice bcause it will not overshoot "target", and works in both directions

// Examples:
//      speed = Approach(speed, max_speed, acceleration);
//      hp = Approach(hp, 0, damage_amount);
//      hp = Approach(hp, max_hp, heal_amount);
//      x = Approach(x, target_x, move_speed);
//      y = Approach(y, target_y, move_speed);
 
if (argument0 < argument1)
{
    argument0 += argument2;
    if (argument0 > argument1)
        return argument1;
}
else
{
    argument0 -= argument2;
    if (argument0 < argument1)
        return argument1;
}
return argument0;