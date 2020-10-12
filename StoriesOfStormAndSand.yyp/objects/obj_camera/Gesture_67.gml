/// @description Move camera
// You can write your code in this editor
if(global.camera_controllable)
{
	var _x = drag_room_x - event_data[? "rawposX"];
	var _y = drag_room_y - event_data[? "rawposY"];

	//Edge guard
	if(_x<0) _x = 0;
	if(_y <0) _y = 0; 

	if(_x > room_width - camera_get_view_width(camera)) _x = room_width - camera_get_view_width(camera);
	if(_y > room_height - camera_get_view_height(camera)) _y = room_height - camera_get_view_height(camera);

	//Set camera
	camera_set_view_pos(camera, _x,_y);
}