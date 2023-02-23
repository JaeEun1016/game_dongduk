-----------------------------------------------------------------------------------------
--
-- intro.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	--배경
	local openingbg = display.newImage("image/오프닝배경.png",1920,1080)
	openingbg.x, openingbg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(openingbg)

	--다이얼로그 
	local dialog = display.newGroup()

	local image = display.newRect(dialog, display.contentWidth*0.5, display.contentHeight*0.75, 1000, 200)
	

	local content = display.newText(dialog, "솰라솰라 불라불라", display.contentWidth*0.6, display.contentHeight*0.85, display.contentWidth*0.7, display.contentHeight*0.2)
	content:setFillColor(0)
	content.size = 30
	
	--json 정보 읽기 
	local Data = jsonParse( "json/intro.json" )
	if Data then
		
		print(Data[1].content)
		print(Data[1].image)
	end

	--json에서 읽은 정보 적용하기 
	local index = 0

	local function nextScript( event )
		index = index + 1
		if(index > #Data) then 
			composer.gotoScene("map") 
			return
		end

		content.text = Data[index].content
		image.fill = {
			type = "image",
			filename = Data[index].image
		}
	end
	openingbg:addEventListener("tap", nextScript)

	nextScript()

	
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