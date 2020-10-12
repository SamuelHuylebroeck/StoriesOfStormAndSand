/// @description Listen for clicks inside the checkoxes
var width = sprite_get_width(spr_title_radio_on);
var height = sprite_get_height(spr_title_radio_on);
var hos_new_selection = noone;
var sa_new_selection = noone;
var clicked = mouse_check_button_released(mb_left);

//House of storms
var y_pos = y + v_offset + height/2;
var x_pos = x + column_start_x - width/2;


scr_draw_debug_rectangle(x_pos, y_pos, width, height);
hos_hover[controller_id.p_1] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)
if(clicked and hos_hover[controller_id.p_1])
{
	hos_new_selection = controller_id.p_1;
}
x_pos += column_width
hos_hover[controller_id.p_2] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)
if(clicked and hos_hover[controller_id.p_2])
{
	hos_new_selection = controller_id.p_2;
}
x_pos += column_width
hos_hover[controller_id.ai] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)
if(clicked and hos_hover[controller_id.ai])
{
	hos_new_selection = controller_id.ai;
}

//Sand alliance
y_pos += row_height;
x_pos = x + column_start_x - width/2;

sa_hover[controller_id.p_1] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)
if(clicked and sa_hover[controller_id.p_1])
{
	sa_new_selection = controller_id.p_1;
}
x_pos += column_width
sa_hover[controller_id.p_2] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)
if(clicked and sa_hover[controller_id.p_2])
{
	sa_new_selection = controller_id.p_2;
}
x_pos += column_width
sa_hover[controller_id.ai] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)
if(clicked and sa_hover[controller_id.ai])
{
	sa_new_selection = controller_id.ai;
}


if(clicked)
{
	with(game_start_controller)
	{
		scr_map_select_change_faction_selection(hos_new_selection,sa_new_selection);
	}
}




