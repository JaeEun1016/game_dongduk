-----------------------------------------------------------------------------------------
--
-- bon.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	--배경--
	local bon = display.newImage("image/건물내부_화살표x.jpg",1920,1080)
	bon:scale(0.24,0.24)
	bon.x, bon.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bon)


	--상하좌우 이동
	local arrow ={}
	arrow[1] =display.newImageRect("image/arrow_left.png",100,100) --왼쪽
	arrow[1].x, arrow[1].y = 1650, 920
	arrow[1].name="leftkey"
	arrow[2] = display.newImageRect("image/arrow_right.png",100,100) --오른쪽
	arrow[2].x,arrow[2].y=arrow[1].x+200,arrow[1].y
	arrow[2].name="rightkey"
	arrow[3]= display.newImageRect("image/arrow_up.png",100,100)--위쪽 이동
	arrow[3].x,arrow[3].y=1750,830
	arrow[3].name="upkey"
	arrow[4]= display.newImageRect("image/arrow_down.png",100,100)--아래쪽 이동
	arrow[4].x,arrow[4].y=1750,arrow[3].y+180

	arrow[5] ="right" --방향정보?
	
	local imgSheet = graphics.newImageSheet( "image/player/캐릭터프레임.png", 
    { width = 3200/8, height = 400, numFrames = 8 })
	local sequencesData = {
    { name = "down",	frames = {1,2 }, time = 500 },
    { name = "left",  	frames = { 3,4}, time = 500 },
    { name = "right", 	frames = { 5,6 }, time = 500 },
    { name = "up", 	frames = { 7,8 }, time = 500 }
	}

	
	
	local player = display.newSprite(imgSheet, sequencesData)
	player:scale(0.7,0.7)
	player.x,player.y=display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(player)
	function arrowTab( event )
		x = player.x
		y = player.y
		
			if (event.target.name == arrow[1].name ) then
					
					player:setSequence("left")
					player:play()
			       transition.to(player, {time=100, x=(x-50)})
			   elseif (event.target.name == arrow[2].name) then 
			     	player:setSequence("right")
					player:play()
			     	transition.to(player,{time=100, x=(x + 50)})
			    elseif(event.target.name ==arrow[3].name) then
			    	player:setSequence("up")
					player:play()
			       transition.to(player, {time=100, y=(y-50)})
			   	else 
			   		player:setSequence("down")
					player:play()
			   	 transition.to(player, {time=100, y=(y+50)})
			    end
			
				end
	
	for i = 1,4  do
		arrow[i]:addEventListener("tap", arrowTab)
		sceneGroup:insert(arrow[i])
	end

	--씬이동 
	local function catch(event)

        	composer.setVariable("complete", true)
        local options={
							effect ="fade",

						}
        composer.gotoScene("bon_project",options)

    	end

	  bon:addEventListener("tap",catch)

	
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
