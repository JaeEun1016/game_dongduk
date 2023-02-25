-----------------------------------------------------------------------------------------
--
-- soongin game.lua
--인문관 미니게임 씬
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	-----------배경------------
	local inmoonGm = display.newImage("image/미니게임배경2.jpg",1920,1080)
	inmoonGm.x, inmoonGm.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(inmoonGm)


	-----------타이머--------------
	local time = display.newText(15, display.contentWidth*0.9, display.contentHeight*0.15)
	time.size = 100
	time:setFillColor(0)
	time.alpha = 0.5

	sceneGroup:insert(time)

	local function counter(event )
		time.text = time.text - 1

		if(time.text == -1) then
			time.alpha = 0
			composer.gotoScene("inmoon_ending")
		end

	end


	-----------설명서---------------
	local message = display.newImage("image/피하기설명서.png")
	message.x, message.y = display.contentWidth*0.5, display.contentHeight*0.5

	local function tapEventListener(evnet)
		message:removeSelf()
		local timeAttack = timer.performWithDelay(1000, counter, 16) --설명서 누르면 시간 시작
	end

	message:addEventListener("tap", tapEventListener) -- 설명서 누르면 사라짐

	local professor = display.newImage("image/교수캐릭터_화난모습.png")
	professor.x, professor.y = display.contentWidth*0.5, display.contentHeight*0.12
	professor:scale(0.5, 0.5)

	local cat = display.newImage("image/고양이뒷모습.png")
	cat.x, cat.y = display.contentWidth*0.5, display.contentHeight*0.88
	cat:scale(0.5, 0.5)

	message:toFront() -- 설명서를 제일 앞으로 



	----------- 움직이는 모션 -----------
	physics.start()
	physics.setDrawMode("hybrid")

	local arrow = {}

	arrow[1] = display.newImageRect("image/left.png", 38, 64)
	arrow[1].x, arrow[1].y = display.contentWidth*0.9, display.contentHeight*0.8
	arrow[1].name = "left"

	arrow[2] = display.newImageRect("image/right.png", 38, 64)
	arrow[2].x, arrow[2].y = arrow[1].x + 86,display.contentHeight*0.8
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

	--------F가 고양이에게 닿으면---------


	--------게임 종료 후------------
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