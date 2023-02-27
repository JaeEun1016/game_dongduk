-----------------------------------------------------------------------------------------
--
-- won_ending.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view
	
	-----------배경------------
	local inmoonGm = display.newImage("image/미니게임배경2.jpg",1920,1080)
	inmoonGm.x, inmoonGm.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(inmoonGm)


 	local goMap = display.newText("맵으로 이동", display.contentWidth*0.4, display.contentHeight*0.7)
 	goMap:setFillColor(0)
 	goMap.size = 50

 	local replay = display.newImage("image/다시하기버튼.png", display.contentWidth*0.6, display.contentHeight*0.7)
	replay.size = 100

	function goMap: tap( event )
		composer.gotoScene('map')
	end

 	function replay: tap( event )
 		composer.gotoScene('won_game')
 	end

 	goMap:addEventListener("tap", goMap)
 	replay:addEventListener("tap", replay)

	sceneGroup:insert(goMap)
	sceneGroup:insert(replay)
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