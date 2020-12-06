/// @description Insert description here
if(keyboard_check_pressed(vk_enter)) {
	// Enterキーで決定。配列を数値に変換する
	global.input_number = 0;
	for(var i = 0; i < number_index; i++) {
		// 10^n をかけて各桁数を計算
		var digit = number_max - i - 1;
		var val = number_list[i] * power(10, digit);
		global.input_number += val;
	}

	// 終了
	instance_destroy();
	return;
}

if(keyboard_check_pressed(vk_backspace)) {
	// 1文字削除
	if(number_index > 0) {
		number_index--;
		number_list[number_index] = 0;
	}
}

if(number_index >= number_max) {
	// すべての桁を入力したら以下の処理は行わない
	return;
}

// キーボードの0〜9の入力判定
for(var i = 0; i < 9 + 1; i++) {
	if(keyboard_check_pressed(ord(string(i)))) {
		number_list[number_index] = i;
		number_index++;
	}
}
