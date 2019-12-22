/// @description Insert description here
// You can write your code in this editor
global.current_turn_controller = controller_id.p_1;
global.selected = noone;
global.moving = false;
global.combat_animation_playing = false;

ds_gui_elements = ds_list_create();
move_grid_drawn = false;

side_objects[sides.house_of_storms] = noone;
side_objects[sides.sand_alliance] = noone;