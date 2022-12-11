local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Weights = Character:WaitForChild('Weights')
Weights.E:FireServer()
