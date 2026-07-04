--[[
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
✅ Violence District | RheyzHub
📌 Versi: v1.3.5
📋 Fitur: Sesuai gambar Pandu Hub + semua permintaan
🔗 Siap untuk GitHub / Raw Link
▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
]]

-- Layanan Roblox
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- ⚙️ SEMUA PENGATURAN & FITUR
_G.RheyzHub = {
    -- Ability
    AutoSkillCheck = false,
    DodgeSkill = false,
    SkillCheckFreq = 10,
    SkillCheckSpeed = 10,
    BypassExitGate = false,
    SelfHeal = false,
    NoSlowdown = false,
    AntiKnockdown = false,
    AutoWiggle = false,
    FleeKiller = false,
    FleeDistance = 25,

    -- Aim & Offset
    FlashHeadOffset = 8,
    LockAimPistol = false,
    HideSilentLaser = false,
    TargetPart = "Torso",
    PistolFOVMode = false,
    ShowPistolFOV = false,
    PistolFOVRadius = 150,

    -- Aimbot
    AimbotKiller = false,
    AimbotSurvivor = false,

    -- Fitur Tambahan
    WalkSpeed = 35,
    Fly = false,
    FlySpeed = 45,
    GodMode = false,
    NoClip = false,
    AutoGene = false,
    BreakGen = false,
    ESP = {
        Survivor = false,
        Killer = false,
        Generator = false,
        Pallet = false,
        Window = false,
        Gate = false
    },
    LocalConfig = {
        NoFog = false,
        FullBright = false,
        NoShadow = false
    }
}

-- 🎨 TAMPILAN MENU GAYA PANDU HUB
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RheyzHub_ViolenceDistrict"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- Tombol Buka/Tutup
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.25, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(70, 40, 180)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "RH"
ToggleBtn.TextColor3 = Color3.new(1,1,1)
ToggleBtn.TextSize = 16
ToggleBtn.AutoButtonColor = false
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)

-- Jendela Utama
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 520, 0, 420)
Main.Position = UDim2.new(0.5, -260, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(22, 18, 45)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(120, 80, 255)
MainStroke.Thickness = 1.5
MainStroke.Parent = Main

-- Bilah Atas
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(28, 24, 58)
TopBar.BorderSizePixel = 0
TopBar.Parent = Main
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0.05, 0, 0, 0)
Title.Text = "Violence District v1.3.5 | RheyzHub"
Title.Font = Enum.Font.GothamSemibold
Title.TextColor3 = Color3.fromRGB(200, 190, 255)
Title.TextSize = 13
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(0.92, 0, 0.15, 0)
CloseBtn.Text = "×"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.TextSize = 18
CloseBtn.BackgroundTransparency = 1
CloseBtn.Parent = TopBar
CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false end)

-- Area Konten Bisa Digulir
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -50)
Content.Position = UDim2.new(0, 10, 0, 45)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.ScrollBarThickness = 4
Content.ScrollBarImageColor3 = Color3.fromRGB(100, 70, 220)
Content.CanvasSize = UDim2.new(0, 0, 0, 850)
Content.Parent = Main

ToggleBtn.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- 🛠️ FUNGSI PEMBUATAN ELEMEN MENU
-- Tombol Saklar
local function BuatSwitch(nama, posY, variabel)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(0.96, 0, 0, 32)
    Container.Position = UDim2.new(0.02, 0, 0, posY)
    Container.BackgroundColor3 = Color3.fromRGB(30, 26, 60)
    Container.BorderSizePixel = 0
    Container.Parent = Content
    Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 6)

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.75, 0, 1, 0)
    Label.Position = UDim2.new(0.08, 0, 0, 0)
    Label.Text = nama
    Label.Font = Enum.Font.Gotham
    Label.TextColor3 = Color3.new(1,1,1)
    Label.TextSize = 11
    Label.BackgroundTransparency = 1
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container

    local Switch = Instance.new("Frame")
    Switch.Size = UDim2.new(0, 30, 0, 14)
    Switch.Position = UDim2.new(0.9, 0, 0.5, -7)
    Switch.BackgroundColor3 = Color3.fromRGB(50, 50, 75)
    Switch.BorderSizePixel = 0
    Switch.Parent = Container
    Instance.new("UICorner", Switch).CornerRadius = UDim.new(0, 7)

    local SwitchDot = Instance.new("Frame")
    SwitchDot.Size = UDim2.new(0, 10, 0, 10)
    SwitchDot.Position = UDim2.new(0.1, 0, 0.5, -5)
    SwitchDot.BackgroundColor3 = Color3.new(1,1,1)
    SwitchDot.BorderSizePixel = 0
    SwitchDot.Parent = Switch
    Instance.new("UICorner", SwitchDot).CornerRadius = UDim.new(0, 5)

    local Click = Instance.new("TextButton")
    Click.Size = UDim2.new(1, 0, 1, 0)
    Click.BackgroundTransparency = 1
    Click.Text = ""
    Click.Parent = Container

    Click.MouseButton1Click:Connect(function()
        _G.RheyzHub[variabel] = not _G.RheyzHub[variabel]
        if _G.RheyzHub[variabel] then
            TweenService:Create(Switch, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(110, 70, 255)}):Play()
            TweenService:Create(SwitchDot, TweenInfo.new(0.15), {Position = UDim2.new(0.55, 0, 0.5, -5)}):Play()
        else
            TweenService:Create(Switch, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(50, 50, 75)}):Play()
            TweenService:Create(SwitchDot, TweenInfo.new(0.15), {Position = UDim2.new(0.1, 0, 0.5, -5)}):Play()
        end
    end)
end

-- Penggeser Nilai
local function BuatSlider(nama, posY, variabel, min, max)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(0.96, 0, 0, 40)
    Container.Position = UDim2.new(0.02, 0, 0, posY)
    Container.BackgroundColor3 = Color3.fromRGB(30, 26, 60)
    Container.BorderSizePixel = 0
    Container.Parent = Content
    Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 6)

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.5, 0, 0.5, 0)
    Label.Position = UDim2.new(0.05, 0, 0.1, 0)
    Label.Text = nama..": ".._G.RheyzHub[variabel].."/"..max
    Label.Font = Enum.Font.Gotham
    Label.TextColor3 = Color3.new(1,1,1)
    Label.TextSize = 11
    Label.BackgroundTransparency = 1
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container

    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(0.85, 0, 0, 6)
    Bar.Position = UDim2.new(0.075, 0, 0.7, 0)
    Bar.BackgroundColor3 = Color3.fromRGB(50, 50, 75)
    Bar.BorderSizePixel = 0
    Bar.Parent = Container
    Instance.new("UICorner", Bar).CornerRadius = UDim.new(0, 3)

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((_G.RheyzHub[variabel]-min)/(max-min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(110, 70, 255)
    Fill.BorderSizePixel = 0
    Fill.Parent = Bar
    Instance.new("UICorner", Fill).CornerRadius = UDim.new(0, 3)

    local Drag = Instance.new("TextButton")
    Drag.Size = UDim2.new(0, 12, 0, 12)
    Drag.Position = UDim2.new((_G.RheyzHub[variabel]-min)/(max-min), -6, 0.5, -6)
    Drag.BackgroundColor3 = Color3.new(1,1,1)
    Drag.BorderSizePixel = 0
    Drag.AutoButtonColor = false
    Drag.Parent = Bar
    Instance.new("UICorner", Drag).CornerRadius = UDim.new(0, 6)

    local dragging = false
    Drag.MouseButton1Down:Connect(function() dragging = true end)
    UserInputService.InputEnded:Connect(function() dragging = false end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
            local nilai = math.floor(min + (pos * (max - min)))
            _G.RheyzHub[variabel] = nilai
            Fill.Size = UDim2.new(pos, 0, 1, 0)
            Drag.Position = UDim2.new(pos, -6, 0.5, -6)
            Label.Text = nama..": "..nilai.."/"..max
        end
    end)
end

-- 📋 SUSUNAN MENU LENGKAP
local posY = 10

-- ⚡ ABILITY
local TitleAbility = Instance.new("TextLabel")
TitleAbility.Size = UDim2.new(0.96, 0, 0, 25)
TitleAbility.Position = UDim2.new(0.02, 0, 0, posY)
TitleAbility.Text = "⚡ Ability"
TitleAbility.Font = Enum.Font.GothamBold
TitleAbility.TextColor3 = Color3.fromRGB(150, 120, 255)
TitleAbility.TextSize = 12
TitleAbility.BackgroundTransparency = 1
TitleAbility.TextXAlignment = Enum.TextXAlignment.Left
TitleAbility.Parent = Content
posY += 30

BuatSwitch("Auto Skill Check", posY, "AutoSkillCheck")
posY += 38
BuatSwitch("Auto Crouch (Dodge Skill)", posY, "DodgeSkill")
posY += 38
BuatSlider("Skill Check Frequency", posY, "SkillCheckFreq", 1, 50)
posY += 48
BuatSlider("Skill Check Speed", posY, "SkillCheckSpeed", 1, 30)
posY += 48
BuatSwitch("Bypass Exit Gate", posY, "BypassExitGate")
posY += 38
BuatSwitch("Self Heal", posY, "SelfHeal")
posY += 38
BuatSwitch("No Slowdown", posY, "NoSlowdown")
posY += 38
BuatSwitch("Anti Knockdown", posY, "AntiKnockdown")
posY += 38
BuatSwitch("Auto Wiggle", posY, "AutoWiggle")
posY += 38
BuatSwitch("Flee Killer", posY, "FleeKiller")
posY += 38
BuatSlider("Flee Distance", posY, "FleeDistance", 5, 100)
posY += 48

-- 🎯 AIM & SETTING
local TitleAim = Instance.new("TextLabel")
TitleAim.Size = UDim2.new(0.96, 0, 0, 25)
TitleAim.Position = UDim2.new(0.02, 0, 0, posY)
TitleAim.Text = "🎯 Aim & Setting"
TitleAim.Font = Enum.Font.GothamBold
TitleAim.TextColor3 = Color3.fromRGB(150, 120, 255)
TitleAim.TextSize = 12
TitleAim.BackgroundTransparency = 1
TitleAim.TextXAlignment = Enum.TextXAlignment.Left
TitleAim.Parent = Content
posY += 30

BuatSlider("Flash Head Offset (Y)", posY, "FlashHeadOffset", 0, 15)
posY += 48
BuatSwitch("Lock Aim (Pistol)", posY, "LockAimPistol")
posY += 38
BuatSwitch("Hide Silent Laser", posY, "HideSilentLaser")
posY += 38

local TargetLabel = Instance.new("TextLabel")
TargetLabel.Size = UDim2.new(0.96, 0, 0, 25)
TargetLabel.Position = UDim2.new(0.02, 0, 0, posY)
TargetLabel.Text = "Target Part: Torso"
TargetLabel.Font = Enum.Font.Gotham
TargetLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TargetLabel.TextSize = 11
TargetLabel.BackgroundTransparency = 1
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetLabel.Parent = Content
posY += 30

BuatSwitch("Pistol FOV Mode", posY, "PistolFOVMode")
posY += 38
BuatSwitch("Show Pistol FOV", posY, "ShowPistolFOV")
posY += 38
BuatSlider("Pistol FOV Radius", posY, "PistolFOVRadius", 50, 500)
posY += 48

-- 🤖 AIMBOT
local TitleAimbot = Instance.new("TextLabel")
TitleAimbot.Size = UDim2.new(0.96, 0, 0, 25)
TitleAimbot.Position = UDim2.new(0.02, 0, 0, posY)
TitleAimbot.Text = "🤖 Aimbot"
TitleAimbot.Font = Enum.Font.GothamBold
TitleAimbot.TextColor3 = Color3.fromRGB(150, 120, 255)
TitleAimbot.TextSize = 12
TitleAimbot.BackgroundTransparency = 1
TitleAimbot.TextXAlignment = Enum.TextXAlignment.Left
TitleAimbot.Parent = Content
posY += 30

BuatSwitch("Aimbot Killer", posY, "AimbotKiller")
posY += 38
BuatSwitch("Aimbot Survivor", posY, "AimbotSurvivor")
posY += 38

-- 🛠️ FITUR TAMBAHAN
local TitleLain = Instance.new("TextLabel")
TitleLain.Size = UDim2.new(0.96, 0, 0, 25)
TitleLain.Position = UDim2.new(0.02, 0, 0, posY)
TitleLain.Text = "🛠️ Fitur Lainnya"
TitleLain.Font = Enum.Font.GothamBold
TitleLain.TextColor3 = Color3.fromRGB(150, 120, 255)
TitleLain.TextSize = 12
TitleLain.BackgroundTransparency = 1
TitleLain.TextXAlignment = Enum.TextXAlignment.Left
TitleLain.Parent = Content
posY += 30

BuatSwitch("Mode Terbang", posY, "Fly")
posY += 38
BuatSwitch("No Clip", posY, "NoClip")
posY += 38
BuatSwitch("Tak Terkalahkan", posY, "GodMode")
posY += 38
BuatSwitch("Perbaiki Generator Otomatis", posY, "AutoGene")
posY += 38
BuatSwitch("Hancurkan Generator", posY, "BreakGen")
posY += 38

-- ⚙️ SISTEM FUNGSI BERJALAN
RunService.RenderStepped:Connect(function()
    pcall(function()
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local HRP = Character:FindFirstChild("HumanoidRootPart")
        if not Humanoid or not HRP or Humanoid.Health <= 0 then return end

        -- Anti Perlambatan
        if _G.RheyzHub.NoSlowdown then
            Humanoid.WalkSpeed = _G.RheyzHub.WalkSpeed
            Humanoid.JumpPower = 55
        end

        -- No Clip
        if _G.RheyzHub.NoClip then
            Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            HRP.Velocity = Vector3.new(0,0,0)
        end

        -- Mode Terbang
        if _G.RheyzHub.Fly then
            HRP.Velocity = Vector3.new(0,0,0)
            local spd = _G.RheyzHub.FlySpeed / 10
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then HRP.CFrame *= CFrame.new(0,0,-spd) end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then HRP.CFrame *= CFrame.new(0,0,spd) end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then HRP.CFrame *= CFrame.new(-spd,0,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then HRP.CFrame *= CFrame.new(spd,0,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then HRP.CFrame *= CFrame.new(0,spd,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then HRP.CFrame *= CFrame.new(0,-spd,0) end
        end

        -- Tak Terkalahkan
        if _G.RheyzHub.GodMode then
            Humanoid.MaxHealth = math.huge
            Humanoid.Health = math.huge
        end

        -- Penyembuhan Otomatis
        if _G.RheyzHub.SelfHeal and Humanoid.Health < Humanoid.MaxHealth then
            Humanoid.Health = math.min(Humanoid.Health + 1.2, Humanoid.MaxHealth)
        end

        -- Pengaturan Grafis
        Lighting.FogEnd = _G.RheyzHub.LocalConfig.NoFog and 100000 or 1000
        Lighting.GlobalShadows = not _G.RheyzHub.LocalConfig.NoShadow
        Lighting.Brightness = _G.RheyzHub.LocalConfig.FullBright and 3 or 1
        Lighting.Ambient = _G.RheyzHub.LocalConfig.FullBright and Color3.new(1,1,1) or Color3.new(0.35,0.35,0.35)
    end)
end)
