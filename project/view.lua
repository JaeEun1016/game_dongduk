-----------------------------------------------------------------------------------------
--
-- view.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	-- background:setFillColor(1,1,0)
	-- background.alpha = 0.5

	-- background.x = background.x + 100
	-- --background.x+=100 루아는 오류남!풀어서 써야함
	-- background.y = background.y - 100

	-- background:scale(0.5, 0.5) 긁은다음에 ctrl+/ 주석처리됨

	-- local background = display.newRect(display.contentCenterX, display.contentCenterY, 500, 500)
	-- background:setFillColor(1,0,0)
	-- local background2 = display.newRect(display.contentCenterX, display.contentCenterY, 300, 300)
	-- background2:setFillColor(1,0.5,0)
	-- local background3 = display.newRect(display.contentCenterX, display.contentCenterY, 100, 100)
	-- background3:setFillColor(1,1,0)

	--배열사용하는 방법
	local object = {}
	object[1] = display.newRect(display.contentCenterX, display.contentCenterY, 500, 500)
	object[1]:setFillColor(1,0,0)

	object[2] = display.newRect(display.contentCenterX, display.contentCenterY, 300, 300)
	object[2]:setFillColor(1,0.5,0)

	object[3] = display.newRect(display.contentCenterX, display.contentCenterY, 100, 100)
	object[3]:setFillColor(1,1,0)

	local objectGroup = display.newGroup()
	objectGroup:insert(object[1])
	objectGroup:insert(object[3])
	objectGroup:insert(object[2])
	object[3]:toFront()

	sceneGroup:insert(background)
	sceneGroup:insert(objectGroup)

	-- local function tapEventListener( event )
	-- 	print("클릭!!")
	-- end
	-- object[3]:addEventListener("tap", tapEventListener)

	--object[3].alpha = 0 투명도가 0일때는 클릭!! 표시 안됨.
	--object[2]:toFront() 다른 오브젝트 뒤에 존재할 때 표시 됨

	-- local function touchEventListener( event )
	-- 	if( event.phase == "began" ) then
	-- 		print("터치를 시작함")
	-- 	elseif( event.phase == "moved" ) then
	-- 		print("객체를 누르고 있는 상태로 움직임(드래그)")
	-- 	elseif ( event.phase == "ended" or event.phase == "cancelled") then
	-- 		print("터치가 끝남")
	-- 	end
	-- end

	-- object[3]:addEventListener("touch", touchEventListener)

	local function drag( event )
		if( event.phase == "began" ) then
			display.getCurrentStage():setFocus( event.target )
			event.target.isFocus = true
			-- 드래그 시작할 때

		elseif( event.phase == "moved" ) then

			if ( event.target.isFocus ) then
				-- 드래그 중일 때
				event.target.x = event.xStart + event.xDelta
				event.target.y = event.yStart + event.yDelta
			end

		elseif ( event.phase == "ended" or event.phase == "cancelled") then
			if ( event.target.isFocus ) then
				display.getCurrentStage():setFocus( nil )
				event.target.isFocus = false
				-- 드래그 끝났을 때
			else
				display.getCurrentStage():setFocus( nil )
				event.target.isFocus = false
			end
		end
	end
	object[3]:addEventListener("touch", drag)

	--local function alarm( event )
	--	print("1초 뒤입니다.")
	--end

	--local timeAttack = timer.performWithDelay(1000, alarm)
	
	--반복하는 타이머--------
	local count = 1
	local function counter( event )
		print(count.."초가 지났습니다.")
		count = count + 1
	end

	local timeAttack = timer.performWithDelay(1000, counter, 10)--0또는 -1은 무한반복
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