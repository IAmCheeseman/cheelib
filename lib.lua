require("cheelib/include")

-- This is a table which holds global game variables.
local game = {
    paused = false,
}

local collisions = {}
local objects = {}


-- Setting aliases
draw = love.graphics
kb = love.keyboard
mouse = love.mouse


-- Object management functions.

local function add_object(obj)
    if obj.init then obj:init() end
    table.insert(objects, obj)
end

local function remove_object(obj)
    for i=1,#objects do
        if objects[i] == object then
            table.remove(objects, i)
            return
        end
    end
end


local function add_collision_layer()

end

local function add_collision_layers(amt)

end


local function update_objects(dt)
    if game.paused then return end
    for i, object in ipairs(objects) do
        if object.update then object:update(dt) end
    end
end

local function draw_objects()
    for i, object in ipairs(objects) do
        if object.draw then object:draw() end
    end
end

return {
    game=game,
    add_object=add_object,
    remove_object=remove_object,
    update_objects=update_objects,
    draw_objects=draw_objects,
    add_collision_layer=add_collision_layer,
    add_collision_layers=add_collision_layers,
}