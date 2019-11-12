/// @description Insert description here
// You can write your code in this editor
var old_align = draw_get_valign();
draw_set_valign(fa_middle);
var current_pos_x = view_get_wport(view_current)/2 + view_get_xport(view_current);
var current_pos_y = screen_offset_y;
scr_gui_unit_stats_assemble_background(current_pos_x,current_pos_y,width, height,component_width,component_height);
current_pos_x += internal_start_offset_x;
current_pos_y += internal_start_offset_y;
//icon
var side_icon = current_side.icon;
current_pos_y -= sprite_get_height(side_icon)/2;
draw_sprite(side_icon, 0, current_pos_x, current_pos_y);
current_pos_x += internal_offset_x + sprite_get_width(side_icon);
current_pos_y += sprite_get_height(side_icon)/2;
//turn
var old_font = draw_get_font();
var old_color = draw_get_color();
draw_set_font(text_font);
draw_set_color(text_color);
draw_set_alpha(1);
var turn_text = "Turn: " + string(current_side.current_turn) + " - ";
draw_text(current_pos_x,current_pos_y,turn_text);
//name
current_pos_x += string_width(turn_text) + internal_offset_x;
draw_text(current_pos_x,current_pos_y, current_side.name);

draw_set_font(old_font);
draw_set_color(old_color);
draw_set_valign(old_align);