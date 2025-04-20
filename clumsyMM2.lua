--[[ ClumsyMM2 GUI by DADATEAM148 ]]--

local Clumsy = Instance.new("ScreenGui")
Clumsy.Name = "ClumsyMM2"
Clumsy.ResetOnSpawn = false
Clumsy.Parent = game.CoreGui

local UI = Instance.new("Frame")
UI.Size = UDim2.new(0, 500, 0, 300)
UI.Position = UDim2.new(0.5, -250, 0.5, -150)
UI.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
UI.BorderSizePixel = 0
UI.Parent = Clumsy

-- Neon UI Glow
local glow = Instance.new("UIStroke", UI)
glow.Thickness = 2
glow.Color = Color3.fromRGB(0, 255, 170)

local UICorner = Instance.new("UICorner", UI)
UICorner.CornerRadius = UDim.new(0, 12)

-- Tabs
local Tabs = Instance.new("Folder", UI)

local function createTab(name, posX)
	local tab = Instance.new("TextButton")
	tab.Name = name
	tab.Text = name
	tab.Position = UDim2.new(0, posX, 0, 10)
	tab.Size = UDim2.new(0, 100, 0, 30)
	tab.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
	tab.TextColor3 = Color3.fromRGB(0, 255, 170)
	tab.Parent = Tabs

	local corner = Instance.new("UICorner", tab)
	corner.CornerRadius = UDim.new(0, 8)

	return tab
end

local mainTab = createTab("Main", 10)
local combatTab = createTab("Combat", 120)
local settingsTab = createTab("Settings", 230)
local creditsTab = createTab("Credits", 340)

-- ESP Function
local function enableESP()
	for _, player in pairs(game.Players:GetPlayers()) do
		if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
			local billboard = Instance.new("BillboardGui", player.Character.Head)
			billboard.Size = UDim2.new(0, 100, 0, 40)
			billboard.AlwaysOnTop = true

			local label = Instance.new("TextLabel", billboard)
			label.Size = UDim2.new(1, 0, 1, 0)
			label.Text = player.Name
			label.BackgroundTransparency = 1
			label.TextColor3 = Color3.fromRGB(0, 255, 170)
			label.TextStrokeTransparency = 0.5
		end
	end
end

-- God Mode (basic example)
local function godMode()
	local plr = game.Players.LocalPlayer
	local char = plr.Character or plr.CharacterAdded:Wait()
	if char:FindFirstChild("Humanoid") then
		char.Humanoid.Name = "1"
		local clone = char["1"]:Clone()
		clone.Parent = char
		clone.Name = "Humanoid"
		wait(0.1)
		char["1"]:Destroy()
		workspace.CurrentCamera.CameraSubject = char
	end
end

-- Kill Aura
local function killAura()
	while true do
		task.wait(0.5)
		local player = game.Players.LocalPlayer
		local char = player.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			for _, plr in pairs(game.Players:GetPlayers()) do
				if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
					local dist = (char.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
					if dist < 10 then
						firetouchinterest(char:FindFirstChildOfClass("Tool").Handle, plr.Character.HumanoidRootPart, 0)
						firetouchinterest(char:FindFirstChildOfClass("Tool").Handle, plr.Character.HumanoidRootPart, 1)
					end
				end
			end
		end
	end
end

-- Add Buttons to Combat Tab
combatTab.MouseButton1Click:Connect(function()
	local espButton = Instance.new("TextButton", UI)
	espButton.Text = "Enable ESP"
	espButton.Position = UDim2.new(0, 20, 0, 60)
	espButton.Size = UDim2.new(0, 120, 0, 30)
	espButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
	espButton.TextColor3 = Color3.fromRGB(0, 255, 170)
	espButton.MouseButton1Click:Connect(enableESP)

	local godButton = Instance.new("TextButton", UI)
	godButton.Text = "God Mode"
	godButton.Position = UDim2.new(0, 20, 0, 100)
	godButton.Size = UDim2.new(0, 120, 0, 30)
	godButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
	godButton.TextColor3 = Color3.fromRGB(0, 255, 170)
	godButton.MouseButton1Click:Connect(godMode)

	local killButton = Instance.new("TextButton", UI)
	killButton.Text = "Kill Aura"
	killButton.Position = UDim2.new(0, 20, 0, 140)
	killButton.Size = UDim2.new(0, 120, 0, 30)
	killButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
	killButton.TextColor3 = Color3.fromRGB(0, 255, 170)
	killButton.MouseButton1Click:Connect(function()
		coroutine.wrap(killAura)()
	end)
end)
