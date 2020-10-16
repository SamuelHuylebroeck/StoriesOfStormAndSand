function scr_deselect() {
	if(global.moving == false){
		global.selected = noone;
		scr_possible_moves_clean();
		scr_gui_unit_stats_clean();
	}

}
