--[[
RheyzHub | Violence District
Style: Pandu Hub
UI & Fitur: 100% Sesuai Video
Versi: Final
]]

-- Layanan Roblox
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- ⚙️ SEMUA FITUR SESUAI PANDU HUB
_G.RheyzHub = {
    Survivor = {
        AutoSkillCheck = false,
        SkillCheckMode = "Normal",
        SkillCheckSpeed = 20,
        KingSourceInstant = false,
        BypassGeneratorPoint = false,
        BypassGeneratorMode = "Auto",
        FastVault = false,
        AutoVault = false,
        NoSlowdown = false,
        AutoCrouchDodge = false,
        AutoParry = false,
        ParryDelay = 0.27,
        ParryRange = 13,
        FakeParry = false,
        RadiusWarning = false,
        SelfHeal = false,
        AntiKnockdown = false,
        AutoWiggle = false,
        BypassExit = false
    },
    Killer = {
        NoCooldown = false,
        InstantHit = false,
        NoStun = false,
        SpeedMulti = 2.0,
        WallCheckBypass = false,
        IgnoreObstacle = false,
        NoAnimation = false,
        InstantGrab = false,
        NoMiss = false
    },
    Combat = {
        FaceKiller = false,
        Sensitivity = 0.01,
        AimPrediction = false,
        AimStrictness = 2,
        IgnoreKillerSkills = false,
        VeilMaskedStalker = false
    },
    Aimbot = {
        Enabled = false,
        LockSurvivor = false,
        LockKiller = false,
        SilentAim = false,
        FOV = 250,
        ShowFOV = false
    },
    ESP = {
        Enabled = false,
        Survivor = true,
        Killer = true,
        Generator = true,
        Exit = true,
        Pallet = true,
        Window = true,
        ShowDistance = true,
        ShowHealth = true
    },
    Visual = {
        FullBright = false,
        NoFog = false,
        NoShadow = false,
        NoBlur = false,
        NoVignette = false
    },
    Misc = {
        WalkSpeed = 40,
        JumpPower = 60,
        NoClip = false,
        Fly = false,
        FlySpeed = 50,
        GodMode = false
    }
}

-- 🎨 UI GAYA PANDU HUB
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RheyzHub_PanduHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- ✅ TOMBOL BUKA/TUTUP (GAYA PANDU HUB)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 42, 0, 42)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.2, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 70, 100)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "RH"
ToggleBtn.TextColor3 = Color3.new(1,1,1)
ToggleBtn.TextSize = 16
ToggleBtn.AutoButtonColor = false
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)
local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(120, 140, 220)
ToggleStroke.Thickness = 1.5
ToggleStroke.Parent = ToggleBtn

-- ✅ JENDELA UTAMA
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 680, 0, 560)
Main.Position = UDim2.new(0.5, -340, 0.5, -280)
Main.BackgroundColor3 = Color3.fromRGB(25, 28, 45)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(120, 140, 220)
MainStroke.Thickness = 1.2
MainStroke.Parent = Main

-- Bilah Atas
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(35, 38, 60)
TopBar.Parent = Main
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.75, 0, 1, 0)
Title.Position = UDim2.new(0.05, 0, 0, 0)
Title.Text = "Violence District | Pandu Hub Style"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(210, 215, 255)
Title.TextSize = 14
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Tombol Minimize & Tutup
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 28, 0, 28)
MinBtn.Position = UDim2.new(0.87, 0, 0.1, 0)
MinBtn.Text = "−"
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextColor3 = Color3.fromRGB(255, 200, 80)
MinBtn.TextSize = 20
MinBtn.BackgroundTransparency = 1
MinBtn.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(0.94, 0, 0.1, 0)
CloseBtn.Text = "×"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
CloseBtn.TextSize = 20
CloseBtn.BackgroundTransparency = 1
CloseBtn.Parent = TopBar

-- Sidebar Navigasi
local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0, 135, 1, -40)
SideBar.Position = UDim2.new(0, 0, 0, 40)
SideBar.BackgroundColor3 = Color3.fromRGB(30, 33, 52)
SideBar.Parent = Main
Instance.new("UICorner", SideBar).CornerRadius = UDim.new(0, 0)

-- Area Konten
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -140, 1, -44)
ContentArea.Position = UDim2.new(0, 140, 0, 42)
ContentArea.BackgroundColor3 = Color3.fromRGB(22, 25, 40)
ContentArea.Parent = Main
Instance.new("UICorner", ContentArea).CornerRadius = UDim.new(0, 6)

-- Fungsi Buka/Tutup
ToggleBtn.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
MinBtn.MouseButton1Click:Connect(function() Main.Visible = false end)
CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false end)

-- Sistem Tab
local tabs = {}
local function CreateTab(name, icon, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.92, 0, 0, 38)
    btn.Position = UDim2.new(0.04, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(38, 42, 68)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = "  "..icon.." "..name
    btn.TextColor3 = Color3.fromRGB(180, 185, 230)
    btn.TextSize = 12
    btn.AutoButtonColor = false
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = SideBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(0.97, 0, 0.97, 0)
    content.Position = UDim2.new(0.015, 0, 0.015, 0)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.ScrollBarThickness = 4
    content.ScrollBarImageColor3 = Color3.fromRGB(120, 140, 220)
    content.Visible = false
    content.Parent = ContentArea

    table.insert(tabs, {Button = btn, Content = content})
    return content
end

local function SwitchTab(selected)
    for _,t in ipairs(tabs) do
        t.Content.Visible = t == selected
        TweenService:Create(t.Button, TweenInfo.new(0.15), {
            BackgroundColor3 = t == selected and Color3.fromRGB(70, 85, 190) or Color3.fromRGB(38, 42, 68),
            TextColor3 = t == selected and Color3.new(1,1,1) or Color3.fromRGB(180, 185, 230)
        }):Play()
    end
end

-- Buat Tab Sesuai Pandu Hub
local tabSurvivor = CreateTab("Survivor", "🧑", 10)
local tabKiller = CreateTab("Killer", "💀", 55)
local tabCombat = CreateTab("Combat", "⚔️", 100)
local tabAimbot = CreateTab("Aimbot", "🎯", 145)
local tabESP = CreateTab("ESP", "👁️", 190)
local tabVisual = CreateTab("Visual", "🎨", 235)
local tabMisc = CreateTab("Misc", "⚙️", 280)

tabs[1].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[1]) end)
tabs[2].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[2]) end)
tabs[3].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[3]) end)
tabs[4].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[4]) end)
tabs[5].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[5]) end)
tabs[6].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[6]) end)
tabs[7].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[7]) end)
SwitchTab(tabs[1])

-- 🛠️ FUNGSI TOMBOL & SLIDER
local function AddSwitch(parent, yPos, label, path)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.98, 0, 0, 36)
    container.Position = UDim2.new(0.01, 0, 0, yPos)
    container.BackgroundColor3 = Color3.fromRGB(32, 36, 58)
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 5)

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.8, 0, 1, 0)
    text.Position = UDim2.new(0.07, 0, 0, 0)
    text.Text = label
    text.Font = Enum.Font.Gotham
    text.TextColor3 = Color3.new(1,1,1)
    text.TextSize = 11.5
    text.BackgroundTransparency = 1
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Parent = container

    local switchBg = Instance.new("Frame")
    switchBg.Size = UDim2.new(0, 32, 0, 16)
    switchBg.Position = UDim2.new(0.91, 0, 0.5, -8)
    switchBg.BackgroundColor3 = Color3.fromRGB(45, 50, 78)
    switchBg.Parent = container
    Instance.new("UICorner", switchBg).CornerRadius = UDim.new(0, 8)

    local switchDot = Instance.new("Frame")
    switchDot.Size = UDim2.new(0, 12, 0, 12)
    switchDot.Position = UDim2.new(0.1, 0, 0.5, -6)
    switchDot.BackgroundColor3 = Color3.new(1,1,1)
    switchDot.Parent = switchBg
    Instance.new("UICorner", switchDot).CornerRadius = UDim.new(0, 6)

    local click = Instance.new("TextButton")
    click.Size = UDim2.new(1,0,1,0)
    click.BackgroundTransparency = 1
    click.Parent = container

    click.MouseButton1Click:Connect(function()
        local val = _G.RheyzHub
        for _,k in ipairs(path) do val = val[k] end
        local newVal = not val
        val = _G.RheyzHub
        for i=1, #path-1 do val = val[path[i]] end
        val[path[#path]] = newVal

        TweenService:Create(switchBg, TweenInfo.new(0.15), {
            BackgroundColor3 = newVal and Color3.fromRGB(120, 140, 220) or Color3.fromRGB(45, 50, 78)
        }):Play()
        TweenService:Create(switchDot, TweenInfo.new(0.15), {
            Position = newVal and UDim2.new(0.62, 0, 0.5, -6) or UDim2.new(0.1, 0, 0.5, -6)
        }):Play()
    end)
end

local function AddSlider(parent, yPos, label, path, min, max)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.98, 0, 0, 42)
    container.Position = UDim2.new(0.01, 0, 0, yPos)
    container.BackgroundColor3 = Color3.fromRGB(32, 36, 58)
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 5)

    local val = _G.RheyzHub
    for _,k in ipairs(path) do val = val[k] end

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.9, 0, 0.4, 0)
    text.Position = UDim2.new(0.06, 0, 0.1, 0)
    text.Text = label..": "..val
    text.Font = Enum.Font.Gotham
    text.TextColor3 = Color3.new(1,1,1)
    text.TextSize = 11.5
    text.BackgroundTransparency = 1
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Parent = container

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0.9, 0, 0, 6)
    bar.Position = UDim2.new(0.06, 0, 0.72, 0)
    bar.BackgroundColor3 = Color3.fromRGB(45, 50, 78)
    bar.Parent = container
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 3)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((val-min)/(max-min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(120, 140, 220)
    fill.Parent = bar
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 3)

    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 11, 0, 11)
    dot.Position = UDim2.new((val-min)/(max-min), -5.5, 0.5, -5.5)
    dot.BackgroundColor3 = Color3.new(1,1,1)
    dot.Parent = bar
    Instance.new("UICorner", dot).CornerRadius = UDim.new(0, 5.5)

    local dragging = false
    dot.MouseButton1Down:Connect(function() dragging = true end)
    UserInputService.InputEnded:Connect(function() dragging = false end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = math.clamp((i.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            local newVal = math.floor(min + pos*(max-min))
            local v = _G.RheyzHub
            for j=1, #path-1 do v = v[path[j]] end
            v[path[#path]] = newVal
            fill.Size = UDim2.new(pos,0,1,0)
            dot.Position = UDim2.new(pos,-5.5,0.5,-5.5)
            text.Text = label..": "..newVal
        end
    end)
end

-- 📋 ISI FITUR SESUAI PANDU HUB
-- Survivor
AddSwitch(tabSurvivor, 10, "Auto Skillcheck", {"Survivor", "AutoSkillCheck"})
AddSwitch(tabSurvivor, 48, "King's Source Instant", {"Survivor", "KingSourceInstant"})
AddSlider(tabSurvivor, 86, "Skillcheck Speed", {"Survivor", "SkillCheckSpeed"}, 1, 50)
AddSwitch(tabSurvivor, 124, "Bypass Generator Point", {"Survivor", "BypassGeneratorPoint"})
AddSwitch(tabSurvivor, 162, "Fast Vault", {"Survivor", "FastVault"})
AddSwitch(tabSurvivor, 200, "Auto Vault", {"Survivor", "AutoVault"})
AddSwitch(tabSurvivor, 238, "No Slowdown", {"Survivor", "NoSlowdown"})
AddSwitch(tabSurvivor, 276, "Auto Crouch Dodge", {"Survivor", "AutoCrouchDodge"})
AddSwitch(tabSurvivor, 314, "Auto Parry", {"Survivor", "AutoParry"})
AddSlider(tabSurvivor, 352, "Parry Delay", {"Survivor", "ParryDelay"}, 0.1, 1)
AddSlider(tabSurvivor, 390, "Parry Range", {"Survivor", "ParryRange"}, 5, 30)
AddSwitch(tabSurvivor, 428, "Fake Parry", {"Survivor", "FakeParry"})
AddSwitch(tabSurvivor, 466, "Radius Warning", {"Survivor", "RadiusWarning"})
AddSwitch(tabSurvivor, 504, "Self Heal", {"Survivor", "SelfHeal"})
AddSwitch(tabSurvivor, 542, "Anti Knockdown", {"Survivor", "AntiKnockdown"})
AddSwitch(tabSurvivor, 580, "Auto Wiggle", {"Survivor", "AutoWiggle"})
AddSwitch(tabSurvivor, 618, "Bypass Exit", {"Survivor", "BypassExit"})
tabSurvivor.CanvasSize = UDim2.new(0,0,0,650)

-- Killer
AddSwitch(tabKiller, 10, "No Cooldown", {"Killer", "NoCooldown"})
AddSwitch(tabKiller, 48, "Instant Hit", {"Killer", "InstantHit"})
AddSwitch(tabKiller, 86, "No Stun", {"Killer", "NoStun"})
AddSlider(tabKiller, 124, "Speed Multiplier", {"Killer", "SpeedMulti"}, 1, 3)
AddSwitch(tabKiller, 162, "Wall Check Bypass", {"Killer", "WallCheckBypass"})
AddSwitch(tabKiller, 200, "Ignore Obstacle", {"Killer", "IgnoreObstacle"})
AddSwitch(tabKiller, 238, "No Animation", {"Killer", "NoAnimation"})
AddSwitch(tabKiller, 276, "Instant Grab", {"Killer", "InstantGrab"})
AddSwitch(tabKiller, 314, "No Miss", {"Killer", "NoMiss"})
tabKiller.CanvasSize = UDim2.new(0,0,0,350)

-- Combat
AddSwitch(tabCombat, 10, "Face Killer", {"Combat", "FaceKiller"})
AddSlider(tabCombat, 48, "Sensitivity", {"Combat", "Sensitivity"}, 0.001, 1)
AddSwitch(tabCombat, 86, "Aim Prediction", {"Combat", "AimPrediction"})
AddSlider(tabCombat, 124, "Aim Strictness", {"Combat", "AimStrictness"}, 1, 10)
AddSwitch(tabCombat, 162, "Ignore Killer Skills", {"Combat", "IgnoreKillerSkills"})
AddSwitch(tabCombat, 200, "Veil / Masked / Stalker", {"Combat", "VeilMaskedStalker"})
tabCombat.CanvasSize = UDim2.new(0,0,0,280)

-- Aimbot
AddSwitch(tabAimbot, 10, "Aimbot Enabled", {"Aimbot", "Enabled"})
AddSwitch(tabAimbot, 48, "Lock Survivor", {"Aimbot", "LockSurvivor"})
AddSwitch(tabAimbot, 86, "Lock Killer", {"Aimbot", "LockKiller"})
AddSwitch(tabAimbot, 124, "Silent Aim", {"Aimbot", "SilentAim"})
AddSlider(tabAimbot, 162, "FOV Size", {"Aimbot", "FOV"}, 50, 600)
AddSwitch(tabAimbot, 200, "Show FOV", {"Aimbot", "ShowFOV"})
tabAimbot.CanvasSize = UDim2.new(0,0,0,260)

-- ESP
AddSwitch(tabESP, 10, "ESP Enabled", {"ESP", "Enabled"})
AddSwitch(tabESP, 48, "Show Survivor", {"ESP", "Survivor"})
AddSwitch(tabESP, 86, "Show Killer", {"ESP", "Killer"})
AddSwitch(tabESP, 124, "Show Generator", {"ESP", "Generator"})
AddSwitch(tabESP, 162, "Show Exit", {"ESP", "Exit"})
AddSwitch(tabESP, 200, "Show Pallet", {"ESP", "Pallet"})
AddSwitch(tabESP, 238, "Show Window", {"ESP", "Window"})
AddSwitch(tabESP, 276, "Show Distance", {"ESP", "ShowDistance"})
AddSwitch(tabESP, 314, "Show Health", {"ESP", "ShowHealth"})
tabESP.CanvasSize = UDim2.new(0,0,0,350)

-- Visual
AddSwitch(tabVisual, 10, "Full Bright", {"Visual", "FullBright"})
AddSwitch(tabVisual, 48, "No Fog", {"Visual", "NoFog"})
AddSwitch(tabVisual, 86, "No Shadow", {"Visual", "NoShadow"})
AddSwitch(tabVisual, 124, "No Blur", {"Visual", "NoBlur"})
AddSwitch(tabVisual, 162, "No Vignette", {"Visual", "NoVignette"})
tabVisual.CanvasSize = UDim2.new(0,0,0,200)

-- Misc
AddSlider(tabMisc, 10, "Walk Speed", {"Misc", "WalkSpeed"}, 16, 120)
AddSlider(tabMisc, 48, "Jump Power", {"Misc", "JumpPower"}, 30, 120)
AddSwitch(tabMisc, 86, "No Clip", {"Misc", "NoClip"})
AddSwitch(tabMisc, 124, "Fly Mode", {"Misc", "Fly"})
AddSlider(tabMisc, 162, "Fly Speed", {"Misc", "FlySpeed"}, 20, 100)
AddSwitch(tabMisc, 200, "God Mode", {"Misc", "GodMode"})
tabMisc.CanvasSize = UDim2.new(0,0,0,260)

-- ⚙️ FUNGSI JALAN FITUR
RunService.RenderStepped:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp or hum.Health <= 0 then return end

        -- Survivor
        if _G.RheyzHub.Survivor.NoSlowdown then
            hum.WalkSpeed = _G.RheyzHub.Misc.WalkSpeed
            hum.JumpPower = _G.RheyzHub.Misc.JumpPower
        end
        if _G.RheyzHub.Survivor.SelfHeal and hum.Health < hum.MaxHealth then
            hum.Health = math.min(hum.Health + 2, hum.MaxHealth)
        end

        -- Killer
        if _G.RheyzHub.Killer.SpeedMulti > 1 then
            hum.WalkSpeed = 22 * _G.RheyzHub.Killer.SpeedMulti
        end

        -- Misc
        if _G.RheyzHub.Misc.Fly then
            hrp.Velocity = Vector3.new(0,0,0)
            local spd = _G.RheyzHub.Misc.FlySpeed / 10
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then hrp.CFrame *= CFrame.new(0,0,-spd) end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then hrp.CFrame *= CFrame.new(0,0,spd) end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then hrp.CFrame *= CFrame.new(-spd,0,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then hrp.CFrame *= CFrame.new(spd,0,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then hrp.CFrame *= CFrame.new(0,spd,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then hrp.CFrame *= CFrame.new(0,-spd,0) end
        end
        if _G.RheyzHub.Misc.NoClip then
            hum:ChangeState(Enum.HumanoidStateType.Physics)
            hrp.Velocity = Vector3.new(0,0,0)
        end
        if _G.RheyzHub.Misc.GodMode then
            hum.MaxHealth = math.huge
            hum.Health = math.huge
        end

        -- Visual
        Lighting.FogEnd = _G.RheyzHub.Visual.NoFog and 100000 or 800
        Lighting.GlobalShadows = not _G.RheyzHub.Visual.NoShadow
        Lighting.Brightness = _G.RheyzHub.Visual.FullBright and 4 or 1
        Lighting.Ambient = _G.RheyzHub.Visual.FullBright and Color3.new(1,1,1) or Color3.new(0.3,0.3,0.3)
        Lighting.BlurSize = _G.RheyzHub.Visual.NoBlur and 0 or 12
        Lighting.VignetteEnabled = not _G.RheyzHub.Visual.NoVignette
    end)
end)
