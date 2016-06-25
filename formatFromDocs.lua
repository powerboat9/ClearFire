local name = "operations"

local str = [[+     -     *     /     %     ^     #
     ==    ~=    <=    >=    <     >     =
     (     )     {     }     [     ]
     ;     :     ,     .     ..    ...]]

local _, columns = str:gsub("\n.*", ""):gsub("(%s*)", "%1")
columns = columns + 1

local vs = {}
for v = str:gfind("%S*") do vs[#vs + 1] = v end

local newStr = "local " .. name .. " = {"

for k, v in ipairs(vs) do
    if (k % columns) == 1 then
        newStr = newStr .. ",\n    "
    else
        newStr = newStr .. ", "
    end
    newStr = newStr .. v
end

print(newStr)
