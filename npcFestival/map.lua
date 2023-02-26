-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	-- map ----------------------------------------------------------------------
 	-- 배경
	local background = display.newImageRect("image/map.png", 1920, 1080)
 	background.x, background.y = display.contentWidth/2, display.contentHeight/2
	sceneGroup:insert(background)

	-- 인문관
	local inmoon = display.newImage("image/인문관.png",1920,1080)
	inmoon.x, inmoon.y = display.contentWidth*0.233, display.contentHeight*0.217
	inmoon:scale(1.3,1.3)
	sceneGroup:insert(inmoon)

	-- 숭인관
	local soongin = display.newImage("image/숭인관.png",1920,1080)
	soongin.x, soongin.y = display.contentWidth*0.753, display.contentHeight*0.215
	soongin:scale(1.25,1.25)
	sceneGroup:insert(soongin)

	-- 본관
	local bon = display.newImage("image/본관.png",1920,1080)
	bon.x, bon.y = display.contentWidth*0.245, display.contentHeight*0.645
	bon:scale(1.35,1.35)
	sceneGroup:insert(bon)

	-- 대학원
	local won = display.newImage("image/대학원.png",1920,1080)
	won.x, won.y = display.contentWidth*0.74, display.contentHeight*0.73
	won:scale(1.1,1.1)
	sceneGroup:insert(won)

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