-- ClumsyMM2 - Enhanced Skin Changer with More Skins (Knives, Pistols, and Characters)

local skins = {
    knife = {
        ["Default"] = {id = "rbxassetid://1234567890", image = "rbxassetid://1234567890"},
        ["Dragon Blade"] = {id = "rbxassetid://9876543210", image = "rbxassetid://9876543210"},
        ["Ice Blade"] = {id = "rbxassetid://1357911131", image = "rbxassetid://1357911131"},
        ["Flame Blade"] = {id = "rbxassetid://4567891234", image = "rbxassetid://4567891234"},
        ["Emerald Blade"] = {id = "rbxassetid://5566778899", image = "rbxassetid://5566778899"},
        ["Shadow Blade"] = {id = "rbxassetid://2233445566", image = "rbxassetid://2233445566"},
        ["Golden Blade"] = {id = "rbxassetid://1029384756", image = "rbxassetid://1029384756"},
    },
    character = {
        ["Default"] = {id = "rbxassetid://2468013579", image = "rbxassetid://2468013579"},
        ["Camo Hat"] = {id = "rbxassetid://1122334455", image = "rbxassetid://1122334455"},
        ["Pirate Hat"] = {id = "rbxassetid://5566778899", image = "rbxassetid://5566778899"},
        ["Witch Hat"] = {id = "rbxassetid://1001122334", image = "rbxassetid://1001122334"},
        ["Fire Helmet"] = {id = "rbxassetid://7878787878", image = "rbxassetid://7878787878"},
        ["Viking Helmet"] = {id = "rbxassetid://1234567891", image = "rbxassetid://1234567891"},
        ["Space Helmet"] = {id = "rbxassetid://9988776655", image = "rbxassetid://9988776655"},
    },
    pistol = {
        ["Default"] = {id = "rbxassetid://1122334455", image = "rbxassetid://1122334455"},
        ["Golden Pistol"] = {id = "rbxassetid://1234567890", image = "rbxassetid://1234567890"},
        ["Laser Pistol"] = {id = "rbxassetid://9876543210", image = "rbxassetid://9876543210"},
        ["Zombie Pistol"] = {id = "rbxassetid://1357911131", image = "rbxassetid://1357911131"},
        ["Silver Pistol"] = {id = "rbxassetid://6677889900", image = "rbxassetid://6677889900"},
    }
}

-- GUI Setup for Skin Changer (Including Pistols)
local skinMenu = Instance.new("Frame", mainFrame)
skinMenu.Size = UDim2.new(0, 250, 0, 350)
skinMenu.Position = UDim2.new(0, 10, 0, 220)
skinMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
local UICorner = Instance.new("UICorner", skinMenu)
UICorner.CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", skinMenu)
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 10, 0, 10)
title.Text = "Select Skin"
title.TextColor3 = Color3.fromRGB(0, 255, 170)
title.BackgroundTransparency = 1
title.TextSize = 18

-- Knife Skins buttons with images
local knifeButtonContainer = Instance.new("Frame", skinMenu)
knifeButtonContainer.Size = UDim2.new(1, 0, 0, 100)
knifeButtonContainer.Position = UDim2.new(0, 10, 0, 40)

local function createKnifeButton(skinName, yPos, imageId)
    local btn = Instance.new("TextButton", knifeButtonContainer)
    btn.Size = UDim2.new(1, -20, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, yPos)
    btn.Text = skinName
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    btn.TextColor3 = Color3.fromRGB(0, 255, 170)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(function()
        applyKnifeSkin(skinName)
    end)

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)

    -- Add Image next to button
    local img = Instance.new("ImageLabel", btn)
    img.Size = UDim2.new(0, 30, 0, 30)
    img.Position = UDim2.new(1, 5, 0, 0)
    img.Image = imageId
    img.BackgroundTransparency = 1
end

local yOffset = 0
for skinName, skin in pairs(skins.knife) do
    createKnifeButton(skinName, yOffset, skin.image)
    yOffset = yOffset + 35
end

-- Character Skins buttons with images
local characterButtonContainer = Instance.new("Frame", skinMenu)
characterButtonContainer.Size = UDim2.new(1, 0, 0, 100)
characterButtonContainer.Position = UDim2.new(0, 10, 0, 150)

local function createCharacterButton(skinName, yPos, imageId)
    local btn = Instance.new("TextButton", characterButtonContainer)
    btn.Size = UDim2.new(1, -20, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, yPos)
    btn.Text = skinName
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    btn.TextColor3 = Color3.fromRGB(0, 255, 170)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(function()
        applyCharacterSkin(skinName)
    end)

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)

    -- Add Image next to button
    local img = Instance.new("ImageLabel", btn)
    img.Size = UDim2.new(0, 30, 0, 30)
    img.Position = UDim2.new(1, 5, 0, 0)
    img.Image = imageId
    img.BackgroundTransparency = 1
end

yOffset = 0
for skinName, skin in pairs(skins.character) do
    createCharacterButton(skinName, yOffset, skin.image)
    yOffset = yOffset + 35
end

-- Pistol Skins buttons with images
local pistolButtonContainer = Instance.new("Frame", skinMenu)
pistolButtonContainer.Size = UDim2.new(1, 0, 0, 100)
pistolButtonContainer.Position = UDim2.new(0, 10, 0, 260)

local function createPistolButton(skinName, yPos, imageId)
    local btn = Instance.new("TextButton", pistolButtonContainer)
    btn.Size = UDim2.new(1, -20, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, yPos)
    btn.Text = skinName
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    btn.TextColor3 = Color3.fromRGB(0, 255, 170)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(function()
        applyPistolSkin(skinName)
    end)

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)

    -- Add Image next to button
    local img = Instance.new("ImageLabel", btn)
    img.Size = UDim2.new(0, 30, 0, 30)
    img.Position = UDim2.new(1, 5, 0, 0)
    img.Image = imageId
    img.BackgroundTransparency = 1
end

yOffset = 0
for skin
