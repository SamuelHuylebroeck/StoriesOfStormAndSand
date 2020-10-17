/// @description Insert description here
// You can write your code in this editor
var current_pos_x = room_width/2
var current_pos_y = screen_offset_y

var old_font = draw_get_font();
var old_color = draw_get_color();
var old_align = draw_get_halign();

draw_set_font(text_font);
draw_set_color(text_color);
draw_set_halign(fa_center)

draw_sprite_ext(global.sprite_victory,0, current_pos_x-sprite_get_width(global.sprite_victory), current_pos_y,2,2,0,c_white,1)
current_pos_y += 64
draw_set_alpha(1);
draw_text(current_pos_x,current_pos_y,global.text_victory);

draw_set_font(old_font);
draw_set_color(old_color);
draw_set_halign(old_align)