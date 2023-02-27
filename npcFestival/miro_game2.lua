-----------------------------------------------------------------------------------------
--
-- miro_game2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

  -- 배경 gameBG
  local gameBG = display.newImageRect("image/미니게임배경.jpg", 1920, 1080)
  gameBG.x, gameBG.y = display.contentWidth/2, display.contentHeight/2


	local miro = display.newImage("image/miro_game/final_miro.png",display.contentWidth,display.contentHeight)
 	miro.x, miro.y = display.contentWidth*0.5, display.contentHeight*0.5

  -----------------------------------------------------------------------------------------

  --상하좌우 이동
	local arrow = {}

	arrow[1] = display.newImage("image/arrow_left.png", 70, 100)
	arrow[1].x, arrow[1].y = display.contentWidth*0.87, display.contentHeight*0.8
  arrow[1]:scale(0.5,0.5)
	arrow[1].name = "left"

	arrow[2] = display.newImage("image/arrow_right.png", 70, 100)
	arrow[2].x, arrow[2].y = arrow[1].x + 240, display.contentHeight*0.8
  arrow[2]:scale(0.5,0.5)
	arrow[2].name = "right"

	arrow[3]= display.newImage("image/arrow_up.png",70,100)--위쪽 이동
	arrow[3].x, arrow[3].y= 1790, 730
  arrow[3]:scale(0.5,0.5)
	arrow[3].name="up"


	arrow[4]= display.newImage("image/arrow_down.png",70,100)--아래쪽 이동
	arrow[4].x,arrow[4].y= 1790, 1000
  arrow[4]:scale(0.5,0.5)
	arrow[4].name="down"


	arrow[5] = "right" --방향정보

	local imgSheet = graphics.newImageSheet( "image/player/캐릭터프레임.png", 
    { width = 3200/8, height = 400, numFrames = 8 })
   local sequencesData = {
    { name = "down",   frames = {1,2 }, time = 500 },
    { name = "left",     frames = { 3,4}, time = 500 },
    { name = "right",    frames = { 5,6 }, time = 500 },
    { name = "up",    frames = { 7,8 }, time = 500 }
}


   local cat = display.newSprite(imgSheet, sequencesData)
   cat:scale(0.5,0.5)
   cat.x,cat.y=display.contentWidth*0.73, display.contentHeight*0.23

   function arrowTab( event )
      x = cat.x
      y = cat.y
      
         if (event.target.name == arrow[1].name ) then
               
               cat:setSequence("left")
               cat:play()
                transition.to(cat, {time=100, x=(x-50)})
            elseif (event.target.name == arrow[2].name) then 
                 cat:setSequence("right")
               cat:play()
                 transition.to(cat,{time=100, x=(x + 50)})
             elseif(event.target.name ==arrow[3].name) then
                cat:setSequence("up")
               cat:play()
                transition.to(cat, {time=100, y=(y-50)})
               else 
                  cat:setSequence("down")
               cat:play()
                transition.to(cat, {time=100, y=(y+50)})
             end
         
            end
   
   for i = 1,4  do
      arrow[i]:addEventListener("tap", arrowTab)
      arrow[i].x = arrow[i].x - 70
      arrow[i].y = arrow[i].y - 100
   end

  ---------------------------------------------------------------------------------------------------
	-- sceneGroup 묶기
	---------------------------------------------------------------------------------------------------
	sceneGroup:insert(gameBG)
	sceneGroup:insert(miro)
  sceneGroup:insert(cat)
  for i = 1,4  do
    sceneGroup:insert(arrow[i])
  end
   
  --  -----타이머 코드
  --  local time = display.newText(0, display.contentWidth*0.1, display.contentHeight*0.15)
 	-- time.size = 100

 	-- time:setFillColor(0)
 	-- time.alpha = 0.5


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