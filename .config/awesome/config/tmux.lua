tmux.tagNumber    = 6
tmux.screenNumber = 2
tmux.debug        = false
tmux.runCommand   = terminal .. " -n %s -title %s -e tmux -L %s"
tmux.fileName     = __dir__ .. "/config/tmux.lua"
tmux.config       = {
	terminal = {
		title = "Console",
		icon = "/usr/share/icons/gnome/32x32/applications/terminal.png",
		screen = 2,
		tag = 6,
		session = {
			"new-session -s 'Console'",
			"new-window",
			"select-window -t 1",
		}
	},
	files = {
		title = "Files",
		icon = "/usr/share/icons/gnome/32x32/applications/file-manager.png",
		screen = 2,
		tag = 6,
		session = {
			"new-session -s 'Files' mc",
			"bind-key -n C-F12 neww mc"
		}
	},
	notes = {
		title = "Notes",
		icon = "/usr/share/icons/hicolor/32x32/apps/evolution-memos.png",
		screen = 2,
		tag = 6,
		session = {}
	},
	tools = {
		title = "Tools",
		screen = 2,
		tag = 6,
		session = {
			"new-session -s 'Tools' cmus",
			"rename-window cmus",
			"neww rtorrent",
			"rename-window torrent",
			"select-window -t 1",
			"setw -t 1 monitor-activity off",
			"setw -t 2 monitor-activity off"
		},
	},
	root = {
		title = "Root",
		screen = 2,
		tag = 6,
		session = {},
		todo = {
			"yum",
			"rpmreaper",
			"/data/sources",
			"/rpm/specs"
		}
	}
}