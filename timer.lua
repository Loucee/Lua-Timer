
--[[
	Author: Lucy van Sandwijk
	Website: https://loucee.dev
	GitHub: https://github.com/Loucee/Lua-Timer
]]

local timer = { }
local _timers = { }

function timer.update(dt)
	for i = #_timers, 1, -1 do
		local t = _timers[i]

		t._timePassed = t._timePassed + dt

		if (t._timePassed >= t.interval) then
			t.callback(unpack(t.args))

			if (t.repeats) then
				t._timePassed = 0
			else
				table.remove(_timers, i)
			end
		end
	end
end

function timer.new(interval, repeats, callback, ...)
	local t = {
		_identifier = tostring(callback),
		_timePassed = 0,
		interval = interval,
		repeats = repeats,
		callback = callback,
		args = {...}
	}

	table.insert(_timers, t)
	return t
end

function timer.stop(t)
	for index, timer in pairs(_timers) do
		if timer._identifier == t._identifier then
			table.remove(_timers, index)
		end
	end
end

--------------------------------------------------------------------------------

return timer
