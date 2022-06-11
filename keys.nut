::getcon <- function(control, state, useauto = false) {
	local keyfunc = 0
	local joyfunc = 0
	local hatfunc = 0

	switch(state) {
		case "press":
			keyfunc = keyPress
			joyfunc = joyButtonPress
			hatfunc = joyHatPress
			break
		case "release":
			keyfunc = keyRelease
			joyfunc = joyButtonRelease
			hatfunc = joyHatRelease
			break
		case "hold":
			keyfunc = keyDown
			joyfunc = joyButtonDown
			hatfunc = joyHatDown
			break
		default:
			return false
			break
	}

	switch(control) {
		case "Replay":
			if(keyfunc(k_a) || hatfunc(0, js_up) || (state == "hold" && joyY(0) < -js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.up
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == -1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == -1) return true
			break
		case "Record":
			if(keyfunc(k_s) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "Pause":
			if(keyfunc(k_p) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "a":
			if(keyfunc(k_a) || hatfunc(0, js_up) || (state == "hold" && joyY(0) < -js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.up
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == -1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == -1) return true
			break
		case "b":
			if(keyfunc(k_b) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "c":
			if(keyfunc(k_c) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "d":
			if(keyfunc(k_d) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "e":
			if(keyfunc(k_e) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "f":
			if(keyfunc(k_f) || hatfunc(0, js_up) || (state == "hold" && joyY(0) < -js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.up
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == -1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == -1) return true
			break
		case "g":
			if(keyfunc(k_g) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "h":
			if(keyfunc(k_h) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "i":
			if(keyfunc(k_i) || hatfunc(0, js_up) || (state == "hold" && joyY(0) < -js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.up
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == -1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == -1) return true
			break
		case "i":
			if(keyfunc(k_i) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "j":
			if(keyfunc(k_j) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "Replay":
			if(keyfunc(k_k) || hatfunc(0, js_up) || (state == "hold" && joyY(0) < -js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.up
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == -1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == -1) return true
			break
		case "k":
			if(keyfunc(k_k) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "l":
			if(keyfunc(k_l) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "m":
			if(keyfunc(k_m) || hatfunc(0, js_up) || (state == "hold" && joyY(0) < -js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.up
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == -1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == -1) return true
			break
		case "n":
			if(keyfunc(k_n) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "o":
			if(keyfunc(k_o) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "p":
			if(keyfunc(k_p) || hatfunc(0, js_up) || (state == "hold" && joyY(0) < -js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.up
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == -1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == -1) return true
			break
		case "r":
			if(keyfunc(k_r) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "s":
			if(keyfunc(k_s) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "t":
			if(keyfunc(k_t) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "u":
			if(keyfunc(k_u) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "v":
			if(keyfunc(k_v) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "w":
			if(keyfunc(k_w) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "x":
			if(keyfunc(k_x) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "y":
			if(keyfunc(k_y) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "z":
			if(keyfunc(k_z) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "lshift":
			if(keyfunc(k_lshift) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "space":
			if(keyfunc(k_space) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "backspace":
			if(keyfunc(k_backspace) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "comma":
			if(keyfunc(k_comma) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "period":
			if(keyfunc(k_period) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "enter":
			if(keyfunc(k_enter) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "1":
			if(keyfunc(k_1) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "2":
			if(keyfunc(k_2) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "3":
			if(keyfunc(k_3) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "4":
			if(keyfunc(k_4) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "4":
			if(keyfunc(k_4) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "5":
			if(keyfunc(k_5) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "6":
			if(keyfunc(k_6) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "7":
			if(keyfunc(k_7) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "8":
			if(keyfunc(k_8) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "9":
			if(keyfunc(k_9) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break
		case "0":
			if(keyfunc(k_0) || hatfunc(0, js_down) || (state == "hold" && joyY(0) > js_max / 10)) return true
			if(state == "hold" && useauto) return autocon.down
			if(state == "press" && joyAxisPress(0, 1, js_max / 20) == 1) return true
			if(state == "release" && joyAxisRelease(0, 1, js_max / 20) == 1) return true
			break


	}

	return false
}