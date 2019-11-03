/// @description Draw background
// You can write your code in this editor
var top_left_corner_x = x - (width*component_width)/2;
var top_left_corner_y = y - (height*component_height)/2;

//Frame
scr_gui_unit_stats_assemble_background(top_left_corner_x,top_left_corner_y,width,height, component_width,component_height);

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
//Name cards
//Attacker
var margin_x = 15;
var margin_y = 15;
if(attacker != noone)
{

	var length = 2;
	scr_gui_unit_stats_assemble_background_small(top_left_corner_x + margin_x, top_left_corner_y + margin_y,length,component_width,component_height);
	var name = attacker.stats_name;
	var old_align = draw_get_valign();
	draw_set_valign(fa_middle);
	draw_text(top_left_corner_x + margin_x + 12 , top_left_corner_y + margin_y + component_height/2, name);
	draw_set_valign(old_align);
	
}

//Defender
if(defender != noone)
{
	var length = 2;
	var pos_x = top_left_corner_x + width*component_width - margin_x - length * component_width;
	scr_gui_unit_stats_assemble_background_small(pos_x, top_left_corner_y + margin_y,length,component_width,component_height);
	var name = defender.stats_name;
	var old_align = draw_get_valign();
	draw_set_valign(fa_middle);
	draw_text(pos_x + 12 , top_left_corner_y + margin_y + component_height/2, name);
	draw_set_valign(old_align);
}


