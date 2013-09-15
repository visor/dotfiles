tmux.tagNumber = 6
tmux.debug = false
tmux.runCommand = terminal .. " -n %s -title %s -e tmux -L %s"
tmux.fileName = __dir__ .. "/config/tmux.lua"
tmux.config = {
	terminal = {
		title = "Console",
		screen = 2,
		icon = "/usr/share/icons/gnome/32x32/applications/terminal.png",
		session = {
			"new-session -s 'Console'",
			"new-window",
			"select-window -t 1",
		}
	},
	files = {
		title = "Files",
		icon = "/usr/share/icons/gnome/32x32/applications/file-manager.png",
		session = {
			"new-session -s 'Files' mc",
			"bind-key -n C-F12 neww mc"
		}
	},
	notes = {
		title = "Notes",
		icon = "/usr/share/icons/hicolor/32x32/apps/evolution-memos.png",
		session = {}
	},
	tools = {
		title = "Tools",
		screen = 2,
		session = {
			"new-session -s 'Tools' cmus",
			"rename-window cmus",
			"new-window rtorrent",
			"rename-window torrent"
		},
	},
	root = {
		title = "Root",
		session = {},
		todo = {
			"yum",
			"rpmreaper",
			"/data/sources",
			"/rpm/specs"
		}
	}
}