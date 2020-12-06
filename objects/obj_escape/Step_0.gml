/// @description Insert description here
// You can write your code in this editor
switch(state) {
case eEscState.Main:
	if(mouse_check_button_pressed(mb_left) == false) {
		return;
	}

	var _layer = layer_get_id("Instances");
	var _elements = layer_get_all_elements(_layer);
	for(var i = 0; i < array_length(_elements); i++) {
		var elem = _elements[i];
		if(layer_get_element_type(elem) != layerelementtype_instance) {
			// not instance.
			continue;
		}
		// get instance id.
		var _inst = layer_instance_get_instance(elem);
		//_inst.image_blend = c_white;
		if(place_meeting(mouse_x, mouse_y, _inst) == false) {
			// don't hit
			continue;
		}
		
		//_inst.image_blend = c_red;
		
		if(variable_instance_exists(_inst, "click")) {
			// execute click event
			_inst.click();
		}
	}
	break;

case eEscState.InputNumber:
	if(instance_exists(exec_obj) == false) {
		if(global.input_number == 3156) {
			// unlock.
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
		
		state = eEscState.Main;
	}
	break;
}
