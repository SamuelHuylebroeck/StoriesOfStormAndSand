/// @description Insert description here
// You can write your code in this editor
game_start_controller = noone;

//text properties
text_color = make_color_hsv(46,74,255);
text_font = font_turn_marker_bahn;

//positioning properties
column_width = 64;
row_height = 64;
column_offset_cells = 5;
v_initial_offset = 32;
h_initial_offset = 16;
v_offset = 64;
h_spacing = 5;

//Derived positiong properties
column_start_x = column_width * column_offset_cells;
hos_hover[controller_id.p_1] = false;
hos_hover[controller_id.p_2] = false;
hos_hover[controller_id.ai] = false;
sa_hover[controller_id.p_1] = false;
sa_hover[controller_id.p_2] = false;
sa_hover[controller_id.ai] = false;

