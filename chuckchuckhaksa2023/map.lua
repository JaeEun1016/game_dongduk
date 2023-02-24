-----------------------------------------------------------------------------------------
--
-- map.lua
--맵(건물 선택 기능, )
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	--배경
	local mapBG = display.newImage("image/맵_건물이름표.png",1920,1080)
	mapBG.x, mapBG.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(mapBG)
	--인문관
	local inmoon = display.newImage("image/인문관.png",1920,1080)
	inmoon.x, inmoon.y = display.contentWidth*0.23, display.contentHeight*0.21
	inmoon:scale(1.3,1.3)
	sceneGroup:insert(inmoon)
	--숭인관
	local soongin = display.newImage("image/숭인관.png",1920,1080)
	soongin.x, soongin.y = display.contentWidth*0.75, display.contentHeight*0.21
	soongin:scale(1.3,1.3)
	sceneGroup:insert(soongin)
	--본관
	local bon = display.newImage("image/본관.png",1920,1080)
	bon.x, bon.y = display.contentWidth*0.25, display.contentHeight*0.68
	bon:scale(1.3,1.3)
	sceneGroup:insert(bon)
	--대학원
	local won = display.newImage("image/대학원.png",1920,1080)
	won.x, won.y = display.contentWidth*0.74, display.contentHeight*0.75
	won:scale(1.2,1.2)
	sceneGroup:insert(won)

	--탭기능 

	--인문
	 local function inmoonTap(event)
			print("인문관탭")
        local options={
							effect ="fade",
							time=400
						}
        composer.gotoScene("inmoon",options)
    end
	 inmoon:addEventListener("tap",inmoonTap)

	--숭인
	 local function SoonginTap(event)
			print("숭인관탭")
        local options={
							effect ="fade",
							time=400
						}
        composer.gotoScene("soongin",options)
    end
	 soongin:addEventListener("tap",SoonginTap)

	--본관
	 local function bonTap(event)
			print("본관탭")
        local options={
							effect ="fade",
							time=400
						}
        composer.gotoScene("bon",options)
    end
	 bon:addEventListener("tap",bonTap)

	--대학원
	 local function wonTap(event)
			print("대학원탭")
        local options={
							effect ="fade",
							time=400
						}
        composer.gotoScene("won",options)
    end
	 won:addEventListener("tap",wonTap)

	
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