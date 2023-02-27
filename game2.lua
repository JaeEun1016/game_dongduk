-----------------------------------------------------------------------------------------
--
-- game2.lua
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
	--퀴즈2번--
	local quiz2 = display.newImage("image_quiz/동덕축제이름퀴즈.png")
	quiz2.x, quiz2.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(quiz2)
	--다시생각해보세요--
	-- local bback = display.newImage("image/back.png")
	--bback.x, bback.y = display.contenWidth*0.5, display.contentHeight*0.5
	--sceneGroup:insert(bback)
	--퀴즈2번보기--
	local an1 = display.newImage("image_quiz/1대동제.png")
	an1.x, an1.y = display.contentWidth*0.45, display.contentHeight*0.4
    an1:scale(0.8,0.8)
	sceneGroup:insert(an1)
	local an2 = display.newImage("image_quiz/2동덕페스티벌.png")
	an2.x, an2.y = display.contentWidth*0.45, display.contentHeight*0.55
    an2:scale(0.8,0.8)
	sceneGroup:insert(an2)

	local an3 = display.newImage("image_quiz/3동동제.png")
	an3.x, an3.y = display.contentWidth*0.45, display.contentHeight*0.7
    an3:scale(0.8,0.8)
	sceneGroup:insert(an3)

    local an4 = display.newImage("image_quiz/4솜솜제.png")
	an4.x, an4.y = display.contentWidth*0.45, display.contentHeight*0.85
    an4:scale(0.8,0.8)
	sceneGroup:insert(an4)

    local function quiz2Tap(event)
        print("퀴즈2탭")
    local options={
                        effect ="fade",
                        time=400
                    }
    composer.gotoScene("game3",options)
end
 an1:addEventListener("tap",quiz2Tap)

 	local function back1(event)
		local score = display.newImage("image/back.png")
		score.x, score.y = display.contentWidth*0.5, display.contentHeight*0.5
		sceneGroup:insert(score)
	end
an2:addEventListener("tap",back1)
an3:addEventListener("tap",back1)
an4:addEventListener("tap",back1)
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
