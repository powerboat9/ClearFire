local data
do
    local path = ...
    local file = fs.open(path, "r")
    data = file.readAll()
    file.close()
end

local keywords = {
    ["and"] = true, ["break"] = true, ["do"] = true, ["else"] = true, ["elseif"] = true,
    ["end"] = true, ["false"] = true, ["for"] = true, ["function"] = true, ["if"] = true,
    ["in"] = true, ["local"] = true, ["nil"] = true, ["not"] = true, ["or"] = true,
    ["repeat"] = true, ["return"] = true, ["then"] = true, ["true"] = true, ["until"] = true,
    ["while"] = true
}

local operations = {
    ["+"] = true, ["-"] = true, ["*"] = true, ["/"] = true, ["%"] = true, ["^"] = true, ["#"] = true,
    ["=="] = true, ["~="] = true, ["<="] = true, [">="] = true, ["<"] = true, [">"] = true, ["="] = true,
    ["("] = true, [")"] = true, ["{"] = true, ["}"] = true, ["["] = true, ["]"] = true, [";"] = true,
    [":"] = true, [","] = true, ["."] = true, [".."] = true, ["..."] = true
}

local lines = {}
local word = ""

local isInString, isEscaping = fasle, false
for v = data:gfind(".") do
    if v:find("%s") and (not isInString) then
        lines[#lines + 1] = {word
        word = ""
