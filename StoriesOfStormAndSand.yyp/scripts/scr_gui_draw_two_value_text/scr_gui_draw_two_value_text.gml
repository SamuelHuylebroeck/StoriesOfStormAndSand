///@function scr_gui_draw_text_split(pos_x, pos_y, preamble, preamble_color, first_value, first_value_color, second_value, second_value_color )
///@description Create a bar graphic at the specified position of the given unit length, showing a gradient between of the two colours based on the passed passed values
///@param {int} pos_x x-position to write text at
///@param {int} pos_y y-position to write text at
///@param {string} preamble preamble text
///@param {color} color of the preamble text
///@param {int} first_value
///@param {color} first_value_color of the first value string
///@param {int} second_value
///@param {color} second_value_color color of the second value string
function scr_gui_draw_two_value_text(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var pos_x = argument0;
	var pos_y = argument1;
	var preamble = argument2;
	var preamble_color = argument3;
	var first_value = argument4;
	var first_value_color = argument5;
	var second_value = argument6;
	var second_value_color = argument7;

	var seperator = "/";

	var old_color = draw_get_color();

	draw_set_color(preamble_color);
	draw_text(pos_x,pos_y,preamble);
	pos_x += string_width(preamble);
	draw_set_color(first_value_color);
	draw_text(pos_x,pos_y,string(first_value));
	pos_x += string_width(string(first_value));
	draw_set_color(preamble_color);
	draw_text(pos_x,pos_y,seperator);
	pos_x += string_width(seperator);
	draw_set_color(second_value_color);
	draw_text(pos_x,pos_y,string(second_value));

	draw_set_color(old_color);


}
