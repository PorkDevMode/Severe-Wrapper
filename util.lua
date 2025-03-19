local util = {

}

--[[
Offsets table
]]--
util.offsets = {
    primitive = 0x168,
    
    sizex = 0x2b0,
    sizey = 0x2b4,
    sizez = 0x2b8
}

--[[
Takes: int, int, int
Returns: Table: {x, y, z}
]]--
function util.Vector3(x, y, z)
    return {x = x, y = y, z = z}
end

--[[
Asyncronous cause no return value.
Takes: Part, Vector3 {x, y, z}
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
Returns: Table: {x, y, z}
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

return util
