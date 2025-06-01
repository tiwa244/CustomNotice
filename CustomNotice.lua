local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Prevent re-execution
if PlayerGui:FindFirstChild("FreakUI") then return end

-- UI Setup
local FreakUI = Instance.new("ScreenGui")
FreakUI.Name = "FreakUI"
FreakUI.IgnoreGuiInset = true
FreakUI.ResetOnSpawn = false
FreakUI.Parent = PlayerGui

-- Base Text
local baseText = "Hello World!"

-- Text size calculation
local tempLabel = Instance.new("TextLabel")
tempLabel.Size = UDim2.new(0, 0, 0, 0)
tempLabel.Font = Enum.Font.SourceSansBold
tempLabel.TextSize = 28
tempLabel.Text = baseText
tempLabel.Parent = FreakUI
local textSize = tempLabel.TextBounds
tempLabel:Destroy()

-- Frame
local Frame = Instance.new("Frame")
Frame.AnchorPoint = Vector2.new(0.5, 0)
Frame.Position = UDim2.new(0.5, 0, -0.2, 0)
Frame.Size = UDim2.new(0, textSize.X + 40, 0, textSize.Y + 20)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 0
Frame.Parent = FreakUI

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Frame

-- Text Label
local Label = Instance.new("TextLabel")
Label.Size = UDim2.new(1, 0, 1, 0)
Label.BackgroundTransparency = 1
Label.Font = Enum.Font.SourceSansBold
Label.TextSize = 28
Label.TextWrapped = true
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.Text = baseText
Label.Parent = Frame

-- Slide in
TweenService:Create(Frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	Position = UDim2.new(0.5, 0, 0.05, 0)
}):Play()

-- Wait 3 seconds
wait(3)

-- Slide out
TweenService:Create(Frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
	Position = UDim2.new(0.5, 0, -0.2, 0)
}):Play()

wait(0.35)
FreakUI:Destroy()
