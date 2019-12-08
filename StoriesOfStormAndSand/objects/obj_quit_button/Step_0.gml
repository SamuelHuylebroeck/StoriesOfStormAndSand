/// @description Insert description here
// You can write your code in this editor
var hover = scr_is_mouse_hovering_over_gui(pos_x,pos_y,width,height);
var click = hover && mouse_check_button_pressed(mb_left)

if(hover)
{
	highlighted = true;
}else{
	highlighted = false;
}

if(visible && click)
{
	global.camera_controllable = false;
	room_goto(rm_title);
}