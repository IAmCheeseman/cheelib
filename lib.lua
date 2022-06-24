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

-- Initializing objects makes sure that:
--   The `init()` function is called.
--   The object has add_child and a children table.
--   That the object's children will be initalized as well.
local function initalize_object(obj)
    obj.add_child = add_child
    if not obj.children then
        obj.children = {}
    else 
        for i, obj in ipairs(obj.children) do
            initalize_object(obj)
        end
    end
    -- Calling the init function at the end so the object can
    -- use `add_child()` in the init.
    if obj.init then obj:init() end
end

-- This function is applied to every object added to the tree,
-- so long as it's initalized by `initalize_object`
local function add_child(self, obj)
    table.insert(self.children, obj)
end

local function add_object(obj)
    initalize_object(obj)
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


local function update_children(children, dt)
    for i, object in ipairs(children) do
        if object.update then
            object:update(dt)
        end
        update_children(object.children, dt)
    end
end

local function update_objects(dt)
    if game.paused then return end
    update_children(objects, dt)
end

local function draw_children(children)
    for i, object in ipairs(objects) do
        if object.draw then
            object:draw()
        end
        draw_children(object.children)
    end
end

local function draw_objects()
    draw_children(objects) 
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