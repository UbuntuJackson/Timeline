::sprFont <- newSprite("font.png", 6, 8, 0, 0, 0, 0)
::FONT <- newFont(sprFont, 0, 0, true, 0)
::FONT_WIDTH <- 6
::FONT_HEIGHT <- 8

::lastCursorPos <- [mouseX(), mouseY()]
::cursorItem <- null
::lockX <- 0
::lockY <- 0
::LOCKED <- false
::SCREENSHOT <- 0
::OVERLAY <- 0
::TARGET <- 0
::FOCUS <- 0

::updateCursor <- function() {
	//if(!config.showcursor) return //If the cursor is set to hidden in the config, don't draw it.
	foreach(a, i in instances){
		if(i.identifier() == "Window"){
			if(mouseX() >= i.x && mouseX() <= i.x + i.w && mouseY() >= i.y && mouseY() <= i.y + i.h && mousePress(0)){
				//i.newWin()
				lockX = mouseX() - i.x
				lockY = mouseY() - i.y
				i.locked = true
				print("locked")
				OVERLAY = i
			}

			print(LOCKED)

			switch(i.locked){
				case true:
					i.x = mouseX() - lockX
					i.y = mouseY() - lockY
					break
			}

			if(!mouseDown(0)){
				print("RELEASE")
				i.locked = false
			}
		}
	}
	//Draw the cursor
	drawText(FONT, lastCursorPos[0], lastCursorPos[1], "+")
	//Cursor idle detection
	if(lastCursorPos[0] == mouseX() && lastCursorPos[1] == mouseY()) return
	lastCursorPos[0] = mouseX()
	lastCursorPos[1] = mouseY()

	//Check if the cursor is on top of any menu item
	cursorItem = null
	/*for(local index = 0; index < menu.len(); index++) {
		local menuItemY = 20 * (index + 1) - 5
		if(mouseX() >= 10 && mouseX() <= 10 + menu[index].name().len() * fontWidth && mouseY() >= menuItemY && mouseY() <= menuItemY + 10) {
			menuSelectorPos = index
			cursorItem = index
			break
		}
	}*/

}