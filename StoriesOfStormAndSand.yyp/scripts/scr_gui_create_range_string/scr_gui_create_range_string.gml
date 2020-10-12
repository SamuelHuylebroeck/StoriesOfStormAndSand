///@function scr_gui_create_range_string(min_range, max_range)
///@description create the range string from the passed min and max range
///@param {int} min_range minimum range 
///@param {int} max_range maximum range
///@returns String created from the minimum and maximum range
function scr_gui_create_range_string(argument0, argument1) {

	var min_range = argument0;
	var max_range = argument1;

	if(min_range == max_range)
	{
		return (string(min_range));
	}
	else
	{
		return string(min_range) + " - " + string(max_range);
	}


}
