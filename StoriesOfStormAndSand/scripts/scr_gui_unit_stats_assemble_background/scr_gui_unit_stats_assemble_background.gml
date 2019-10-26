//// @function scr_gui_unit_stats_assemble_background()
/// @description Create the background of the unit stat card.
var current_tlc_x =  screen_offset_x;
var current_tlc_y =  screen_offset_y;
//Draw corners
draw_sprite(spr_gui_us_tlc, 0, current_tlc_x,current_tlc_y);
draw_sprite(spr_gui_us_trc, 0, current_tlc_x + (current_width-1) * component_width ,current_tlc_y);
draw_sprite(spr_gui_us_blc, 0, current_tlc_x, current_tlc_y + (current_height-1) * component_height);
draw_sprite(spr_gui_us_brc, 0, current_tlc_x + (current_width-1) * component_width, current_tlc_y + (current_height-1) * component_height);
//Draw edges
for(i = 1; i<current_width-1; i++)
{	
	draw_sprite(spr_gui_us_t, 0, current_tlc_x + i * component_width, current_tlc_y);
	draw_sprite(spr_gui_us_b, 0, current_tlc_x + i * component_width, current_tlc_y + (current_height-1) * component_height);
}
for(i = 1 ; i < current_height -1 ; i++)
{
	draw_sprite(spr_gui_us_l, 0, current_tlc_x , current_tlc_y + i * component_height);
	draw_sprite(spr_gui_us_r, 0, current_tlc_x + (current_width-1) * component_width, current_tlc_y + i * component_height);
}
//Draw middle
for(i =1; i< current_width -1;i++)
{
	for(j = 1;j<current_height-1;j++)
	{
		draw_sprite(spr_gui_us_m, 0, current_tlc_x + i * component_width, current_tlc_y + j * component_height);
	}
}