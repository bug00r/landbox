package.path = package.path .. ";../lib/?.lua"

local mock = require("mocking")
local tblutils = require("table_utils")

local MockObj = mock.new()

tblutils.print(mock)
tblutils.print(MockObj)

-- Here we should noch have any Problems

MockObj.blubb()
local bla = MockObj.HAHA
local bla2 = MockObj["HAHA"]

-- Enable MockLoader, with multiple protection
mock.add_loader()
mock.add_loader()
mock.add_loader()

-- Disable Mockloader, with multiple protection
mock.remove_loader()
mock.remove_loader()
mock.remove_loader()