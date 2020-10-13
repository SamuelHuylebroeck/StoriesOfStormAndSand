/// @description Start attack sequence
// You can write your code in this editor
with(obj_camera)
{
	scr_combat_camera_apply();
}
with(obj_gui_unit_stats)
{
	visible = false;
}
var camera = view_get_camera(view_current);
var x_center = camera_get_view_x(camera) + camera_get_view_width(camera)/2;
var y_center = camera_get_view_y(camera) + camera_get_view_height(camera)/2;

var combat_controller = instance_create_layer(x_center, y_center,"Combat_Background",obj_combat_controller);
combat_controller.attacker = executor;
combat_controller.defender = target;
combat_controller.attack = assigned_attack;
combat_controller.linked_ai_task = self;
with(combat_controller)
{
	scr_attack_startup_sequence();
}