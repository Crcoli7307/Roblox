local module = {}
module.defaultState = false
function module.idled()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end

function module:setState(bool_state)
    if bool_state == self.defaultState then return end
    if bool_state then
        self.connection = core:gPlayer().Idled:Connect(self.idled)
    else
        self.connection:Disconnect()
        self.connection = nil
    end
    self.defaultState = bool_state
    return true
end

module:setState(module.defaultState)
return module
