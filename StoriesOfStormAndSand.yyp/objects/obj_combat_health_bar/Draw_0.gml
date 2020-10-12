/// @description Insert description here
// You can write your code in this editor
if(initialized)
{
	scr_gui_unit_stats_assemble_background_small(x,y,width, component_width,component_height);
	var x_pos = x + margin_x;
	var y_pos = y + component_height/2 - component_bar_height/2;
	scr_gui_unit_stats_create_bar(x_pos,y_pos,2,current_health, current_color, max_health, max_color,health_blend_length);
}