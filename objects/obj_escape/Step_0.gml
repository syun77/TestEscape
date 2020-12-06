/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(vk_space)) {
	var _inst = instance_create_depth(0, 0, 0, obj_notice);
	_inst.text = "hello world.";
	_inst.alarm[eNoticeAlarm.LifeTime] = 180;
}
