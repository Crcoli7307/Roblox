--!nolint DeprecatedGlobal
--!nolint BuiltinGlobalWrite

local Settings = {}
Settings.List = {}

function Settings:get(key)
    return self.List[key]
end

function Settings:set(key, value)
    self.List[key] = value
    return true
end

function Settings:default(list)
    for _, key in pairs(list) do
        self:set(key, false)
    end
    return true
end

return Settings
