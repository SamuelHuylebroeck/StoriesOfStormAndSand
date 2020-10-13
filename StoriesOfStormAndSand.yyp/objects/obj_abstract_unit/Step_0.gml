/// @description Insert description here
// You can write your code in this editor
scr_death_cleanup_check();
var mov_animation = unit_animation_fields.idle;
if(path_index != -1)
{
	var mov_animation = unit_animation_fields.idle;
	if(direction >=315 or (0 <= direction and direction <=45))
	{
		mov_animation = unit_animation_fields.move_ltr;
	}
	
	if( 45 < direction and direction <= 135)
	{
		mov_animation = unit_animation_fields.move_btt;
	}
	
	if( 135 < direction and direction <= 225)
	{
		mov_animation = unit_animation_fields.move_rtl;
	}
	
	if( 225 < direction and direction <= 315)
	{
		mov_animation = unit_animation_fields.move_ttb;
	}
}
sprite_index = animations[mov_animation];

var terrain_inst = instance_place(x, y, obj_abstract_terrain);
if( terrain_inst != noone)
{
	occupied_terrain = terrain_inst;
	alarm[2] = 5;
}



