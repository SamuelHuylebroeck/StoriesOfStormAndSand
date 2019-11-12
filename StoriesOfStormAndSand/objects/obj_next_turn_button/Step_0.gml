/// @description Insert description here
// You can write your code in this editor
var hover = scr_is_hovering_over();
var click = hover && mouse_check_button_pressed(mb_left)

if(hover)
{
	highlighted = true;
}else{
	highlighted = false;
}

if(visible && click)
{
	scr_next_turn();
}