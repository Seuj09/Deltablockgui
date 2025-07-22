local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ExecutorBlockNotice"
gui.IgnoreGuiInset = true
gui.DisplayOrder = 9999
gui.ResetOnSpawn = false

-- FULLSCREEN BACKGROUND BLOCKER
local fullscreen = Instance.new("Frame", gui)
fullscreen.Size = UDim2.new(1, 0, 1, 0)
fullscreen.Position = UDim2.new(0, 0, 0, 0)
fullscreen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
fullscreen.BackgroundTransparency = 0.4
fullscreen.BorderSizePixel = 0
fullscreen.ZIndex = 10

-- Main Blocked Message
local blockedText = Instance.new("TextLabel", gui)
blockedText.Size = UDim2.new(0.9, 0, 0.13, 0)
blockedText.Position = UDim2.new(0.05, 0, 0.25, 0)
blockedText.BackgroundTransparency = 1
blockedText.Text = "❌ Blocked Script (Works on these executors):\nloadstring(game:HttpGet(\"https://raw.githubusercontent.com/Seuj09/Nathub/refs/heads/main/Nathubscripts\"))()"
blockedText.TextColor3 = Color3.fromRGB(255, 85, 85)
blockedText.TextScaled = true
blockedText.TextWrapped = true
blockedText.Font = Enum.Font.SourceSansBold
blockedText.ZIndex = 2

-- Question Mark Button
local helpBtn = Instance.new("TextButton", gui)
helpBtn.Size = UDim2.new(0, 40, 0, 40)
helpBtn.Position = UDim2.new(0.92, 0, 0.21, 0)
helpBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
helpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
helpBtn.Text = "?"
helpBtn.Font = Enum.Font.GothamBold
helpBtn.TextSize = 24
helpBtn.ZIndex = 3

-- Help Panel Background
local helpPanel = Instance.new("Frame", gui)
helpPanel.Size = UDim2.new(0.9, 0, 0.3, 0)
helpPanel.Position = UDim2.new(0.05, 0, 0.4, 0)
helpPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
helpPanel.BorderSizePixel = 0
helpPanel.Visible = false
helpPanel.ZIndex = 4

-- Help Text
local helpText = Instance.new("TextLabel", helpPanel)
helpText.Size = UDim2.new(1, -10, 1, -10)
helpText.Position = UDim2.new(0, 5, 0, 5)
helpText.BackgroundTransparency = 1
helpText.TextWrapped = true
helpText.TextScaled = true
helpText.Font = Enum.Font.Gotham
helpText.TextColor3 = Color3.fromRGB(255, 255, 255)
helpText.Text = "💡 This script doesn't work on Delta Executor.\n\nFor full compatibility and features, please use:\n🛠 Krnl (krnl.place) or 🧠 Codex (codex.lol). Both support this script perfectly.\n\n⚙️ Unlock the full experience!"
helpText.ZIndex = 5

-- Toggle Help Panel Visibility
helpBtn.MouseButton1Click:Connect(function()
	helpPanel.Visible = not helpPanel.Visible
end)

-- Krnl Button
local krnlBtn = Instance.new("TextButton", gui)
krnlBtn.Size = UDim2.new(0.35, 0, 0.07, 0)
krnlBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
krnlBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
krnlBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
krnlBtn.Font = Enum.Font.GothamBold
krnlBtn.TextSize = 18
krnlBtn.Text = "Download Krnl"
krnlBtn.ZIndex = 3

-- Codex Button
local codexBtn = Instance.new("TextButton", gui)
codexBtn.Size = UDim2.new(0.35, 0, 0.07, 0)
codexBtn.Position = UDim2.new(0.55, 0, 0.75, 0)
codexBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
codexBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
codexBtn.Font = Enum.Font.GothamBold
codexBtn.TextSize = 18
codexBtn.Text = "Download Codex"
codexBtn.ZIndex = 3

-- Clipboard copy on click
krnlBtn.MouseButton1Click:Connect(function()
	setclipboard("https://krnl.place")
	krnlBtn.Text = "✅ Krnl Link Copied"
	wait(1.5)
	krnlBtn.Text = "Download Krnl"
end)

codexBtn.MouseButton1Click:Connect(function()
	setclipboard("https://codex.lol")
	codexBtn.Text = "✅ Codex Link Copied"
	wait(1.5)
	codexBtn.Text = "Download Codex"
end)
