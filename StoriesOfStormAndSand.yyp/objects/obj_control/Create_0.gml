/// @description Insert description here
// You can write your code in this editor
global.current_turn_controller = global.active_players[0];
global.selected = noone;
global.enemy_selected = noone;
global.moving = false;
global.combat_animation_playing = false;

ds_gui_elements = ds_list_create();
move_grid_drawn = false;