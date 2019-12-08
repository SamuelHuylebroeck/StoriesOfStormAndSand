///@function scr_get_center_of_cell(cell_x,cell_y)
///@description get the center coordinates in pixels of the cell at the passed coordinates
///@param {int} cell_x
///@param {int} cell_y
///@returns array containing the pixel coordinates of the center of the passed cell

var cell_x = argument0;
var cell_y = argument1;
var result;
result[0] = cell_x * global.grid_cell_width + global.grid_cell_width/2;
result[1] = cell_y * global.grid_cell_height + global.grid_cell_height/2;
return result;