donut("input.nut")
donut("cursor.nut")
donut("timeline.nut")
donut("keys.nut")
//donut("input.nut")

::instances <- []

::QUIT <- false
::idNum <- 0

setFPS(60)
setResolution(800, 480)
setWindowTitle("Timeline")

::instances <- [Timeline(), Window(100, 100 + 300, 300, 200, 0)]

while(!QUIT && !getQuit()) {
	//Update various parts of the application

	foreach(i in instances){
		i.run()
	}
	updateCursor()
	update() //Update to next frame
}