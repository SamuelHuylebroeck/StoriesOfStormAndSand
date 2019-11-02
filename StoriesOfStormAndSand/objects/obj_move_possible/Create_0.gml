/// @description Insert description here
// You can write your code in this editor
for(i=-global.attack_max_range+1;i<global.attack_max_range;i++){
	for(j=-global.attack_max_range;j<global.attack_max_range;j++){
		if(instance_position(x+i*global.grid_cell_width, y+j*global.grid_cell_height,par_enemy)){
			if(!instance_position(x+i*global.grid_cell_width, y+j*global.grid_cell_height,obj_move_target)){
				instance_create_layer(x+i*global.grid_cell_width, y+j*global.grid_cell_height,"Pathing",obj_move_target)
			}
		}
	}
}