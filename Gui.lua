-- Blocked Script Content (shown to user)
local blockedScript = [[
loadstring(game:HttpGet("https://pastefy.app/ZHsftk5E/raw"))()
]]

-- Disable clicking in-game elements
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("TextButton") or v:IsA("ImageButton") then
        v.Active = false
    end
end

-- Create GUI
local CoreGui = game:GetService("CoreGui")
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "DeltaBlockNotice"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 9999

-- Fullscreen Dark Background
local bg = Instance.new("Frame", gui)
bg.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BorderSizePixel = 0

-- Header Text
local title = Instance.new("TextLabel", bg)
title.Text = "⚠️ This script is not working on Delta ⚠️"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 80, 80)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0.05, 0)

-- Blocked Script Display (centered)
local blockedDisplay = Instance.new("TextLabel", bg)
blockedDisplay.Text = blockedScript
blockedDisplay.Font = Enum.Font.Code
blockedDisplay.TextScaled = false
blockedDisplay.TextSize = 18
blockedDisplay.TextColor3 = Color3.fromRGB(220, 220, 220)
blockedDisplay.BackgroundTransparency = 1
blockedDisplay.Size = UDim2.new(0.9, 0, 0.2, 0)
blockedDisplay.Position = UDim2.new(0.05, 0, 0.25, 0)
blockedDisplay.TextWrapped = true
blockedDisplay.TextXAlignment = Enum.TextXAlignment.Center
blockedDisplay.TextYAlignment = Enum.TextYAlignment.Top

-- KRNL Button
local krnlBtn = Instance.new("TextButton", bg)
krnlBtn.Text = "Download KRNL"
krnlBtn.Font = Enum.Font.GothamBold
krnlBtn.TextColor3 = Color3.new(1, 1, 1)
krnlBtn.BackgroundColor3 = Color3.fromRGB(70, 120, 255)
krnlBtn.Size = UDim2.new(0, 180, 0, 50)
krnlBtn.Position = UDim2.new(0.5, -190, 0.5, 0)
krnlBtn.TextScaled = true

-- Codex Button
local codexBtn = Instance.new("TextButton", bg)
codexBtn.Text = "Download Codex"
codexBtn.Font = Enum.Font.GothamBold
codexBtn.TextColor3 = Color3.new(1, 1, 1)
codexBtn.BackgroundColor3 = Color3.fromRGB(100, 60, 220)
codexBtn.Size = UDim2.new(0, 180, 0, 50)
codexBtn.Position = UDim2.new(0.5, 10, 0.5, 0)
codexBtn.TextScaled = true

-- KRNL Link
local krnlLink = Instance.new("TextLabel", bg)
krnlLink.Text = "https://krnl.place/download"
krnlLink.Font = Enum.Font.Gotham
krnlLink.TextColor3 = Color3.fromRGB(255, 255, 255)
krnlLink.BackgroundTransparency = 1
krnlLink.TextScaled = true
krnlLink.Size = UDim2.new(1, 0, 0.08, 0)
krnlLink.Position = UDim2.new(0, 0, 0.62, 0)
krnlLink.Visible = false

-- Codex Link
local codexLink = Instance.new("TextLabel", bg)
codexLink.Text = "https://codex.lol/download"
codexLink.Font = Enum.Font.Gotham
codexLink.TextColor3 = Color3.fromRGB(255, 255, 255)
codexLink.BackgroundTransparency = 1
codexLink.TextScaled = true
codexLink.Size = UDim2.new(1, 0, 0.08, 0)
codexLink.Position = UDim2.new(0, 0, 0.7, 0)
codexLink.Visible = false

-- Button Actions
krnlBtn.MouseButton1Click:Connect(function()
    krnlLink.Visible = true
    codexLink.Visible = false
end)

codexBtn.MouseButton1Click:Connect(function()
    codexLink.Visible = true
    krnlLink.Visible = false
end)
