for(i=0; i<global.grid_nr_h_cells; i+=1){
	var i_x = i * global.grid_cell_width + global.grid_left_startpos + global.grid_cell_width/2;
	for(j=0;j<global.grid_nr_v_cells;j++){
		var i_y = j* global.grid_cell_height+global.grid_top_startpos + global.grid_cell_height/2;
		if(mp_grid_path(global.map_grid,global.navigate,global.selected.cur_node_x,global.selected.cur_node_y, i_x,i_y, global.path_allow_diag)){
			if (path_get_length(global.navigate) <= global.selected.move_points_pixels_curr){
				instance_create_layer(i_x,i_y,"Instances", obj_move_possible);
			}else{
				instance_create_layer(i_x,i_y,"Instances", obj_move_impossible);
			}
		}
	}
}
move_grid_drawn = true;	