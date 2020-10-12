////scr_calculate_dist
////For the nearest attack square, calculate which of the surrounding move squares is the closest 
function scr_calculate_dist() {
	var huge_amount = 500000;
	var current_min = huge_amount; //Arbitrarily high value
	show_debug_message("mouse at: "+ string(mouse_x)+", "+ string(mouse_y));
	var nearest_attack_square = instance_nearest(mouse_x, mouse_y, obj_move_attack);
	var w = global.grid_cell_width;
	var h = global.grid_cell_height;
	var selected_x=0;
	var selected_y=0;
	for(i =-1;i<2;i++)
	{
		for(j=-1;j<2;j++)
		{
			if(i==0 && i==j)
			{
				continue;
			}
			if(instance_position(nearest_attack_square.x + i*w, nearest_attack_square.y+j*h, obj_move_possible))
			{
				var new_dist = point_distance(global.selected.x,global.selected.y, nearest_attack_square.x + i*w, nearest_attack_square.y+j*h);
		
				if(new_dist < current_min)
				{
					current_min = new_dist
					selected_x = nearest_attack_square.x + i*w;
					selected_y = nearest_attack_square.y+j*h;
				}
			}
		}
	}

	//failsafe check
	if(current_min >= huge_amount)
	{
		show_debug_message("script scr_calculate_dist did not find a point of attack");
	}

	global.attack_travel_x = selected_x;
	global.attack_travel_y = selected_y;


}
