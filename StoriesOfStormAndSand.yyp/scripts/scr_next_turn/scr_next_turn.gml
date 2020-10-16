function scr_next_turn() {
	scr_deselect();
	
	with(global.side_map[global.current_turn_controller])
	{
		scr_side_end_turn();
	}
	with(obj_terrain_hospital){
		instance_create_layer(x,y, "Gui", obj_heal_animation)
	}
	//Check for victory
	scr_check_for_game_end()
	
	// Switch state in global
	next_turn_controller= global.current_turn_controller == global.active_players[0] ? global.active_players[1] : global.active_players[0]
	next_active_side = global.inactive_side
	global.inactive_side = global.active_side
	global.active_side = next_active_side
	global.current_turn_controller = next_turn_controller

}
