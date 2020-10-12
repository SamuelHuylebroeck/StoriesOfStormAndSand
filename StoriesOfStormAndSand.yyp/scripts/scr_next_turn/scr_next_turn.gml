function scr_next_turn() {
	scr_deselect();

	with(global.side_map[global.current_turn_controller])
	{
		scr_side_end_turn();
	}

	switch(global.current_turn_controller)
	{
		case controller_id.p_1:
			global.current_turn_controller = controller_id.p_2;
			break;
		case controller_id.p_2:
			global.current_turn_controller = controller_id.p_1;
			break;
		case controller_id.ai:
			break;
	}


}
