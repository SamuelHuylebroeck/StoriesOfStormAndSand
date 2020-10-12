/// @description Insert description here
// You can write your code in this editor
if(initialized)
{
	scr_gui_unit_stats_assemble_background_small(x,y,width, component_width,component_height);
	var running_x = x + margin_x;
	var running_y = y + component_height/2 - sprite_get_height(icon)/2;
	draw_sprite(icon,0,running_x,running_y);
	running_x += sprite_get_width(icon) + 5;
	running_y += sprite_get_height(icon)/2
	var old_font = draw_get_font();
	var old_valign = draw_get_valign();
	draw_set_valign(fa_middle);
	draw_set_font(text_font);
	draw_text(running_x, running_y, "SPIKE: " + string(spike));
	draw_set_font(old_font);
	draw_set_valign(old_valign);
}