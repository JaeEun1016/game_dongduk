-----------------------------------------------------------------------------------------
--
-- won_game.lua
-- 대학원 미니게임 씬
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	-----------배경------------
	local inmoonGm = display.newImage("image/미니게임배경2.jpg",1920,1080)
	inmoonGm.x, inmoonGm.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(inmoonGm)

	-----------캐릭터 이미지-----------
	local professor = display.newImage("image/교수캐릭터_화난모습.png")
	professor.x, professor.y = display.contentWidth*0.5, display.contentHeight*0.12
	professor:scale(0.5, 0.5)
	sceneGroup:insert(professor)

	local cat = display.newImage("image/고양이뒷모습.png")
	cat.x, cat.y = display.contentWidth*0.5, display.contentHeight*0.8
	cat:scale(0.5, 0.5)
	sceneGroup:insert(cat)

	---------------------------
	local t = display.newImage("image/time 바.png")
	t.x, t.y = display.contentWidth*0.1, display.contentHeight*0.15
	sceneGroup:insert(t)

	local s = display.newImage("image/score 바.png")
	s.x, s.y = display.contentWidth*0.1, display.contentHeight*0.25
	sceneGroup:insert(s)

	local result = display.newText("결과 보기", display.contentWidth*0.88, display.contentHeight*0.6)
	result:setFillColor(0)
	result.size = 80
	sceneGroup:insert(result)

	function result: tap(event)
		composer.gotoScene("won_ending")
	end

	result:addEventListener("tap", result)
	

	---------점수-------------
	local score = display.newText(5, display.contentWidth*0.12, display.contentHeight*0.25)
	score.size = 40
	score:setFillColor(0)

	sceneGroup:insert(score)

	-----------타이머--------------
	local time = display.newText(15, display.contentWidth*0.12, display.contentHeight*0.15)
	time.size = 40
	time:setFillColor(0)

	sceneGroup:insert(time)

	---------------F----------
	local F = {}

	for i=1, 5 do
		F[i] = display.newImage("image/F.png")
		F[i].x, F[i].y = display.contentWidth*0.5, display.contentHeight*0.12
		F[i]:scale(0.5, 0.5)
		sceneGroup:insert(F[i])
	end
	-----------------------------------------------
	local function counter(event)
		time.text = time.text - 1

		for i=1, 5 do
			local num = math.random(10)
   			local w,h = display.contentWidth*num*0.1, display.contentHeight
   			transition.moveTo( F[i], { x=w, y=display.contentHeight*0.8, time=2000*i})

   			if(F[i].x > cat.x - 100 and F[i].x < cat.x + 100 and F[i].y > cat.y - 100 and F[i].y < cat.y + 100 ) then
   				score.text = score.text - 1
   			end

		composer.setVariable("score", score.text)

		if(time.text == '0') then
				composer.gotoScene("won_ending")
		end
	end

	end

	-----------설명서---------------
	local message = display.newImage("image/피하기설명서.png")
	message.x, message.y = display.contentWidth*0.5, display.contentHeight*0.5

	local function tapEventListener(event)
		message:removeSelf()
		local timeAttack = timer.performWithDelay(1000, counter, 15) --설명서 누르면 시간 시작
	end

	message:addEventListener("tap", tapEventListener) -- 설명서 누르면 사라짐

	message:toFront() -- 설명서를 제일 앞으로 

	----------- 움직이는 모션 -----------
	physics.start()
	physics.setDrawMode("hybrid")

	local arrow = {}

	arrow[1] = display.newImageRect("image/arrow_left.png", 70, 100)
	arrow[1].x, arrow[1].y = display.contentWidth*0.87, display.contentHeight*0.8
	arrow[1].name = "left"

	arrow[2] = display.newImageRect("image/arrow_right.png", 70, 100)
	arrow[2].x, arrow[2].y = arrow[1].x + 90,display.contentHeight*0.8
	arrow[2].name = "right"

	arrow[3] = "right"


	function arrowTab(event)
		x = cat.x
		y = cat.y

		if(event.target.name == arrow[3]) then
			if(event.target.name == "left") then
				transition.to(cat,{time=100, x=(x-50)})
			else
				transition.to(cat,{time=100, x=(x+50)})
			end
		else
			arrow[3] = event.target.newImage

			if(event.target.name == "left") then
				transition.to(cat,{time=100, x=(x-50)})
			else
				transition.to(cat,{time=100, x=(x+50)})
			end
		end
	end

	for i = 1, 2 do --tap하면 움직임
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
	physics.start()
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
		 composer.removeScene("won_game")
	end
	physics.pause()
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	 physics.stop()
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene