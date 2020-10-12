///@function scr_draw_map_select_column(header, x_pos, y_pos, column_controller)
///@description draw a column for faction assignment object
///@param {String} header the header text
///@param {int} x_pos x-value of the top middle of the column
///@param {int} y_pos y-value of the top middle of the column
///@param {controller_id} column_controller controller_id value that corresponds to the owner of the column
function scr_draw_map_select_faction_column(argument0, argument1, argument2, argument3) {

	var header = argument0;
	var x_pos = argument1;
	var y_pos = argument2;
	var column_controller = argument3;

	draw_text(x_pos, y_pos, header);
	y_pos += v_offset;
	var row_controller = game_start_controller.storm_house_controller;
	var radiobutton_sprite = scr_map_select_faction_get_radio_button_sprite(column_controller,row_controller, hos_hover[column_controller]);
	draw_sprite(radiobutton_sprite, 0, x_pos - sprite_get_width(radiobutton_sprite)/2, y_pos - sprite_get_height(radiobutton_sprite)/2);
	y_pos += row_height;
	row_controller = game_start_controller.sand_alliance_controller;
	radiobutton_sprite = scr_map_select_faction_get_radio_button_sprite(column_controller,row_controller, sa_hover[column_controller]);
	draw_sprite(radiobutton_sprite, 0, x_pos - sprite_get_width(radiobutton_sprite)/2, y_pos - sprite_get_height(radiobutton_sprite)/2);


}
