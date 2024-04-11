local tblutils = {}

function tblutils.print(tab, recursive)
    local dorecursive = type(recursive) == "boolean" and recursive or false
    print("recursive: "..tostring(dorecursive))
    for key,val in pairs(tab) do
        local value = string.find("function,table",type(val)) and type(val) or val 
        print("key: "..key.." val: "..tostring(value))
        if ( type(val) == "table" and dorecursive ) then
            tblutils.print(val, dorecursive)
        end
    end
end

return tblutils