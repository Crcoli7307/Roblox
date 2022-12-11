local Data = {}

function Data:deepSearch(key)
    local cache = getgc(true)
    for i, v in pairs(cache) do
        if type(v) == 'table' and rawget(v, key) then
            return v
        end
    end
    return nil
end

return Data
