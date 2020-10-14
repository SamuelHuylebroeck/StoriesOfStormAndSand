////scr_player_turn
function scr_state_player_turn() {

	var par_curr_player = global.active_side.assigned_parent;
	var par_enemy = scr_get_enemy_side_par()

	if(instance_position(mouse_x, mouse_y,par_curr_player) && mouse_check_button_pressed(mb_left))
	{
		var player_unit;
		player_unit = instance_nearest(mouse_x,mouse_y,par_curr_player);
	
		if(player_unit.id != global.selected){
			//delete old stat card
			with(obj_gui_unit_stats)
			{
				if (self.unit == global.selected){
					instance_destroy();
				}
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
	
	if(instance_position(mouse_x, mouse_y,par_enemy) && mouse_check_button_pressed(mb_left))
	{
		var enemy_unit;
		enemy_unit = instance_nearest(mouse_x,mouse_y,par_enemy);
		if(enemy_unit.id != global.enemy_selected){
			//delete old stat card
			with(obj_gui_unit_stats)
			{
				if (self.unit == global.enemy_selected){
					instance_destroy();
				}
			}
			global.enemy_selected=enemy_unit;
			//Create unit stats view
			var gui_unit_stats = instance_create_layer(0,0,"Gui", obj_gui_unit_stats);
			gui_unit_stats.unit = global.enemy_selected;
			gui_unit_stats.screen_offset_x += global.enemy_stat_card_shift
			with(gui_unit_stats){
				scr_gui_unit_recalculate_anchor_points()
			}
	
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
				var center_start = scr_get_center_of_occupied_cell(global.selected);
				is_moving = scr_navigation(center_start[0],center_start[1],(floor(mouse_x/w))*w + w/2,floor(mouse_y/h)*h + h/2);
				if(is_moving)
				{
					move_points_pixels_curr -= path_get_length(global.navigate);
				}
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
				global.moving = false;
				is_moving = false;
				if(move_points_pixels_curr >= global.grid_cell_width && !has_acted_this_round){
					scr_draw_possible_moves_selected();
				}
			}
		
		}
	}


}
