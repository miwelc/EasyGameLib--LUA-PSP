--[[
Easy Game Lib (EGLib) v 0.2

Copyright (C) 

    Pause function --> BlackSith, 2006
    ExitGame Menu function --> BlackSith, 2006
    ScaleImage function --> soulphalanx, 2006
    RotateImage & PrintRotated functions --> shine, 2005
    PrintCentered function --> nathan42100, 2006
    hFlip & vFlip functions --> BlackSith, 2006
    Fus function --> BlackSith, 2006

This program is free software; you can redistribute it and/or modify it under 
the terms of the GNU General Public License as published by the Free Software 
Foundation; either version 2 of the License, or (at your option) any later 
version.
This program is distributed in the hope that it will be useful, but WITHOUT 
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS 
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with 
this program; if not, write to the 
Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
]]--

--------VARs--------
local whitel = Color.new(255, 255, 255)
local bluel = Color.new(0, 0, 255)
local redl = Color.new(255, 0, 0)
local yellowl = Color.new(255, 255, -255)
local blackl = Color.new(0, 0, 0)

exitsure = 0
exityes = 0
exitno = 1

local squarel = Image.createEmpty(26, 14)
squarel:clear(bluel)


-------Pause-------
function pause(soundl, timer1, timer2)

  if soundl ~= nil then soundl:play() end
  if timer1 ~= nil then timer1:stop() end
  if timer2 ~= nil then timer2:stop() end
  pauseon = 1
  screen:clear()
  screen:print(209, 130, "------", yellowl)
  screen:print(213, 136, "PAUSE", whitel)
  screen:print(209, 142, "------", yellowl)
  screen.flip()
  screen.waitVblankStart(20)
  while pauseon == 1 do
    padl = Controls.read()
    if padl:start() then pauseon = 0 end
  end
  if soundl ~= nil then soundl:play() end
  if timer1 ~= nil then timer1:start() end
  if timer2 ~= nil then timer2:start() end
  screen:clear()
  screen.flip()
  screen.waitVblankStart(12)
  
end

-------Exit-------
function exit(soundl, timer1, timer2)

  exitmenuon = 1
  if timer1 ~= nil then timer1:stop() end
  if timer2 ~= nil then timer2:stop() end
  if soundl ~= nil then soundl:play() end
  screen.waitVblankStart(10)
  while exitmenuon == 1 do
    screen:clear()
    screen:print(209, 130, "------", yellowl)
    screen:print(213, 136, "SURE?", whitel)
    screen:print(209, 142, "------", yellowl)
    if exitno == 1 then screen:blit(245, 158, squarel) end
    if exityes == 1 then screen:blit(192, 158, squarel) end
    screen:print(195, 162, "YES", whitel)
    screen:print(252, 162, "NO", whitel)
    screen.flip()
    screen.waitVblankStart()
    padl = Controls.read()
    if padl:left() then
      if exitno == 1 then
        exitno = 0
        exityes = 1
      else
        exitno = 1
        exityes = 0
      end
    screen.waitVblankStart(10)
    end
    if padl:right() then
      if exitno == 1 then
        exitno = 0
        exityes = 1
      else
        exitno = 1
        exityes = 0        
      end
    screen.waitVblankStart(10)
    end
    if padl:cross() then
      if soundl ~= nil then soundl:play() end
      if timer1 ~= nil then timer1:start() end
      if timer2 ~= nil then timer2:start() end
      screen:clear()
      screen.flip()
      screen.waitVblankStart(12)
      break
    end
  end
  
end

-------ScaleImage-------
function scaleImage(newX, newY, theImage) 

  newImage = Image.createEmpty(newX, newY) 
  for x = 1, newX do 
  for y = 1, newY do 
    newImage:blit(x,y , theImage, math.floor(x*(theImage:width()/newX)),math.floor(y*(theImage:height()/newY)), 1, 1) 
  end 
  end 
  return newImage 

end

-------RotateImage-------
function rotate(image, rotateIndex)

  if rotateIndex < 0 then rotateIndex = 0 end
  if rotateIndex == 0 then return image else
  hmt = 0
  local wro = image:width()
  local hro = image:height()
  local result = Image.createEmpty(hro, wro)
  for xro=0,wro-1 do
    for yro=0,hro-1 do
      result:pixel(hro-yro-1, xro, image:pixel(xro, yro))
    end
  end
  hmt = hmt + 1
  if rotateIndex == 1 then return result end

  while hmt < rotateIndex do
    local wro = image:width()
    local hro = image:height()
    for xro=0,wro-1 do
      for yro=0,hro-1 do
        result:pixel(hro-yro-1, xro, image:pixel(xro, yro))
      end
    end
    hmt = hmt + 1
    return result
  end
  end

end

-------PrintRotated-------
function printRotated(xro, yro, text, color, rotateIndex)

  rotateIndex = math.mod(rotateIndex, 4)
  local wro = string.len(text)
  local result = Image.createEmpty(wro * 8, 8)
  result:print(0, 0, text, color)
  if rotateIndex > 0 then
    rotateIndex = rotateIndex - 1
    for iro=0,rotateIndex do
      result = rotate(result, 1)
    end
  end
  screen:blit(xro, yro, result)

end

-------PrintCentered-------
function printCentered(y, text, color)

  local tl=string.len(text) 
  local xmod = 240-((tl*10)/2) 
  screen:print(xmod, y, text, color) 

end

------------hFlip------------
function hFlip(image)

  local wro = image:width()
  local hro = image:height()
  result = Image.createEmpty(wro, hro)
    for xro=0,wro-1 do
      for yro=0,hro-1 do
        xde = wro-xro-1
        result:pixel(xde, yro, image:pixel(xro, yro))
      end
    end
  return result

end

------------vFlip------------
function vFlip(image)

  local wro = image:width()
  local hro = image:height()
  result = Image.createEmpty(wro, hro)
    for xro=0,wro-1 do
      for yro=0,hro-1 do
        yde = hro-yro-1
        result:pixel(xro, yde, image:pixel(xro, yro))
      end
    end
  return result

end

--------Fus--------
function fus(image1, image2)

  if image1:width() < image2:width() then wro = image1:width() else wro = image2:width() end
  if image1:height() < image2:height() then hro = image1:height() else hro = image2:height() end
  result = Image.createEmpty(wro, hro)
    for xro=0,wro-1 do
      for yro=0,hro-1 do
        local c1 = image1:pixel(xro, yro)
        local c2 = image2:pixel(xro, yro)
        local cs1 = c1:colors()
        local cs2 = c2:colors()
        local r1 = cs1.r
        local r2 = cs2.r
        local g1 = cs1.g
        local g2 = cs2.g
        local b1 = cs1.b
        local b2 = cs2.b
        local a1 = cs1.a
        local a2 = cs2.a
        if r1 == 255 and b1 == 255 and a1 == 0 then
          tran1 = 1
        else
          tran1 = 0
        end
        if r2 == 255 and b2 == 255 and a2 == 0 then
          tran2 = 1
        else
          tran2 = 0
        end
        if tran1 == 0 and tran2 == 0 then
          rpix = (r1 + r2) / 2
          gpix = (g1 + g2) / 2
          bpix = (b1 + b2) / 2
          transpav = (a1 + a2) / 2
        end
        if tran1 == 1 and tran2 == 0 then
          rpix = r2
          gpix = g2
          bpix = b2
          transpav = a2
        end
        if tran2 == 1 and tran1 == 0 then
          rpix = r1
          gpix = g1
          bpix = b1
          transpav = a1
        end
        if tran1 == 1 and tran2 == 1 then
          rpix = 0
          gpix = 0
          bpix = 0
          transpav = (a1 + a2) / 2
        end
        local c = Color.new(rpix, gpix, bpix, transpav)
        result:pixel(xro, yro, c)
      end
    end
  return result

end