/// @description Insert description here
// You can write your code in this editor
scr_gui_unit_stats_assemble_background(screen_offset_x,screen_offset_y,width,height,component_width,component_height);

var current_pos_x = content_left_edge + internal_offset_x;
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
var text_pos = current_pos_x;
var hp_text = "HP: ";
scr_gui_draw_two_value_text(current_pos_x, current_pos_y, hp_text,text_color, unit.stats_current_hp, text_color, unit.stats_max_hp, text_color);
var bar_length = 2;
current_pos_x = content_right_edge - bar_length*bar_component_width - internal_offset_x;
scr_gui_unit_stats_create_bar(current_pos_x,current_pos_y,bar_length,unit.stats_current_hp,health_color_healthy,unit.stats_max_hp,health_color_missing,health_blend_length);
current_pos_y += string_height(hp_text) + internal_offset_y + internal_offset_y;
current_pos_x = text_pos;

//movement
var movement_text = "Mov: " + string(unit.stats_move_points_sqr);
draw_text(current_pos_x, current_pos_y, movement_text);
current_pos_y += string_height(movement_text);
//x-reset point
current_pos_x = content_left_edge;
current_pos_y += 2*internal_offset_y;
//double line
draw_set_color(c_black);
draw_line_width(current_pos_x, current_pos_y , current_pos_x + width * component_width - internal_offset_x - screen_offset_x - internal_start_offset_x, current_pos_y, internal_offset_x);
current_pos_y += 2* internal_offset_y
//armor
text_pos = current_pos_x;
var preamble_arm = "Arm: ";
scr_gui_draw_two_value_text(current_pos_x,current_pos_y,preamble_arm,text_color,unit.stats_armor_weak,text_stat_color_weak,unit.stats_armor_normal,text_stat_color_normal);
var arm_text = preamble_arm + string(unit.stats_armor_weak) + "/" + string(unit.stats_armor_normal);
bar_length = 3 ; 
current_pos_x = content_right_edge - bar_length*bar_component_width - internal_offset_x;
scr_gui_unit_stats_create_bar(current_pos_x,current_pos_y,bar_length,unit.stats_armor_weak,text_stat_color_weak, unit.stats_armor_normal, text_stat_color_normal,blend_length);
current_pos_y += bar_component_height + internal_offset_y;
//evade
current_pos_x = content_left_edge;
var preamble_eva = "Eva: ";
scr_gui_draw_two_value_text(current_pos_x,current_pos_y,preamble_eva,text_color,unit.stats_evade_weak,text_stat_color_weak,unit.stats_evade_normal,text_stat_color_normal);
var arm_text = preamble_arm + string(unit.stats_evade_weak) + "/" + string(unit.stats_evade_normal);
bar_length = 3 ; 
current_pos_x = content_right_edge - bar_length*bar_component_width - internal_offset_x;
scr_gui_unit_stats_create_bar(current_pos_x,current_pos_y,3,unit.stats_evade_weak,text_stat_color_weak, unit.stats_evade_normal, text_stat_color_normal,blend_length);
current_pos_y += bar_component_height + internal_offset_y;
//Spike
current_pos_x = content_left_edge;
var preamble_eva = "Spike: ";
scr_gui_draw_two_value_text(current_pos_x,current_pos_y,preamble_eva,text_color,unit.stats_spike_weak,text_stat_color_weak,unit.stats_spike_normal,text_stat_color_normal);
var arm_text = preamble_arm + string(unit.stats_evade_weak) + "/" + string(unit.stats_evade_normal);
bar_length = 3 ; 
current_pos_x = content_right_edge - bar_length*bar_component_width - internal_offset_x;
scr_gui_unit_stats_create_bar(current_pos_x,current_pos_y,bar_length,unit.stats_spike_weak,text_stat_color_weak, unit.stats_spike_normal, text_stat_color_normal,blend_length);
current_pos_y += bar_component_height + internal_offset_y;
//x-reset point
current_pos_x = content_left_edge;
current_pos_y += 2*internal_offset_y;
//double line
draw_set_color(c_black);
draw_line_width(current_pos_x, current_pos_y , current_pos_x + width * component_width - internal_offset_x - screen_offset_x - internal_start_offset_x, current_pos_y, internal_offset_x);
current_pos_y += 2* internal_offset_y

for(j=0; j< ds_list_size(unit.ds_attack_list);j++)
{
	current_pos_y = scr_gui_unit_stats_draw_attack(current_pos_x, current_pos_y, unit.ds_attack_list[| j]);
}