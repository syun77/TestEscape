/// @description Insert description here
// 背景を描画
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_alpha(1);
draw_set_color(c_white);

// 入力中の数値を描画
var px = 512;
var py = 256;
var size = 32;
for(var i = 0; i < number_max; i++) {
	draw_set_color(c_black);
	draw_rectangle(px, py, px+size, py+size, false);
	draw_set_color(c_white);
	draw_rectangle(px, py, px+size, py+size, true);
	if(i < number_index) {
		draw_text(px+8, py, string(number_list[i]));
	}
	px += size;
}

// 説明文を描画
px = 512;
draw_set_font(fnt_jp);
draw_text(px, py+128, "数字キーで入力");
draw_text(px, py+128+32, "* Enterキーで決定 *");
draw_text(px, py+128+64, "* Backspaceキーで1文字戻る *");