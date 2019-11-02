mp_grid_clear_all(global.map_grid);

with(par_player){
	if(global.selected != noone){
		if(self.id != global.selected.id){
			mp_grid_add_instances(global.map_grid,self,false);
		}
	}
}

with(par_enemy){
	mp_grid_add_instances(global.map_grid,self,false);
}

//Draw
var center_x = global.selected.x;
var center_y = global.selected.y;
var range = global.selected.stats_move_points_sqr;
for(i=-range; i<=range; i+=1){
	var i_x = i * global.grid_cell_width + center_x;
	for(j=-range;j<=range;j++){
		var i_y = j* global.grid_cell_height+center_y;
		//check for move
		if(mp_grid_path(global.map_grid,global.navigate,global.selected.cur_node_x,global.selected.cur_node_y, i_x,i_y, global.path_allow_diag)){
			if (path_get_length(global.navigate) <= global.selected.move_points_pixels_curr){
				instance_create_layer(i_x,i_y,"Pathing", obj_move_possible);
			}else{
				instance_create_layer(i_x,i_y,"Pathing", obj_move_impossible);
			}
		}
		
	}
}

with(global.selected){
	instance_create_layer(global.selected.x,global.selected.y,"Pathing", obj_move_curr_selected);
}
move_grid_drawn = true;	