chee=require("cheelib/lib")

-- Toggles pausing
function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       chee.game.paused = not chee.game.paused
    end
end


function love.load()
    -- An object that counts down.
    chee.add_object(
        {
            count_down=timer.new(5),
            init=function(self)
                chee.add_object(self.count_down)
            end,
            update=function(self, dt)
                if not self.count_down:is_over() then
                    print(self.count_down.time_left)
                end
            end
        }
    )
end

-- You need to call `chee.update_objects()` to process objects.
function love.update(dt)
    chee.update_objects(dt)
end

-- You need to call `chee.draw_objects()` to draw objects.
function love.draw()
    chee.draw_objects()
end