for s = 1, screen.count() do
	tags[s] = awful.tag(
		{ "dev", "web", "net", "im", "med", "cons", "todo", "∞", "game" },
		s,
		layouts[1]
	)
end
awful.layout.set(awful.layout.webdev, tags[1][2])
