--[[
Example vFlip(image) app
  by BlackSith
  powered by EGLib
]]--

dofile("eglib.lua")

im = Image.load("./images/osa.png")
screen:clear()
screen:blit(25, 25, im)
screen.flip()

while true do
  
  pad = Controls.read()
  if pad:cross() then
  screen:clear()
  im = vFlip(im)
  screen:blit(25, 25, im)
  screen.flip()
  screen.waitVblankStart(7)
  end
  if pad:start() then
    break
  end

end