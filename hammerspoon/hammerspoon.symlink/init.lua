local canvas = require("hs.canvas")

hs.window.animationDuration = 0
-- for when we have a Medium sized uBar at the bottom
-- local units = {
-- 	right50 = {x = 0.50, y = 0.00, w = 0.50, h = 0.958},
-- 	left50 = {x = 0.00, y = 0.00, w = 0.50, h = 0.958},
-- 	top50 = {x = 0.00, y = 0.00, w = 1.00, h = 0.4775},
-- 	bot50 = {x = 0.00, y = 0.4780, w = 1.00, h = 0.4773},
-- 	maximum = {x = 0.00, y = 0.00, w = 1.00, h = 0.958}
-- }
local units = {
    right50 = {x = 0.50, y = 0.00, w = 0.50, h = 1},
	left50 = {x = 0.00, y = 0.00, w = 0.50, h = 1},
	top50 = {x = 0.00, y = 0.00, w = 1.00, h = 0.5},
	bot50 = {x = 0.00, y = 0.5, w = 1.00, h = 0.5},
	maximum = {x = 0.00, y = 0.00, w = 1.00, h = 1}
}


local function moveWindowLeft(win)
	local winscreen = win:screen()
	local screengrid = hs.grid.getGrid(winscreen)
	local cell = hs.grid.get(win)
	-- go to right screen
	local frame=win:frame()
	local newscreen=winscreen:toWest(frame)
	-- if not newscreen then return grid end
	frame.x = frame.x-frame.w
	win:setFrameInScreenBounds(frame)
end

local function moveWindowRight(win)
	local winscreen = win:screen()
	local screengrid = hs.grid.getGrid(winscreen)
	local cell = hs.grid.get(win)
	-- go to right screen
	local frame=win:frame()
	local newscreen=winscreen:toEast(frame)
	-- if not newscreen then return grid end
	frame.x = frame.x+frame.w
	win:setFrameInScreenBounds(frame)
end

function toggleZoomMute()
  local zoom = hs.appfinder.appFromName("zoom.us")

  if (zoom == nil) then
    hs.alert.show("Zoom NOT RUNNING")
    return
  end

  local unmute = {"Meeting", "Unmute Audio"}
  local mute = {"Meeting", "Mute Audio"}

  if (zoom:findMenuItem(mute)) then
    zoom:selectMenuItem(mute)
    hs.alert.show("Zoom Muted")
  elseif (zoom:findMenuItem(unmute)) then
    zoom:selectMenuItem(unmute)
    hs.alert.show("Zoom Unmuted")
  end
end

function toggleZoomVideo()
  local zoom = hs.appfinder.appFromName("zoom.us")

  if (zoom == nil) then
    return
  end

  local stop = {"Meeting", "Stop Video"}
  local start = {"Meeting", "Start Video"}

  if (zoom:findMenuItem(start)) then
    zoom:selectMenuItem(start)
    hs.alert.show("Video started")
  elseif (zoom:findMenuItem(stop)) then
    zoom:selectMenuItem(stop)
    hs.alert.show("Video stopped")
  end
end

hs.hotkey.bind({"cmd", "shift"}, "A", function()
  toggleZoomMute()
end)

--hs.hotkey.bind({"cmd", "shift"}, "V", function()
--  toggleZoomVideo()
--end)

local mash = {"alt", "ctrl", "cmd"}

-- snapping of windows
hs.fnutils.each({
        { key='k', mod=mash, units=units.top50 },
        { key='j', mod=mash, units=units.bot50 },
        { key='u', mod=mash, units=units.left50 },
        { key='p', mod=mash, units=units.right50 },
        { key='m', mod=mash, units=units.maximum },
    }, function(b)
        hs.hotkey.bind(
            b.mod,
            b.key,
            function() hs.window.focusedWindow():move(b.units, nil, false) end
        )
    end
)

-- hotkeys to be like vim
hs.fnutils.each({
        { key='n', mod={"ctrl"}, dst="down" },
        { key='j', mod={"ctrl"}, dst="down" },
        { key='p', mod={"ctrl"}, dst="up" },
        { key='k', mod={"ctrl"}, dst="up" },
    }, function(b)
        hs.hotkey.bind(
            b.mod,
            b.key,
            function() hs.eventtap.keyStroke({}, hs.keycodes.map[b.dst], 0) end,
            nil,
            function() hs.eventtap.keyStroke({}, hs.keycodes.map[b.dst], 0) end
        )
    end
)

-- moving of windows from one screen to another
hs.hotkey.bind(
	mash,
	"h", -- effectively move current window to the left screen
	function()
		local win = hs.window.focusedWindow()
		moveWindowLeft(win)
		hs.window.focusedWindow():move(units.maximum, nil, false)
	end
)
hs.hotkey.bind(
	mash,
	"l", -- effectively move current window to the right screen
	function()
		local win = hs.window.focusedWindow()
		moveWindowRight(win)
		hs.window.focusedWindow():move(units.maximum, nil, false)
	end
)

