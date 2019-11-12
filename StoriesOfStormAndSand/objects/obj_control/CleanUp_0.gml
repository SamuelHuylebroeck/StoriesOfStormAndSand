/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i< ds_list_size(ds_gui_elements);i++)
{
	var element = ds_gui_elements[| i];
	with(element)
	{
		instance_destroy();
	}
}
ds_list_destroy(ds_gui_elements);