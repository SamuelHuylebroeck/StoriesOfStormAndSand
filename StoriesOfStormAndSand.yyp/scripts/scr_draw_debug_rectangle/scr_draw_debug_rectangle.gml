///@function scr_draw_debug_rectangle(pos_x,pos_y,width,height)
///@description draw a transparant rectangle for debugging purposes
///@param {int} pos_x top left pixel x value
///@param {int} pos_y top left pixel y value
///@param {int} width width of the rectangle in pixels
///@param {int} height height of the rectangle in pixels
function scr_draw_debug_rectangle(argument0, argument1, argument2, argument3) {

	var pos_x = argument0;
	var pos_y = argument1;
	var width = argument2;
	var height = argument3;

	var old_color = draw_get_color();
	var old_alpha = draw_get_alpha();

	draw_set_color(c_blue);
	draw_set_alpha(0.6);

	draw_rectangle(pos_x,pos_y,width,height,false);

	draw_set_color(old_color);
	draw_set_alpha(old_alpha);


}
