/// @description Insert description here
// You can write your code in this editor
var gui_element = self;
with(obj_control)
{
	ds_list_add(ds_gui_elements, gui_element);
}


//Config
width = 7;
height = 2;

component_width = sprite_get_width(spr_gui_us_tlc);
component_height = sprite_get_width(spr_gui_us_tlc);

screen_offset_y=16;

internal_start_offset_x = 12;
internal_start_offset_y = height/2*component_height;

internal_offset_x = 3;
internal_offset_y = 3;

text_font = font_turn_marker_bahn;
text_color = make_color_hsv(46,74,255);

//internals
current_side = global.side_map[global.current_turn_controller];