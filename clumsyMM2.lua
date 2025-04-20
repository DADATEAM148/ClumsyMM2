-- ClumsyMM2 - Main Script
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- GUI Setup
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ClumsyMM2"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 500, 0, 300)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

-- Neon Glow Effect
local glow = Instance.new("UIStroke", mainFrame)
glow.Thickness = 2
glow.Color = Color3.fromRGB(0, 255, 170)

local UICorner = Instance.new("UICorner", mainFrame)
UICorner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "Clumsy (Legit)"
title.TextColor3 = Color3.fromRGB(0, 255, 170)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

-- Tabs creation function
local function createTab(name, posX)
	local tab = Instance.new("TextButton")
	tab.Name = name
	tab.Text = name
	tab.Position = UDim2.new(0, posX, 0, 10)
	tab.Size = UDim2.new(0, 100, 0, 30)
	tab.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
	tab.TextColor3 = Color3.fromRGB(0, 255, 170)
	tab.Parent = mainFrame

	local corner = Instance.new("UICorner", tab)
	corner.CornerRadius = UDim.new(0, 8)

	return tab
end

local mainTab = createTab("Main", 10)
local combatTab = createTab("Combat", 120)
local settingsTab = createTab("Settings", 230)
local creditsTab = createTab("Credits", 340)

-- NoClip function
local noclip = false
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.N then
        noclip = not noclip
        LocalPlayer.Character.HumanoidRootPart.CanCollide = not noclip
    end
end)

-- ESP Function
local function createESP(player)
    if player == LocalPlayer then return end
    local highlight = Instance.new("Highlight", player.Character)
    highlight.FillColor = Color3.fromRGB(0, 255, 170)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createESP(player)
    end)
end)

-- Silent Aim Function (Basic Targeting)
local SilentAimEnabled = false
local function getClosestTarget()
    local closestPlayer = nil
    local shortestDistance = math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local distance = (LocalPlayer.Character.Head.Position - player.Character.Head.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = player
            end
        end
    end
    return closestPlayer
end

-- Skin Changer (Visual only)
local knifeTexture = "rbxassetid://1234567890" -- ID of the new skin
local function applyKnifeSkin()
    local knife = LocalPlayer.Character:FindFirstChild("Knife")
    if knife and knife:IsA("Tool") then
        local handle = knife:FindFirstChild("Handle")
        if handle then
            local decal = handle:FindFirstChildOfClass("Decal") or Instance.new("Decal", handle)
            decal.Texture = knifeTexture
        end
    end
end

-- Buttons for Combat Tab
combatTab.MouseButton1Click:Connect(function()
    local espButton = Instance.new("TextButton", mainFrame)
    espButton.Text = "Enable ESP"
    espButton.Position = UDim2.new(0, 20, 0, 60)
    espButton.Size = UDim2.new(0, 120, 0, 30)
    espButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    espButton.TextColor3 = Color3.fromRGB(0, 255, 170)
    espButton.MouseButton1Click:Connect(function()
        for _, player in pairs(Players:GetPlayers()) do
            createESP(player)
        end
    end)

    local godButton = Instance.new("TextButton", mainFrame)
    godButton.Text = "God Mode"
    godButton.Position = UDim2.new(0, 20, 0, 100)
    godButton.Size = UDim2.new(0, 120, 0, 30)
    godButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    godButton.TextColor3 = Color3.fromRGB(0, 255, 170)
    godButton.MouseButton1Click:Connect(function()
        -- Implement God Mode
    end)

    local killButton = Instance.new("TextButton", mainFrame)
    killButton.Text = "Kill Aura"
    killButton.Position = UDim2.new(0, 20, 0, 140)
    killButton.Size = UDim2.new(0, 120, 0, 30)
    killButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    killButton.TextColor3 = Color3.fromRGB(0, 255, 170)
    killButton.MouseButton1Click:Connect(function()
        -- Implement Kill Aura
    end)

    local skinButton = Instance.new("TextButton", mainFrame)
    skinButton.Text = "Apply Knife Skin"
    skinButton.Position = UDim2.new(0, 20, 0, 180)
    skinButton.Size = UDim2.new(0, 120, 0, 30)
    skinButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    skinButton.TextColor3 = Color3.fromRGB(0, 255, 170)
    skinButton.MouseButton1Click:Connect(applyKnifeSkin)
end)

