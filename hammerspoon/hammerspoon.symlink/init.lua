canvas = require("hs.canvas")

hs.window.animationDuration = 0
units = {
	right30 = {x = 0.70, y = 0.00, w = 0.30, h = 1.00},
	right70 = {x = 0.30, y = 0.00, w = 0.70, h = 1.00},
	left70 = {x = 0.00, y = 0.00, w = 0.70, h = 1.00},
	left30 = {x = 0.00, y = 0.00, w = 0.30, h = 1.00},
	top50 = {x = 0.00, y = 0.00, w = 1.00, h = 0.50},
	-- top30 = {x = 0.00, y = 0.00, w = 1.00, h = 0.33},
	bot50 = {x = 0.00, y = 0.50, w = 1.00, h = 0.50},
	-- bot30 = {x = 0.00, y = 1.00, w = 1.00, h = 0.33},
	upright30 = {x = 0.70, y = 0.00, w = 0.30, h = 0.50},
	botright30 = {x = 0.70, y = 0.50, w = 0.30, h = 0.50},
	upleft70 = {x = 0.00, y = 0.00, w = 0.70, h = 0.50},
	botleft70 = {x = 0.00, y = 0.50, w = 0.70, h = 0.50},
	maximum = {x = 0.00, y = 0.00, w = 1.00, h = 1.00}
}

mash = {"alt", "ctrl", "cmd"}
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
-- hs.hotkey.bind(
-- 	mash,
-- 	"up",
-- 	function()
-- 		hs.window.focusedWindow():move(units.top30, nil, true)
-- 	end
-- )
-- hs.hotkey.bind(
-- 	mash,
-- 	"down",
-- 	function()
-- 		hs.window.focusedWindow():move(units.bottom30, nil, true)
-- 	end
-- )
hs.hotkey.bind(
	mash,
	"m",
	function()
		hs.window.focusedWindow():move(units.maximum, nil, true)
	end
)

-- mouseCircle = nil
-- mouseCircleTimer = nil
-- mouseCircleCurrentState = 0 -- goes between 0 and 1 to switch between sizes and color

-- function mouseToggleState()
-- 	if mouseCircle then
-- 		strokeColor = {["red"] = 0, ["blue"] = 0, ["green"] = 1, ["alpha"] = 1}
-- 		fillColor = {["red"] = 0, ["blue"] = 0, ["green"] = 1, ["alpha"] = 1}
-- 		fill = true
-- 		strokeWidth = 5
-- 		if mouseCircleCurrentState == 0 then
-- 			strokeColor = {["red"] = 0, ["blue"] = 0, ["green"] = 1, ["alpha"] = 1}
-- 			fillColor = {["red"] = 0, ["blue"] = 0, ["green"] = 1, ["alpha"] = 1}
-- 			fill = true
-- 			strokeWidth = 5
-- 			mouseCircleCurrentState = 1
-- 		else
-- 			strokeWidth = 10
-- 			mouseCircleCurrentState = 0
-- 		end
-- 		mouseCircle:setStrokeColor(strokeColor)
-- 		mouseCircle:setFill(fill)
-- 		mouseCircle:setFillColor(fill)
-- 		mouseCircle:setStrokeWidth(5)
-- 		mouseCircle:show()
-- 	end
-- end

-- function mouseCircleDelete()
-- 	mouseCircle:delete()
-- end

-- function mouseHighlight()
-- 	-- Delete an existing highlight if it exists
-- 	if mouseCircle then
-- 		mouseCircle:removeElement()
-- 		if mouseCircleTimer then
-- 			mouseCircleTimer:stop()
-- 		-- mouseCircleTimer = nil
-- 		end
-- 	end
-- 	-- Get the current co-ordinates of the mouse pointer
-- 	mousepoint = hs.mouse.getAbsolutePosition()
-- 	-- Prepare a big red circle around the mouse pointer
-- 	-- mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x - 40, mousepoint.y - 40, 80, 80))
-- 	mouseCircle =
-- 		hs.canvas.new {x = mousepoint.x - 100, y = mousepoint.y - 100, h = 200, w = 200}:appendElements(
-- 		{
-- 			action = "fill",
-- 			fillColor = {alpha = 1, red = 1.0},
-- 			radius = "25",
-- 			type = "circle",
-- 			withShadow = true
-- 		}
-- 	):show()

-- 	-- mouseToggleState()

-- 	-- mouseCircleTimer = hs.timer.doAfter(0.5, mouseToggleState)
-- 	-- mouseCircleTimer = hs.timer.doAfter(1, mouseToggleState)
-- 	-- mouseCircleTimer = hs.timer.doAfter(1.5, mouseToggleState)
-- 	-- mouseCircleTimer = hs.timer.doAfter(2, mouseToggleState)
-- 	mouseCircleTimer = hs.timer.doAfter(2.5, mouseCircleDelete)
-- end
-- hs.hotkey.bind({"cmd", "shift", "ctrl"}, "a", mouseHighlight)

function moveWindowLeft()
	-- hs.window.focusedWindow():moveToScreen(screens.left)
	hs.window.focusedWindow():moveOneScreenWest()
end

function moveWindowRight()
	-- hs.window.focusedWindow():moveToScreen(screens.right)
	hs.window.focusedWindow():moveOneScreenEast()
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "h", moveWindowLeft)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "l", moveWindowRight)

hs.hotkey.bind(
	{"cmd", "alt"},
	"V",
	function()
		hs.eventtap.keyStrokes(hs.pasteboard.getContents())
	end
)
