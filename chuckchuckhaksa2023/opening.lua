-----------------------------------------------------------------------------------------
--
-- opening.lua
--시작화면 구성 (시작버튼, 화면 )
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	--배경
	local StartBg = display.newImage("image/시작화면임시.jpg",1920,1080)
	StartBg.x, StartBg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(StartBg)

	
	--임시 텍스트 
	

	--씬이동 
	local function catch(event)
		
        	composer.setVariable("complete", true)
        local options={
							effect ="fade",
							
						}
        composer.gotoScene("intro",options)
    
    	end

	  StartBg:addEventListener("tap",catch)

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