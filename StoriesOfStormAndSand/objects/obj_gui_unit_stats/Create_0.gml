/// @description Insert description here
// You can write your code in this editor
//register with controller
var gui_element = self;
with(obj_control)
{
	ds_list_add(ds_gui_elements, gui_element);
}

unit = noone;

//config
width = 5;
height = 7;

component_width = sprite_get_width(spr_gui_us_tlc);
component_height = sprite_get_width(spr_gui_us_tlc);

screen_offset_x=16;
screen_offset_y=16;

internal_start_offset_x = 12;
internal_start_offset_y = 12

internal_offset_x = 3;
internal_offset_y = 3;

blend_length = 16;
health_blend_length = 10;

text_font = font_stats_bahn;
text_color = make_color_hsv(46,74,255);
health_color_healthy = c_green;
health_color_missing= c_red;
text_stat_color_normal = make_color_hsv(142,211,222);
text_stat_color_weak = c_yellow;

//derived values
bar_component_width = sprite_get_width(spr_horizontal_gauge_l);
bar_component_height = sprite_get_height(spr_horizontal_gauge_l);

content_left_edge = screen_offset_x + internal_start_offset_x;
content_right_edge = screen_offset_x + width * component_width-internal_start_offset_x;

