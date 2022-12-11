-- Load the core library
core = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/core/main/core.lua'))()
core:gModule('UiLibrary'); core:stopRunningInstance(); core:registerSession();
local MainWindow = library:AddWindow('[FREE ADMIN] GUI - github.com/brownfieldd00')

-- Add a tab to the main window
local MainTab = MainWindow:AddTab('Cool stuff')

-- Add a button to the main tab
local Button1 = MainTab:AddButton('spawn all gears (slow down server)', function()
    -- Find all ClickDetectors in the workspace that have a NumberValue descendant
    local clickDetectors = workspace:GetDescendants()
        :FindAll(function(descendant)
            return descendant:IsA('ClickDetector') and descendant.Parent:FindFirstChildOfClass('NumberValue')
        end)

    -- Fire the click detectors
    for _, detector in pairs(clickDetectors) do
        fireclickdetector(detector, 3)
    end
end)
