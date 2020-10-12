function scr_deselect() {
	global.selected = noone;
	scr_possible_moves_clean();
	scr_gui_unit_stats_clean();


}
