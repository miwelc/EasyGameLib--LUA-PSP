--[[
Example fus(image1, image2) app
  by BlackSith
  powered by EGLib
]]--

dofile("eglib.lua")

osa = Image.load("images/osa.png")
cuad = Image.load("images/cuad.jpg")

screen:blit(0, 0, fus(osa, cuad))

screen.flip()

while true do

  pad = Controls.read()
  if pad:start() then break end
  
end