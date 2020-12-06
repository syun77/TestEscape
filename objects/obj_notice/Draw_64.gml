/// @description Insert description here
// You can write your code in this editor

var height = 48;

var px = room_width/2;
var py = room_height - height;

// draw bg.
draw_set_alpha(0.3);
draw_set_color(c_black);
draw_rectangle(0, py-16, room_width, room_height, false);

// draw text.
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fnt_jp);

draw_set_halign(fa_center);
draw_text(px, py, text);
draw_set_halign(fa_left);
