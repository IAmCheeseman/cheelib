chee=require("cheelib")


-- This file would be in the parent directory of this repo,
-- which would be cloned in your project directory.
-- The reason it's made like this is so you can update it
-- whenever you need.


-- Toggles pausing
function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       chee.game.paused = not chee.game.paused
    end
end


function love.load()
    -- Creating an object that moves right for half a second
    -- and then removes itself.
    chee.add_object({
        position=vec.new(0, 100),
        lifetime=timer.new(0.5),
        init=function(self)
            chee.add_child(self, self.lifetime)
        end,
        update=function(self, dt)
            self.position.x = self.position.x + dt * 500
            if self.lifetime:is_over() then
                chee.remove_object(self)
            end
        end,
        draw=function(self)
            draw.setColor(color.new(0.5, 0.5, 1))
            draw.circle("fill", self.position, 16)
        end
    })
end

-- You need to call `chee.update_objects()` to process objects.
function love.update(dt)
    chee.update_objects(dt)
end

-- You need to call `chee.draw_objects()` to draw objects.
function love.draw()
    chee.draw_objects()
end