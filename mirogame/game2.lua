-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImageRect("image/minigame_background.jpg",display.contentWidth,display.contentHeight)
 	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local miro = display.newImage("image/miro.png",display.contentWidth,display.contentHeight)
 	miro.x, miro.y = display.contentWidth*0.5, display.contentHeight*0.5

	--상하좌우 이동
	local arrow ={}
	arrow[1] = display.newImage("image/arrow_left.jpg",display.contentWidth,display.contentHeight)
	arrow[1].width = 120
	arrow[1].height = 120
 	arrow[1].x, arrow[1].y = display.contentWidth*0.83, display.contentHeight*0.7
	arrow[2] = display.newImage("image/arrow_right.jpg",display.contentWidth,display.contentHeight)
	arrow[2].width = 120
	arrow[2].height = 120
 	arrow[2].x, arrow[2].y = display.contentWidth*0.95, display.contentHeight*0.7
	arrow[3] = display.newImage("image/arrow_up.jpg",display.contentWidth,display.contentHeight)
	arrow[3].width = 120
	arrow[3].height = 120
 	arrow[3].x, arrow[3].y = display.contentWidth*0.89, display.contentHeight*0.6
	arrow[4] = display.newImage("image/arrow_down.jpg",display.contentWidth,display.contentHeight)
	arrow[4].width = 120
	arrow[4].height = 120
 	arrow[4].x, arrow[4].y = display.contentWidth*0.89, display.contentHeight*0.8

	arrow[5] ="right" --방향정보
	local cat_left = display.newImageRect("image/cat_left.png",display.contentWidth,display.contentHeight)
	cat_left.width = 170
	cat_left.height = 170
 	cat_left.x, cat_left.y = display.contentWidth*0.715, display.contentHeight*0.79


	----

	
	player.x, player.y = background.x, background.y+200
	player.name = "player"
	
	sceneGroup:insert(player)

	function arrowTab( event )
		x = player.x
		y = player.y
		
			if (event.target.name == arrow[5]) then
			    if (event.target.name == "left") then
			       transition.to(player, {time=100, x=(x-50)})
			     elseif (event.target.name == "up") then 
			     	transition.to(player,{time=100, y=(y-50)})
			    else
			       transition.to(player, {time=100, x=(x+50)})
			    end
			 else
			    arrow[5] = event.target.name
			    player:scale(-1, 1)
			   

			    if (event.target.name == "left") then
			       
			       transition.to(player, {time=100, x=(x-50)})
			    elseif(event.target.name =="up") then 
			    	transition.to(player,{time=100,y=(y+50)})
			    else
			     
			       transition.to(player, {time=100, x=(x+50)})
			    end
			    
				end
		end
	

	for i = 1, 2 do
		arrow[i]:addEventListener("tap", arrowTab)
		sceneGroup:insert(arrow[i])
	end
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
