package.path = package.path .. ";../lib/?.lua"

local tblutils = require("table_utils")

print(_ENV)

function raise_error(arg_)
    error("Help!!!")
end

function msghandler(msg)
    print("MSGH: "..msg)
end

print("package table: "..tostring(pcall(tblutils.print,package))) -- tostring because pcall returns an boolean
print("arg table: "..tostring(pcall(tblutils.print,arg))) -- tostring because pcall returns an boolean
print("state: "..tostring(pcall(raise_error,arg))) -- pcall quits silently
print("state: "..tostring(xpcall(raise_error,msghandler,arg))) -- xpcall has msg handler

