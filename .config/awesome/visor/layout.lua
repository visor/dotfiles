local awful = require("awful")

awful.layout.webdev = {
    name   = "webdev",
    center = false,
    width  = 1280,

    rules  = {
        { class = "Google-chrome", role = "browser" },
        { class = "Firefox",       role = "browser" },
        { class = "Opera",         role = "browser" }
    },

    arrange = function (p)
        if awful.layout.webdev.center then
            awful.layout.webdev.arrangeCenter(p)
        else
            awful.layout.webdev.arrangeLeft(p)
        end
    end,

    arrangeCenter = function (p)
        local wa  = p.workarea
        local cls = p.clients

        if #cls > 0 then
            local c = cls[#cls]

            for i = #cls,1,-1 do
                c = cls[i]
                g = {}

                g.width  = awful.layout.webdev.width
                g.height = wa.height
                g.y      = wa.y
                g.x      = math.floor((wa.width - awful.layout.webdev.width) / 2)

                c:geometry(g)
            end
        end
    end,

    arrangeLeft = function (p)
        local wa  = p.workarea
        local cls = p.clients

        if #cls > 0 then
            local c = cls[#cls]

            for i = #cls,1,-1 do
                c = cls[i]
                g = {}

                g.height = wa.height
                g.y      = wa.y

                if (awful.rules.match(c, { role = "browser" })) then
                    g.width = awful.layout.webdev.width
                    g.x     = 0
                else
                    g.width = wa.width - awful.layout.webdev.width
                    g.x     = awful.layout.webdev.width
                    awful.client.floating.set(c, false)
                end

                c:geometry(g)
            end
        end
    end
}
