///@function scr_map_select_change_faction_selection(new_hos_controller, new_sa_controller)
///@description change the selected faction controllers
///@param {controller_id} new_hos_controller new controller for the house of storms
///@param {controller_id} new_sa_controller new controller for the sand alliance
function scr_map_select_change_faction_selection(argument0, argument1) {
	var new_hos_controller = argument0;
	var new_sa_controller = argument1;

	var old_hos_controller = storm_house_controller;
	var old_sa_controller = sand_alliance_controller;

	if(new_hos_controller != noone and new_hos_controller != old_hos_controller)
	{
		storm_house_controller = new_hos_controller;
	}

	if(new_sa_controller != noone and new_sa_controller != old_sa_controller)
	{
		sand_alliance_controller = new_sa_controller;
	}

	if(storm_house_controller == sand_alliance_controller)
	{
		if(new_hos_controller == noone)
		{
			storm_house_controller = old_sa_controller;
		}else if (new_sa_controller == noone)
		{
			sand_alliance_controller = old_hos_controller;
		}
	}


}
