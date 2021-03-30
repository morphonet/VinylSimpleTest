
draw_set_halign(fa_left);
draw_set_valign(fa_middle);


if (instMusic != undefined) {
	if (vinyl_is_finished(instMusic)) {
		draw_text(212, 42, "instMusic Playlist finished");
	} else {
		draw_text(212, 42, "instMusic is playing song #" + string(instMusic.playing_index));
	}
} else {
	draw_text(212, 42, "instMusic = undefined");
}


if (instVoices != undefined) {
	if (vinyl_is_finished(instVoices)) {
		draw_text(212, 304, "instVoices is finished");
	} else {
		draw_text(212, 304, "instVoices is running...");
	}
} else {
	draw_text(212, 304, "instVoices = undefined");	
}
