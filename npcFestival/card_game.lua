-----------------------------------------------------------------------------------------
--
-- card_game.lua
--
-----------------------------------------------------------------------------------------
math.randomseed(os.time())

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	-----------------------------------------------------------------------------------------
	-- 게임 시작 기능 -----------------------------------------------------------------------
	-----------------------------------------------------------------------------------------

	-- 배경 cardBG
	local cardBG = display.newImageRect("image/미니게임배경.jpg", 1920, 1080)
 	cardBG.x, cardBG.y = display.contentWidth/2, display.contentHeight/2

	-- 카드 게임 설명 cardex
	local cardex = display.newImageRect("image/음식카드설명서.png", 1920, 1080)
	cardex.x, cardex.y = display.contentWidth/2, display.contentHeight/2
	cardex:scale(0.5,1)

	-- (skip button) skipBu 
	local skipBu = display.newImageRect("image/skipbutton.png", 1920, 1080)
	skipBu.x, skipBu.y = display.contentWidth*0.68, display.contentHeight*0.92
	skipBu:scale(0.04,0.05)
	

	-- arr에 1~8까지 2번씩 랜덤하게 넣어라
	local tbl = {1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8}
	local function shuffle(tbl)
		for i = #tbl, 2, -1 do
			local j = math.random(i)
			tbl[i], tbl[j] = tbl[j], tbl[i]
		end
		return tbl
	end
	local arr = shuffle(tbl)
	


	-- 뒤집힌 카드 cardBGroup 
	local cardBGroup = display.newGroup(); 
	local cardBack = {}
	for i = 1,4 do
		cardBack[i] = {}
		for j = 1,4 do
			cardBack[i][j] = display.newImage(cardBGroup, "image/뒤집힌카드.png")
			cardBack[i][j].index = arr[4*(i-1)+j]
			cardBack[i][j].x, cardBack[i][j].y = display.contentWidth*0.13*i + 340, display.contentHeight*(0.15+(j-1)*0.23)
			cardBack[i][j]:scale(0.75,0.6)
			cardBack[i][j].alpha = 0
		end
	end


	-- 오픈된 카드 cardOGroup
	local cardOGroup = display.newGroup()
	local cardOpen = {}

	for i = 1,4 do
		cardOpen[i] = {}
		for j = 1,4 do
			cardOpen[i][j] = display.newImage(cardOGroup, "image/card ("..arr[4*(i-1)+j]..").png")
			cardOpen[i][j].index = arr[4*(i-1)+j]
			cardOpen[i][j].x, cardOpen[i][j].y = display.contentWidth*0.13*i + 340, display.contentHeight*(0.15+(j-1)*0.23)
			cardOpen[i][j]:scale(0.75,0.6)
			cardOpen[i][j].alpha = 0
		end
	end
  

	-- 타이머	
	local time_bar = display.newImage("image/time 바.png", 1920, 1080)
	time_bar.x, time_bar.y = display.contentWidth*0.89, display.contentHeight*0.15
	time_bar:scale(1.8,2)
	time_bar.alpha = 0

	local time = display.newText(10, display.contentWidth*0.91, display.contentHeight*0.15)
	time.size = 80
	time:setFillColor(0)
	time.alpha = 0

	local score
	local function counter(event)
		time.text = time.text - 1
		if (time.text == '30') then
			time:setFillColor(1,0,0) -- 빨강
		end

		if( time.text == '-1') then
			composer.gotoScene( "F_ending" )
			time.alpha = 0 
			--composer.gotoScene( "F_ending" )
		end

		-- if time.text > 30 then
		-- 	score = 'A+'
		-- elseif (time.text <= 30 and time.text > 0) then
		-- 	score = 'B'
		-- else 
		-- 	score = 'F'
		-- end

	end

	-- local function counter( event )
	-- 	time.text = time.text - 1
 
	-- 	if( time.text == '30' ) then
	-- 		time:setFillColor(1, 0, 0)
	-- 	end
 
	-- 	if( time.text == '-1') then
	-- 		time.alpha = 0
 
	-- 		if( score.text ~= '성공!' ) then
	-- 			score.text = '실패!'
				
	-- 			for i = 1, 5 do
	-- 				if (carrot[i]) then
	-- 					carrot[i]:removeEventListener("touch", dragCarrot)
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- end
 

	-- 게임화면으로 넘어가기 tapskip
	local function tapskip(event)
		cardex.alpha = 0
		skipBu.alpha = 0
		time_bar.alpha = 1
		time.alpha = 1
		local timeAttack = timer.performWithDelay(1000, counter, 11) -- 0 또는 -1 은 무한 반복	 

		timer.performWithDelay(500, function() cardBGroup:toFront() end) -- 전체적으로 보이는 시간
		for i = 1,4 do
			for j = 1,4 do
				cardBack[i][j].alpha = 1
				cardOpen[i][j].alpha = 1
			end
		end 
	end
	skipBu:addEventListener("tap", tapskip)


	-----------------------------------------------------------------------------------------
	-- 카드 flip 기능 -----------------------------------------------------------------------
	-----------------------------------------------------------------------------------------

	-- Back 카드를 뒤집으면서(rotation) 사라지게 하는 기능
	-- flip
	local function flip(event)
		local onComplete1

		onComplete1 = function(self)
				--self.isVisible = not event.target.isVisible
			self.alpha = 0 
		end

		transition.to(event.target, {xScale = 0.05, time = 150, onComplete = onComplete1, transition = easing.outCirc})
	end

	-- Open 카드도 같이 rotation
	local function rotation(event)
	 	transition.to(event.target, {xScale = 0.75, time = 300, transition = easing.inCirc})
	end

	local function removeORgoback(idx1, idx2)
		if idx1 == idx2 then
			for i =1, 4 do
				for j = 1,4 do
					if cardOpen[i][j].index == idx1 then
						timer.performWithDelay(300, 
						function() 
							display.remove(cardOpen[i][j]) 
							display.remove(cardBack[i][j])
						end)
					end
				end
			end
		elseif idx1 ~= -1 and idx2 ~= -1 and idx1 ~= idx2 then
			for i =1, 4 do
				for j = 1,4 do
						local onComplete1

						onComplete1 = function(self)
						self.alpha = 1 end
						transition.to(cardBack[i][j], {xScale = 0.75, time = 300, onComplete = onComplete1, transition = easing.outCirc})
				end
			end
		end
	end

	local idx1 = -1
	local idx2 = -1
	local function getIndex(event)
		if idx1 == -1 and idx2 == -1 then
			idx1 = event.target.index
		elseif idx1 ~= -1 and idx2 == -1 then 
			idx2 = event.target.index
		elseif idx1 ~= -1 and idx2 ~= -1 then
			idx2 = -1
			idx1 = event.target.index
		end
		print(idx1, idx2)
		removeORgoback(idx1, idx2)
	end


	for i = 1,4 do
		for j = 1,4 do
			cardBack[i][j]:addEventListener("tap", flip)
			cardOpen[i][j]:addEventListener("tap", getIndex)
			cardOpen[i][j]:addEventListener("tap", rotation)
		end
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
		-- 추가 (다시하기 만들때) composer.removeScene('card_game') 
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
