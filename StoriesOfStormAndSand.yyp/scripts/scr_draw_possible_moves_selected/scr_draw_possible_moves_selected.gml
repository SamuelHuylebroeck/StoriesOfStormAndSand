function scr_draw_possible_moves_selected() {
	mp_grid_clear_all(global.map_grid);

	scr_add_impassible_tiles_to_grid(global.selected)

	//Draw
	var center = scr_get_center_of_occupied_cell(global.selected);
	var center_x = center[0];
	var center_y = center[1];
	var range = global.selected.stats_move_points_sqr;
	var w = global.grid_cell_width;
	var h = global.grid_cell_height
	for(i=-range; i<=range; i+=1){
		var i_x = i * w + center_x;
		for(j=-range;j<=range;j++){
			var i_y = j* h + center_y;
			//check for move
			if(mp_grid_path(global.map_grid,global.navigate,center_x,center_y, i_x,i_y, global.path_allow_diag)){
				if (path_get_length(global.navigate) <= global.selected.move_points_pixels_curr){
					instance_create_layer(i_x - w/2,i_y - h/2 ,"Pathing", obj_move_possible);
				}else{
					instance_create_layer(i_x - w/2,i_y-h/2,"Pathing", obj_move_impossible);
				}
			}
		
		}
	}

	with(global.selected){
		instance_create_layer(global.selected.x,global.selected.y,"Pathing", obj_move_curr_selected);
	}
	move_grid_drawn = true;	


}
