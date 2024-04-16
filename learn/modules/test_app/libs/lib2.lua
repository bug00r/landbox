package.path = package.path .. ";sublibs/?.lua"

local sublib2 = require("sublib2")

local lib2 = lib2 or {}

function lib2.print(text)
    print("lib2.print: "..text)
end

function lib2.calc(a, b, c)
    local result = sublib2.add(a,b) + c
    print("lib2.calc: "..result)
    return result
end

return lib2