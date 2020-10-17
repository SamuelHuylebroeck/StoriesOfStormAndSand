// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_instance_occupies_cell(instance, cell_pixel_x, cell_pixel_y ){
	var center_object = scr_get_center_of_occupied_cell(instance)
	var center_to_check = scr_get_center_of_cell(floor(cell_pixel_x/global.grid_cell_width), floor(cell_pixel_y/global.grid_cell_height))
	return center_object[0] == center_to_check[0] && center_object[1] == center_to_check[1]
}