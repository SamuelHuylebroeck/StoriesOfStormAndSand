/// @description Insert description here
// You can write your code in this editor
draw_self();
if(highlighted)
{
	if(assigned_attack != noone)
	{
		var current_pos_x  =  x + sprite_width;
		var current_pos_y = y + sprite_height/2;
		var old_align = draw_get_valign();
		draw_set_valign(fa_middle);
		draw_text(current_pos_x, current_pos_y,assigned_attack[attack_fields.name]);
		draw_set_valign(old_align);
	}
	else
	{
		show_debug_message("obj_attack_int without assigned attack highlighted");
	}
}