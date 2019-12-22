///@function scr_check_victory(hos_side,sa_side, score_object)
///@description Check for game end
///@param {side} hos_side Side-object corresponding to the House of Storms
///@param {int} sa_side Side-object corresponding to the Sand alliance

var hos_side = argument0;
var sa_side = argument1;
var score_object = argument2;

var game_ends = false;

//Check for annhilation victory
var hos_wiped = ds_list_size(hos_side.ds_active_units) <=0;
var sa_wiped = ds_list_size(sa_side.ds_active_units) <=0;

//Check for flag control victory
var hos_flags_captured = false;
var sa_flags_captured = false;

var victory_type = end_of_game_outcomes.draw;
if(hos_wiped || sa_wiped || hos_flags_captured || sa_flags_captured)
{
	game_ends = true;
	
	//annhilitation victories and draws have precedence)
	if(hos_wiped)
	{
		victory_type = end_of_game_outcomes.sand_alliance_victory;
	}
	
	if(sa_wiped)
	{
		victory_type = end_of_game_outcomes.house_of_storms_victory;
	}
	
	if(hos_wiped && sa_wiped)
	{
		victory_type =end_of_game_outcomes.draw
	}
	
}

if(game_ends)
{
	//update score object
	score_object.victory_state = victory_type;
	//move to score screen
	room_goto(rm_end);
}