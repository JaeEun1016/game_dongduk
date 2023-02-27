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

--json save 
	function jsonSave(src,data)
		local filename = system.pathForFile( src )

	local text, pos, msg = json.encode( data )

	local file, errorString = io.open( filename, "w" )

	if not file then
    	print( "File error: " .. errorString )
	else
	    file:write( text )
	    io.close( file )
	end
end
--json 읽기 
local GData = jsonParse("json/gauge.json")

if(GData) then 
	print(GData.gauge_json)
end
--json-> 게이지 전역변수 
gague =GData.gauge_json




-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"


-- event listeners for tab buttons:
local function onFirstView( event )
	composer.gotoScene( "intro" )
end
local function onSecondView( event )
	composer.gotoScene( "intro" )
end
local function onThirdView( event )
	composer.gotoScene( "opening" )
end



onFirstView()	-- invoke first tab button's onPress event manually
