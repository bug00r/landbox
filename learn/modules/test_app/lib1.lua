package.path = package.path .. ";libs/sublibs/?.lua"

local sublib1 = require("sublib1")

local lib1 = lib1 or {}

function lib1.print(text)
    print("lib1.print: "..text)
end

function lib1.calc(a, b, c)
    local result = sublib1.add(a,b) + c
    print("lib1.calc: "..result)
    return result
end

return lib1