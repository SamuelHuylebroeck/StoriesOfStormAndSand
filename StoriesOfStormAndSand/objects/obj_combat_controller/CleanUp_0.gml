/// @description Insert description here
// You can write your code in this editor
with(obj_combat_attacker_anim)
{
	instance_destroy();
}

with(obj_combat_defender_anim)
{
	instance_destroy();
}

with(obj_camera)
{
	scr_combat_camera_reset();
}
global.camera_controllable = true;
with(obj_gui_unit_stats)
{
	visible = true;
}