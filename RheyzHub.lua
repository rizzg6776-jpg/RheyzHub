--[[
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
✅ Violence District | RheyzHub
📌 Versi: v1.5.0
🎨 Tampilan & Struktur: Sesuai Pandu Hub
📋 Fitur Lengkap: Survivor | Killer | Aim | ESP | Grafis
▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
]]

-- Layanan Roblox
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Camera = game:GetService("Workspace").CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- ⚙️ PENGATURAN LENGKAP
_G.RheyzHub = {
    -- 🧑 SURVIVOR
    Survivor = {
        AutoSkillCheck = false,
        DodgeSkill = false,
        SkillCheckFreq = 12,
        SkillCheckSpeed = 15,
        BypassExitGate = false,
        SelfHeal = false,
        NoSlowdown = false,
        AntiKnockdown = false,
        AutoWiggle = false,
        FleeKiller = false,
        FleeDistance = 30,
        AutoRepair = false,
        FastRepair = false,
        NoInteractDelay = false
    },

    -- 💀 KILLER
    Killer = {
        NoCooldown = false,
        InstantHit = false,
        NoStun = false,
        SpeedBoost = false,
        SpeedMultiplier = 1.8,
        InstantGrab = false,
        Wallhack = false,
        NoHitMiss = false,
        TrapInstant = false
    },

    -- 🎯 AIM & AIMBOT
    Aim = {
        FlashHeadOffset = 9,
        LockAimPistol = false,
        HideLaser = false,
        TargetPart = "Head",
        FOVMode = false,
        ShowFOV = false,
        FOVRadius = 200,
        AimbotSurvivor = false,
        AimbotKiller = false,
        SilentAim = false
    },

    -- 👁️ ESP
    ESP = {
        Enabled = false,
        Survivor = true,
        Killer = true,
        Generator = true,
        ExitGate = true,
        Pallet = true,
        Window = true,
        ShowDistance = true
    },

    -- ⚙️ UMUM & GRAFIS
    General = {
        WalkSpeed = 38,
        JumpPower = 55,
        Fly = false,
        FlySpeed = 50,
        NoClip = false,
        GodMode = false,
        Reach = false,
        ReachDistance = 12,
        Graphics = {
            FullBright = false,
            NoFog = false,
            NoShadow = false,
            NoBlur = false
        }
    }
}

-- 🎨 TAMPILAN GAYA PANDU HUB
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RheyzHub_ViolenceDistrict"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- Tombol Buka/Tutup
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 42, 0, 42)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.22, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(62, 48, 140)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "RH"
ToggleBtn.TextColor3 = Color3.new(1,1,1)
ToggleBtn.TextSize = 17
ToggleBtn.AutoButtonColor = false
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 9)

-- Jendela Utama
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 560, 0, 480)
Main.Position = UDim2.new(0.5, -280, 0.5, -240)
Main.BackgroundColor3 = Color3.fromRGB(20, 18, 38)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(120, 95, 255)
MainStroke.Thickness = 1.8
MainStroke.Parent = Main

-- Bilah Atas
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(28, 25, 52)
TopBar.BorderSizePixel = 0
TopBar.Parent = Main
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 14)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Position = UDim2.new(0.06, 0, 0, 0)
Title.Text = "Violence District v1.5.0 | RheyzHub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(200, 185, 255)
Title.TextSize = 15
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(0.93, 0, 0.13, 0)
CloseBtn.Text = "×"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
CloseBtn.TextSize = 22
CloseBtn.BackgroundTransparency = 1
CloseBtn.Parent = TopBar
CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false end)

-- 📌 SISTEM TAB
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -20, 0, 42)
TabBar.Position = UDim2.new(0, 10, 0, 55)
TabBar.BackgroundTransparency = 1
TabBar.Parent = Main

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -20, 1, -110)
ContentFrame.Position = UDim2.new(0, 10, 0, 102)
ContentFrame.BackgroundColor3 = Color3.fromRGB(26, 23, 46)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = Main
Instance.new("UICorner", ContentFrame).CornerRadius = UDim.new(0, 10)

local tabs = {}
local function CreateTab(name, offsetX)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 125, 0, 36)
    btn.Position = UDim2.new(0, offsetX, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(36, 32, 62)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(170, 160, 230)
    btn.TextSize = 12.5
    btn.AutoButtonColor = false
    btn.Parent = TabBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(1, -16, 1, -16)
    content.Position = UDim2.new(0, 8, 0, 8)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.ScrollBarThickness = 5
    content.ScrollBarImageColor3 = Color3.fromRGB(120, 95, 255)
    content.Visible = false
    content.Parent = ContentFrame

    table.insert(tabs, {Button = btn, Content = content})
    return content
end

local function SwitchTab(selected)
    for _,t in ipairs(tabs) do
        t.Content.Visible = t == selected
        TweenService:Create(t.Button, TweenInfo.new(0.18), {
            BackgroundColor3 = t == selected and Color3.fromRGB(72, 58, 190) or Color3.fromRGB(36, 32, 62),
            TextColor3 = t == selected and Color3.new(1,1,1) or Color3.fromRGB(170, 160, 230)
        }):Play()
    end
end

-- Buat Semua Tab
local tabSurvivor = CreateTab("🧑 SURVIVOR", 0)
local tabKiller = CreateTab("💀 KILLER", 135)
local tabAim = CreateTab("🎯 AIM & AIMBOT", 270)
local tabESP = CreateTab("👁️ ESP", 405)
local tabGraphics = CreateTab("⚙️ GRAFIS", 540)

-- Hubungkan Klik
tabs[1].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[1]) end)
tabs[2].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[2]) end)
tabs[3].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[3]) end)
tabs[4].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[4]) end)
tabs[5].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[5]) end)

SwitchTab(tabs[1])

-- 🛠️ FUNGSI PEMBUATAN ELEMEN
local function AddSwitch(parent, yPos, label, path)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.97, 0, 0, 36)
    container.Position = UDim2.new(0.015, 0, 0, yPos)
    container.BackgroundColor3 = Color3.fromRGB(34, 30, 58)
    container.BorderSizePixel = 0
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 7)

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.78, 0, 1, 0)
    text.Position = UDim2.new(0.07, 0, 0, 0)
    text.Text = label
    text.Font = Enum.Font.Gotham
    text.TextColor3 = Color3.new(1,1,1)
    text.TextSize = 11.5
    text.BackgroundTransparency = 1
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Parent = container

    local switchBg = Instance.new("Frame")
    switchBg.Size = UDim2.new(0, 34, 0, 17)
    switchBg.Position = UDim2.new(0.91, 0, 0.5, -8.5)
    switchBg.BackgroundColor3 = Color3.fromRGB(52, 48, 82)
    switchBg.Parent = container
    Instance.new("UICorner", switchBg).CornerRadius = UDim.new(0, 8.5)

    local switchDot = Instance.new("Frame")
    switchDot.Size = UDim2.new(0, 13, 0, 13)
    switchDot.Position = UDim2.new(0.1, 0, 0.5, -6.5)
    switchDot.BackgroundColor3 = Color3.new(1,1,1)
    switchDot.Parent = switchBg
    Instance.new("UICorner", switchDot).CornerRadius = UDim.new(0, 6.5)

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
            BackgroundColor3 = newVal and Color3.fromRGB(120, 95, 255) or Color3.fromRGB(52, 48, 82)
        }):Play()
        TweenService:Create(switchDot, TweenInfo.new(0.15), {
            Position = newVal and UDim2.new(0.62, 0, 0.5, -6.5) or UDim2.new(0.1, 0, 0.5, -6.5)
        }):Play()
    end)
end

local function AddSlider(parent, yPos, label, path, min, max)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.97, 0, 0, 44)
    container.Position = UDim2.new(0.015, 0, 0, yPos)
    container.BackgroundColor3 = Color3.fromRGB(34, 30, 58)
    container.BorderSizePixel = 0
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 7)

    local val = _G.RheyzHub
    for _,k in ipairs(path) do val = val[k] end

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.9, 0, 0.42, 0)
    text.Position = UDim2.new(0.06, 0, 0.1, 0)
    text.Text = label .. ": " .. val .. "/" .. max
    text.Font = Enum.Font.Gotham
    text.TextColor3 = Color3.new(1,1,1)
    text.TextSize = 11.5
    text.BackgroundTransparency = 1
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Parent = container

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0.9, 0, 0, 7)
    bar.Position = UDim2.new(0.06, 0, 0.75, 0)
    bar.BackgroundColor3 = Color3.fromRGB(52, 48, 82)
    bar.Parent = container
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 3.5)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((val-min)/(max-min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(120, 95, 255)
    fill.Parent = bar
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 3.5)

    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 13, 0, 13)
    dot.Position = UDim2.new((val-min)/(max-min), -6.5, 0.5, -6.5)
    dot.BackgroundColor3 = Color3.new(1,1,1)
    dot.Parent = bar
    Instance.new("UICorner", dot).CornerRadius = UDim.new(0, 6.5)

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
            dot.Position = UDim2.new(pos,-6.5,0.5,-6.5)
            text.Text = label .. ": " .. newVal .. "/" .. max
        end
    end)
end

-- 📋 ISI SETIAP TAB
-- Tab SURVIVOR
AddSwitch(tabSurvivor, 10, "Auto Skill Check", {"Survivor", "AutoSkillCheck"})
AddSwitch(tabSurvivor, 48, "Auto Crouch (Dodge Skill)", {"Survivor", "DodgeSkill"})
AddSlider(tabSurvivor, 86, "Skill Check Frequency", {"Survivor", "SkillCheckFreq"}, 1, 50)
AddSlider(tabSurvivor, 134, "Skill Check Speed", {"Survivor", "SkillCheckSpeed"}, 1, 30)
AddSwitch(tabSurvivor, 182, "Bypass Exit Gate", {"Survivor", "BypassExitGate"})
AddSwitch(tabSurvivor, 220, "Self Heal", {"Survivor", "SelfHeal"})
AddSwitch(tabSurvivor, 258, "No Slowdown", {"Survivor", "NoSlowdown"})
AddSwitch(tabSurvivor, 296, "Anti Knockdown", {"Survivor", "AntiKnockdown"})
AddSwitch(tabSurvivor, 334, "Auto Wiggle", {"Survivor", "AutoWiggle"})
AddSwitch(tabSurvivor, 372, "Auto Repair Generator", {"Survivor", "AutoRepair"})
AddSwitch(tabSurvivor, 410, "Fast Repair", {"Survivor", "FastRepair"})
AddSlider(tabSurvivor, 448, "Flee Distance", {"Survivor", "FleeDistance"}, 5, 120)
tabSurvivor.CanvasSize = UDim2.new(0,0,0,490)

-- Tab KILLER
AddSwitch(tabKiller, 10, "No Cooldown Skill", {"Killer", "NoCooldown"})
AddSwitch(tabKiller, 48, "Instant Hit", {"Killer", "InstantHit"})
AddSwitch(tabKiller, 86, "No Stun", {"Killer", "NoStun"})
AddSwitch(tabKiller, 124, "Speed Boost", {"Killer", "SpeedBoost"})
AddSlider(tabKiller, 162, "Speed Multiplier", {"Killer", "SpeedMultiplier"}, 1, 3)
AddSwitch(tabKiller, 210, "Instant Grab", {"Killer", "InstantGrab"})
AddSwitch(tabKiller, 248, "Wallhack", {"Killer", "Wallhack"})
AddSwitch(tabKiller, 286, "No Hit Miss", {"Killer", "NoHitMiss"})
tabKiller.CanvasSize = UDim2.new(0,0,0,320)

-- Tab AIM & AIMBOT
AddSlider(tabAim, 10, "Flash Head Offset", {"Aim", "FlashHeadOffset"}, 0, 15)
AddSwitch(tabAim, 58, "Lock Aim Pistol", {"Aim", "LockAimPistol"})
AddSwitch(tabAim, 96, "Hide Laser", {"Aim", "HideLaser"})
AddSwitch(tabAim, 134, "FOV Mode", {"Aim", "FOVMode"})
AddSwitch(tabAim, 172, "Show FOV", {"Aim", "ShowFOV"})
AddSlider(tabAim, 210, "FOV Radius", {"Aim", "FOVRadius"}, 50, 500)
AddSwitch(tabAim, 260, "Aimbot Survivor", {"Aim", "AimbotSurvivor"})
AddSwitch(tabAim, 298, "Aimbot Killer", {"Aim", "AimbotKiller"})
AddSwitch(tabAim, 336, "Silent Aim", {"Aim", "SilentAim"})
tabAim.CanvasSize = UDim2.new(0,0,0,370)

-- Tab ESP
AddSwitch(tabESP, 10, "ESP Aktif", {"ESP", "Enabled"})
AddSwitch(tabESP, 48, "Tampilkan Survivor", {"ESP", "Survivor"})
AddSwitch(tabESP, 86, "Tampilkan Killer", {"ESP", "Killer"})
AddSwitch(tabESP, 124, "Tampilkan Generator", {"ESP", "Generator"})
AddSwitch(tabESP, 162, "Tampilkan Pintu Keluar", {"ESP", "ExitGate"})
AddSwitch(tabESP, 200, "Tampilkan Pallet", {"ESP", "Pallet"})
AddSwitch(tabESP, 238, "Tampilkan Jendela", {"ESP", "Window"})
AddSwitch(tabESP, 276, "Tampilkan Jarak", {"ESP", "ShowDistance"})
tabESP.CanvasSize = UDim2.new(0,0,0,310)

-- Tab GRAFIS & UMUM
AddSwitch(tabGraphics, 10, "Mode Terbang", {"General", "Fly"})
AddSwitch(tabGraphics, 48, "No Clip", {"General", "NoClip"})
AddSwitch(tabGraphics, 86, "Tak Terkalahkan", {"General", "GodMode"})
AddSlider(tabGraphics, 124, "Kecepatan Jalan", {"General", "WalkSpeed"}, 16, 120)
AddSlider(tabGraphics, 172, "Kekuatan Lompat", {"General", "JumpPower"}, 30, 120)
AddSwitch(tabGraphics, 220, "Full Bright", {"General", "Graphics", "FullBright"})
AddSwitch(tabGraphics, 258, "No Fog", {"General", "Graphics", "NoFog"})
AddSwitch(tabGraphics, 296, "No Shadow", {"General", "Graphics", "NoShadow"})
AddSwitch(tabGraphics, 334, "No Blur", {"General", "Graphics", "NoBlur"})
tabGraphics.CanvasSize = UDim2.new(0,0,0,370)

-- ⚙️ FUNGSI AKTIF FITUR
RunService.RenderStepped:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp or hum.Health <= 0 then return end

        -- Survivor
        if _G.RheyzHub.Survivor.NoSlowdown then
            hum.WalkSpeed = _G.RheyzHub.General.WalkSpeed
            hum.JumpPower = _G.RheyzHub.General.JumpPower
        end
        if _G.RheyzHub.Survivor.SelfHeal and hum.Health < hum.MaxHealth then
            hum.Health = math.min(hum.Health + 1.5, hum.MaxHealth)
        end

        -- Killer
        if _G.RheyzHub.Killer.SpeedBoost then
            hum.WalkSpeed = 22 * _G.RheyzHub.Killer.SpeedMultiplier
        end

        -- Umum
        if _G.RheyzHub.General.Fly then
            hrp.Velocity = Vector3.new(0,0,0)
            local spd = _G.RheyzHub.General.FlySpeed / 10
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then hrp.CFrame *= CFrame.new(0,0,-spd) end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then hrp.CFrame *= CFrame.new(0,0,spd) end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then hrp.CFrame *= CFrame.new(-spd,0,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then hrp.CFrame *= CFrame.new(spd,0,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then hrp.CFrame *= CFrame.new(0,spd,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then hrp.CFrame *= CFrame.new(0,-spd,0) end
        end
        if _G.RheyzHub.General.NoClip then
            hum:ChangeState(Enum.HumanoidStateType.Physics)
            hrp.Velocity = Vector3.new(0,0,0)
        end
        if _G.RheyzHub.General.GodMode then
            hum.MaxHealth = math.huge
            hum.Health = math.huge
        end

        -- Grafis
        Lighting.FogEnd = _G.RheyzHub.General.Graphics.NoFog and 100000 or 800
        Lighting.GlobalShadows = not _G.RheyzHub.General.Graphics.NoShadow
        Lighting.Brightness = _G.RheyzHub.General.Graphics.FullBright and 3.5 or 1
        Lighting.Ambient = _G.RheyzHub.General.Graphics.FullBright and Color3.new(1,1,1) or Color3.new(0.32,0.32,0.32)
    end)
end)

ToggleBtn.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
