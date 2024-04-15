package.path = package.path .. ";../../libs/?.lua" .. ";libs/?.lua"

local lib1 = require("lib1")
local lib2 = require("lib2")

print("lib1"..tostring(lib1))
print("lib2"..tostring(lib2))

lib1.print(tostring(lib1.calc(1,2,3)))
lib2.print(tostring(lib2.calc(4,5,6)))
