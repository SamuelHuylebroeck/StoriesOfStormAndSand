var active_side = scr_get_active_side_par();

switch(active_side)
{
	case par_storm_house:
		return par_sand_alliance;
	case par_sand_alliance:
		return par_storm_house;
}