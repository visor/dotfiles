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
			"rename-window common",
			"setw -t 1 monitor-activity off",

			-- -- RosNeft
			-- "new-window -c /home/interprogma/source/rosneft",
			-- "rename-window rosneft",
			-- "setw -t 2 monitor-activity off",
			-- "split-window -c /home/interprogma/source/rosneft/etp",
			-- "select-pane -t 0",

			-- TMK
			"new-window -c /home/interprogma/source/tmk-sale",
			"rename-window tmk-sale",
			"setw -t 2 monitor-activity off",
			"split-window -c /home/interprogma/source/tmk-sale/cometp",

			-- -- edi
			-- "new-window -c /home/interprogma/source/edi",
			-- "rename-window edi",
			-- "setw -t 3 monitor-activity off",
			-- "split-window -c /home/interprogma/source/edi/application/modules/edi",
			
			-- GazBur
			"new-window -c /home/interprogma/source/gazbur",
			"rename-window gazbur",
			"setw -t 3 monitor-activity off",
			"split-window -c /home/interprogma/source/gazbur/cometp",
			"select-pane -t 0",
			"split-window -h -c /home/interprogma/source/gazbur/commodules/orderbook",
			"select-pane -D",
			"split-window -h -c /home/interprogma/source/gazbur/cometp2/module/Ext1C",
			"select-pane -t 0",

			-- RosAtom 2
			-- "new-window -c /home/interprogma/source/rosatom-2",
			-- "rename-window rosatom",
			-- "setw -t 2 monitor-activity off",

			-- -- Avtodor PO
			-- "new-window -c /home/interprogma/source/avtodor",
			-- "rename-window avtodor-po",
			-- "setw -t 2 monitor-activity off",
			-- "split-window -c /home/interprogma/source/avtodor/commodules/po",
			-- "split-window -c /home/interprogma/source/avtodor/commodules/cm",
			-- "select-pane -t 0",
			-- "split-window -c /home/interprogma/source/avtodor/cometp",
			-- "select-pane -t 0",

			-- -- Avtodor ETP
			-- "new-window -c /home/interprogma/source/avtodor-etp",
			-- "rename-window avtodor-etp",
			-- "setw -t 3 monitor-activity off",
			-- "split-window -c /home/interprogma/source/avtodor-etp/cometp",
			-- "select-pane -t 0",

			-- -- GPO (SPB)
			-- "new-window -c /home/interprogma/source/gpo",
			-- "rename-window gpospb",
			-- "setw -t 2 monitor-activity off",
			-- "split-window -c /home/interprogma/source/gpo/commodules/po",
			-- "split-window -c /home/interprogma/source/gpo/commodules/cm",
			-- "select-pane -t 0",
			-- "split-window -c /home/interprogma/source/gpo/cometp",
			-- "select-pane -t 0",

			-- -- МЧC
			-- "new-window -c /home/interprogma/source/mchs",
			-- "rename-window mchs",
			-- "setw -t 4 monitor-activity off",
			-- "split-window -c /home/interprogma/source/mchs/commodules/bp",
			-- "split-window -c /home/interprogma/source/mchs/commodules/po",
			-- "select-pane -t 0",
			-- "split-window -h -c /home/interprogma/source/mchs/commodules/mchs",
			-- "select-pane -D",
			-- "split-window -h -c /home/interprogma/source/mchs/commodules/cm",
			-- "select-pane -D",
			-- "split-window -h -c /home/interprogma/source/mchs/cometp",
			-- "select-pane -t 0",

			-- АИС ГЗ Ставраполь
			"new-window -c /home/interprogma/source/ast",
			"rename-window ast",
			"setw -t 4 monitor-activity off",
			"split-window -c /home/interprogma/source/ast/projects/ast/composer",
			"split-window -c /home/interprogma/source/ast/cometp",
			"select-pane -t 0",
			"split-window -h -c /home/interprogma/source/ast/commodules/ast",
			"select-pane -D",
			"split-window -h -c /home/interprogma/source/ast/commodules/cm",
			"select-pane -D",
			"split-window -h -c /home/interprogma/source/ast/commodules/po",
			"select-pane -t 0",

			-- Gostinets
			"new-window -c /home/gostinets/gostinets.dev",
			"rename-window gostinets",
			"setw -t 5 monitor-activity off",
			"split-window -c /home/gostinets/gostinets.dev/vendor/gostinets/v1",
			"split-window -c /home/gostinets/gostinets.dev/vendor/gostinets/v2",
			"select-pane -t 0",

			-- SmartHome
			"new-window -c /home/smart",
			"rename-window smart-home",
			"setw -t 6 monitor-activity off",
			"split-window -c /home/smart/kodi",
			"select-pane -t 0",

			-- HarryPotter
			"new-window -c /home/harry/source",
			"rename-window harry-potter",
			"setw -t 7 monitor-activity off",
			"split-window -c /home/harry/vagrant-box",
			"split-window -h -c /home/harry/vagrant-box/migrate",
			"select-pane -t 0",

			-- The End
			"select-window -t 1"
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
		tag = 5,
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
		sudo = true,
		session = {
			"new-session -s 'Root'",
			"rename-window root",
			"neww ranger",
			"rename-window ranger",
			"setw -t 1 monitor-activity off",
			"setw -t 2 monitor-activity off",
			"select-window -t 1"
		}
	}
}