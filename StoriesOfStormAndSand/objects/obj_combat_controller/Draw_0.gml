/// @description Draw background
// You can write your code in this editor
var pos_x = x - (width*component_width)/2;
var pos_y = y - (height*component_height)/2;

//show_debug_message(string(pos_x) + ", " + string(pos_y));
scr_gui_unit_stats_assemble_background(pos_x,pos_y,width,height, component_width,component_height);

//draw arenas
if(attacker != noone && defender != noone && attack != noone)
{
	if(attack[attack_fields.range_min] >1)
	{
		var platform_source_width = sprite_get_width(spr_desert_battle_ranged_left_1);
		var platform_source_height = sprite_get_height(spr_desert_battle_ranged_left_1);
		//left
		draw_sprite(spr_desert_battle_ranged_left_1,0,x - platforms_offset_ranged_x,y+platforms_offset_y);
		//right
		draw_sprite(spr_desert_battle_ranged_right_1,0,x + platforms_offset_ranged_x,y+platforms_offset_y);
	}
	else
	{
		var platform_source_width = sprite_get_width(spr_desert_battle_ranged_left_1);
		var platform_source_height = sprite_get_height(spr_desert_battle_ranged_left_1);
		//left
		draw_sprite(spr_desert_battle_melee_left_1,0,x - platforms_offset_melee_x,y+platforms_offset_y);
		//right
		draw_sprite(spr_desert_battle_melee_right_1,0,x + platforms_offset_melee_x,y+platforms_offset_y);
	}
}


