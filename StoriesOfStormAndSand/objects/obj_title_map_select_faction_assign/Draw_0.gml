/// @description Insert description here
// You can write your code in this editor
draw_self();
var old_font = draw_get_font();
var old_halign = draw_get_halign();
var old_valign = draw_get_valign();
var old_color = draw_get_color();

var x_pos = x + h_initial_offset;
var y_pos = y + v_offset + v_initial_offset;

draw_set_color(text_color);
draw_set_font(text_font);
draw_set_valign(fa_middle);
//Column 1, the sides
//house of storms
draw_sprite(spr_symbol_hos,0,x_pos,y_pos - sprite_get_height(spr_symbol_hos)/2);
x_pos += sprite_get_width(spr_symbol_hos)+h_spacing;
draw_text(x_pos,y_pos, "House of Storms");
y_pos += row_height;
//sand alliance
x_pos = x+h_initial_offset;
draw_sprite(spr_symbol_sand_alliance,0,x_pos,y_pos - sprite_get_height(spr_symbol_hos)/2);
x_pos += sprite_get_width(spr_symbol_sand_alliance)+h_spacing;
draw_text(x_pos,y_pos, "Sand Alliance");

draw_set_halign(fa_center);
var i = 0;
//Column 2, Player 1
x_pos = x + column_start_x + i*column_width;
y_pos = y + v_initial_offset;
scr_draw_map_select_faction_column("P 1", x_pos, y_pos, controller_id.p_1);
i++;
//Column 3, Player 2
x_pos = x + column_start_x + i*column_width;
scr_draw_map_select_faction_column("P 2", x_pos, y_pos, controller_id.p_2);
i++;
//Column 4, AI
x_pos = x + column_start_x + i*column_width;
scr_draw_map_select_faction_column("AI", x_pos, y_pos, controller_id.ai);
i++;

//Cleanup
draw_set_color(old_color);
draw_set_halign(old_halign);
draw_set_valign(old_valign);
draw_set_font(old_font);