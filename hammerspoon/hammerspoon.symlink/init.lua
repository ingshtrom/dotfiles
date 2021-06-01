local canvas = require("hs.canvas")

hs.window.animationDuration = 0
local units = {
	right50 = {x = 0.50, y = 0.00, w = 0.50, h = 1.00},
	left50 = {x = 0.00, y = 0.00, w = 0.50, h = 1.00},
	top50 = {x = 0.00, y = 0.00, w = 1.00, h = 0.50},
	bot50 = {x = 0.00, y = 0.50, w = 1.00, h = 0.50},
	maximum = {x = 0.00, y = 0.00, w = 1.00, h = 1.00}
}

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

-- hs.hotkey.bind({"cmd", "shift"}, "V", function()
--   toggleZoomVideo()
-- end)

local mash = {"alt", "ctrl", "cmd"}
hs.hotkey.bind(
	mash,
	"k", -- put window on top half of current screen
	function()
		hs.window.focusedWindow():move(units.top50, nil, true)
	end
)
hs.hotkey.bind(
	mash,
	"j", -- put window on bottom half of current screen
	function()
		hs.window.focusedWindow():move(units.bot50, nil, true)
	end
)
hs.hotkey.bind(
	mash,
	"u", -- put window on left half of current screen
	function()
		hs.window.focusedWindow():move(units.left50, nil, true)
	end
)
hs.hotkey.bind(
	mash,
	"p", -- put window on right half of current screen
	function()
		hs.window.focusedWindow():move(units.right50, nil, true)
	end
)

hs.hotkey.bind(
	mash,
	"m", -- maximize (not full screen) window on current screen
	function()
		hs.window.focusedWindow():move(units.maximum, nil, true)
	end
)

hs.hotkey.bind(
	mash,
	"h", -- effectively move current window to the left screen 
	function()
		local win = hs.window.focusedWindow()
		hs.grid.pushWindowPrevScreen(win)
	end
)
hs.hotkey.bind(
	mash,
	"l", -- effectively move current window to the right screen
	function()
		local win = hs.window.focusedWindow()
		hs.grid.pushWindowNextScreen(win)
	end
)
hs.hotkey.bind(
	{"ctrl"},
	"n",
	function()
		hs.eventtap.keyStroke({}, hs.keycodes.map["down"], 0)
	end
)
hs.hotkey.bind(
	{"ctrl"},
	"p",
	function()
		hs.eventtap.keyStroke({}, hs.keycodes.map["up"], 0)
	end
)
hs.hotkey.bind(
	{"ctrl"},
	"j",
	function()
		hs.eventtap.keyStroke({}, hs.keycodes.map["down"], 0)
	end
)
hs.hotkey.bind(
	{"ctrl"},
	"k",
	function()
		hs.eventtap.keyStroke({}, hs.keycodes.map["up"], 0)
	end
)
