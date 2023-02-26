
  -- 배경 cardBG
	local cardBG = display.newImageRect("image/미니게임배경.jpg", 1920, 1080)
  cardBG.x, cardBG.y = display.contentWidth/2, display.contentHeight/2

-----------------------------------------------------------------------------------------
--
-- ending.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view
	
  local cardBG = display.newImageRect("image/미니게임배경.jpg", 1920, 1080)
  cardBG.x, cardBG.y = display.contentWidth/2, display.contentHeight/2
	
	local goMap = display.newText("맵으로 이동", display.contentWidth*0.3, display.contentHeight*0.8)
  goMap.size = 50
	goMap:setFillColor(0)

  local replayBu = display.newImageRect("image/다시하기버튼.png", 1920, 1080)
  replayBu.x, replayBu.y = display.contentWidth*0.7, display.contentHeight*0.8
  replayBu:scale(0.15,0.10)

  local F = display.newImageRect("image/F.png", 1920, 1080)
 	F.x, F.y = display.contentWidth/2 + 50, display.contentHeight*0.35
  F:scale(0.3,0.30)


	local function replay( event )
		composer.gotoScene("card_game")
	end

	replayBu:addEventListener("tap", replay)



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
		composer.removeScene('F_ending')
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
