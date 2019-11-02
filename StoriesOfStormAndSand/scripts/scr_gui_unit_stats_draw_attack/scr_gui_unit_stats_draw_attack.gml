///@function scr_gui_unit_stats_draw_attack(pos_x, pos_y, attack)
///@description draw the stats of an attack in the unit stat card
///@param{int} pos_x x-position to start drawing at
///@param{int} pos_y y-position to start drawing at
///@param{attack} attack the attack information array
///@param{int} 

var current_pos_x = argument0;
var current_pos_y = argument1;
var attack = argument2;

var type_icon = scr_select_icon(attack[attack_fields.type]);
draw_sprite(type_icon,0,current_pos_x, current_pos_y);
current_pos_x += sprite_get_width(type_icon);
draw_set_font(text_font);
draw_set_color(text_color);
draw_set_alpha(1);
draw_text(current_pos_x,current_pos_y,attack[attack_fields.name]);
current_pos_x += string_width(attack[attack_fields.name]) + internal_offset_x;
var range_string = scr_gui_create_range_string(attack[attack_fields.range_min], attack[attack_fields.range_max]);
draw_text(current_pos_x,current_pos_y, " | Range: " + range_string);
current_pos_x = content_left_edge;
current_pos_y += sprite_get_height(type_icon) + internal_offset_y;
var preamble_strength = "Str: ";
scr_gui_draw_two_value_text(current_pos_x,current_pos_y,preamble_strength,text_color,attack[attack_fields.strength_weak],text_stat_color_weak,attack[attack_fields.strength_normal],text_stat_color_normal);
var bar_length = 3;
current_pos_x = content_right_edge - bar_length * bar_component_width;
scr_gui_unit_stats_create_bar(current_pos_x,current_pos_y,bar_length,attack[attack_fields.strength_weak],text_stat_color_weak, attack[attack_fields.strength_normal], text_stat_color_normal,blend_length);
current_pos_y += bar_component_height + internal_offset_y;
current_pos_x = content_left_edge;
var preamble_hit = "Hit: ";
scr_gui_draw_two_value_text(current_pos_x,current_pos_y,preamble_hit,text_color,attack[attack_fields.hit_weak],text_stat_color_weak,attack[attack_fields.hit_normal],text_stat_color_normal);
bar_length = 3;
current_pos_x = content_right_edge - bar_length * bar_component_width;
scr_gui_unit_stats_create_bar(current_pos_x,current_pos_y,bar_length,attack[attack_fields.hit_weak],text_stat_color_weak, attack[attack_fields.hit_normal], text_stat_color_normal,blend_length);
current_pos_y += bar_component_height + internal_offset_y;
return current_pos_y;