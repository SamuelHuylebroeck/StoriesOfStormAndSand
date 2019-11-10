/// @description Insert description here
// You can write your code in this editor
var current_camera = view_get_camera(view_current);
var pos_x = camera_get_view_width(current_camera);
var pos_y = camera_get_view_height(current_camera);

if(highlighted)
{
	draw_sprite(spr_next_turn_button_highlighted,0,pos_x,pos_y);
}else
{
	draw_sprite(spr_next_turn_button_highlighted,0,pos_x,pos_y);
}