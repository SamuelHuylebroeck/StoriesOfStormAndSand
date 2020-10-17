// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_add_impassible_tiles_to_grid(this_unit){
	with(obj_impassable)
	{
		mp_grid_add_instances(global.map_grid,self,false);
	}
	var par_enemy = scr_get_enemy_side_par();
	with(par_enemy){
		mp_grid_add_instances(global.map_grid,self,false);
	}
}