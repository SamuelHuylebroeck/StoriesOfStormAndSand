//increment turn number
current_turn++;
//refresh units
var nr_of_units = ds_list_size(ds_active_units);

for(var i = 0; i< nr_of_units;i++)
{
	var unit = ds_active_units[| i];
	with(unit)
	{
		scr_refresh_unit();
	}
}

