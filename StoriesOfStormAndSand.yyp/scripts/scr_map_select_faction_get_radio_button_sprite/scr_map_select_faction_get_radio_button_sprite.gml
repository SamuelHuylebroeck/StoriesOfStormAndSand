///@function scr_map_select_faction_get_radiobutton_sprite(column_controller, faction_controller, mouse_hovering_over)
///@param {controller_id} column_controller controller_id value that corresponds to the owner of the column
///@param {controller_id} faction_controller controller_id value that corresponds to the current owner of the row
///@param {boolean} mouse_hovering_over
function scr_map_select_faction_get_radio_button_sprite(argument0, argument1, argument2) {

	var column_controller = argument0;
	var faction_controller = argument1;
	var mouse_hovering_over = argument2;

	if(column_controller == faction_controller)
	{
		return spr_title_radio_on;
	}else
	{
		return mouse_hovering_over? spr_title_radio_highlight : spr_title_radio_off;
	}


}
