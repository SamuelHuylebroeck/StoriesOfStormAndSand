////scr_player_turn

var par_curr_player = global.side_map[global.state].assigned_parent;

if(instance_position(mouse_x, mouse_y,par_curr_player) && mouse_check_button_pressed(mb_left))
{
	var player_unit;
	player_unit = instance_nearest(mouse_x,mouse_y,par_curr_player);
	
	if(player_unit.id != global.selected){
		//delete old stat card
		with(obj_gui_unit_stats)
		{
			instance_destroy();
		}
		global.selected=player_unit;
		scr_possible_moves_clean();
		//Create unit stats view
		var gui_unit_stats = instance_create_layer(0,0,"Gui", obj_gui_unit_stats);
		gui_unit_stats.unit = global.selected;
	}
	
	if(!move_grid_drawn && global.selected != noone && !global.selected.has_acted_this_round){ 
		scr_draw_possible_moves_selected();
	}
}


if(global.selected != noone && mouse_check_button_pressed(mb_right))
{
	//Moving
	if(instance_position(mouse_x,mouse_y,obj_move_possible))
	{
		global.moving = true;
		
		with(global.selected){
			var w = global.grid_cell_width;
			var h = global.grid_cell_height;
			is_moving = true;
			scr_navigation(x,y,(round(mouse_x/w))*w,round(mouse_y/h)*h);
			move_points_pixels_curr -= path_get_length(global.navigate);
		}
		scr_possible_moves_clean();
	}else{
		scr_deselect();
	}
}
if(global.moving)
{
	with(global.selected)
	{
		if(path_index = -1)
		{
			cur_node_x = x;
			cur_node_y = y;
			global.moving = false;
			is_moving = false;
			if(move_points_pixels_curr >= global.grid_cell_width && !has_acted_this_round){
				scr_draw_possible_moves_selected();
			}
		}
	}
}