/// @description Debug resets
// You can write your code in this editor
with(global.selected){
	move_points_pixels_curr = move_points_pixels;
	has_acted_this_round = false;
}
scr_possible_moves_clean();
global.selected = noone;
scr_gui_unit_stats_clean();

