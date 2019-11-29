/// @description State Control
// You can write your code in this editor
if(global.map_running)
{
	switch(global.current_turn_controller)
	{
		case controller_id.p_1:
			scr_state_player_turn();
			break;
		case controller_id.p_2:
			scr_state_player_turn();
			break;
	}
}