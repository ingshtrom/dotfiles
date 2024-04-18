foreach = hs.fnutils.each

hs.window.animationDuration = 0

-- for when we have a Medium sized uBar at the bottom
--local units = {
--    right50 = {x = 0.50, y = 0.00, w = 0.50, h = 1.0},
--    left50 = {x = 0.00, y = 0.00, w = 0.50, h = 1.0},
--    top50 = {x = 0.00, y = 0.00, w = 1.00, h = 0.5},
--    bot50 = {x = 0.00, y = 0.4780, w = 1.00, h = 0.5},
--    maximum = {x = 0.00, y = 0.00, w = 1.00, h = 1.0}
--}
-- without ubar or any other bottom decorations (bars, etc)
-- local units = {
--     right50 = {x = 0.50, y = 0.00, w = 0.50, h = 1.0},
--     left50 = {x = 0.00, y = 0.00, w = 0.50, h = 1.0},
--     top50 = {x = 0.00, y = 0.00, w = 1.00, h = 0.5},
--     bot50 = {x = 0.00, y = 0.5, w = 1.00, h = 0.5},
--     maximum = {x = 0.00, y = 0.00, w = 1.00, h = 1.0}
-- }

-- hs.application.enableSpotlightForNameSearches(true)

-- wait for up to 5 seconds for a window to appear and be focused
--local function waitForFocusedWindowByName(name)
--    local timer = 0
--    while (true and timer < 5) do
--        local win = hs.window.focusedWindow()
--        hs.printf("is nil: %s", win == nil)
--        if win ~= nil and win:application():name() == name then
--            hs.printf("returning focused window for app %", name)
--            return win
--        end
--        hs.timer.usleep(100000)
--        timer = timer + 1
--    end
--    return nil
--end

-- local function moveWindowLeft(win)
-- 	local winscreen = win:screen()
-- 	local screengrid = hs.grid.getGrid(winscreen)
-- 	local cell = hs.grid.get(win)
-- 	-- go to right screen
-- 	local frame=win:frame()
-- 	local newscreen=winscreen:toWest(frame)
-- 	-- if not newscreen then return grid end
-- 	frame.x = frame.x-frame.w
-- 	win:setFrameInScreenBounds(frame)
-- end

-- local function moveWindowRight(win)
-- 	local winscreen = win:screen()
-- 	local screengrid = hs.grid.getGrid(winscreen)
-- 	local cell = hs.grid.get(win)
-- 	-- go to right screen
-- 	local frame=win:frame()
-- 	local newscreen=winscreen:toEast(frame)
-- 	-- if not newscreen then return grid end
-- 	frame.x = frame.x+frame.w
-- 	win:setFrameInScreenBounds(frame)
-- end

function toggleZoomMute()
	local zoom = hs.appfinder.appFromName("zoom.us")

	if (zoom == nil) then
		hs.alert.show("ahokanson: Zoom NOT RUNNING")
		return
	end

	local unmute = { "Meeting", "Unmute audio" }
	local mute = { "Meeting", "Mute audio" }

	if (zoom:findMenuItem(mute)) then
		zoom:selectMenuItem(mute)
		hs.alert.show("ahokanson: Zoom Muted")
	elseif (zoom:findMenuItem(unmute)) then
		zoom:selectMenuItem(unmute)
		hs.alert.show("ahokanson: Zoom Unmuted")
	end
end

function toggleZoomVideo()
	local zoom = hs.appfinder.appFromName("zoom.us")

	if (zoom == nil) then
		return
	end

	local stop = { "Meeting", "Stop Video" }
	local start = { "Meeting", "Start Video" }

	if (zoom:findMenuItem(start)) then
		zoom:selectMenuItem(start)
		hs.alert.show("ahokanson: Video started")
	elseif (zoom:findMenuItem(stop)) then
		zoom:selectMenuItem(stop)
		hs.alert.show("ashokanson: Video stopped")
	end
end

hs.hotkey.bind({ "cmd", "shift" }, "A", function()
	toggleZoomMute()
end)

--hs.hotkey.bind({"cmd", "shift"}, "V", function()
--  toggleZoomVideo()
--end)

local mash = { "alt", "ctrl", "cmd" }

-- NOTE: REPLACED by Raycast
--
-- snapping of windows
-- foreach({
--         { key='k', mod=mash, units=units.top50 },
--         { key='j', mod=mash, units=units.bot50 },
--         { key='u', mod=mash, units=units.left50 },
--         { key='p', mod=mash, units=units.right50 },
--         { key='m', mod=mash, units=units.maximum },
--     }, function(b)
--         hs.hotkey.bind(
--             b.mod,
--             b.key,
--             function()
--                 hs.window.focusedWindow():move(b.units, nil, false)
--             end
--         )
--     end
-- )

-- hotkeys to be like vim
foreach({
	-- { key = 'n', mod = { "ctrl" }, dst = "down" },
	-- { key = 'p', mod = { "ctrl" }, dst = "up" },
	{ key = 'j', mod = { "ctrl" }, dst = "down" },
	{ key = 'k', mod = { "ctrl" }, dst = "up" },
	{ key = 'h', mod = { "ctrl" }, dst = "left" }, -- breaks keybinding for zellij, if using that
	{ key = 'l', mod = { "ctrl" }, dst = "right" },
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

-- NOTE: replaced with Raycast!
--
-- moving of windows from one screen to another
-- hs.hotkey.bind(
-- 	mash,
-- 	"h", -- effectively move current window to the left screen
-- 	function()
-- 		local win = hs.window.focusedWindow()
-- 		moveWindowLeft(win)
-- 		hs.window.focusedWindow():move(units.maximum, nil, false)
-- 	end
-- )
-- hs.hotkey.bind(
-- 	mash,
-- 	"l", -- effectively move current window to the right screen
-- 	function()
-- 		local win = hs.window.focusedWindow()
-- 		moveWindowRight(win)
-- 		hs.window.focusedWindow():move(units.maximum, nil, false)
-- 	end
-- )

-- reload functions
hs.hotkey.bind(
	{ "cmd", "shift" },
	"r",
	function()
		hs.reload()
	end
)
-- open console and then reload
hs.hotkey.bind(
	mash,
	"r",
	function()
		hs.toggleConsole()
		hs.reload()
	end
)


-- hs.hotkey.bind(
--     mash,
--     "o",
--     function()
--         local didStartObsidian = hs.application.launchOrFocus("Obsidian")
--         hs.printf("Did start/focus Obsidian?: %s", didStartObsidian)
--     end
-- )

-- hs.window.switcher.ui.showThumbnails = false
-- hs.window.switcher.ui.showSelectedThumbnail = false
-- switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
-- switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{}) -- include minimized/hidden windows, current Space only
-- hs.hotkey.bind('alt','tab',function()switcher_space:next()end)
-- hs.hotkey.bind('alt-shift','tab',function()switcher_space:previous()end)
--

-- Next up:
-- https://github.com/adamyonk/PushToTalk.spoon/blob/master/init.lua
--hs.hotkey.bind('', 'f13', function()
--  spoon.Zoom:toggleMute()
--end)
