// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_for_game_end(){
	var storm_house_victory = false
	var sand_alliance_victory = false
	var draw = false
	
	
	var game_ended = storm_house_victory or sand_alliance_victory or draw
	if(game_ended){
		room_goto(rm_end)
	}
}