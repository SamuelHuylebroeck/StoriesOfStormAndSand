/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i< ds_list_size(ds_active_units);i++)
{
	var element = ds_active_units[| i];
	with(element)
	{
		instance_destroy();
	}
}
ds_list_destroy(ds_active_units);