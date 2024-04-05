local MyMeta = {
    __name = "blubb",
    __call = function (self, msg) 
        print("Message: "..tostring(msg).." on "..tostring(self))
    end,
    __close = function(value, errmsg)
        print("CLOSE!!! ".." value: "..tostring(value).." err: "..tostring(errmsg))
    end
}

local MyObj = setmetatable({}, MyMeta)

print("MyObj: "..tostring(MyObj))
MyObj("wtf!!!")

do
    print("Obj created!!")
    local MyObj <close> = setmetatable({}, MyMeta)
    print("Obj reached Scope")
end

print("EOF Script")

print("2^8: "..tostring(math.floor(2^8)))