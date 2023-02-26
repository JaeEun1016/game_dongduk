-----------------------------------------------------------------------------------------
--
-- 인문관.lua
--인문관 내부 맵
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	--배경
	local inmoonBG = display.newImage("image/건물내부-01.png",1920,1080)
	inmoonBG.x, inmoonBG.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(inmoonBG)


	--임시 텍스트 
	local showText = display.newText("인문관 내부",display.contentWidth*0.5,display.contentHeight*0.8)
	showText:setFillColor(1)
	showText.size=200
	sceneGroup:insert(showText)

	--씬이동 
	local function catch(event)

        	composer.setVariable("complete", true)
        local options={
							effect ="fade",

						}
        composer.gotoScene("inmoon_game",options)

    	end

	  inmoonBG:addEventListener("tap",catch)

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