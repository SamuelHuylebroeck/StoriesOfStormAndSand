// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//Get the center of the cell that this pixel-coordinate falls in
function scr_get_center_of_cell_pixel(point_x, point_y){
	var result
	result[0] = floor(point_x / global.grid_cell_width) * global.grid_cell_width + global.grid_cell_width/2
	result[1] = floor(point_y / global.grid_cell_height) * global.grid_cell_height + global.grid_cell_height/2
	return result
}