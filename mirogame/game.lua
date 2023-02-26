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

	local ab_miro = display.newImage("image/about_miro.png",display.contentWidth,display.contentHeight)
 	ab_miro.x, ab_miro.y = display.contentWidth*0.5, display.contentHeight*0.5
	
	local button1 = display.newImage("image/button_1.png",display.contentWidth,display.contentHeight)
 	button1.x, button1.y = display.contentWidth*0.9, display.contentHeight*0.9
	sceneGroup:insert(button1)

		--æ¿¿Ãµø 
	local function catch(event)
		
        	composer.setVariable("complete", true)
        local options={
							effect ="fade",
							
						}
        composer.gotoScene("game2",options)
    
    	end

	  button1:addEventListener("tap",catch)

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
