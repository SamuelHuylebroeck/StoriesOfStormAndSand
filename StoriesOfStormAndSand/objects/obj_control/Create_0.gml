/// @description Insert description here
// You can write your code in this editor
global.state = states.turn_p_1;
global.selected = noone;
global.moving = false;
global.combat_animation_playing = false;

var storm_house = instance_find(obj_side_storm_house,0);
var sand_alliance = instance_find(obj_side_sand_alliance,0);

global.side_map[states.turn_p_1] = storm_house;
global.side_map[states.turn_p_2] = sand_alliance;

ds_gui_elements = ds_list_create();
move_grid_drawn = false;