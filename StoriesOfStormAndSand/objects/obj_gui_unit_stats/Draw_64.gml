/// @description Insert description here
// You can write your code in this editor
scr_gui_unit_stats_assemble_background();
var current_pos_x = internal_start_offset_x + screen_offset_x;
var current_pos_y = internal_start_offset_y+ screen_offset_y;

var bar_component_width = sprite_get_width(spr_horizontal_gauge_l);
var bar_component_height = sprite_get_height(spr_horizontal_gauge_l);
var blend_length = 16;

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
scr_gui_draw_two_value_text(current_pos_x, current_pos_y, hp_text,text_color, unit.stats_current_hp, text_color, unit.stats_max_hp, text_color);

var hp_values =  string(unit.stats_current_hp) +" / " + string(unit.stats_max_hp);
current_pos_x += string_width(hp_text + hp_values);

var bar_length = 2;
scr_gui_unit_stats_create_bar(current_pos_x,current_pos_y,bar_length,unit.stats_current_hp,c_green,unit.stats_max_hp,c_red,0);
current_pos_y += string_height(hp_text) + internal_offset_y + internal_offset_y;
current_pos_x -= string_width(hp_text + hp_values);

//movement
var movement_text = "Mov: " + string(unit.stats_move_points_sqr);
draw_text(current_pos_x, current_pos_y, movement_text);
current_pos_y += string_height(movement_text);
//x-reset point
current_pos_x = internal_start_offset_x + screen_offset_x;
current_pos_y += 2*internal_offset_y;
//double line
draw_set_color(c_black);
draw_line_width(current_pos_x, current_pos_y , current_pos_x + current_width * component_width - internal_offset_x - screen_offset_x - internal_start_offset_x, current_pos_y, internal_offset_x);
current_pos_y += 2* internal_offset_y
//armor
var preamble_arm = "Arm: ";
scr_gui_draw_two_value_text(current_pos_x,current_pos_y,preamble_arm,text_color,unit.stats_armor_weak,text_stat_color_weak,unit.stats_armor_normal,text_stat_color_normal);
var arm_text = preamble_arm + string(unit.stats_armor_weak) + "/" + string(unit.stats_armor_normal);
current_pos_x += string_width(arm_text) + internal_offset_x;
scr_gui_unit_stats_create_bar(current_pos_x,current_pos_y,3,unit.stats_armor_weak,text_stat_color_weak, unit.stats_armor_normal, text_stat_color_normal,blend_length);
current_pos_y += bar_component_height + internal_offset_y;
//evade
current_pos_x = internal_start_offset_x + screen_offset_x;
var preamble_eva = "Eva: ";
scr_gui_draw_two_value_text(current_pos_x,current_pos_y,preamble_eva,text_color,unit.stats_evade_weak,text_stat_color_weak,unit.stats_evade_normal,text_stat_color_normal);
var arm_text = preamble_arm + string(unit.stats_evade_weak) + "/" + string(unit.stats_evade_normal);
current_pos_x += string_width(arm_text) + internal_offset_x;
scr_gui_unit_stats_create_bar(current_pos_x,current_pos_y,3,unit.stats_evade_weak,text_stat_color_weak, unit.stats_evade_normal, text_stat_color_normal,blend_length);
current_pos_y += bar_component_height + internal_offset_y;
//x-reset point
current_pos_x = internal_start_offset_x + screen_offset_x;
current_pos_y += 2*internal_offset_y;
//double line
draw_set_color(c_black);
draw_line_width(current_pos_x, current_pos_y , current_pos_x + current_width * component_width - internal_offset_x - screen_offset_x - internal_start_offset_x, current_pos_y, internal_offset_x);

