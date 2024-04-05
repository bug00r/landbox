print(_ENV)

function print_table(tab)
    for key,val in pairs(tab) do
        local value = string.find("function,table",type(val)) ~= nil and type(val) or val 
        print("key: "..key.." val: "..value)
        if ( type(val) == "table" ) then
            print_table(val)
        end
    end
end

function raise_error(arg_)
    error("Help!!!")
end

function msghandler(msg)
    print("MSGH: "..msg)
end

print("state: "..tostring(pcall(print_table,arg))) -- tostring because pcall returns an boolean
print("state: "..tostring(pcall(raise_error,arg))) -- pcall quits silently
print("state: "..tostring(xpcall(raise_error,msghandler,arg))) -- xpcall has msg handler

