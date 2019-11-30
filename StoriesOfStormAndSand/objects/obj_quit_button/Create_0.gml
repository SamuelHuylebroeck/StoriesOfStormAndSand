/// @description Insert description here
// You can write your code in this editor
var gui_element = self;
with(obj_control)
{
	ds_list_add(ds_gui_elements, gui_element);
}


highlighted = false;
width = sprite_get_width(spr_quit_button);
height = sprite_get_height(spr_quit_button);
margin = 32;

pos_x = view_get_xport(view_current) +  view_get_wport(view_current) - width - margin;
pos_y = view_get_yport(view_current) + margin;