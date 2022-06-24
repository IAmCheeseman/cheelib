

local function is_over(self) return self.time_left <= 0 end
local function start(self, time)
    self.total_time = time or self.total_time

    self.time_left = self.total_time
end


local function update(self, dt)
    self.time_left = self.time_left - dt
end


local function new(time)
    return {
        total_time=time,
        time_left=time,
        update=update,
        is_over=is_over,
    }
end

return {
    new=new
}