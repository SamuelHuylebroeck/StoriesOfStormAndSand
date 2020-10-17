/// @description Delete the unit from it's active side list
// You can write your code in this editor
event_inherited()
var this = self
with(obj_side_sand_alliance){
	var pos = ds_list_find_index(ds_active_units, this)
	ds_list_delete(ds_active_units, pos)
}
if(global.game_in_progress){
	scr_check_for_game_end()
}