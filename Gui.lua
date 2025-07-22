local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")

-- Prevent other GUIs from being clickable
for _, v in pairs(CoreGui:GetDescendants()) do
    if v:IsA("TextButton") or v:IsA("ImageButton") then
        v.Active = false
    end
end

-- Create full screen blocker
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.DisplayOrder = 9999
gui.Name = "BlockerGui"
gui.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.Position = UDim2.new(0, 0, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0
frame.Parent = gui

-- Header Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(0.7, 0, 0.15, 0)
label.Position = UDim2.new(0.15, 0, 0.1, 0)
label.BackgroundTransparency = 1
label.Text = "This script is not working on Delta Executor"
label.TextColor3 = Color3.fromRGB(255, 75, 75)
label.TextScaled = true
label.Font = Enum.Font.GothamBold
label.Parent = frame

-- Question Mark Button
local infoButton = Instance.new("TextButton")
infoButton.Size = UDim2.new(0, 30, 0, 30)
infoButton.Position = UDim2.new(0.85, 10, 0.1, 0)
infoButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
infoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
infoButton.Text = "?"
infoButton.Font = Enum.Font.GothamBold
infoButton.TextScaled = true
infoButton.AutoButtonColor = true
infoButton.Parent = frame

-- Hidden Persuasive Message
local message = Instance.new("TextLabel")
message.Size = UDim2.new(0.75, 0, 0.2, 0)
message.Position = UDim2.new(0.125, 0, 0.22, 0)
message.BackgroundTransparency = 1
message.Text = [[❗ The script you tried to run is not compatible with Delta Executor.

💡 For the best results, use **Krnl** or **Codex** — trusted, stable, and feature-rich.

🔓 Unlock the full experience by switching now!]]
message.TextColor3 = Color3.fromRGB(255, 255, 255)
message.TextScaled = true
message.Font = Enum.Font.Gotham
message.TextWrapped = true
message.Visible = false
message.Parent = frame

-- Toggle visibility when "?" is clicked
infoButton.MouseButton1Click:Connect(function()
	message.Visible = not message.Visible
end)

-- Krnl Button
local krnlButton = Instance.new("TextButton")
krnlButton.Size = UDim2.new(0.25, 0, 0.08, 0)
krnlButton.Position = UDim2.new(0.2, 0, 0.6, 0)
krnlButton.BackgroundColor3 = Color3.fromRGB(50, 50, 255)
krnlButton.TextColor3 = Color3.fromRGB(255, 255, 255)
krnlButton.Text = "Download Krnl"
krnlButton.Font = Enum.Font.GothamBold
krnlButton.TextScaled = true
krnlButton.Parent = frame

-- Codex Button
local codexButton = Instance.new("TextButton")
codexButton.Size = UDim2.new(0.25, 0, 0.08, 0)
codexButton.Position = UDim2.new(0.55, 0, 0.6, 0)
codexButton.BackgroundColor3 = Color3.fromRGB(0, 200, 200)
codexButton.TextColor3 = Color3.fromRGB(0, 0, 0)
codexButton.Text = "Download Codex"
codexButton.Font = Enum.Font.GothamBold
codexButton.TextScaled = true
codexButton.Parent = frame

-- Show link on click
krnlButton.MouseButton1Click:Connect(function()
	setclipboard("https://krnl.place")
	StarterGui:SetCore("SendNotification", {
		Title = "Link Copied",
		Text = "Krnl download link copied to clipboard!",
		Duration = 4
	})
end)

codexButton.MouseButton1Click:Connect(function()
	setclipboard("https://codex.lol")
	StarterGui:SetCore("SendNotification", {
		Title = "Link Copied",
		Text = "Codex download link copied to clipboard!",
		Duration = 4
	})
end)
