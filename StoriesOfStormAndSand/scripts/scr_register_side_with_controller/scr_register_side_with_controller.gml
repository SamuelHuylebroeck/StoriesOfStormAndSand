///@function scr_register_side_with_controller
///@description register the calling side object with the controller object that orchestrates the current battle session
var control = instance_find(obj_control,0);

if(control != noone)
{
	control.side_objects[tag] = self;
}