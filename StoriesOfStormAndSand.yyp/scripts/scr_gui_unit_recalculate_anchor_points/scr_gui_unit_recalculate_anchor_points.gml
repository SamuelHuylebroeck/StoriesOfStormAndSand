// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gui_unit_recalculate_anchor_points(){
	content_left_edge = screen_offset_x + internal_start_offset_x;
	content_right_edge = screen_offset_x + width * component_width-internal_start_offset_x;
}