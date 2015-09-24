
-- Setup Network
wifi.setmode(wifi.STATION)
wifi.sta.config('Wifi-Name','password')

waitForIp = true
tmr.alarm(0,7000,0, function() waitForIp=false end)
currentStatus = wifi.sta.status()
while waitForIp and currentStatus < 5 do
	currentStatus = wifi.sta.status()
	print('.')
end
if currentStatus == 5 then
	-- print ip
	ip, nm, gw = wifi.sta.getip()
	print('\nip: '..ip..'\nnm: '..nm..'\ngw: '..gw..'\n')
else
	print('Network timed out, sry.\n')
end

-- Starting main.lua
dofile('main.lua')
