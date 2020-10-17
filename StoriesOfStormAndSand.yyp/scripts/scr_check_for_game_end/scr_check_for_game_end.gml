// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_for_game_end(){
	var storm_house_victory = false
	var sand_alliance_victory = false
	var draw = false
	
	//Check for unit deaths
	var units_remaining_sh = true
	with(obj_side_storm_house){
		if(ds_list_size(ds_active_units) <= 0){
			units_remaining_sh = false
		}
	}
	
	var units_remaining_sa = true
	with(obj_side_sand_alliance){
		if(ds_list_size(ds_active_units) <= 0){
			units_remaining_sa = false
		}
	}
	
	//Check for flag occupation
	var nr_of_storm_flags = 0;
	var nr_of_conquered_storm_flags=0;
	with(obj_terrain_flag_storm_house){
		nr_of_storm_flags++
		if(occupying_unit != noone){
			if(object_is_ancestor(occupying_unit.object_index, par_sand_alliance)){
				nr_of_conquered_storm_flags++
			}
		}
	}
	if(nr_of_conquered_storm_flags >= nr_of_storm_flags){
		sand_alliance_victory = true
	}
	
	
	var nr_of_sand_flags = 0;
	var nr_of_conquered_sand_flags=0;
	with(obj_terrain_flag_sand_alliance){
		nr_of_sand_flags++
		if(occupying_unit != noone){
			if(object_is_ancestor(occupying_unit.object_index, par_storm_house)){
				nr_of_conquered_sand_flags++
			}
		}
	}
	if(nr_of_conquered_sand_flags >= nr_of_sand_flags){
		storm_house_victory = true
	}
	
	storm_house_victory = storm_house_victory || !units_remaining_sa
	sand_alliance_victory =  sand_alliance_victory || !units_remaining_sh
	draw = storm_house_victory && sand_alliance_victory
	var game_ended = storm_house_victory or sand_alliance_victory or draw
	if(game_ended){
		global.game_in_progress = false;
		if(draw){
			global.text_victory = "Game has ended in a draw"
			global.sprite_victory = spr_brutal_fist
			room_goto(rm_end)
		}
		if(storm_house_victory){
			global.text_victory = "Victory for the House of Storms, may the winds be ever in their favour"
			global.sprite_victory = spr_symbol_hos
			room_goto(rm_end)
		}

		if(sand_alliance_victory){
			global.text_victory = "Victory for the Sand Alliance, as the Mother of Dunes predicted"
			global.sprite_victory = spr_symbol_sand_alliance
			room_goto(rm_end)
		}
	}
}