hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	disabled = false,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "auto",
	scale = 2,
})

hl.monitor({
	output = "DP-2",
	mode = "2560x1440@180",
	position = "1920x0",
	-- bitdepth = 10,
	-- cm = "hdr",
	-- sdrbrightness = 1.2,
	-- sdrsaturation = 1.0,
})

hl.monitor({
	output = "DP-3",
	mode = "1920x1200",
	position = "0x0",
})
