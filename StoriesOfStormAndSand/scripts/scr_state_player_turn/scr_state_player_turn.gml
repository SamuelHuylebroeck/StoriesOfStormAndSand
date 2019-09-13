////scr_player_turn
if(instance_position(mouse_x, mouse_y,par_player) && mouse_check_button_pressed(mb_left))
{
	var player;
	player = instance_nearest(mouse_x,mouse_y,par_player);
	
	if(player.id != global.selected){
		global.selected=player;
		scr_possible_moves_clean();
	}
	
	if(!move_grid_drawn){ 
		scr_draw_possible_moves_selected();
	}
}

if(global.selected != noone && mouse_check_button_pressed(mb_right) && instance_position(mouse_x,mouse_y,obj_move_possible))
{
	
	global.moving = true;
	scr_possible_moves_clean();
	with(global.selected){
		var w = global.grid_cell_width;
		var h = global.grid_cell_height
		scr_navigation(x,y,(round(mouse_x/w))*w,round(mouse_y/h)*h);
		move_points_pixels_curr -= path_get_length(global.navigate);
	}
}
if(global.moving){
	with(global.selected)
	{
		if(path_index = -1){
			cur_node_x = x;
			cur_node_y = y;
			global.moving = false;
			if(move_points_pixels_curr >= global.grid_cell_width){
				scr_draw_possible_moves_selected();
			}
		}
	}
}
