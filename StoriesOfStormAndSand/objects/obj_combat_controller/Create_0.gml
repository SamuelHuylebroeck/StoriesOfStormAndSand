/// @description Insert description here
// You can write your code in this editor

//Config
//background
width =11;
height = 5;
component_width = sprite_get_width(spr_gui_us_tlc);
component_height = sprite_get_height(spr_gui_us_tlc);
//platforms
platforms_offset_melee_x = 1*component_width;
platforms_offset_ranged_x = 2*component_width;
platforms_offset_y = 0.5*component_height;
//animation
animation_start_delay = room_speed * 0.5;;
animation_end_delay = room_speed *1.2;
animation_health_bar_depletion_steps = room_speed*1;
//internal variables
//Positioning
top_left_corner_x = x - width*component_width/2;
top_left_corner_y = y - height*component_height/2;
//Animation
attacker = noone;
attack = noone;
defender = noone;
attacker_anim_done = false;
defender_anim_done = false;
animation_end_started = false;
//Camera
ds_list_combat_controller_components = ds_list_create();
global.camera_controllable = false;

