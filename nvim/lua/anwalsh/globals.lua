-- Convenience functions largely borrowed from elsewhere

---Determine if a value of any type is empty
---@param item any
---@return boolean?
function Empty(item)
    if not item then return true end
    local item_type = type(item)
    if item_type == "string" then return item == "" end
    if item_type == "number" then return item <= 0 end
    if item_type == "table" then return vim.tbl_isempty(item) end
    return item ~= nil
end

---@generic T
---Given a table return a new table which if the key is not found will search
---all the table's keys for a match using `string.match`
---@param map T
---@return T
function P_table(map)
    return setmetatable(map, {
        __index = function(tbl, key)
            if not key then return end
            for k, v in pairs(tbl) do
                if key:match(k) then return v end
            end
        end,
    })
end

--- Convert a list or map of items into a value by iterating all it's fields and transforming
--- them with a callback
---@generic T, S
---@param callback fun(acc: S, item: T, key: string | number): S
---@param list T[]
---@param accum S?
---@return S
function Fold(callback, list, accum)
    accum = accum or {}
    for k, v in pairs(list) do
        accum = callback(accum, v, k)
        assert(accum ~= nil, "The accumulator must be returned on each iteration")
    end
    return accum
end

---A terser proxy for `nvim_replace_termcodes`
---@param str string
---@return string
function Replace_termcodes(str) return api.nvim_replace_termcodes(str, true, true, true) end
