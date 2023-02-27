-----------------------------------------------------------------------------------------
--
-- map.lua
--맵(건물 선택 기능, )
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	--SOUND
	


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

	
	--게이지

	--데이터 parsing 
	local GData = jsonParse("json/gauge.json")
	if(GData) then 
		print(GData.gauge_json)
	end

		--json 로드 (전역변수,게이지값) 
	gauge = GData.gauge_json


	--게이지바 
	local gaugeBar
		if (gauge ==0 )then 
			gaugeBar=display.newImage("image/gauge/gauge0.png")
	 		gaugeBar.x, gaugeBar.y = display.contentWidth*0.5 , display.contentHeight*0.5
			sceneGroup:insert(gaugeBar)
		elseif(gauge == 15) then 
			gaugeBar=display.newImage("image/gauge/gauge1.png")
	 		gaugeBar.x, gaugeBar.y = display.contentWidth*0.5 , display.contentHeight*0.5
			sceneGroup:insert(gaugeBar)
		elseif(gauge ==20 )then 
			gaugeBar=display.newImage("image/gauge/gauge2.png")
	 		gaugeBar.x, gaugeBar.y = display.contentWidth*0.5 , display.contentHeight*0.5
			sceneGroup:insert(gaugeBar)
		elseif(gauge == 35 )then 
			gaugeBar=display.newImage("image/gauge/gauge3.png")
	 		gaugeBar.x, gaugeBar.y = display.contentWidth*0.5 , display.contentHeight*0.5
			sceneGroup:insert(gaugeBar)
		elseif(gauge == 40 )then 
			gaugeBar=display.newImage("image/gauge/gauge4.png")
	 		gaugeBar.x, gaugeBar.y = display.contentWidth*0.5 , display.contentHeight*0.5
			sceneGroup:insert(gaugeBar)
		elseif(gauge ==55) then
			gaugeBar=display.newImage("image/gauge/gauge5.png")
	 		gaugeBar.x, gaugeBar.y = display.contentWidth*0.5 , display.contentHeight*0.5
			sceneGroup:insert(gaugeBar)
		elseif(gauge ==60) then
			gaugeBar=display.newImage("image/gauge/gauge6.png")
	 		gaugeBar.x, gaugeBar.y = display.contentWidth*0.5 , display.contentHeight*0.5
			sceneGroup:insert(gaugeBar)

		end 

	--경고문구 
	local contentimg = display.newImage("image/대화창_양갱.png",1300,300)
	contentimg.x, contentimg.y = display.contentWidth*0.5, display.contentHeight*0.8
	contentimg:scale(0.7,0.7)
	contentimg.alpha=0
	sceneGroup:insert(contentimg)

	local warning = display.newText("다른 관을 깨지 않았을 때, 들어갈 수 없습니다.", display.contentWidth*0.5, display.contentHeight*0.82)
		warning:setFillColor(0)
		warning.size=30
		warning.alpha=0
		sceneGroup:insert(warning)
	--경고메세지 타임어택 지우기 
	local warningCount = 0
	local function warningTimeAttack(event)
		warningCount = warningCount +1
		if(warningCount ==1) then 
			contentimg.alpha=0
			warning.alpha=0
			warningCount = 0
		end
	end
	--본관탭
	local function bonTap(event)
		if(gauge >=45 ) then
			print("본관탭")
			--효과음
			--local soundEffect = audio.loadSound( "audio/문여는소리.mp3" )
			--	audio.play( soundEffect)
        local options={
							effect ="fade",
							time=400
						}
        composer.gotoScene("bon",options)
    	else 
    		contentimg.alpha=1
    		warning.alpha=1
    		timeAttack= timer.performWithDelay(600, warningTimeAttack, 1)

       end
    end
	 bon:addEventListener("tap",bonTap)


-------탭기능 
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
----------
	
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