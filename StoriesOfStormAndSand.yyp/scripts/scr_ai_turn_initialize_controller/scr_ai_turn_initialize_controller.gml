// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_initialize_controller(){
	// Gather tasks
	scr_ai_turn_register_executors(ds_active_executors)
	scr_ai_turn_register_targets()
	//Select correct flag object
	switch(global.active_side.object_index){
		case obj_side_sand_alliance:
			target_flag_object = obj_terrain_flag_storm_house
			break;
		case obj_side_storm_house:
			target_flag_object = obj_terrain_flag_sand_alliance
			break;
		default:
			target_flag_object = noone
			break;
	}
}