/// @description Insert description here
// You can write your code in this editor

//Config
//background
width = 9;
height = 5;
component_width = sprite_get_width(spr_gui_us_tlc);
component_height = sprite_get_height(spr_gui_us_tlc);
//platforms
platforms_offset_melee_x = 1*component_width;
platforms_offset_ranged_x = 1.5*component_width;
platforms_offset_y = 1*component_height;

//Animation
attacker = noone;
attack = noone;
defender = noone;

global.camera_controllable = false;
