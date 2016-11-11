PIN = 4
dht22 = require("dht22mini")
tText="Error"
hText="Error"
lText=0
sv=net.createServer(net.TCP,30)
sv:listen(80,function(c)
c:on("recieve", function(c,pl)
    print(pl) end)
    readData()
    c:send("{"..tText..","..hText..", Light:"..lText.."}")
end)

function readData()
    tier=5
    tText="Error"
    hText="Error"
    lText=0
    while tier>0 do
        dht22.read(PIN)
        t = dht22.getTemperature()
        h = dht22.getHumidity()
        if h == nil then
            tier=tier-1
        else
            tier=0
            tText="Temperature: "..((t-(t % 10)) / 10).."."..(t % 10)
            hText="Humidity : "..((h-(h % 10)) / 10).."."..(h % 10)
        end
      end
      lText=adc.read(0)
end