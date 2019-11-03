/// @func scr_draw_health_bar()
/// @description Draw the health bar for a damaged unit
var healthbar_distance_above_unit = 16;
var healthbar_height = 2;
var healthbar_x_offset = 2;
var healthbar_y_offset = 2;
var healthbar_width = 60;
var fill_color = c_green;

//Calculated values
var percentFilled = stats_current_hp/stats_max_hp;
if(percentFilled <0) percentFilled = 0;

//drawing functionality
draw_sprite(spr_unit_health_bar,image_index,x,y-healthbar_distance_above_unit);
var old_color = draw_get_color();
draw_set_color(fill_color);
draw_rectangle(x+healthbar_x_offset + sprite_width/2,y-healthbar_distance_above_unit+healthbar_y_offset, x+healthbar_x_offset + percentFilled*healthbar_width + sprite_width/2,y-healthbar_distance_above_unit+healthbar_y_offset + healthbar_height ,false);
draw_set_color(old_color);
