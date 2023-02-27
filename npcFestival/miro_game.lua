-----------------------------------------------------------------------------------------
--
-- miro_game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

  -- 배경 gameBG
  local gameBG = display.newImageRect("image/미니게임배경.jpg", 1920, 1080)
  gameBG.x, gameBG.y = display.contentWidth/2, display.contentHeight/2

  -- 게임 설명 ab_miro 
	local ab_miro = display.newImage("image/miro_game/about_miro.png", 1920, 1080)
 	ab_miro.x, ab_miro.y = display.contentWidth*0.5, display.contentHeight*0.5


  -- (skip button) skipBu 
	local skipBu = display.newImageRect("image/skipbutton.png", 1920, 1080)
	skipBu.x, skipBu.y = display.contentWidth*0.68, display.contentHeight*0.92
	skipBu:scale(0.04,0.05)

  -----------------------------------------------------------------------------------------


	
	-- 씬이동 
	local function catch(event)
		
    composer.setVariable("complete", true)
  local options={
        effect ="fade",
        
      }
  composer.gotoScene("miro_game2",options)

  end

  skipBu:addEventListener("tap",catch)

	---------------------------------------------------------------------------------------------------
	-- sceneGroup 묶기
	---------------------------------------------------------------------------------------------------
	sceneGroup:insert(gameBG)
	sceneGroup:insert(ab_miro)
	sceneGroup:insert(skipBu)

end -- end scene:create 

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