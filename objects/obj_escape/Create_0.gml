/// @description Insert description here
// You can write your code in this editor

// 状態
enum eEscState {
	Main,        // メイン(クリック判定)
	InputNumber, // 数値入力
};

// フラグを初期化
flag_reset();

// メイン状態に設定
state = eEscState.Main;

// 実行オブジェクト初期化
exec_obj = noone;

// 数値入力開始関数
start_input_number = function() {
	global.input_number = 0;
	if(instance_exists(exec_obj)) {
		instance_destroy(exec_obj);
	}
	exec_obj = instance_create_depth(0, 0, -100, obj_esc_input_number);
	state = eEscState.InputNumber;
};
