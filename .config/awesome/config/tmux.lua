tmux.tagNumber    = 6
tmux.screenNumber = 2
tmux.debug        = false
tmux.runCommand   = terminal .. " -n %s -title %s -e tmux -L %s"
tmux.fileName     = __dir__ .. "/config/tmux.lua"
tmux.config       = {
	terminal = {
		title = "Console",
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
		screen = 2,
		tag = 6,
		session = {
			"new-session -s 'Files' mc",
			"bind-key -n C-F12 neww mc"
		}
	},
	notes = {
		title = "Notes",
		screen = 2,
		tag = 6,
		session = {}
	},
	music = {
		title = "Music",
		screen = 2,
		tag = 6,
		session = {
			"new-session -s 'Music' cmus",
			"rename-window cmus",
			"setw -t 1 monitor-activity off",
		},
	},
	torrent = {
		title = "Torrent",
		screen = 2,
		tag = 3,
		session = {
			"new-session -s 'Tools' rtorrent",
			"rename-window torrent",
			"neww /home/tools/bin/torrents-sorter.php",
			"rename-window torrents-sorter",
			"setw -t 1 monitor-activity off",
			"setw -t 2 monitor-activity off",
			"select-window -t 1"
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