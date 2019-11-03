/// @description Clean up components and re-rnzblr camera
// You can write your code in this editor
for (var i = 0; i< ds_list_size(ds_list_combat_controller_components);i++)
{
	var component = ds_list_combat_controller_components[| i];
	with(component)
	{
		instance_destroy();
	}
}
ds_list_destroy(ds_list_combat_controller_components);

with(obj_camera)
{
	scr_combat_camera_reset();
}
global.camera_controllable = true;
with(obj_gui_unit_stats)
{
	visible = true;
}