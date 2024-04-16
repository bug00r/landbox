package.path = package.path .. ";../../libs/?.lua" .. ";libs/?.lua"

local lib1 = require("lib1")
local lib2 = require("lib2")

--[[print("lib1: "..tostring(lib1).." #: "..#lib1)
print("lib2: "..tostring(lib2).." #: "..#lib2)
for k,v in pairs(getmetatable(lib1) or {}) do print("mk: "..tostring(k).." mv: "..tostring(v)) end
for k,v in pairs(getmetatable(lib2) or {}) do print("mk: "..tostring(k).." mv: "..tostring(v)) end
for k,v in pairs(lib1) do print("k: "..tostring(k).." v: "..tostring(v)) end
for k,v in pairs(lib2) do print("k: "..tostring(k).." v: "..tostring(v)) end
--]]
lib1.print(tostring(lib1.calc(1,2,3)))
lib2.print(tostring(lib2.calc(4,5,6)))
