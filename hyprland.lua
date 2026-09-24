-- Adeptus Astartes Hyprland Presentation
-- Imperial Auric Gold, Macragge Blue and Ceramite Slate

local activeBorderColor = {
	colors = { "rgb(38BDF8)", "rgb(38BDF8)", "rgb(2563EB)", "rgb(2563EB)", "rgb(1E3A8A)", "rgb(1E3A8A)" },
	angle = 45,
}
local inactiveBorderColor = "rgba(43506877)"

hl.config({
	general = {
		col = {
			active_border = activeBorderColor,
			inactive_border = inactiveBorderColor,
		},
		border_size = 2,
		gaps_in = 6,
		gaps_out = 12,
	},
	group = {
		col = {
			border_active = activeBorderColor,
			border_inactive = inactiveBorderColor,
		},
	},
	decoration = {
		rounding = 10,
		rounding_power = 2,
		blur = {
			enabled = true,
			size = 4,
			passes = 3,
			noise = 0.02,
			contrast = 0.88,
			brightness = 0.35,
			vibrancy = 0.08,
			vibrancy_darkness = 0.65,
			ignore_opacity = true,
		},
		shadow = {
			enabled = true,
			scale = 1.8,
			range = 20,
			render_power = 4,
		},
	},
	animations = {
		enabled = true,
	},
})

hl.curve("smoothFlow", { type = "bezier", points = { { 0.25, 0.46 }, { 0.45, 0.94 } } })
hl.curve("martialStrike", { type = "bezier", points = { { 0.2, 0.9 }, { 0.3, 1.05 } } })

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 2.2,
	bezier = "smoothFlow",
	style = "slide",
})
hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 2.0,
	bezier = "smoothFlow",
	style = "popin 80%",
})
hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 2.2,
	bezier = "smoothFlow",
	style = "slide",
})
hl.animation({
	leaf = "border",
	enabled = true,
	speed = 2.5,
	bezier = "smoothFlow",
})
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 2.2,
	bezier = "smoothFlow",
	style = "slide",
})
hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 1.8,
	bezier = "smoothFlow",
})
hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 2.0,
	bezier = "martialStrike",
})
