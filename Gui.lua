-- Place this in StarterPlayerScripts (LocalScript)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- CONFIG
local totalTime = 90 -- 1:30 minutes in seconds

-- ScreenGui Setup
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundTransparency = 1
bg.BorderSizePixel = 0
bg.Parent = screenGui

-- Gradient background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(173, 216, 230)), -- Light Blue
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 228, 196)), -- Peach
	ColorSequenceKeypoint.new(1, Color3.fromRGB(221, 160, 221)) -- Light Purple
}
gradient.Rotation = 45
gradient.Parent = bg

-- Fade in background
TweenService:Create(bg, TweenInfo.new(2, Enum.EasingStyle.Sine), {BackgroundTransparency = 0}):Play()

-- Floating circles (background visuals)
for i = 1, 8 do
	local circle = Instance.new("Frame")
	circle.Size = UDim2.new(0, math.random(100,200), 0, math.random(100,200))
	circle.Position = UDim2.new(math.random(), 0, math.random(), 0)
	circle.BackgroundColor3 = Color3.fromHSV(math.random(), 0.6, 1)
	circle.BackgroundTransparency = 0.7
	circle.BorderSizePixel = 0
	circle.ZIndex = 0
	circle.Parent = bg

	local uiCorner = Instance.new("UICorner")
	uiCorner.CornerRadius = UDim.new(1,0)
	uiCorner.Parent = circle

	task.spawn(function()
		while circle.Parent do
			local newPos = UDim2.new(math.random(), 0, math.random(), 0)
			TweenService:Create(circle, TweenInfo.new(10, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Position = newPos}):Play()
			task.wait(10)
		end
	end)
end

-- Function: Create wavy title
local function createWavyText(text, posY)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(1, 0, 0.15, 0)
	container.Position = UDim2.new(0, 0, posY, 0)
	container.BackgroundTransparency = 1
	container.Parent = bg

	local letters = {}
	local spacing = 1 / #text
	for i = 1, #text do
		local letter = Instance.new("TextLabel")
		letter.Size = UDim2.new(spacing, 0, 1, 0)
		letter.Position = UDim2.new((i-1)*spacing, 0, 0, 0)
		letter.Text = string.sub(text, i, i)
		letter.TextScaled = true
		letter.Font = Enum.Font.AmaticSC
		letter.BackgroundTransparency = 1
		letter.TextColor3 = Color3.new(1,1,1)
		letter.Parent = container
		letters[i] = letter
	end

	-- Animate wave motion
	task.spawn(function()
		local t = 0
		while container.Parent do
			for i, letter in ipairs(letters) do
				local wave = math.sin(t + i*0.5) * 0.05
				letter.Position = UDim2.new((i-1)*spacing, 0, wave, 0)
			end
			t += 0.1
			task.wait(0.05)
		end
	end)

	return letters
end

-- Big Title
local titleLetters = createWavyText("Bypassing Anti-Cheat", 0.25)

-- Subtext
local subText = Instance.new("TextLabel")
subText.Size = UDim2.new(1, 0, 0.08, 0)
subText.Position = UDim2.new(0, 0, 0.42, 0)
subText.Text = "Please wait while we make sure things are working..."
subText.TextScaled = true
subText.Font = Enum.Font.FredokaOne
subText.BackgroundTransparency = 1
subText.TextColor3 = Color3.fromRGB(60, 60, 60)
subText.Parent = bg

-- Timer container
local timerFrame = Instance.new("Frame")
timerFrame.Size = UDim2.new(1, 0, 0.08, 0)
timerFrame.Position = UDim2.new(0, 0, 0.48, 0) -- just below subtext
timerFrame.BackgroundTransparency = 1
timerFrame.Parent = bg

-- Hourglass icon
local hourglass = Instance.new("TextLabel")
hourglass.Size = UDim2.new(0.08, 0, 1, 0)
hourglass.Position = UDim2.new(0.35, 0, 0, 0)
hourglass.BackgroundTransparency = 1
hourglass.Text = "⌛"
hourglass.TextScaled = true
hourglass.Font = Enum.Font.FredokaOne
hourglass.TextColor3 = Color3.fromRGB(80, 80, 80)
hourglass.Parent = timerFrame

-- Timer label
local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0.4, 0, 1, 0)
timerLabel.Position = UDim2.new(0.42, 0, 0, 0)
timerLabel.BackgroundTransparency = 1
timerLabel.Text = "Estimated time: 1:30m"
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.FredokaOne
timerLabel.TextColor3 = Color3.fromRGB(80, 80, 80)
timerLabel.TextXAlignment = Enum.TextXAlignment.Left
timerLabel.Parent = timerFrame

-- Progress Bar BG
local barBG = Instance.new("Frame")
barBG.Size = UDim2.new(0.6, 0, 0.05, 0)
barBG.Position = UDim2.new(0.2, 0, 0.58, 0)
barBG.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
barBG.BorderSizePixel = 0
barBG.Parent = bg

local barBGCorner = Instance.new("UICorner")
barBGCorner.CornerRadius = UDim.new(0, 20)
barBGCorner.Parent = barBG

-- Progress Bar Fill
local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
barFill.BorderSizePixel = 0
barFill.Parent = barBG

local barFillCorner = Instance.new("UICorner")
barFillCorner.CornerRadius = UDim.new(0, 20)
barFillCorner.Parent = barFill

-- Percentage Label
local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(1, 0, 0.05, 0)
percentLabel.Position = UDim2.new(0, 0, 0.65, 0)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextScaled = true
percentLabel.Font = Enum.Font.FredokaOne
percentLabel.TextColor3 = Color3.fromRGB(80, 80, 80)
percentLabel.Parent = bg

-- Rainbow effect
task.spawn(function()
	while screenGui.Parent do
		for hue = 0, 255 do
			local color = Color3.fromHSV(hue/255, 1, 1)
			for _, letter in ipairs(titleLetters) do
				letter.TextColor3 = color
			end
			barFill.BackgroundColor3 = color
			task.wait(0.03)
		end
	end
end)

-- Hourglass spinning
task.spawn(function()
	while hourglass.Parent do
		for i = 0, 360, 15 do
			hourglass.Rotation = i
			task.wait(0.05)
		end
	end
end)

-- Countdown timer + smooth progress bar
local elapsed = 0
while elapsed < totalTime do
	elapsed += RunService.Heartbeat:Wait()
	local remaining = math.max(totalTime - math.floor(elapsed), 0)
	local mins = math.floor(remaining / 60)
	local secs = remaining % 60
	timerLabel.Text = string.format("Estimated time: %d:%02dm", mins, secs)

	-- Progress bar
	local progress = math.clamp(elapsed / totalTime, 0, 1)
	TweenService:Create(barFill, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(progress, 0, 1, 0)}):Play()
	percentLabel.Text = math.floor(progress*100) .. "%"
end

-- Fade out
TweenService:Create(bg, TweenInfo.new(2, Enum.EasingStyle.Sine), {BackgroundTransparency = 1}):Play()
task.wait(2)
screenGui:Destroy()
