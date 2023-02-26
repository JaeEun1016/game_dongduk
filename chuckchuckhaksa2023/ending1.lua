-----------------------------------------------------------------------------------------
--
-- ending1.lua
-- 엔딩1 85점 이상 
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	--배경
	local ending = display.newImage("image/하늘배경.png",1920,1080)
	ending.x, ending.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(ending)

	--다이얼로그 
	local dialog = display.newGroup()

	local background = display.newRect(dialog,display.contentWidth*0.5,display.contentHeight*0.5,2000,1000)

	local image0 = display.newRect(dialog,display.contentWidth*0.1,display.contentHeight*0.7,200,200)
	image0:scale(2,2)
	local image = display.newRect(dialog, display.contentWidth*0.6, display.contentHeight*0.75, 1300, 300)
	
	local certificate= display.newRect(dialog,display.contentWidth*0.5, display.contentHeight*0.5, 700, 800)
	local content = display.newText(dialog, "솰라솰라 불라불라", display.contentWidth*0.8, display.contentHeight*0.85, display.contentWidth*0.7, display.contentHeight*0.2)
	content:setFillColor(0)
	content.size = 30

	sceneGroup:insert(certificate)
	sceneGroup:insert(dialog)
	sceneGroup:insert(background)
	sceneGroup:insert(image0)
	sceneGroup:insert(image)
	sceneGroup:insert(content)
	--버튼
	local skip = display.newImage("image/넘기기버튼.png",5,5)
	skip:scale(0.4,0.4)
	skip.alpha=0
	skip.x, skip.y = display.contentWidth*0.65, display.contentHeight*0.25
	sceneGroup:insert(skip)

	--json 정보 읽기 

	local Data = jsonParse( "json/ending1.json" )
	if Data then
		print(Data[1].background)
		print(Data[1].certificate)
		print(Data[1].image0)
		print(Data[1].content)
		print(Data[1].image)

	end

	--json에서 읽은 정보 적용하기 
	local index = 0

	local function nextScript( event )
		index = index + 1
		if(index > #Data) then 
			skip.alpha=1
			return
		elseif(index==#Data) then
			skip.alpha=1

		end
		
		image0.fill = {
			type ="image",
			filename =Data[index].image0
		}
		content.text = Data[index].content
		image.fill = {
			type = "image",
			filename = Data[index].image
		}background.fill = {
			type ="image",
			filename =Data[index].background
		}
		certificate.fill = {
			type="image",
			filename =Data[index].certificate
		}

	end
	ending:addEventListener("tap", nextScript)

	nextScript()

	--씬이동 
	local function catch(event)
		
        	composer.setVariable("complete", true)
        local options={
							effect ="fade",
							
						}
        composer.gotoScene("ending1_1",options)
    
    	end

	  skip:addEventListener("tap",catch)


	

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