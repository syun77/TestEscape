// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function esc_message(text){
	if(instance_exists(obj_notice)) {
		instance_destroy(obj_notice);
	}
	
	var _inst = instance_create_depth(0, 0, 0, obj_notice);
	_inst.text = text;
	_inst.alarm[eNoticeAlarm.LifeTime] = 180;
	
	return _inst;
}