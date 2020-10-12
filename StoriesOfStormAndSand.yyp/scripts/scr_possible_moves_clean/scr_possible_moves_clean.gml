function scr_possible_moves_clean() {
	with(obj_move_possible)
	{
		instance_destroy();
	}
	with(obj_move_impossible)
	{
		instance_destroy();
	}
	with(obj_move_target)
	{
		instance_destroy();
	}
	with(obj_move_curr_selected)
	{
		instance_destroy();
	}
	with(obj_attack_init)
	{
		instance_destroy();
	}
	move_grid_drawn = false;


}
