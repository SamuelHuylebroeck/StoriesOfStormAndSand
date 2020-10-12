///@function scr_gui_unit_stats_assemble_background(pos_x, pos_y, width, component_width,component_height,)
///@description Create a framed background
///@param {int} pos_x top-left-corner x position
///@param {int} pos_y top-left-corner y position
///@param {int} width width of the background in components
///@param {int} height height of the background in components
///@param {int} component_width width of each component in pixels
///@param {int} component_height height of each component in pixels
function scr_gui_unit_stats_assemble_background_small(argument0, argument1, argument2, argument3, argument4) {

	var current_tlc_x =  argument0;
	var current_tlc_y =  argument1;
	var width = argument2;

	var component_width = argument3;
	var component_height = argument4;

	//Draw corners
	draw_sprite(spr_gui_us_small_l, 0, current_tlc_x,current_tlc_y);
	draw_sprite(spr_gui_us_small_r, 0, current_tlc_x + (width-1) * component_width ,current_tlc_y);

	//Draw middle
	for(var i =1; i< width-1;i++)
	{
		draw_sprite(spr_gui_us_small_m, 0, current_tlc_x + i * component_width, current_tlc_y);
	}


}
