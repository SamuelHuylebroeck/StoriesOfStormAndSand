/// @description Insert description here
// You can write your code in this editor
if(position_meeting(x+sprite_width/2,y+sprite_height/2, obj_abstract_unit)){
	//show_debug_message("Flag occupied")
	occupying_unit = instance_nearest(x+sprite_width/2,y+sprite_height/2,obj_abstract_unit)
	//show_debug_message(string(self) + ", " + string(occupying_unit))
}else{
	//show_debug_message(string(self)+ " , unassigning occupier")
	occupying_unit = noone
}