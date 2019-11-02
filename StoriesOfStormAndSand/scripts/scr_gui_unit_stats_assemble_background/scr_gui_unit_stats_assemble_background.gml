///@function scr_gui_unit_stats_assemble_background(pos_x, pos_y, width, height, component_width,component_height,)
///@description Create a framed background
///@param {int} pos_x top-left-corner x position
///@param {int} pos_y top-left-corner y position
///@param {int} width width of the background in components
///@param {int} height height of the background in components
///@param {int} component_width width of each component in pixels
///@param {int} component_height height of each component in pixels

var current_tlc_x =  argument0;
var current_tlc_y =  argument1;
var width = argument2;
var height = argument3;
var component_width = argument4;
var component_height = argument5;

//Draw corners
draw_sprite(spr_gui_us_tlc, 0, current_tlc_x,current_tlc_y);
draw_sprite(spr_gui_us_trc, 0, current_tlc_x + (width-1) * component_width ,current_tlc_y);
draw_sprite(spr_gui_us_blc, 0, current_tlc_x, current_tlc_y + (height-1) * component_height);
draw_sprite(spr_gui_us_brc, 0, current_tlc_x + (width-1) * component_width, current_tlc_y + (height-1) * component_height);
//Draw edges
for(var i = 1; i<width-1; i++)
{	
	draw_sprite(spr_gui_us_t, 0, current_tlc_x + i * component_width, current_tlc_y);
	draw_sprite(spr_gui_us_b, 0, current_tlc_x + i * component_width, current_tlc_y + (height-1) * component_height);
}
for(var i = 1 ; i < height -1 ; i++)
{
	draw_sprite(spr_gui_us_l, 0, current_tlc_x , current_tlc_y + i * component_height);
	draw_sprite(spr_gui_us_r, 0, current_tlc_x + (width-1) * component_width, current_tlc_y + i * component_height);
}
//Draw middle
for(var i =1; i< width -1;i++)
{
	for(var j = 1;j<height-1;j++)
	{
		draw_sprite(spr_gui_us_m, 0, current_tlc_x + i * component_width, current_tlc_y + j * component_height);
	}
}