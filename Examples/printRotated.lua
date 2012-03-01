--[[
Example printRotated app
  by BlackSith
  powered by EGLib
]]--

dofile("EGLib.lua")
red = Color.new(255, 0, 0)
screen:clear()
printRotated(160, 2, "Hello World", red, 0)
printRotated(472, 76, "Hello World", red, 1)
printRotated(160, 262, "Hello World", red, 2)
printRotated(2, 76, "Hello World", red, 3)
screen.flip()
screen.waitVblankStart(130)