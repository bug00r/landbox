package.path = package.path .. ";../../lib/?.lua"

local mock = require("mocking")
local tblutils = require("table_utils")

local ConfigLoaderMeta = {
    __call = function (self, configfile) 

        print("self:"..tostring(self).."read config: "..tostring(configfile))

        local configEnv = {} -- to keep it separate from the global env
        local f,err = loadfile(configfile, "t", configEnv)
        if f then
            f()
        else
            print(err)
        end

        return configEnv
    end
}

local ConfigLoader = setmetatable({}, ConfigLoaderMeta)

local ArgumentsMeta = {
    __call = function (self, arguments) 
        local args = {}

        print("self: "..tostring(self))
        print("args: "..tostring(arguments))
        if ( #arguments >= 1 ) then
            args.config = arguments[1]
        end

        return args
    end
}

local Arguments = setmetatable({}, ArgumentsMeta)

local args = Arguments(arg)

local conf = ConfigLoader(args.config)

print("config: "..tostring(conf))
tblutils.print(conf, true)

-- Enable MockLoader, with multiple protection
mock.add_loader()

print("parse module: "..conf.build.app.path)
print("path before: "..package.path)
--print("ENV")
--tblutils.print(_ENV)

local mod,err = loadfile(conf.build.app.path, "t", _ENV)
if mod then
    mod()
else
    print("module parse: "..err)
end

print("path after: "..package.path)
--print("ENV")
--tblutils.print(_ENV)
-- Disable Mockloader, with multiple protection
mock.remove_loader()
