///@function scr_gui_unit_stats_create_bar(x_pos, y_pos, bar_length, current_value, current_color, max_value, max_color, blend_length)
///@description Create a bar graphic at the specified position of the given unit length, showing a gradient between of the two colours based on the passed passed values
///@param {int} x_pos pixel x-coordinate of the top-left corner
///@param {int} y_pos pixel y-coordinate of the top-left corner
///@param {int} bar_length length of the bar in component units
///@param {int} current_value current value that fills the bar
///@param {color} color of the current_value
///@param {int} max_value maximum value of the bar
///@param {color} color of the bar portion not filled by current_value
///@param {int} blend_length length of the blended part of the bar in pixels

var pos_x = argument0;
var pos_y = argument1;
var length = argument2;
var current_value = argument3;
var current_color = argument4;
var max_value = argument5;
var max_color = argument6
var blend_length = argument7;

//configuration
var component_length = sprite_get_width(spr_horizontal_gauge_l);
var internal_margin_x = 10; //ignoring sprite curvature for now
var internal_margin_y = 10;
var internal_height = 12;

var old_color = draw_get_color();
//Internal bar
//draw coloured in bar
var percentage = current_value/max_value;
var total_fill_bar_length = length*component_length - 2*internal_margin_x;
var current_total_length = total_fill_bar_length * percentage;


//Max-value underlying layer
draw_set_color(max_color);
var x1 = pos_x + internal_margin_x;
var y1 = pos_y + internal_margin_y;
var x2 = x1 + total_fill_bar_length;
var y2 = y1 + internal_height;
draw_rectangle(x1,y1,x2,y2,false);

//Current-value top layer
if(current_total_length > 0)
{
	draw_set_color(current_color);
	x2  = x1 + current_total_length;
	draw_rectangle(x1,y1,x2,y2,false);
}

//blend-box
if(blend_length > 0)
{
	//cap blend pos 
	var bar_start_pos = pos_x + internal_margin_x;
	var bar_end_pos = bar_start_pos + total_fill_bar_length;
	var curr_end_pos = bar_start_pos + current_total_length;
	var blend_left_pos = curr_end_pos - blend_length/2 < bar_start_pos ? bar_start_pos : curr_end_pos - blend_length/2;
	var blend_right_pos = curr_end_pos + blend_length > bar_end_pos ? bar_end_pos : curr_end_pos + blend_length/2;
	draw_rectangle_color(blend_left_pos , y1, blend_right_pos,y2,current_color,max_color,max_color,current_color,false);

}

//Background
//draw corners
draw_sprite(spr_horizontal_gauge_l,0,pos_x,pos_y);
draw_sprite(spr_horizontal_gauge_r,0,pos_x + (length-1) * component_length,pos_y);
//draw middle
for(i =1; i<length-1;i++)
{
	draw_sprite(spr_horizontal_gauge_m,0,pos_x + (i) * component_length,pos_y);
}

draw_set_color(old_color);

