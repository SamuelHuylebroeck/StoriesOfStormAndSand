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
var ellipse_box_width = 6;
draw_set_circle_precision(12);

//Background
//draw corners
draw_sprite(spr_horizontal_gauge_l,0,pos_x,pos_y);
draw_sprite(spr_horizontal_gauge_r,0,pos_x + (length-1) * component_length,pos_y);
//draw middle
for(i =1; i<length-1;i++)
{
	draw_sprite(spr_horizontal_gauge_m,0,pos_x + (i) * component_length,pos_y);
}
//Internal bar
//draw coloured in bar
var percentage = current_value/max_value;
var total_fill_bar_length = length*component_length - 2*internal_margin_x;
var old_color = draw_get_color();
//left part
draw_set_color(current_color);
//edge eclipse
var x1 = pos_x + internal_margin_x;
var y1 = pos_y + internal_margin_y;
var x2 = x1 + ellipse_box_width;
var y2 = y1 + internal_height;
draw_ellipse(x1,y1,x2,y2,false);

//normal rectangle
var bar_length = percentage * total_fill_bar_length - blend_length/2 - ellipse_box_width/2;
x1 += ellipse_box_width/2;
x2 = x1 + bar_length;
draw_rectangle(x1,y1,x2,y2,false);
//middle blend
x1 = x2;
x2 += blend_length;
draw_rectangle_color(x1,y1,x2,y2,current_color,max_color,max_color,current_color,false);
//right color
draw_set_color(max_color);
x1 = x2;
bar_length = (1-percentage) * total_fill_bar_length - blend_length/2 - ellipse_box_width/2;
x2 += bar_length
draw_rectangle(x1,y1,x2,y2,false);
x1=x2-ellipse_box_width/2;
x2+= ellipse_box_width/2;
draw_ellipse(x1,y1,x2,y2,false);

draw_set_color(old_color);

