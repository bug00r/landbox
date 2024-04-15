local sublib1 = {}

function sublib1.print(text)
    print("sublib1.print: "..text)
end

function sublib1.add(a,b)
    return a + b
end

return sublib1