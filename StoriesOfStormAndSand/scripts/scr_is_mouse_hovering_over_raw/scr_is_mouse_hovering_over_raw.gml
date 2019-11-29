///@function scr_is_hovering_over(x_pos, y_pos, width, height)
///@param {int} x_pos x-value of the top left corner in pixels
///@param {int} y_pos y-value of the the top left corner in pixels
///@param {int} width width of the object in pixels
///@param {int} height height of the object in pixels
///@description check if the mouse is hovering over this object

var x_pos = argument0;
var y_pos = argument1;
var width = argument2;
var height = argument3;

return point_in_rectangle(mouse_x,mouse_y,x_pos,y_pos,x_pos+width,y_pos+height);
