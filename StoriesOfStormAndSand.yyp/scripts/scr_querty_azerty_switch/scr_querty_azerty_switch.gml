function scr_querty_azerty_switch() {
	azerty = !azerty;
	global.up = azerty?"Z":"W";
	global.left = azerty?"Q":"A";


}
