// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum eFlag {
	UNLOCK_NUMBER,
	FLAG_01,
	FLAG_02,
	FLAG_03,
	FLAG_04,
	FLAG_05,
	FLAG_06,
	FLAG_07,
	
	Max,
};

function flag_on(flag_id) {
	global.flags[flag_id] = true;
}
function flag_off(flag_id) {
	global.flags[flag_id] = false;
}
function flag_chk(flag_id) {
	return global.flags[flag_id];
}
function flag_reset() {
	global.flags = [];
	for(var i = 0; i < eFlag.Max; i++) {
		global.flags[i] = false;
	}
}

function esc_message(text) {
	if(instance_exists(obj_notice)) {
		instance_destroy(obj_notice);
	}
	
	var _inst = instance_create_depth(0, 0, 0, obj_notice);
	_inst.text = text;
	_inst.alarm[eNoticeAlarm.LifeTime] = 180;
	
	return _inst;
}

function esc_start_input() {
	obj_escape.start_input_number();
}
