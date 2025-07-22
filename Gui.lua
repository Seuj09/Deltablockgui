local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")

-- 🔒 Block all inputs
local function blockInput(_, _, _)
	return Enum.ContextActionResult.Sink
end
contextActionService:BindAction("BlockAllInput", blockInput, false, unpack(Enum.PlayerActions:GetEnumItems()))
userInputService.ModalEnabled = true

-- 🖥️ GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlockedWarningGUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 1000
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
frame.BackgroundTransparency = 0
frame.ZIndex = 10
frame.Parent = screenGui

-- 🚫 Main Warning
local warningText = Instance.new("TextLabel")
warningText.Size = UDim2.new(1, 0, 0.2, 0)
warningText.Position = UDim2.new(0, 0, 0.25, 0)
warningText.BackgroundTransparency = 1
warningText.Text = "🚫 This script has been blocked by Delta 🚫"
warningText.TextColor3 = Color3.fromRGB(255, 0, 0)
warningText.Font = Enum.Font.GothamBlack
warningText.TextScaled = true
warningText.TextWrapped = true
warningText.ZIndex = 11
warningText.Parent = frame

-- ℹ️ Subtext
local subText = Instance.new("TextLabel")
subText.Size = UDim2.new(1, 0, 0.1, 0)
subText.Position = UDim2.new(0, 0, 0.42, 0)
subText.BackgroundTransparency = 1
subText.Text = "Please use KRNL or Codex instead."
subText.TextColor3 = Color3.fromRGB(255, 255, 255)
subText.Font = Enum.Font.Gotham
subText.TextScaled = true
subText.TextWrapped = true
subText.ZIndex = 11
subText.Parent = frame

-- 🔘 KRNL Button
local krnlButton = Instance.new("TextButton")
krnlButton.Size = UDim2.new(0.4, 0, 0.08, 0)
krnlButton.Position = UDim2.new(0.1, 0, 0.55, 0)
krnlButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
krnlButton.TextColor3 = Color3.new(1, 1, 1)
krnlButton.Font = Enum.Font.GothamBold
krnlButton.Text = "🔗 Get KRNL"
krnlButton.TextScaled = true
krnlButton.ZIndex = 11
krnlButton.Parent = frame

-- 🔘 Codex Button
local codexButton = Instance.new("TextButton")
codexButton.Size = UDim2.new(0.4, 0, 0.08, 0)
codexButton.Position = UDim2.new(0.5, 0, 0.55, 0)
codexButton.BackgroundColor3 = Color3.fromRGB(0, 180, 140)
codexButton.TextColor3 = Color3.new(1, 1, 1)
codexButton.Font = Enum.Font.GothamBold
codexButton.Text = "🔗 Get Codex"
codexButton.TextScaled = true
codexButton.ZIndex = 11
codexButton.Parent = frame

-- 📎 Link Display
local linkLabel = Instance.new("TextLabel")
linkLabel.Size = UDim2.new(1, 0, 0.05, 0)
linkLabel.Position = UDim2.new(0, 0, 0.65, 0)
linkLabel.BackgroundTransparency = 1
linkLabel.Text = ""
linkLabel.TextColor3 = Color3.fromRGB(0, 255, 127)
linkLabel.Font = Enum.Font.Gotham
linkLabel.TextScaled = true
linkLabel.TextWrapped = true
linkLabel.ZIndex = 11
linkLabel.Parent = frame

-- 🖱️ Click Actions
krnlButton.MouseButton1Click:Connect(function()
	linkLabel.Text = "📎 KRNL Download: https://krnl.place"
end)

codexButton.MouseButton1Click:Connect(function()
	linkLabel.Text = "📎 Codex Download: https://codex.lol"
end)
