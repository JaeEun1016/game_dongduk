-----------------------------------------------------------------------------------------
--
-- game3.lua
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
	--퀴즈3번--
	local quiz3 = display.newImage("image/bon/동덕교화퀴즈.png")
	quiz3.x, quiz3.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(quiz3)
	--퀴즈3번보기--
	local ans1 = display.newImage("image/bon/1.무궁화.png")
	ans1.x, ans1.y = display.contentWidth*0.45, display.contentHeight*0.4
    ans1:scale(0.8,0.8)
	sceneGroup:insert(ans1)
	local ans2 = display.newImage("image/bon/2.벚꽃.png")
	ans2.x, ans2.y = display.contentWidth*0.45, display.contentHeight*0.55
    ans2:scale(0.8,0.8)
	sceneGroup:insert(ans2)
	local ans3 = display.newImage("image/bon/3.목화.png")
	ans3.x, ans3.y = display.contentWidth*0.45, display.contentHeight*0.7
    ans3:scale(0.8,0.8)
	sceneGroup:insert(ans3)
    local ans4 = display.newImage("image/bon/4.진달래.png")
	ans4.x, ans4.y = display.contentWidth*0.45, display.contentHeight*0.85
    ans4:scale(0.8,0.8)
	sceneGroup:insert(ans4)

    local function quiz3Tap(event)
        print("퀴즈2탭")
    local options={
                    effect ="fade",
                    time=400
                    }
    composer.gotoScene("bon",options)
end
    ans1:addEventListener("tap",quiz3Tap)
    ans2:addEventListener("tap",quiz3Tap)
    ans3:addEventListener("tap",quiz3Tap)
	ans4:addEventListener("tap",quiz3Tap)
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
