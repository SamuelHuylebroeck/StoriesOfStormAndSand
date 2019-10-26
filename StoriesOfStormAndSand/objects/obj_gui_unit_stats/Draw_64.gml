/// @description Insert description here
// You can write your code in this editor
scr_gui_unit_stats_assemble_background();
var current_pos_x = internal_start_offset_x + screen_offset_x;
var current_pos_y = internal_start_offset_y+ screen_offset_y;


//Draw internals
//portrait 1x1
draw_sprite(unit.spr_portrait,0,current_pos_x, current_pos_y);
current_pos_x += sprite_get_width(unit.spr_portrait) + internal_offset_x;
//icon
var type_icon = scr_select_icon(unit.stats_type);
draw_sprite(type_icon, 0, current_pos_x, current_pos_y);
current_pos_x += internal_offset_x + sprite_get_width(type_icon);
//name
draw_set_font(text_font);
draw_set_color(text_color);
draw_set_alpha(1);
draw_text(current_pos_x,current_pos_y,unit.stats_name);
current_pos_x -= (internal_offset_x + sprite_get_width(type_icon));
current_pos_y += sprite_get_height(type_icon) + internal_offset_y;
//health
var hp_text = "HP: ";
draw_text(current_pos_x,current_pos_y,hp_text);
current_pos_x += string_width(hp_text);
var hp_values =  string(unit.stats_current_hp) +" / " + string(unit.stats_max_hp);
draw_text(current_pos_x,current_pos_y, hp_values);

current_pos_x -= string_width(hp_text);
current_pos_y += string_height(hp_text) + internal_offset_y;

//input
var length = 2;
var blend_length = 12;
var left_color = c_green;
var right_color = c_red;
var value_one = unit.stats_current_hp;
var value_two = unit.stats_max_hp;

scr_gui_unit_stats_create_bar(current_pos_x,current_pos_y,2,unit.stats_current_hp,c_green,unit.stats_max_hp,c_red,0);



//movement
//defense
//evade