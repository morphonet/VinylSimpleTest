/// @description Insert description here

if (point_in_rectangle(mouse_x, mouse_y, x,  y, x + sprite_get_width(sprite_index), y + sprite_get_height(sprite_index))) {
	image_index = 1;
	
	if (mouse_check_button_released(mb_left) && clickHandler != undefined) {
		clickHandler();	
	}
} else {
	image_index = 0;	
}