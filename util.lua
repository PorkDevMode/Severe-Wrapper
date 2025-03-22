local util = {

}

--[[
Offsets table
]]--
util.offsets = {
    primitive = 0x168,
    parent = 0x50,
    
    sizex = 0x2b0,
    sizey = 0x2b4,
    sizez = 0x2b8,

    transparency = 0xf0,
    hipheight = 0x1a0
}

--[[
Takes: int, int, int
Returns: Table: {x = int, y = int, z = int}
]]--
function util.Vector3(x, y, z)
    return {x = x, y = y, z = z}
end

--[[
Takes: int, int
Returns: Table: {x = int, y = int}
]]--
function util.Vector2(x, y)
    return {x = x, y = y}
end

--[[
Asyncronous cause no return value.
Takes: Part, Vector3 {x = int, y = int, z = int}
Returns: None
]]--
function util.setsize(part, sizevector)
    spawn(function()
        if sizevector.x and sizevector.y and sizevector.z then
            if not part then
                print("Part is invalid!")
            end
            local primptr = part:GetMemoryValue(0x168, "qword")
            local ptrtable = pointer_to_table_data(primptr)
    
            ptrtable:SetMemoryValue(util.offsets.sizex, "float", sizevector.x)
            ptrtable:SetMemoryValue(util.offsets.sizey, "float", sizevector.y)
            ptrtable:SetMemoryValue(util.offsets.sizez, "float", sizevector.z)
        else
            print("Incorrect vector! make sure its a table with a x = value, y = value, z = value")
        end
    end)
end

--[[
Takes: Part
Returns: Table: {x = int, y = int, z = int}
]]--
function util.getsize(part)
    if not part then
        print("Part is invalid!")
        return nil
    end

    local primptr = part:GetMemoryValue(0x168, "qword")
    local ptrtable = pointer_to_table_data(primptr)

    return {
        x = ptrtable:GetMemoryValue(util.offsets.sizex, "float"),
        y = ptrtable:GetMemoryValue(util.offsets.sizey, "float"),
        z = ptrtable:GetMemoryValue(util.offsets.sizez, "float")
    }
end

--[[
Asyncronous because no return value needed
Takes: Part, Transparency Value
Returns: None
]]--
function util.settransparency(part, value)
    spawn(function()
        if not part then
            print("Part is invalid!")
        end

        if value > 1 or value < 0 then
            print("Values is below or higher than 0 or 1, use values between 1 - 0.")
        end

        setmemoryvalue(part, util.offsets.transparency, "float", value)
    end)
end

--[[
Takes: Part
Returns: Float
]]--
function util.gettransparency(part)
    if not part then
        print("Part is invalid!")
        return nil
    end

    local transparencyvalue = part:GetMemoryValue(util.offsets.transparency, "float")

    return transparencyvalue
end

--[[
Takes: Humanoid
Returns: Float
]]--
function util.gethipheight(humanoid)
    if not humanoid then
        print("Humanoid is invalid!")
        return nil
    end

    local hipheight = humanoid:GetMemoryValue(util.offsets.hipheight, "float")
    if hipheight then
        return hipheight
    else
        print("Could not find hipheight")
        return nil
    end
end

--[[
Asyncronous no need for a return value
Takes: Humanoid, Hipheight value
Returns: None
]]--
function util.sethipheight(humanoid, value)
    spawn(function()
        if not humanoid then
            print("Humanoid is invalid!")
            return nil
        end

        setmemoryvalue(humanoid, util.offsets.hipheight, "float", value)
    end)
end

return util
