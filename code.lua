if _G.sourcelib then return _G.sourcelib end

link = "https://raw.githubusercontent.com/%s/%s/code.lua"
paste = "https://pastebin.com/raw/%s"

local module = {}
_G.sourcelib = module

module.__index = module
module.__lib = {}

function module:require(package, version, update)
    local link = link:format(package, version or "main")
    if self.__lib[link] and update ~= true then return self.__lib[link] end

    self.__lib[link] = loadstring(game:HttpGet(link))()
    return self.__lib[link]
end

function module:test(pin)
    return loadstring(game:HttpGet(paste:format(pin)))()
end

return setmetatable({}, module)
