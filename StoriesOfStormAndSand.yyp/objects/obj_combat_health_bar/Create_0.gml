/// @description Insert description here
// You can write your code in this editor

//Config
width = 3;
text_font = font_stats_bahn_small;

component_width = sprite_get_width(spr_gui_us_small_l);
component_height = sprite_get_height(spr_gui_us_small_l);

component_bar_width = sprite_get_width(spr_horizontal_gauge_l);
component_bar_height = sprite_get_height(spr_horizontal_gauge_l);

current_color = c_green;
max_color = c_red;
health_blend_length = 10;

margin_x = 15;

//Internal values
initialized = false;
linked_anim_obj = noone;
running = false;
current_health = 0;
max_health = 0;
target_health = 0;
health_step = 0;