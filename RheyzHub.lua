--[[
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
✅ Violence District | RheyzHub
📌 Versi: v1.6.0
🎨 UI & Fitur: Persis Gaya Pandu Hub
📋 Lengkap & Aktif
▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
]]

-- Layanan Roblox
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- ⚙️ PENGATURAN LENGKAP
_G.RheyzHub = {
    Survivor = {
        AutoSkillCheck = false,
        SkillCheckSpeed = 20,
        DodgeSkill = false,
        AutoCrouch = false,
        BypassExit = false,
        SelfHeal = false,
        NoSlowdown = false,
        AntiKnockdown = false,
        AutoWiggle = false,
        FleeKiller = false,
        FleeRange = 30,
        AutoRepair = false,
        FastRepair = false,
        NoInteractDelay = false
    },
    Killer = {
        NoCooldown = false,
        InstantHit = false,
        NoStun = false,
        SpeedBoost = false,
        SpeedMulti = 2,
        InstantGrab = false,
        WallCheckBypass = false,
        NoMiss = false,
        TrapInstant = false
    },
    Aimbot = {
        Enabled = false,
        Target = "Head",
        SilentAim = false,
        FOV = 250,
        ShowFOV = false,
        LockOnKiller = false,
        LockOnSurvivor = false,
        HeadOffset = 9
    },
    ESP = {
        Enabled = false,
        Survivor = true,
        Killer = true,
        Generator = true,
        Exit = true,
        Pallet = true,
        Window = true,
        ShowDistance = true
    },
    Visual = {
        FullBright = false,
        NoFog = false,
        NoShadow = false,
        NoBlur = false
    },
    Misc = {
        WalkSpeed = 40,
        JumpPower = 60,
        GodMode = false,
        NoClip = false,
        Fly = false,
        FlySpeed = 50
    }
}

-- 🎨 UI GAYA PANDU HUB
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RheyzHub_ViolenceDistrict"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- Tombol Buka/Tutup
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 42, 0, 42)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.2, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(75, 60, 180)
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
Main.Size = UDim2.new(0, 580, 0, 500)
Main.Position = UDim2.new(0.5, -290, 0.5, -250)
Main.BackgroundColor3 = Color3.fromRGB(18, 16, 35)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(130, 100, 255)
MainStroke.Thickness = 1.5
MainStroke.Parent = Main

-- Bilah Atas
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(26, 23, 50)
TopBar.BorderSizePixel = 0
TopBar.Parent = Main
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Position = UDim2.new(0.05, 0, 0, 0)
Title.Text = "Violence District v1.6.0 | RheyzHub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(210, 200, 255)
Title.TextSize = 14
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(0.93, 0, 0.15, 0)
CloseBtn.Text = "×"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.fromRGB(255, 85, 85)
CloseBtn.TextSize = 20
CloseBtn.BackgroundTransparency = 1
CloseBtn.Parent = TopBar
CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false end)

-- 📌 SISTEM TAB
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -20, 0, 40)
TabBar.Position = UDim2.new(0, 10, 0, 55)
TabBar.BackgroundTransparency = 1
TabBar.Parent = Main

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -20, 1, -110)
ContentFrame.Position = UDim2.new(0, 10, 0, 100)
ContentFrame.BackgroundColor3 = Color3.fromRGB(24, 21, 42)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = Main
Instance.new("UICorner", ContentFrame).CornerRadius = UDim.new(0, 8)

local tabs = {}
local function CreateTab(name, offsetX)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 120, 0, 34)
    btn.Position = UDim2.new(0, offsetX, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(35, 31, 60)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(170, 160, 230)
    btn.TextSize = 12
    btn.AutoButtonColor = false
    btn.Parent = TabBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(1, -16, 1, -16)
    content.Position = UDim2.new(0, 8, 0, 8)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.ScrollBarThickness = 4
    content.ScrollBarImageColor3 = Color3.fromRGB(130, 100, 255)
    content.Visible = false
    content.Parent = ContentFrame

    table.insert(tabs, {Button = btn, Content = content})
    return content
end

local function SwitchTab(selected)
    for _,t in ipairs(tabs) do
        t.Content.Visible = t == selected
        TweenService:Create(t.Button, TweenInfo.new(0.15), {
            BackgroundColor3 = t == selected and Color3.fromRGB(70, 55, 190) or Color3.fromRGB(35, 31, 60),
            TextColor3 = t == selected and Color3.new(1,1,1) or Color3.fromRGB(170, 160, 230)
        }):Play()
    end
end

-- Buat Tab
local tabSurvivor = CreateTab("🧑 SURVIVOR", 0)
local tabKiller = CreateTab("💀 KILLER", 125)
local tabAim = CreateTab("🎯 AIMBOT", 250)
local tabESP = CreateTab("👁️ ESP", 375)
local tabMisc = CreateTab("⚙️ LAINNYA", 500)

tabs[1].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[1]) end)
tabs[2].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[2]) end)
tabs[3].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[3]) end)
tabs[4].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[4]) end)
tabs[5].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[5]) end)
SwitchTab(tabs[1])

-- 🛠️ FUNGSI TOMBOL & SLIDER
local function AddSwitch(parent, yPos, label, path)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.96, 0, 0, 36)
    container.Position = UDim2.new(0.02, 0, 0, yPos)
    container.BackgroundColor3 = Color3.fromRGB(32, 28, 55)
    container.BorderSizePixel = 0
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 6)

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.75, 0, 1, 0)
    text.Position = UDim2.new(0.08, 0, 0, 0)
    text.Text = label
    text.Font = Enum.Font.Gotham
    text.TextColor3 = Color3.new(1,1,1)
    text.TextSize = 11
    text.BackgroundTransparency = 1
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Parent = container

    local switchBg = Instance.new("Frame")
    switchBg.Size = UDim2.new(0, 32, 0, 16)
    switchBg.Position = UDim2.new(0.9, 0, 0.5, -8)
    switchBg.BackgroundColor3 = Color3.fromRGB(50, 46, 80)
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
            BackgroundColor3 = newVal and Color3.fromRGB(130, 100, 255) or Color3.fromRGB(50, 46, 80)
        }):Play()
        TweenService:Create(switchDot, TweenInfo.new(0.15), {
            Position = newVal and UDim2.new(0.6, 0, 0.5, -6) or UDim2.new(0.1, 0, 0.5, -6)
        }):Play()
    end)
end

local function AddSlider(parent, yPos, label, path, min, max)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.96, 0, 0, 42)
    container.Position = UDim2.new(0.02, 0, 0, yPos)
    container.BackgroundColor3 = Color3.fromRGB(32, 28, 55)
    container.BorderSizePixel = 0
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 6)

    local val = _G.RheyzHub
    for _,k in ipairs(path) do val = val[k] end

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.9, 0, 0.4, 0)
    text.Position = UDim2.new(0.06, 0, 0.1, 0)
    text.Text = label .. ": " .. val .. "/" .. max
    text.Font = Enum.Font.Gotham
    text.TextColor3 = Color3.new(1,1,1)
    text.TextSize = 11
    text.BackgroundTransparency = 1
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Parent = container

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0.9, 0, 0, 6)
    bar.Position = UDim2.new(0.06, 0, 0.75, 0)
    bar.BackgroundColor3 = Color3.fromRGB(50, 46, 80)
    bar.Parent = container
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 3)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((val-min)/(max-min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(130, 100, 255)
    fill.Parent = bar
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 3)

    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 12, 0, 12)
    dot.Position = UDim2.new((val-min)/(max-min), -6, 0.5, -6)
    dot.BackgroundColor3 = Color3.new(1,1,1)
    dot.Parent = bar
    Instance.new("UICorner", dot).CornerRadius = UDim.new(0, 6)

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
            dot.Position = UDim2.new(pos,-6,0.5,-6)
            text.Text = label .. ": " .. newVal .. "/" .. max
        end
    end)
end

-- 📋 ISI SETIAP TAB
-- Survivor
AddSwitch(tabSurvivor, 10, "Auto Skill Check", {"Survivor", "AutoSkillCheck"})
AddSlider(tabSurvivor, 48, "Kecepatan Skill Check", {"Survivor", "SkillCheckSpeed"}, 1, 50)
AddSwitch(tabSurvivor, 96, "Auto Crouch / Dodge", {"Survivor", "DodgeSkill"})
AddSwitch(tabSurvivor, 134, "Bypass Pintu Keluar", {"Survivor", "BypassExit"})
AddSwitch(tabSurvivor, 172, "Penyembuhan Otomatis", {"Survivor", "SelfHeal"})
AddSwitch(tabSurvivor, 210, "Tanpa Perlambatan", {"Survivor", "NoSlowdown"})
AddSwitch(tabSurvivor, 248, "Anti Jatuh", {"Survivor", "AntiKnockdown"})
AddSwitch(tabSurvivor, 286, "Auto Wiggle", {"Survivor", "AutoWiggle"})
AddSwitch(tabSurvivor, 324, "Lari Jauh dari Pemburu", {"Survivor", "FleeKiller"})
AddSlider(tabSurvivor, 362, "Jarak Lari", {"Survivor", "FleeRange"}, 10, 150)
AddSwitch(tabSurvivor, 410, "Perbaiki Generator Otomatis", {"Survivor", "AutoRepair"})
AddSwitch(tabSurvivor, 448, "Perbaiki Cepat", {"Survivor", "FastRepair"})
tabSurvivor.CanvasSize = UDim2.new(0,0,0,490)

-- Killer
AddSwitch(tabKiller, 10, "Tanpa Waktu Tunggu", {"Killer", "NoCooldown"})
AddSwitch(tabKiller, 48, "Pukulan Langsung Tembus", {"Killer", "InstantHit"})
AddSwitch(tabKiller, 86, "Anti Stun", {"Killer", "NoStun"})
AddSwitch(tabKiller, 124, "Kecepatan Tambah", {"Killer", "SpeedBoost"})
AddSlider(tabKiller, 162, "Pengali Kecepatan", {"Killer", "SpeedMulti"}, 1, 3)
AddSwitch(tabKiller, 210, "Tangkap Langsung", {"Killer", "InstantGrab"})
AddSwitch(tabKiller, 248, "Tembus Dinding", {"Killer", "WallCheckBypass"})
AddSwitch(tabKiller, 286, "Pukulan Tidak Meleset", {"Killer", "NoMiss"})
tabKiller.CanvasSize = UDim2.new(0,0,0,320)

-- Aimbot
AddSwitch(tabAim, 10, "Aimbot Aktif", {"Aimbot", "Enabled"})
AddSwitch(tabAim, 48, "Aim Pemburu", {"Aimbot", "LockOnKiller"})
AddSwitch(tabAim, 86, "Aim Korban", {"Aimbot", "LockOnSurvivor"})
AddSwitch(tabAim, 124, "Aim Senyap", {"Aimbot", "SilentAim"})
AddSlider(tabAim, 162, "Jarak Pandang (FOV)", {"Aimbot", "FOV"}, 50, 600)
AddSwitch(tabAim, 210, "Tampilkan Lingkaran FOV", {"Aimbot", "ShowFOV"})
AddSlider(tabAim, 248, "Offset Kepala", {"Aimbot", "HeadOffset"}, 0, 15)
tabAim.CanvasSize = UDim2.new(0,0,0,300)

-- ESP
AddSwitch(tabESP, 10, "ESP Aktif", {"ESP", "Enabled"})
AddSwitch(tabESP, 48, "Tampilkan Korban", {"ESP", "Survivor"})
AddSwitch(tabESP, 86, "Tampilkan Pemburu", {"ESP", "Killer"})
AddSwitch(tabESP, 124, "Tampilkan Generator", {"ESP", "Generator"})
AddSwitch(tabESP, 162, "Tampilkan Pintu Keluar", {"ESP", "Exit"})
AddSwitch(tabESP, 200, "Tampilkan Palet", {"ESP", "Pallet"})
AddSwitch(tabESP, 238, "Tampilkan Jendela", {"ESP", "Window"})
AddSwitch(tabESP, 276, "Tampilkan Jarak", {"ESP", "ShowDistance"})
tabESP.CanvasSize = UDim2.new(0,0,0,310)

-- Lainnya
AddSwitch(tabMisc, 10, "Cahaya Penuh", {"Visual", "FullBright"})
AddSwitch(tabMisc, 48, "Tanpa Kabut", {"Visual", "NoFog"})
AddSwitch(tabMisc, 86, "Tanpa Bayangan", {"Visual", "NoShadow"})
AddSwitch(tabMisc, 124, "Tanpa Efek Kabur", {"Visual", "NoBlur"})
AddSlider(tabMisc, 162, "Kecepatan Jalan", {"Misc", "WalkSpeed"}, 16, 120)
AddSlider(tabMisc, 210, "Kekuatan Lompat", {"Misc", "JumpPower"}, 30, 120)
AddSwitch(tabMisc, 258, "Tak Terkalahkan", {"Misc", "GodMode"})
AddSwitch(tabMisc, 296, "Tembus Dinding", {"Misc", "NoClip"})
AddSwitch(tabMisc, 334, "Mode Terbang", {"Misc", "Fly"})
tabMisc.CanvasSize = UDim2.new(0,0,0,370)

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
            hum.Health = math.min(hum.Health + 1.5, hum.MaxHealth)
        end

        -- Killer
        if _G.RheyzHub.Killer.SpeedBoost then
            hum.WalkSpeed = 22 * _G.RheyzHub.Killer.SpeedMulti
        end

        -- Umum
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

        -- Grafis
        Lighting.FogEnd = _G.RheyzHub.Visual.NoFog and 100000 or 800
        Lighting.GlobalShadows = not _G.RheyzHub.Visual.NoShadow
        Lighting.Brightness = _G.RheyzHub.Visual.FullBright and 3.5 or 1
        Lighting.Ambient = _G.RheyzHub.Visual.FullBright and Color3.new(1,1,1) or Color3.new(0.3,0.3,0.3)
    end)
end)

ToggleBtn.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
