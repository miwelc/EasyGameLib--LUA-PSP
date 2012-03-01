--[[
Example rotate(image) app
  by BlackSith
  powered by EGLib
]]--

dofile("EGLib.lua")

im = Image.load("./images/osa.png")
rot = 0

while true do
  
  pad = Controls.read()
  if pad:cross() then
    rot = rot + 1
    im = rotate(im, 1)
  end
  if pad:start() then
    break
  end
  screen:clear()
  screen:blit(5, 5, im)
  screen.flip()
  screen.waitVblankStart(7)

end