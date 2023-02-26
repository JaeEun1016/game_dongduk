-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImageRect("image/minigame_background.jpg",display.contentWidth,display.contentHeight)
 	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local miro = display.newImage("image/final_miro.png",display.contentWidth,display.contentHeight)
 	miro.x, miro.y = display.contentWidth*0.5, display.contentHeight*0.5

	local cat = display.newImageRect("image/cat_left.png", 170, 170)
	cat.x, cat.y = display.contentWidth*0.7, display.contentHeight*0.23

	physics.start()
	physics.setDrawMode("hybrid")

	local arrow = {}

	arrow[1] = display.newImage("image/arrow_left.png", 70, 100)
	arrow[1].x, arrow[1].y = display.contentWidth*0.87, display.contentHeight*0.8
	arrow[1].name = "left"
	arrow[1]:toFront()

	arrow[2] = display.newImage("image/arrow_right.png", 70, 100)
	arrow[2].x, arrow[2].y = arrow[1].x + 90,display.contentHeight*0.8
	arrow[2].name = "right"
	arrow[2]:toFront()

	arrow[3] = "right"

	function arrowTab(event)
		x = cat.x
		y = cat.y

		if(event.target.name == arrow[3]) then
			if(event.target.name == "left") then
				transition.to(cat,{time=100, x=(x-50)})
			else
				transition.to(cat,{time=100, x=(x+50)})
			end
		else
			arrow[3] = event.target.newImage

			if(event.target.name == "left") then
				transition.to(cat,{time=100, x=(x-50)})
			else
				transition.to(cat,{time=100, x=(x+50)})
			end
		end
	end

	for i = 1, 2 do --tap하면 움직임
		arrow[i]:addEventListener("tap", arrowTab)
		sceneGroup:insert(arrow[i])
	end

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
