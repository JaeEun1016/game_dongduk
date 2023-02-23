-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- json parsing (2302)
local json = require "json"

function jsonParse( src )
	local filename = system.pathForFile( src )
	
	local data, pos, msg
	data, pos, msg = json.decodeFile(filename)

	-- debuging
	if data then
		return data
	else
		print("WARNING: " .. pos, msg)
		return nil
	end
end

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"


-- event listeners for tab buttons:
local function onFirstView( event )
	composer.gotoScene( "opening" )
end
local function onSecondView( event )
	composer.gotoScene( "intro" )
end
local function onThirdView( event )
	composer.gotoScene( "view2" )
end



onFirstView()	-- invoke first tab button's onPress event manually
