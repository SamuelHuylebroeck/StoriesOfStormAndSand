function scr_start_map() {
	//Config sides
	storm_house.controller = storm_house_controller;
	sand_alliance.controller = sand_alliance_controller;

	global.side_map[storm_house.controller] = storm_house;
	global.side_map[sand_alliance.controller] = sand_alliance;
	
	global.active_players[0] = storm_house_controller;
	global.active_players[1] = sand_alliance_controller;
	
	global.active_side = storm_house
	global.inactive_side = sand_alliance

	global.grid_nr_h_cells = map_width;
	global.grid_nr_v_cells = map_height;


	global.grid_left_startpos = map_x_offset;
	global.grid_top_startpos = map_y_offset;

	//Move to map room
	global.map_running = true;
	room_goto(current_map);


}
