local Data = {}
Data.cache = getgc(true)
Data.tables = {}
for i, v in pairs(Data.cache) do
    if type(v) == 'table' then
        table.insert(Data.tables, v)
    end
end

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
