/// @description Insert description here
// You can write your code in this editor
draw_self();
var old_font = draw_get_font();
var old_color = draw_get_color();
var old_valign = draw_get_valign()


draw_set_font(text_font);
draw_set_color(highlighted?text_color_highlight:text_color);
draw_set_valign(fa_middle);

var x_pos = x + x_offset;
var y_pos = y + sprite_height/2;
draw_text(x_pos,y_pos,map_name);

draw_set_font(old_font);
draw_set_color(old_color);
draw_set_valign(old_valign);


