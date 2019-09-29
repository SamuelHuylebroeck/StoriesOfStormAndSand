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


if(global.selected != noone && mouse_check_button_pressed(mb_right))
{
	//Moving
	if(instance_position(mouse_x,mouse_y,obj_move_possible))
	{
		global.moving = true;
		
		with(global.selected){
			var w = global.grid_cell_width;
			var h = global.grid_cell_height;
			sprite_index = anim_run;
			scr_navigation(x,y,(round(mouse_x/w))*w,round(mouse_y/h)*h);
			move_points_pixels_curr -= path_get_length(global.navigate);
		}
		scr_possible_moves_clean();
	//Attacking
	}else if(instance_position(mouse_x,mouse_y,obj_move_attack))
	{
		global.attacking = true;
		with(global.selected){
			//Check if we are already close enough to attack
			if(distance_to_object(obj_move_attack) > global.grid_cell_width/2-5){
				//TODO: Figure out correct magic number
				global.moving = true;
				show_debug_message("mouse at: "+ string(mouse_x)+", "+ string(mouse_y));
				var nearest_attack_square = instance_nearest(mouse_x, mouse_y, obj_move_attack);
				scr_calculate_dist();
				sprite_index = anim_run;
				var w = global.grid_cell_width;
				var h = global.grid_cell_height;
				scr_navigation(x,y,round(global.attack_travel_x/w)*w, round(global.attack_travel_y/h)*h);
				move_points_pixels_curr -= path_get_length(global.navigate);
			}
		}
		scr_possible_moves_clean();
	//Deselect
	}else if(instance_position(mouse_x,mouse_y, obj_move_impossible)){
		global.selected = noone;
		scr_possible_moves_clean();
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
			sprite_index = anim_idle;
			global.moving = false;
			if(move_points_pixels_curr >= global.grid_cell_width){
				scr_draw_possible_moves_selected();
			}
		}
	}
}
if(global.attacking == true)
{
	if(global.moving == false)
	{
		with(global.selected)
		{
			scr_melee_attack();
		}
	} 
}