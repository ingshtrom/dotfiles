local canvas = require("hs.canvas")

hs.window.animationDuration = 0
local units = {
	right50 = {x = 0.50, y = 0.00, w = 0.50, h = 1.00},
	left50 = {x = 0.00, y = 0.00, w = 0.50, h = 1.00},
	top50 = {x = 0.00, y = 0.00, w = 1.00, h = 0.50},
	bot50 = {x = 0.00, y = 0.50, w = 1.00, h = 0.50},
	maximum = {x = 0.00, y = 0.00, w = 1.00, h = 1.00}
}

local mash = {"alt", "ctrl", "cmd"}
hs.hotkey.bind(
	mash,
	"k",
	function()
		hs.window.focusedWindow():move(units.top50, nil, true)
	end
)
hs.hotkey.bind(
	mash,
	"j",
	function()
		hs.window.focusedWindow():move(units.bot50, nil, true)
	end
)
hs.hotkey.bind(
	mash,
	"u",
	function()
		hs.window.focusedWindow():move(units.left50, nil, true)
	end
)
hs.hotkey.bind(
	mash,
	"p",
	function()
		hs.window.focusedWindow():move(units.right50, nil, true)
	end
)

hs.hotkey.bind(
	mash,
	"m",
	function()
		hs.window.focusedWindow():move(units.maximum, nil, true)
	end
)

hs.hotkey.bind(
	mash,
	"h",
	function()
		local win = hs.window.focusedWindow()
		hs.grid.pushWindowPrevScreen(win)
	end
)
hs.hotkey.bind(
	mash,
	"l",
	function()
		local win = hs.window.focusedWindow()
		hs.grid.pushWindowNextScreen(win)
	end
)

-- hs.hotkey.bind(
-- 	{"cmd", "alt"},
-- 	"V",
-- 	function()
-- 		hs.eventtap.keyStrokes(hs.pasteboard.getContents())
-- 	end
-- )
