package.path = package.path .. ";../lib/?.lua"
local tblutils = require("table_utils")

print("package: ")
tblutils.print(package)

print("pkg loaded: ")
tblutils.print(package.loaded)

print("pkg preload: ")
tblutils.print(package.preload)

print("pkg searchers: ")
for k,v in pairs(package.searchers) do
    print("k: "..k.." v: "..tostring(v))
end
