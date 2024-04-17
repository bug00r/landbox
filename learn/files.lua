-- reading dir

local f = io.popen("finds /c/dev/src/lua/projects/landbox/learn/modules/test_app -maxdepth 1")
for line in f:lines() do
    print(line)
end