randomize();

// ######################################################################
//				ASSETS COLLECTIONS
// ######################################################################
vinyl_lib.collec_music_queue = vinyl_queue(music_003, music_002, music_001);
vinyl_lib.collec_voices_random = vinyl_random(juju, pug_saviour, pugs_best);


// ######################################################################
//				VINYL OBJECTS
// ######################################################################

// Buss definition
eBuss = {
	Music: "bussMusic",
	SFX: "bussSFX",
	Voices: "bussVoices"
}

bussMusic = vinyl_buss_create(eBuss.Music);
bussSFX = vinyl_buss_create(eBuss.SFX);
bussVoices = vinyl_buss_create(eBuss.Voices);

// Default tuning values
bussMusic.gain = 1;
bussSFX.gain = 1;
bussVoices.gain = 1;

// Vinyl future instances
instMusic = undefined;
instSFX = undefined;
instVoices = undefined;


// ######################################################################
//				VINYL HELPERS
// ######################################################################

setExplicitFadeOut = function(_vinyl, _gain_target, _gain_rate) {
	_vinyl.gain_target = _gain_target;
	_vinyl.gain_rate = _gain_rate;
}



// ######################################################################
//				HANDLERS
// ######################################################################
startMusic = function() {
	if (instMusic == undefined) {
		instMusic = vinyl_play("collec_music_queue");
		instMusic.buss_set(eBuss.Music);
	}
	//setExplicitFadeOut(instMusic, 0, 0.002);
}

nextMusic = function() {
	if (instMusic != undefined) {
		instMusic.playing_index = (instMusic.playing_index + 1) mod array_length(instMusic.sources);
	}
}

stopMusic = function() {
	vinyl_stop(instMusic);
	instMusic = undefined;
}

startVoiceRandom = function() {
	instVoices = vinyl_play("collec_voices_random");
	instVoices.buss_set(eBuss.Voices);
}

changeGainMusic = function(_value) {
	bussMusic.gain = _value;	
}

changePitchMusic = function(_value) {
	bussMusic.pitch = _value;	
}

changeGainVoice = function(_value) {
	bussVoices.gain = _value;	
}

changePitchVoice = function(_value) {
	bussVoices.pitch = _value;	
}

// ######################################################################
//				UI BUTTONS / SLIDERS
// ######################################################################
btnStartMusic = instance_create_depth(10, 10, depth-1, oButton);
btnStartMusic.setText("Start Music");
btnStartMusic.clickHandler = startMusic;

btnStopMusic = instance_create_depth(10, 84, depth-1, oButton);
btnStopMusic.setText("Next Music");
btnStopMusic.clickHandler = nextMusic;

btnStopMusic = instance_create_depth(10, 158, depth-1, oButton);
btnStopMusic.setText("Stop Music");
btnStopMusic.clickHandler = stopMusic;

btnStartVoice = instance_create_depth(10, 272, depth-1, oButton);
btnStartVoice.setText("Random Voice");
btnStartVoice.clickHandler = startVoiceRandom;


sliderGainMusic = instance_create_depth(room_width - 562, 10, depth-1, oSlider);
sliderGainMusic.setText("Music Gain");
sliderGainMusic.conf.max = 1;
sliderGainMusic.onChange = changeGainMusic;

sliderPitchMusic = instance_create_depth(room_width - 202, 10, depth-1, oSlider);
sliderPitchMusic.setText("Music Pitch");
sliderPitchMusic.onChange = changePitchMusic;


sliderGainVoice = instance_create_depth(room_width - 562, 272, depth-1, oSlider);
sliderGainVoice.setText("Voice Gain");
sliderGainVoice.conf.max = 1;
sliderGainVoice.onChange = changeGainVoice;


sliderPitchVoice = instance_create_depth(room_width - 202, 272, depth-1, oSlider);
sliderPitchVoice.setText("Voice Pitch");
sliderPitchVoice.onChange = changePitchVoice;