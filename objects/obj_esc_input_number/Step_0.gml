/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_enter)) {
	global.input_number = 0;
	for(var i = 0; i < number_index; i++) {
		var digit = number_max - i - 1;
		var val = number_list[i] * power(10, digit);
		global.input_number += val;
	}
	instance_destroy();
	return;
}

if(keyboard_check_pressed(vk_backspace)) {
	if(number_index > 0) {
		number_index--;
		number_list[number_index] = 0;
	}
}

if(number_index >= number_max) {
	return;
}


for(var i = 0; i < 9 + 1; i++) {
	if(keyboard_check_pressed(ord(string(i)))) {
		number_list[number_index] = i;
		number_index++;
	}
}

