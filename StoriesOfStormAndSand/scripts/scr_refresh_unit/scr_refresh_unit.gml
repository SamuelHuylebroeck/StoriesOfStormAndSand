//reset marker
has_acted_this_round = false;
//reset movement points
move_points_pixels_curr = move_points_pixels;
//apply end of turn effects
if(occupied_terrain != noone)
{
	stats_current_hp = max(min(stats_current_hp + occupied_terrain.terrain_eot_hp_change * stats_max_hp, stats_max_hp), 0)
}