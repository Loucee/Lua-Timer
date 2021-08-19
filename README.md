# timer.lua
This is a stand-alone version of the timer module in my Löve2D state-manager [Soupy](https://github.com/Loucee/Soupy)

It's only one file, easy to use, and doesn't require any external modules.

## Usage
Step 1: Place the "timer.lua" file somewhere in your source folder (e.g. "/lib/timer.lua")

Step 2: Require the library in your application:
```lua
timer = require("lib.timer")
```

Step 3: Make sure to update the timers, simply pass the deltatime from your update loop to Timer's update function. (example shown uses Löve2D)
```lua
function love.update(dt)
  timer.update(dt)
end
```

Step 4: Create timers!
```lua
local myTimer = timer.new(5, true, function()
  print("Hi!")
end)

-- Output:
-- Hi!
-- Hi!
-- Hi!
-- ...
```

## Documentation
**timer.new(interval, repeats, callback, args)**<br/>
This function creates a new timer object, the *interval* is how long to wait before firing the *callback* function in seconds, and *repeats* is whether or not to keep firing the callback function every <interval> seconds.
  
Args is for any parameters you want to pass to the callback functions and is completely optional:
```lua
local myTimer = timer.new(5, false, function(a, b)
  print(a .. " " .. b)
end, "Hello,", "World!")
  
-- Output:
-- Hello, World!
```
  
The timer object is also returned but can be ignored unless needed to stop the timer for any reason.
  
**timer.stop(t)**<br/>
Stops the passed timer object.

```lua
local myTimer = timer.new(5, true, function()
  print("Hi!")
end)
  
timer.new(20, false, function()
  timer.stop(myTimer)
end)

-- Output:
-- Hi!
-- Hi!
-- Hi!
-- Hi!
---- 20 seconds passed so myTimer is stopped
```

## License
MIT
