////scr_player_turn
if(instance_position(mouse_x, mouse_y,par_player) && mouse_check_button_pressed(mb_left))
{
	var player;
	player = instance_nearest(mouse_x,mouse_y,par_player);
	global.selected=player;
}

if(global.selected != noone && mouse_check_button_pressed(mb_right))
{
	with(global.selected){
		scr_navigation(x,y,mouse_x,mouse_y);
	}
}