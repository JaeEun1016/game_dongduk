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
	
	-- 오픈된 카드 cardOGroup
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
	
	local cardOGroup = display.newGroup()
	local cardOpen = {}

	for i = 1,4 do
		cardOpen[i] = {}
		for j = 1,4 do
			--local num = arr[i][j]
			cardOpen[i][j] = display.newImage(cardOGroup, "image/card ("..arr[4*(i-1)+j]..").png")
			cardOpen[i][j].index = arr[4*(i-1)+j]
			cardOpen[i][j].x, cardOpen[i][j].y = display.contentWidth*0.13*i + 340, display.contentHeight*(0.15+(j-1)*0.23)
			cardOpen[i][j]:scale(0.70,0.6)
			cardOpen[i][j].alpha = 0
			--cardOpen[i][j].isVisible = true
		end
	end

	-- 뒤집힌 카드 cardBGroup 
	local cardBGroup = display.newGroup(); 
	local cardBack = {}
	for i = 1,4 do
		cardBack[i] = {}
		for j = 1,4 do
			cardBack[i][j] = display.newImage(cardBGroup, "image/뒤집힌카드.png")
			cardBack[i][j].x, cardBack[i][j].y = display.contentWidth*0.13*i + 340, display.contentHeight*(0.15+(j-1)*0.23)
			cardBack[i][j]:scale(0.75,0.6)
			cardBack[i][j].alpha = 0
		end
	end

	-- 게임화면으로 넘어가기 tapskip
	local function tapskip(event)
		cardex.alpha = 0
		skipBu.alpha = 0
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
				self.isVisible = not event.target.isVisible
		end

		transition.to(event.target, {xScale = 0.05, time = 150, onComplete = onComplete1, transition = easing.outCirc})
	end

	-- Open 카드도 같이 rotation
	local function rotation(event)
	 	transition.to(event.target, {xScale = 0.75, time = 250, transition = easing.inCirc})
	end

	
	for i = 1,4 do
		for j = 1,4 do
			cardBack[i][j]:addEventListener("tap", flip)
			cardOpen[i][j]:addEventListener("tap", rotation)
		end
	end

	-- match true or not
	local click1 = true
	local function match(event)
		local idx = event.target.index
	end


	-- flip => rotation
	-- local function flip(card, skipCB)
	-- 	local onComplete1
	-- 	local onComplete2

	-- 	onComplete1 = function(self)
	-- 		self.image.isVisible = not card.image.isVisible
	-- 		transition.to(card, {xScale = 1, time = 250, onComplete = onComplete2, transition = easing.outCirc})
	-- 	end

	-- 	onComplete2 = function(self)
	-- 		self.isFlipping = false
	-- 		self.isFaceUp = not self.isFaceUp
	-- 		if (not skipCB) then
	-- 			post("onFlippedCard", {card = self})
	-- 		end
	-- 	end

	-- 	transition.to(card, {xScale = 0.05, time = 250, onComplete = onComplete1, transition = easing.inCirc})
	-- end

-- 	-- createCard
-- 	local function createCard(group, x, y, width, height, num, images ) -- images = folder
-- 		local card = display.newGroup()
-- 		group:insert(card)

-- 		card.x = x
-- 		card.y = y

-- 		local back = display.newImageRect(card, "image/뒤집힌카드.png", width, height)
-- 		-- width, height 대신 cardBack[i][j]:scale(0.75,0.6)
		
-- 		local size = (width>height) and height or width
-- 		local image = display.newImageRect(card, "image/card ("..i..").png", width, height)
-- 		image.isVisible = false

-- 		card.num = num -- number of the cards
-- 		card.isFlipping = false 
-- 		card.isFaceUp = false -- image visible
-- 		card.back = back
-- 		card.image = image

-- 		card.flip = flip -- 1 of 3 flipping function
		
-- 		-- touch handler: return true -> pause / return false -> continue pocessing
-- 		back.touch = function(self, event)
-- 			if (card.isFlipping) then return true end
-- 			if (card.isFaceUp) then return true end

-- 			if (event.phase == "ended" or event.phase == "cancelled") then
-- 				card.isFlipping = true
-- 				card:flip() -- flip3 function 
-- 				-- = card.flip(card)
-- 				post("onSFX", {sfx = "click"}) -- post event (haven't discuss yet)
-- 			end
-- 			return true
-- 		end
-- 		back:addEventListener("touch")

-- 		return card
-- 	end

	
-- -- Variables
-- local layers
-- local cards = {}

-- local duration = 60

-- local rows = 4 
-- local cols = 4 

-- local cardWidth 	= w/cols
-- local cardHeight 	= cardWidth

-- local flipCount = 0
-- local currentCards = {}

-- -- Draw Board
-- --
-- function public.drawBoard()
-- 	-- Calculate the position of the first card (upper-left)
-- 	--

-- 	local startX = centerX - (cols * cardWidth)/2 + cardWidth/2
-- 	local startY = centerY - (rows * cardHeight)/2 + cardHeight/2  + 20

-- 	-- Generate a list of card numbers then 'shuffle' it
-- 	local count = 1
-- 	local cardNumbers = {}	
-- 	for i = 1, (rows * cols)/2 do		
-- 		cardNumbers[#cardNumbers+1] = count
-- 		cardNumbers[#cardNumbers+1] = count
-- 		count = count + 1
-- 	end

-- 	-- Randomize (shuffle) the numbers list
-- 	--
-- 	table.shuffle( cardNumbers, 100 )
	
-- 	-- Create and lay out the cards 
-- 	--
-- 	local count = 1
-- 	for i = 1, cols do
-- 		for j = 1, rows do				
-- 			local card = createCard( layers.content, 
-- 				                       startX + (i-1) * cardWidth, 
-- 						               startY + (j-1) * cardHeight, 
-- 				                       cardWidth - 6, cardHeight - 6, 
-- 				                       cardNumbers[count],
-- 				                       images )
-- 			cards[card] = card	
-- 			count = count+1
-- 		end
-- 	end

-- 	post("onStartTimer", { duration = 60 } )
-- end
-- 	-- Listen For Card Flips - onFlippedCard()
-- 	function public.onFlippedCard(event)	
-- 		flipCount = flipCount + 1
-- 		currentCards[flipCount] = event.card

-- 		if( flipCount > 1 ) then
-- 			-- Same image?
-- 			--
-- 			if( currentCards[1].num == currentCards[2].num ) then
-- 				-- Yes!
-- 				--
-- 				transition.to( currentCards[1], { xScale = 0.05, yScale = 0.05, alpha = 0,
-- 																				time = 250, delay = 500, onComplete = display.remove } )
-- 				transition.to( currentCards[2], { xScale = 0.05, yScale = 0.05, alpha = 0,
-- 																				time = 250, delay = 500, onComplete = display.remove } )

-- 				-- Remove cards from our tracking list
-- 				--
-- 				cards[currentCards[1]] = nil
-- 				cards[currentCards[2]] = nil

-- 				post("onScore")

-- 				if( table.count(cards) == 0 ) then
-- 					post("onGameOver")
-- 				end
-- 				post( "onSFX", { sfx = "match" } )
-- 			else
-- 				-- Nope.
-- 				--
-- 				local card1 = currentCards[1]
-- 				local card2 = currentCards[2]

-- 				timer.performWithDelay( 500, 
-- 					function()
-- 						-- Since we waited, do simple check to be sure
-- 						-- the objects are still valid (not already removed).
-- 						--
-- 						if( not card1 or card1.removeSelf == nil or
-- 								not card2 or card2.removeSelf == nil ) then 
-- 								print("One of the cards was removed before it was time to flip.")
-- 								return
-- 						end

-- 						card1:flip(true)
-- 						card2:flip(true)					
-- 					end )
-- 			end
-- 			currentCards = {}
-- 			flipCount = 0
-- 		end	
-- 	end
-- 	listen( "onFlippedCard", public.onFlippedCard )

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
