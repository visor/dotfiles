tags[1] = awful.tag(
	{ "dev", "web", "net", "gr", "vdo"},
	2,
	layouts[1]
)
tags[2] = awful.tag(
	{ "dev", "web", "net", "im", "med", "cons", "todo", "∞", "game" },
	1,
	layouts[1]
)


awful.layout.set(awful.layout.webdev, tags[1][2])
