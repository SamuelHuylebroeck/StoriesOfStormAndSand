/// @description Init camera
// You can write your code in this editor

//Variable declaration
camera = view_camera[0];
//dragging
drag_room_x = 0;
drag_room_y = 0;

//panning
camera_pan_step = 16;

//zooming
camera_width = camera_get_view_width(camera);
camera_height = camera_get_view_height(camera);
camera_x = camera_get_view_x(camera);
camera_y = camera_get_view_y(camera);
max_camera_width = 3200;
min_camera_width = 400
camera_zoom_step = 16;
aspect_ratio = camera_width/camera_height;

//combat camera setup
combat_camera_width = 800;

//Starting position
camera_set_view_pos(camera,0,0);
