-- Convenience functions largely borrowed from elsewhere

---Determine if a value of any type is empty
---@param item any
---@return boolean?
function anwalsh.empty(item)
    if not item then return true end
    local item_type = type(item)
    if item_type == 'string' then return item == '' end
    if item_type == 'number' then return item <= 0 end
    if item_type == 'table' then return vim.tbl_isempty(item) end
    return item ~= nil
end

---@generic T
---Given a table return a new table which if the key is not found will search
---all the table's keys for a match using `string.match`
---@param map T
---@return T
function anwalsh.p_table(map)
    return setmetatable(map, {
        __index = function(tbl, key)
            if not key then return end
            for k, v in pairs(tbl) do
                if key:match(k) then return v end
            end
        end,
    })
end
