-----------------------------------------------------------------------------------------
--
-- project.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	--배경--
	local graduation = display.newImage("image_quiz/졸업퀴즈 배경.png", 1920, 1080)
	graduation.x, graduation.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(graduation)

	local showText = display.newText("졸업퀴즈게임씬",display.contentWidth*0.5,display.contentHeight*0.8)
	showText:setFillColor(1)
	showText.size=200
	sceneGroup:insert(showText)

	local button = display.newImage("image_quiz/넘기기버튼.png", 1920, 1080)
	button.x, button.y = display.contentWidth*0.87, display.contentHeight*0.8
	button:scale(0.8,0.8)
	sceneGroup:insert(button)
	
	local function quizTap(event)
        print("퀴즈1탭")
    local options={
                        effect ="fade",
                        time=400
                    }
    composer.gotoScene("game1",options)
end
 button:addEventListener("tap",quizTap)
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
