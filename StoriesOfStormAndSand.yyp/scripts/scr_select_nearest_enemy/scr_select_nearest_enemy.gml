///@function scr_select_nearest_unit(pos_x, pos_y, current_player_par)
///@description select the unit nearest to the mouse position, ignoring units that inherit from the passed parent;
///@param pos_x x position to look at
///@param pos_y y position to look at
///@param current_player_par the parent object type of the active player's units
function scr_select_nearest_enemy(argument0, argument1, argument2) {

	var pos_x = argument0;
	var pos_y = argument1;
	var current_player_par = argument2;

	switch(current_player_par)
	{
		case par_storm_house:
			return instance_nearest(pos_x,pos_y,par_sand_alliance);
		case par_sand_alliance:
			return instance_nearest(pos_x,pos_y, par_storm_house);
		default:
			return noone;
	}


}
