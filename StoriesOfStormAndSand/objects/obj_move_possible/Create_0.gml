/// @description Insert description here
// You can write your code in this editor
for(i=-1;i<2;i++){
	for(j=-1;j<2;j++){
		if(instance_position(x+i*global.grid_cell_width, y+j*global.grid_cell_height,par_enemy)){
			sprite_index = spr_move_target;
			if(!instance_position(x+i*global.grid_cell_width, y+j*global.grid_cell_height,obj_move_attack)){
				instance_create_layer(x+i*global.grid_cell_width, y+j*global.grid_cell_height,"Pathing",obj_move_attack)
			}
		}
	}
}