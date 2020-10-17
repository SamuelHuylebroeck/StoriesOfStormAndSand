///@function scr_get_center_of_occupied_cell(object occupier)
///@description get the center of the grid cell that this object is currently occupying
function scr_get_center_of_occupied_cell(occupier) {
	var cell_x, cell_y;
	with(occupier){
		cell_x = floor(x/global.grid_cell_width);
		cell_y = floor(y/global.grid_cell_height);
	}
	return scr_get_center_of_cell(cell_x,cell_y);


}
