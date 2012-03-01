--[[
Example scaleImage app
  by BlackSith
  powered by EGLib
]]--

dofile("EGLib.lua")

bl = Color.new(255, 255, -255)
f = Image.load("./images/cuad.jpg")

x = 25
y = 25

while true do

pad = Controls.read()
if pad:start() then break end
if pad:right() then
  x = x + 1
end
if pad:left() then
  x = x - 1
end

if pad:down() then
  y = y - 1
end
if pad:up() then
  y = y + 1
end

if x <= 0 then
  x = 1
end
if y <= 0 then
  y = 1
end

screen:clear()
screen:blit(10, 10, scaleImage(x, y, f))
screen.flip()
screen.waitVblankStart()

end