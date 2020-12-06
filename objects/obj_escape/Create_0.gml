/// @description Insert description here
// You can write your code in this editor

enum eEscState {
	Main,
	InputNumber,
};

flag_reset();

state = eEscState.Main;
exec_obj = noone;

start_input_number = function() {
	global.input_number = 0;
	if(instance_exists(exec_obj)) {
		instance_destroy(exec_obj);
	}
	exec_obj = instance_create_depth(0, 0, -100, obj_esc_input_number);
	state = eEscState.InputNumber;
};
