/// @description Displays damage than destroys itself
// You can write your code in this editor
alpha +=0.01;
y_pos +=1;

draw_text_color(x,y-y_pos,damage_text,0,0,0,0,1-alpha);
if(alpha == 1) instance_destroy();