--[[
    Is it possible to create an table that accepts all kind of module calls based.
    The Idea behind that is a Package Analyzer who has to simulate working code but
    only loading file.     
]] 

local mocking = mocking or {}

local MockMetaTable = {
    __add = function(self, a,b)
        print("=> __add: "..tostring(a).." + "..tostring(b))
        return self
    end,
    __index = function(self, key)
        print("=> __index: "..tostring(key))
        return self
    end,
    __call = function(self, key)
        print("=> __call: "..tostring(key))
        return self
    end
}

function mocking.new ()
    return setmetatable({}, MockMetaTable)
end

local function mock_load(name, modpath)
    -- every Module and Parameter are valid
    print("mock_load: "..name.." path: "..tostring(modpath))
    -- return load("setmetatable({}, MockMetaTable)", "blubb", 'bt', {})(name)
    assert(false, "MOCK LOADER NOT WORKING ISSUE") -- may be fixable here https://gist.github.com/stevedonovan/1297868
    return mocking.new()
end

local function print_loader()
    for k,v in pairs(package.searchers) do print("k: "..tostring(k).." v: "..tostring(v)) end
end

function mocking.add_loader()
    -- Install the loader so that it's called just before the normal Lua loader
    local foundKey = nil
    for k,v in pairs(package.searchers) do 
        if ( v == mock_load) then foundKey = k; break end
    end

    if ( foundKey == nil ) then table.insert(package.searchers, 1, mock_load) end
end

function mocking.remove_loader()
    local foundKey = nil
    for k,v in pairs(package.searchers) do 
        if ( v == mock_load) then foundKey = k; break end
    end

    if ( foundKey ~= nil ) then table.remove(package.searchers, foundKey) end
end

return mocking
