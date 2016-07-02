local Entity = require("src/entities/entity.lua")
local constants = require("src/constants.lua")

local EntityMob = {}
EntityMob.__index = EntityMob

setmetatable(EntityMob, {
    __index = Entity,
    __call = function (cls, ...)
        local self = setmetatable({}, cls)
        self:_init(...)
        return self
    end,
})

function EntityMob:_init(id, x, y, type)
    Entity._init(self, x, y)

    self.id = id
    self.type = type
end

function EntityMob:getType()
    return "BaseMob"
end

function EntityMob:inspect(token)
    http.request(constants.server .. "game/entity/" .. textutils.urlEncode(self.id) .. "/inspect", "token=" .. textutils.urlEncode(token))
end

function EntityMob:interact(token)
    http.request(constants.server .. "game/entity/" .. textutils.urlEncode(self.id) .. "/interact", "token=" .. textutils.urlEncode(token))
end

function EntityMob:getSymbol()
    if self.type == "bat" then
        return math.floor(os.clock()) % 2 == 0 and "^" or "v"
    elseif self.type == "rat" then
        return "~"
    elseif self.type == "goblin" then
        return "\5"
    elseif self.type == "dwarf" then
        return "\6"
    elseif self.type == "lizard" then
        return "Y"
    elseif self.type == "serpent" then
        return "\36"
    end

    return "\164"
end

function EntityMob:getColour()
    if self.type == "bat" then
        return colours.brown
    elseif self.type == "rat" then
        return colours.brown
    elseif self.type == "goblin" then
        return colours.green
    elseif self.type == "dwarf" then
        return colours.orange
    elseif self.type == "lizard" then
        return colours.orange
    elseif self.type == "serpent" then
        return colours.green
    end

    return colours.red
end

return EntityMob