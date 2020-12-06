switch(state) {
case eEscState.Main:
	// クリック判定
	if(mouse_check_button_pressed(mb_left) == false) {
		// 左クリックしていなければ何もしない
		return;
	}

	// "Instances" レイヤーを取得
	var _layer = layer_get_id("Instances");
	// 要素をすべて取得
	var _elements = layer_get_all_elements(_layer);
	for(var i = 0; i < array_length(_elements); i++) {
		var elem = _elements[i];
		if(layer_get_element_type(elem) != layerelementtype_instance) {
			// instanceでないので何もしない
			continue;
		}

		// instance idを取得
		var _inst = layer_instance_get_instance(elem);
		//_inst.image_blend = c_white;
		// obj_escapeと当たり判定(クリック判定)を行う
		if(place_meeting(mouse_x, mouse_y, _inst) == false) {
			// don't hit
			continue;
		}
		
		//_inst.image_blend = c_red;
		
		if(variable_instance_exists(_inst, "click")) {
			// click関数が存在すれば実行する
			_inst.click();
		}
	}
	break;

case eEscState.InputNumber:
	// 数値入力判定
	if(instance_exists(exec_obj) == false) {
		// 数値入力が終わったら正解判定をする
		if(global.input_number == 3156) {
			// 正解なのでunlockする
			instance_destroy(obj_input);
			instance_destroy(obj_door_close);
			instance_destroy(obj_sticker1);
			instance_destroy(obj_door_hit);
			obj_door_open.visible = true;

			// flag on (unlock number).
			flag_on(eFlag.UNLOCK_NUMBER);
			
			esc_message("ドアが開いた");
		}
		else {
			esc_message("正しくないようだ");
		}
		
		// メインに戻る
		state = eEscState.Main;
	}
	break;
}
