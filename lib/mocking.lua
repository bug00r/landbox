--[[
    Is it possible to create an table that accepts all kind of module calls based.
    The Idea behind that is a Package Analyzer who has to simulate working code but
    only loading file.     
]] 

local mocking = mocking or {}

local MockMetaTable = {
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

local function mock_load(modulename)
    -- every Module and Parameter are valid
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

    if ( foundKey == nil ) then table.insert(package.searchers, 2, mock_load) end
end

function mocking.remove_loader()
    local foundKey = nil
    for k,v in pairs(package.searchers) do 
        if ( v == mock_load) then foundKey = k; break end
    end

    if ( foundKey ~= nil ) then table.remove(package.searchers, foundKey) end
end

return mocking
