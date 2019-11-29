/// @description Listen for clicks inside the checkoxes
var width = sprite_get_width(spr_title_radio_on);
var height = sprite_get_height(spr_title_radio_on);

//House of storms
var y_pos = y + v_offset - height/2
var x_pos = x + column_start_x - width/2;

hos_hover[controller_id.p_1] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)
x_pos += column_width
hos_hover[controller_id.p_2] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)
x_pos += column_width
hos_hover[controller_id.ai] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)

//Sand alliance
y_pos += row_height;
x_pos = x + column_start_x - width/2;
sa_hover[controller_id.p_1] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)
x_pos += column_width
sa_hover[controller_id.p_2] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)
x_pos += column_width
sa_hover[controller_id.ai] = scr_is_mouse_hovering_over_raw(x_pos,y_pos,width,height)

var clicked = mouse_check_button_released(mb_left);
if(clicked)
{
//Find the hovering over controller
}




