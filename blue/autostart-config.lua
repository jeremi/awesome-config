-----------------------------------------------------------------------------------------------------------------------
--                                              Autostart app list                                                   --
-----------------------------------------------------------------------------------------------------------------------

-- Grab environment
local awful = require("awful")

-- Initialize tables and vars for module
-----------------------------------------------------------------------------------------------------------------------
local autostart = {}

-- Application list function
--------------------------------------------------------------------------------
function autostart.run()
	-- utils
	awful.spawn.with_shell("compton")
	awful.spawn.with_shell("nm-applet")
	awful.spawn.with_shell("slack")
	awful.spawn.with_shell("code")
	-- awful.spawn.with_shell("google-chrome-stable")
	awful.spawn.with_shell("xscreensaver -nosplash")
	awful.spawn.with_shell("xss-lock -- xscreensaver-command -lock")
	awful.spawn.with_shell("xmodmap -e 'keycode 117='")
	awful.spawn.with_shell("xmodmap -e 'keycode 112='")

	awful.spawn("google-chrome-stable --profile-directory=Default", {tag="2 Me"}) -- Perso
	awful.spawn("google-chrome-stable --profile-directory='Profile 1'", {tag="1 NL"}) -- Newlogic
	awful.spawn("google-chrome-stable --profile-directory='Profile 2'", {tag="2 Me"}) -- CS
	awful.spawn("termite", {tag="3 Code"})
	awful.spawn("termite", {tag="6 Code"})
	awful.spawn("termite", {tag="4 Shell"})
	awful.spawn("termite", {tag="4 Shell"})
	awful.spawn("spotify", {tag="7 Media"})
	awful.spawn("udiskie --tray")
	

	-- awful.spawn.with_shell("bash ~/scripts/env/pa-setup.sh")
	-- awful.spawn.with_shell("bash ~/scripts/env/color-profile-setup.sh")

	-- awful.spawn.with_shell("sleep 1 && bash ~/scripts/firefox/ff-sync.sh")

	-- gnome environment
	-- awful.spawn.with_shell("/lib/gsd-xsettings")
	-- awful.spawn.with_shell("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

	-- keyboard layouts
	-- awful.spawn.with_shell("kbdd")
	-- awful.spawn.with_shell("bash ~/scripts/env/kbdd-setup.sh")

	-- apps
	-- awful.spawn.with_shell("clipflap")
	-- awful.spawn.with_shell("transmission-gtk -m")
end

-- Read and commads from file and spawn them
--------------------------------------------------------------------------------
function autostart.run_from_file(file_)
	local f = io.open(file_)
	for line in f:lines() do
		if line:sub(1, 1) ~= "#" then awful.spawn.with_shell(line) end
	end
	f:close()
end

-- End
-----------------------------------------------------------------------------------------------------------------------
return autostart
