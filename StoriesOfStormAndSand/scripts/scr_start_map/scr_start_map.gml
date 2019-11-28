//Config sides
storm_house.controller = storm_house_controller;
sand_alliance.controller = sand_alliance_controller;

global.side_map[storm_house.controller] = storm_house;
global.side_map[sand_alliance.controller] = sand_alliance;
//Move to map room
global.map_running = true;
room_goto(current_map);