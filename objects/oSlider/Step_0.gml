/// @description Insert description here
// You can write your code in this editor

if (point_in_rectangle(mouse_x, mouse_y, x, y, x+192, y+64)) {
	if (mouse_check_button(mb_left)) {
		value = conf.max * (mouse_x - x) / 192;
		
		if (onChange != undefined) {
			onChange(value);
		}
	}
}