local keybind = {}

keybind.bindfunctions = {}
keybind.enabled = true

--[[
Takes: function, keycode (string), delay (int)
Returns: bool
]]--
function keybind.addbind(bindfunction, key, delay)
    if type(bindfunction) ~= "function" or bindfunction == nil or delay == nil then
        print("Must pass a function to addbind!")
        return false
    end
    if keybind.bindfunctions[key] then
        print("This key already exists! delete with delbind")
        return false
    end
    keybind.bindfunctions[key] = {func = bindfunction, delay = delay}
    return true
end

--[[
Takes: keycode (string)
Returns: bool
]]--
function keybind.delbind(key)
    if not keybind.bindfunctions[key] then
        print("This keybind does not exist!")
        return true
    end
    keybind.bindfunctions[key] = nil
end

--[[
Takes: None
Returns: None
]]--
function keybind.start()
    spawn(function()
        while keybind.enabled do
            if #keybind.bindfunctions ~= 0 and isrbxactive() then
                local pressedkeys = getpressedkeys()
                for i, v in pairs(pressedkeys) do
                    if keybind.bindfunctions[v] then
                        keybind.bindfunctions[v].func()
                        wait(keybind.bindfunctions[v].delay)
                    end
                end
                wait()
            end
        end
    end)
end

--[[
Takes: None
Returns: None
]]--
function keybind.stop()
    keybind.enabled = false
end

return keybind
