/// @description Insert description here
// You can write your code in this editor
var gui_element = self;
with(obj_control)
{
	var pos = ds_list_find_index(ds_gui_elements, gui_element);
	ds_list_delete(ds_gui_elements, pos);
}