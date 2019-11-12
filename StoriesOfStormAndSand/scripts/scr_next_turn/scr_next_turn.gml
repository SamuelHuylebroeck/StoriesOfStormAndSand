scr_deselect();

with(global.side_map[global.state])
{
	scr_side_end_turn();
}

switch(global.state)
{
	case states.turn_p_1:
		global.state = states.turn_p_2;
		break;
	case states.turn_p_2:
		global.state = states.turn_p_1;
		break;
	case states.turn_ai:
		break;
}