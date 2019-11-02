///@function scr_attack_in_range(origin,target,attack)
///@description check if an attack is in range of the target
///@param{unit} origin the unit that would make the attack
///@param{unit} target target of the possible attack
///@param{attack} attack
var origin = argument0;
var target = argument1;
var attack = argument2;

var origin_x = scr_pixel_x_to_tile_x(origin.x);
var origin_y = scr_pixel_y_to_tile_y(origin.y)

var target_x = scr_pixel_x_to_tile_x(target.x);
var target_y = scr_pixel_y_to_tile_y(target.y);

var range = sqrt( power(origin_x-target_x, 2) + power(origin_y - target_y,2));
var outside_min =  range > attack[attack_fields.range_min]-1;
var inside_max = range <= attack[attack_fields.range_max];
show_debug_message(attack[attack_fields.name] + " " + string(range) + string(outside_min)+ "," + string(inside_max));
return  outside_min && inside_max;
