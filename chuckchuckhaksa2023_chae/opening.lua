-----------------------------------------------------------------------------------------
--
-- opening.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	--SOUND
	local backgroundMusic = audio.loadSound( "audio/opening.mp3" )
				audio.play( backgroundMusic,{ channel=0,loops=-1 })
				audio.setVolume( 0.4  )

	--배경
	local StartBg = display.newImage("image/게임시작화면.jpg",1920,1080)
	StartBg.x, StartBg.y = display.contentWidth*0.5, display.contentHeight*0.5
	StartBg:scale(0.24,0.24)
	sceneGroup:insert(StartBg)

	local StartButton = display.newImage("image/시작하기버튼.png",1920,1080)
	StartButton.x, StartButton.y = display.contentWidth*0.73, display.contentHeight*0.83
	sceneGroup:insert(StartButton)

	--임시 텍스트 
	

	--씬이동 
	local function catch(event)
		
        	composer.setVariable("complete", true)
        local options={
							effect ="fade",
							
						}
        composer.gotoScene("intro",options)
    		--local soundEffect = audio.loadSound( "audio/miro.mp3" )
				audio.play( soundEffect)
    	end

	  StartButton:addEventListener("tap",catch)

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