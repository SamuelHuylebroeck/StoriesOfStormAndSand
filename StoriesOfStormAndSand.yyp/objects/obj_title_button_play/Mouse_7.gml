/// @description Insert description here
// You can write your code in this editor

//get current view
var camera =  view_camera[0];
var camera_x = camera_get_view_x(camera) + 1600;
var camera_y = camera_get_view_y(camera);
camera_set_view_pos(camera,camera_x,camera_y);
image_index = 1;