/// @description Insert description here
// You can write your code in this editor
event_inherited()
var this = self
with(obj_side_storm_house){
	var pos = ds_list_find_index(ds_active_units, this)
	ds_list_delete(ds_active_units, pos)
}
if(global.game_in_progress){
	scr_check_for_game_end()
}
