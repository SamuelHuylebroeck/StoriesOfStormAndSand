/// @description Insert description here
// You can write your code in this editor
var old_font = draw_get_font();
var old_halign = draw_get_halign();
var old_valign = draw_get_valign();
var old_color = draw_get_color();

var pos_x = x;
var pos_y = y + v_offset;

draw_set_color(text_color);
draw_set_font(text_font);
draw_set_valign(fa_middle);
//Column 1, the sides
//house of storms
draw_sprite(spr_symbol_hos,0,pos_x,pos_y - sprite_get_height(spr_symbol_hos)/2);
pos_x += sprite_get_width(spr_symbol_hos)+h_spacing;
draw_text(pos_x,pos_y, "House of Storms");
pos_y += column_height;
//sand alliance
pos_x = x;
draw_sprite(spr_symbol_sand_alliance,0,pos_x,pos_y - sprite_get_height(spr_symbol_hos)/2);
pos_x += sprite_get_width(spr_symbol_sand_alliance)+h_spacing;
draw_text(pos_x,pos_y, "Sand Alliance");

draw_set_halign(fa_center);
var i = 5;
var radiobutton_sprite;
//Column 2, Player 1
pos_x = x + i* column_width;
pos_y = y;
draw_text(pos_x, pos_y, "P 1");
pos_y += v_offset;
radiobutton_sprite = scr_get_radio_button_sprite()
draw_sprite(radiobutton_sprite, 0, pos_x - sprite_get_width(radiobutton_sprite)/2, pos_y - sprite_get_height(radiobutton_sprite)/2);
pos_y += column_height;
draw_sprite(radiobutton_sprite, 0, pos_x - sprite_get_width(radiobutton_sprite)/2, pos_y - sprite_get_height(radiobutton_sprite)/2);
i++;
//Column 3, Player 2
pos_x = x + i* column_width;
pos_y = y;
draw_text(pos_x, pos_y, "P 2");
i++;
//Column 4, AI
pos_x = x + i* column_width;
pos_y = y;
draw_text(pos_x, pos_y, "AI");
pos_x += column_width;

//Cleanup
draw_set_color(old_color);
draw_set_halign(old_halign);
draw_set_valign(old_valign);
draw_set_font(old_font);