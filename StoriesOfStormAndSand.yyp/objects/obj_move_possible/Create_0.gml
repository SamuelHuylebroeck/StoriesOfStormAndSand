/// @description Insert description here
// You can write your code in this editor
var par_enemy = scr_get_enemy_side_par();
var center = scr_get_center_of_occupied_cell(self);
for(i=-global.attack_max_range+1;i<global.attack_max_range;i++){
	for(j=-global.attack_max_range;j<global.attack_max_range;j++){
		if(instance_position(center[0]+i*global.grid_cell_width, center[1]+j*global.grid_cell_height,par_enemy)){
			if(!instance_position(center[0]+i*global.grid_cell_width, center[1]+j*global.grid_cell_height,obj_move_target)){
				instance_create_layer(center[0]+(i-1/2)*global.grid_cell_width, center[1]+(j-1/2)*global.grid_cell_height,"Pathing",obj_move_target)
			}
		}
	}
}