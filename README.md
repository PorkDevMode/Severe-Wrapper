# Memory utility setup:

How to use:
go to github link and make a folder named data at C:/v2. Put util.lua in that data version
in other scripts do or use the loadstring

-- Scroll down for the keybind library information
***Example:***

```
local util = loadstring(readfile("util.lua"))() -- local file
local util = loadstring(game:HttpGet("https://raw.githubusercontent.com/PorkDevMode/Severe-Wrapper/refs/heads/main/util.lua"))() -- loadstring

util.settransparency(game.Workspace.Part, 0.5)
```
***Memory util documentation:***
```
--[[
Takes: int, int, int
Returns: Table: {x = int, y = int, z = int}
]]--
util.Vector3(69, 420, 69)

--[[
Takes: int, int
Returns: Table: {x = int, y = int}
]]--
util.Vector2(x, y)

--[[
Asyncronous cause no return value.
Takes: Part, Vector3 {x = int, y = int, z = int}
Returns: None
]]--
util.setsize(part, sizevector)

--[[
Takes: Part
Returns: Table: {x = int, y = int, z = int}
]]--
util.getsize(part)

--[[
Asyncronous because no return value needed
Takes: Part, Transparency Value
Returns: None
]]--
util.settransparency(part, value)

--[[
Takes: Part
Returns: Float
]]--
util.gettransparency(part)

--[[
Takes: Humanoid
Returns: Float
]]--
util.gethipheight(humanoid)

--[[
Asyncronous no need for a return value
Takes: Humanoid, Number
Returns: None
]]--
util.sethipheight(humanoid)

--[[
Takes: Humanoid
Returns: Float
]]--
util.getjumppower(humanoid)

--[[
Asyncronous no need for a return value
Takes: Humanoid, Jumppower value
Returns: None
]]--
util.setjumppower(humanoid, value)

CURRENT OFFSETS:
    primitive = 0x168,
    parent = 0x50,
    
    sizex = 0x2b0,
    sizey = 0x2b4,
    sizez = 0x2b8,

    transparency = 0xf0,
    hipheight = 0x1a0,
    jumppower = 0x1ac,
    maxslopeangle = 0x1b8
```

# Keybind library setup

How to use:
go to github link and make a folder named data at C:/v2. Put keybind.lua in that data version
in other scripts do or use the loadstring

***Example:***

```
local keybind = loadstring(readfile("keybind.lua"))() -- local file
local keybind = loadstring(game:HttpGet("https://raw.githubusercontent.com/PorkDevMode/Severe-Wrapper/refs/heads/main/keybind.lua"))() -- loadstring

local yes = true

local function setyes()
    yes = false
end

keybind.addbind(setyes, "Space", 0.4) -- our callback function, our key, our delay it waits after executing said function so it does not spam
keybind.start() -- start our keybind listener
keybind.delbind("Space") -- delete our keybind
keybind.stop() -- stop the keybind listener
```
***Keybind util documentation:***
```
--[[
Takes: function, keycode (string), delay (int)
Returns: bool
]]--
keybind.addbind(bindfunction, key, delay)

--[[
Takes: keycode (string)
Returns: bool
]]--
keybind.delbind(key)

--[[
Takes: None
Returns: None
]]--
keybind.start()

--[[
Takes: None
Returns: None
]]--
keybind.stop()
```
