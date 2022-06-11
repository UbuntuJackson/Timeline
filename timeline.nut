::Timeline <- class extends Actor{
	timer = 0
	points = []
	radius = 5
	x = 0
	y = 0
	mode = null
	texts = null
	b = 0
	c = 0
	paused = true
	sliderX = 0
	sliderY = 0
	Wx = 0
	Wy = 0
	Ww = 0
	Wh = 0
	locked = false
	_id = 0
	seconds = 0
	minutes = 0
	maxLen = 0
	defaultLen = 600
	factor = 1
	step = 1
	children = 0
	constructor(_arr = null){
		x = 200
		y = 200
		mode = record
		paused = false
		texts = []
		b = 0
		Wx = 0
		Wy = screenH()-screenH()/5
		Ww = screenW()
		Wh = screenH()/5
		sliderX = Wx
		sliderY = Wy + Wh/2
		locked = false
		timer = 0
		step = 1
		_id = idNum
		idNum++
		seconds = 0
		minutes = 0
		maxLen = 600
		defaultLen = 600
		factor = 1
		step = 1
		setDrawColor(0xFFFFFF)
		children = []
		if(!_arr) return
		if(_arr.len() == 1) points = _arr[0]
		if(_arr.len() == 2) timer = 0
		else return
	}

	function updateTimer(){
		if(paused == false){
			timer++
		}

		seconds = floor(timer/60)%60
		minutes = floor(timer/3600)
		//if(seconds.len() == 1) drawText(FONT, screenW() - 50, screenH() - 20, minutes.tostring() + ":" + seconds.tostring() + "s")
		drawText(FONT, screenW() - 50, screenH() - 20, minutes.tostring() + ":" + seconds.tostring())

	}

	function pause(){

	}

	function slider(){
		print(step)
		print(maxLen)
		sliderX = timer*step
		setDrawColor(0x907070FF)
		drawRec(Wx, Wy, Ww, Wh, true)
		setDrawColor(0x0000FF)
		drawCircle(sliderX, sliderY, radius, true)
		if(pow(mouseX() - sliderX, 2) + pow(mouseY() - sliderY, 2) <= 25 && mousePress(0)){
			locked = true
		}
		switch(locked){
			case true:
				sliderX = mouseX()
				timer = sliderX/step
				if(mouseRelease(0)){
					locked = false
				}
				break


		}
	}

	function replay(){
		foreach(i in points){
			if(i[2] < timer) drawCircle(i[0], i[1], radius, true)
		}
		updateTimer()
	}

	function record(){
		foreach(i in points){
			if(i[2] <= timer){
				setDrawColor(0xFFFFFF)
				drawCircle(i[0], i[1], radius, true)
			}
		}
		if(mousePress(0)){
			points.push([mouseX(), mouseY(), timer])
		}
		updateTimer()
	}

	function drawForTicks(text, ticks, _a){
		texts[_a][2]++
		print(texts[_a][2])
		if(texts[_a][2] < texts[_a][1]){
			drawText(FONT, 20, screenH() - 20 - _a * 20, text)
		}
		else{
			texts.remove(_a)
		}
	}

	function run(){
		if(maxLen < timer){
			maxLen = timer
			step = defaultLen.tofloat()/maxLen.tofloat()
		}

		if(texts.len() != 0){
			foreach(a, i in texts){
				drawForTicks(i[0], i[1], a)
			}
		}
		if(getcon("Replay", "press")){
			timer = 0
			if(paused == false) texts.push(["Replaying...", 50, 0, 0])
			if(paused == true) texts.push(["Replaying... (Paused)", 50, 0, 0])
		}
		if(getcon("Record", "press")){
			points = []
			mode = record
			if(paused == false)texts.push(["Recording...", 50, 0, 0])
			if(paused == true)texts.push(["Recording... (Paused)", 50, 0, 0])
		}
		if(getcon("Pause", "press")){
			switch(paused){
				case false:
					texts.push(["Pausing...", 50, 0, 0])
					paused = true
					break
				case true:
					texts.push(["Resuming...", 50, 0, 0])
					paused = false
					break
			}
		}
		slider()
		mode()
	}

	function identifier(){return "Timeline"}
}

::Window <- class extends Actor{
	x = 0
	y = 0
	w = 0
	h = 0
	buttons = []
	_ID = 0
	res = []
	fullScreen = false
	standardRes = null
	fullRes = []
	orgRes = []
	parent = null
	locked = false
	contentText = ""
	buttonsExtra = []
	row = 0
	constructor(_x, _y, _w, _h, _parent, _arr = null){
		x = _x
		y = _y
		w = _w
		h = _h
		parent = _parent
		locked = false
		_ID = idNum
		idNum++
		print(_ID)
		res = [_x, _y, _w, _h]
		print(instances.len())
		row = 0

		orgRes = res
		standardRes = res
		fullRes = [0, 0, screenW(), screenH()]
		buttons = ["x"]
		buttonsExtra = [["New Dialogue", x + w/2, y + h/2, this], ["New Response", x + 20, y + h - 20, this]]
		contentText = ""
		SCREENSHOT = newTexture(w, h)
		OVERLAY = this
		TARGET = this
		row = 0

		if(!_arr) return
		if(_arr.len() == 1) contentText = _arr[0]
		if(_arr.len() == 2) timer = 0
		else return
	}

	function iNdex(){
		foreach(a, i in instances){
			if(i == this) return a
		}
	}

	function toolBar(){
		buttonsExtra = [["New Dialogue", x + w/2 - buttonsExtra[0][0].len() * FONT_WIDTH/2, y + h/2, this], ["New Response", x + 20, y + h - 20, this]]
		foreach(a, i in buttons){
			if(distance2(mouseX(), mouseY(), x+w-12*(a+1), y+3) < FONT_WIDTH/2 + 1){
				setDrawColor(0xFF0000FF)
				drawCircle(x+w-12*(a+1) + FONT_WIDTH/2 - 1, y+3 + FONT_HEIGHT/2, FONT_WIDTH/2 + 1, true)
			}
			drawText(FONT, x+w-12*(a+1), y+3, i)
			if(distance2(mouseX(), mouseY(), x+w-12*(a+1), y+3) < FONT_WIDTH/2 + 1 && mousePress(0)){
				switch(i){
					case "x":
						parent = "dead"
						instances.remove(iNdex())
						break
					case "o":
						switch(res){
							case standardRes:
								setRes(fullRes)
								break
							case fullRes:
								setRes(standardRes)
								break
						}
						break
					case "-":
						setRes(orgRes)
						break
					case "n":
						instances.push(Window(x, y + 200, 200, 100, this))
						break

				}
			}
		}

		foreach(a, i in buttonsExtra){
			local buttonText = i[0]
			local buttonW = i[0].len() * FONT_WIDTH
			local buttonH = FONT_HEIGHT
			local buttonX = i[1]
			local buttonY = i[2]
			switch(buttonText){
				case "New Dialogue":
					if(FOCUS != i[3] || TARGET != this){
						if(contentText.len() == 0) drawText(FONT, buttonX, buttonY, buttonText.tostring())
					}

					if(TARGET == this) if(getFrames()%50 >= 0 && getFrames()%50 <= 10) if(FOCUS == i[3]) drawText(FONT, buttonX + FONT_WIDTH * contentText.len() - FONT_WIDTH/2, buttonY, "|")

					if(mouseX() >= buttonX && mouseX() <= buttonX + buttonW && mouseY() >= buttonY && mouseY() <= buttonY + buttonH && mousePress(0)){
						FOCUS = i[3]
					}

					if(OVERLAY == this) if(TARGET == this){
						contentText += letter()
						if(getcon("backspace", "press") && contentText.len() >= 1) contentText = contentText.slice(0, contentText.len()-1)
						if(getcon("enter", "press")) row++
						print(TARGET)
					}
					drawText(FONT, buttonX, buttonY, contentText.tostring())
					break
				case "New Response":

					drawText(FONT, buttonX, buttonY, buttonText.tostring())

					if(mouseX() >= buttonX && mouseX() <= buttonX + buttonW && mouseY() >= buttonY && mouseY() <= buttonY + buttonH && mousePress(0)){
						instances.push(Window(x, y + 200, 200, 100, this))
					}
					break
			}
		}
	}

	function updateWindow(){
		if(TARGET == this) setDrawColor(0x707099FF)
		else setDrawColor(0x707099EE)
		drawRec(x, y, w, h, true)
	}

	function content(){
		if(mouseX() >= x && mouseX() <= x + w && mouseY() >= y && mouseY() <= y + h && mousePress(0)){
			TARGET = this
		}
	}

	function setRes(_res){
		x = _res[0]
		y = _res[1]
		w = _res[2]
		h = _res[3]
		res = _res
	}

	function newWin(){
		instances.push(Window(200, 200, 200, 200, this, ["Hello, folks. My name is UbuntuJackson."]))
		print("this")
	}

	function run(){
		setDrawColor(0xAAAAAAFF)
		if(parent != 0) drawLine(x+w/2, y, parent.x + parent.w/2, parent.y + parent.h)
		if(parent) if(parent.parent == "dead") instances.remove(iNdex())
		//SCREENSHOT = newTexture(w, h)
		//setDrawTarget(SCREENSHOT)
		updateWindow()
		toolBar()
		content()
		//resetDrawTarget()
		//drawImage(SCREENSHOT, x, y)
	}

	function identifier(){
		return "Window"
	}
}