require("luci.tools.webadmin")

local m = Map("squeezelite", "Configure", "")

m.on_after_commit = function()
	luci.sys.call("/etc/init.d/squeezelite restart")
end

local s = m:section(NamedSection, "options", "options", "Various player options")
s.addremove = false
s.anonymous = true

local n = s:option(Value, "name", "Name", "Name to identify this player")
n.default = "SqueezeWRT"
n.optional = false

local o = s:option(ListValue, "device", "Output device", "Audio device to play music");
o.optional = false
o.default = "hw:0,0"
o:value("hw:0,0","hw:0,0")
for devstring in luci.util.execi("/usr/bin/squeezelite -l") do
	local pair = luci.util.split(devstring, "-", 1)
	if pair[2] == nil then
	else
		local dev = luci.util.trim(pair[1])
		local txt = luci.util.trim(pair[2])
		o:value(dev, txt)
	end
end

local ap = s:option(Value, "alsa_params", "ALSA parameters", "b:p:f:m ALSA params to open output device, b = buffer time in ms or size in bytes, p = period count or size in bytes, f sample format [16|24|24_3|32], m = use mmap [0|1]");
ap.default = "200:::"
ap.optional = false

local flc = s:option(Flag, "decode_flac", "FLAC in player", "FLAC decoding takes place in player, not in server");
flc.optional = false
flc.default = 0

local dop = s:option(Flag, "dsd_over_pcm", "DSD over PCM", "Output device supports DSD over PCM (DoP)");
dop.optional = false
dop.default = 0

local ir = s:option(ListValue, "ircontrol", "Infrared HID", "USB infrared receiver to control playback");
ir.optional = false
ir:value("0","No IR device")
ir.default = "0"
for devstring in luci.util.execi("/usr/bin/squeezelite -I") do
	local pair = luci.util.split(devstring, "\t", 1)
	if pair[2] == nil then
	else
		local dev = luci.util.trim(pair[1])
		local txt = luci.util.trim(pair[2])
		ir:value(dev, txt)
	end
end

return m
