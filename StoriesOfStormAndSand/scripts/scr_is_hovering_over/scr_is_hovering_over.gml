///@function scr_is_hovering_over
///@description check if the mouse is hovering over this object
var mouse_gui_x = device_mouse_x_to_gui(0);
var mouse_gui_y = device_mouse_y_to_gui(0);

return point_in_rectangle(mouse_gui_x,mouse_gui_y,pos_x,pos_y,pos_x+width,pos_y+height);
