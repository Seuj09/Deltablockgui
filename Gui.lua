local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "DeltaBlockNotice"
gui.IgnoreGuiInset = true
gui.DisplayOrder = 9999
gui.ResetOnSpawn = false

-- Prevent all game input
local blocker = Instance.new("TextButton", gui)
blocker.Size = UDim2.new(1, 0, 1, 0)
blocker.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
blocker.BackgroundTransparency = 0.6
blocker.BorderSizePixel = 0
blocker.Text = ""
blocker.AutoButtonColor = false
blocker.ZIndex = 1

-- Display Blocked Script
local blockedText = Instance.new("TextLabel", gui)
blockedText.Size = UDim2.new(0.9, 0, 0.1, 0)
blockedText.Position = UDim2.new(0.05, 0, 0.25, 0)
blockedText.BackgroundTransparency = 1
blockedText.Text = "Blocked Script:\nloadstring(game:HttpGet(\"https://raw.githubusercontent.com/Seuj09/Nathub/refs/heads/main/Nathubscripts\"))()"
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
helpBtn.ZIndex = 2

-- Help Background
local helpBackground = Instance.new("Frame", gui)
helpBackground.Size = UDim2.new(0.9, 0, 0.3, 0)
helpBackground.Position = UDim2.new(0.05, 0, 0.4, 0)
helpBackground.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
helpBackground.BorderSizePixel = 0
helpBackground.Visible = false
helpBackground.ZIndex = 3

-- Help Text
local helpText = Instance.new("TextLabel", helpBackground)
helpText.Size = UDim2.new(1, -10, 1, -10)
helpText.Position = UDim2.new(0, 5, 0, 5)
helpText.BackgroundTransparency = 1
helpText.TextWrapped = true
helpText.TextScaled = true
helpText.Font = Enum.Font.Gotham
helpText.TextColor3 = Color3.fromRGB(255, 255, 255)
helpText.Text = "❗ The script you tried to run is not compatible with Delta Executor.\n\n💡 For a smoother and more powerful experience, we highly recommend using Krnl or Codex. These trusted executors fully support this script and offer better reliability, speed, and support.\n\n🔒 Don’t miss out on the full features—switch now to unlock everything!"
helpText.ZIndex = 4

-- Toggle Help Text
helpBtn.MouseButton1Click:Connect(function()
	helpBackground.Visible = not helpBackground.Visible
end)

-- Krnl Button
local krnlBtn = Instance.new("TextButton", gui)
krnlBtn.Size = UDim2.new(0.3, 0, 0.07, 0)
krnlBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
krnlBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
krnlBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
krnlBtn.Font = Enum.Font.GothamBold
krnlBtn.TextSize = 18
krnlBtn.Text = "Download Krnl"
krnlBtn.ZIndex = 2

-- Codex Button
local codexBtn = Instance.new("TextButton", gui)
codexBtn.Size = UDim2.new(0.3, 0, 0.07, 0)
codexBtn.Position = UDim2.new(0.6, 0, 0.75, 0)
codexBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
codexBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
codexBtn.Font = Enum.Font.GothamBold
codexBtn.TextSize = 18
codexBtn.Text = "Download Codex"
codexBtn.ZIndex = 2

-- Click to show URLs
krnlBtn.MouseButton1Click:Connect(function()
	setclipboard("https://krnl.place")
	krnlBtn.Text = "Copied Krnl Link!"
end)

codexBtn.MouseButton1Click:Connect(function()
	setclipboard("https://codex.lol")
	codexBtn.Text = "Copied Codex Link!"
end)
