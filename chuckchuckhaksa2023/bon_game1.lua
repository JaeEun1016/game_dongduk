-----------------------------------------------------------------------------------------
--
-- bon_game1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	--배경--
	local graduation = display.newImage("image/bon/졸업퀴즈 배경.png", 1920, 1080)
	graduation.x, graduation.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(graduation)
	--퀴즈1번--
	local quiz1 = display.newImage("image/bon/동덕홍보대사퀴즈.png")
	quiz1.x, quiz1.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(quiz1)
	--퀴즈1번보기--
	local a1 = display.newImage("image/bon/1동그라미.png")
	a1.x, a1.y = display.contentWidth*0.45, display.contentHeight*0.45
	sceneGroup:insert(a1)
	local a2 = display.newImage("image/bon/2동덕솜솜.png")
	a2.x, a2.y = display.contentWidth*0.45, display.contentHeight*0.65
	sceneGroup:insert(a2)
	local a3 = display.newImage("image/bon/3동덕이.png")
	a3.x, a3.y = display.contentWidth*0.45, display.contentHeight*0.85
	sceneGroup:insert(a3)
	
    --씬이동-
    local function quiz1Tap(event)
        print("퀴즈1탭")
    local options={
                        effect ="fade",
                        time=400
                    }
    composer.gotoScene("bon_game2",options)
end
 a1:addEventListener("tap",quiz1Tap)
 a2:addEventListener("tap",quiz1Tap)
 a3:addEventListener("tap",quiz1Tap)
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
