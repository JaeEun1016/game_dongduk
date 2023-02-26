-----------------------------------------------------------------------------------------
--
-- inmoon.lua
--인문관 내부 맵
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
	
function scene:create( event )
	local sceneGroup = self.view
	--배경
	local inmoonBg = display.newImage("image/건물내부-01.png",1920,1080)
	inmoonBg.x, inmoonBg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(inmoonBg)

	local door = display.newRect(display.contentCenterX, display.contentCenterY, 150, 220)
		door.x, door.y = display.contentWidth*0.5, display.contentHeight*0.14
	sceneGroup:insert(door)
	--임시 텍스트 
	local showText = display.newText("인문관내부",display.contentWidth*0.5,display.contentHeight*0.8)
	showText:setFillColor(1)
	showText.size=200
	sceneGroup:insert(showText)

	--상하좌우 이동
	local arrow ={}
	arrow[1] =display.newImageRect("image/arrow_left.jpg",100,100) --왼쪽
	arrow[1].x, arrow[1].y = 1700, 900
	arrow[1].name="left"
	arrow[2] = display.newImageRect("image/arrow_right.jpg",100,100) --오른쪽
	arrow[2].x,arrow[2].y=arrow[1].x+150,arrow[1].y
	arrow[2].name="right"
	arrow[3]= display.newImageRect("image/arrow_up.jpg",100,100)--위쪽 이동
	arrow[3].x,arrow[3].y=1770,800
	arrow[3].name="up"
	arrow[4]= display.newImageRect("image/arrow_down.jpg",100,100)--아래쪽 이동
	arrow[4].x,arrow[4].y=1770,1000
	arrow[4].name="down"

	arrow[5] ="right" --방향정보
	local player = display.newImageRect("image/오른쪽모습.png",250,250)

	
	

	player.x, player.y = inmoonBg.x, inmoonBg.y+200
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
	
	--씬이동 
	local function catch(event)
		
        	composer.setVariable("complete", true)
        local options={
							effect ="fade",
							
						}
        composer.gotoScene("inmoon_game",options)
    
    	end

	  door:addEventListener("tap",catch)

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