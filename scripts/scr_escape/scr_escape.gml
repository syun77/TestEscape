// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// 使用するフラグを定義
enum eFlag {
	UNLOCK_NUMBER, // ドアを開いた
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

/// @description 通知テキスト表示
/// @param text 表示するテキスト
function esc_message(text) {
	if(instance_exists(obj_notice)) {
		// テキストがすでに表示されていたら消す
		instance_destroy(obj_notice);
	}
	
	// 通知テキスト表示オブジェクトを生成
	var _inst = instance_create_depth(0, 0, 0, obj_notice);
	_inst.text = text; // テキストを設定
	_inst.alarm[eNoticeAlarm.LifeTime] = 180; // 表示時間は3秒
	
	return _inst;
}

/// @description 数値入力開始
function esc_start_input() {
	obj_escape.start_input_number();
}
