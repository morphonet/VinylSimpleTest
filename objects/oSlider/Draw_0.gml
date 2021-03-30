/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_text(x - 10, y + 32, text);

var _w = lerp(0, 192, value / conf.max);

draw_set_alpha(0.5);
draw_rectangle_color(x, y, x+_w, y+64, $241CEE, $241CEE, $241CEE, $241CEE, false);
draw_set_alpha(1);

draw_rectangle_color(x, y, x+192, y+64, $1D94F8, $1D94F8, $1D94F8, $1D94F8, true);
draw_rectangle_color(x+1, y+1, x+190, y+62, $1D94F8, $1D94F8, $1D94F8, $1D94F8, true);
draw_rectangle_color(x+2, y+2, x+188, y+60, $1D94F8, $1D94F8, $1D94F8, $1D94F8, true);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + 96, y + 32, string(value));
