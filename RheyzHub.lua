--[[
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
✅ Violence District | RheyzHub
📌 Versi: v1.4.0
📋 Tampilan & Fitur Sesuai Pandu Hub
🔹 Tab Terpisah: Survivor | Killer | Aimbot | Lainnya
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

-- ⚙️ PENGATURAN LENGKAP
_G.RheyzHub = {
    -- === SURVIVOR ===
    Survivor = {
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
        AutoRepair = false,
        FastRepair = false
    },

    -- === KILLER ===
    Killer = {
        NoCooldown = false,
        InstantHit = false,
        NoStun = false,
        SpeedBoost = false,
        SpeedMultiplier = 1.5,
        Wallhack = false,
        InstantGrab = false
    },

    -- === AIMBOT & AIM ===
    Aim = {
        FlashHeadOffset = 8,
        LockAimPistol = false,
        HideSilentLaser = false,
        TargetPart = "Torso",
        PistolFOVMode = false,
        ShowPistolFOV = false,
        PistolFOVRadius = 150,
        AimbotKiller = false,
        AimbotSurvivor = false
    },

    -- === FITUR UMUM ===
    General = {
        WalkSpeed = 35,
        Fly = false,
        FlySpeed = 45,
        GodMode = false,
        NoClip = false,
        ESP = {Enabled = false, Survivor = true, Killer = true, Generator = true, Gate = true},
        Graphics = {NoFog = false, FullBright = false, NoShadow = false}
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
ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.25, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(58, 46, 124)
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
Main.Size = UDim2.new(0, 540, 0, 460)
Main.Position = UDim2.new(0.5, -270, 0.5, -230)
Main.BackgroundColor3 = Color3.fromRGB(25, 22, 44)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(102, 86, 226)
MainStroke.Thickness = 1.5
MainStroke.Parent = Main

-- Bilah Atas
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BackgroundColor3 = Color3.fromRGB(32, 29, 56)
TopBar.BorderSizePixel = 0
TopBar.Parent = Main
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.75, 0, 1, 0)
Title.Position = UDim2.new(0.05, 0, 0, 0)
Title.Text = "Violence District v1.4.0 | RheyzHub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(180, 160, 255)
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
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, -20, 0, 40)
TabContainer.Position = UDim2.new(0, 10, 0, 50)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = Main

local ContentHolder = Instance.new("Frame")
ContentHolder.Size = UDim2.new(1, -20, 1, -100)
ContentHolder.Position = UDim2.new(0, 10, 0, 95)
ContentHolder.BackgroundColor3 = Color3.fromRGB(30, 27, 52)
ContentHolder.BorderSizePixel = 0
ContentHolder.Parent = Main
Instance.new("UICorner", ContentHolder).CornerRadius = UDim.new(0, 8)

-- Fungsi Bikin Tab
local tabs = {}
local currentTab = nil
local function CreateTab(name, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 115, 0, 32)
    btn.Position = UDim2.new(0, yPos, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(40, 36, 68)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(160, 150, 220)
    btn.TextSize = 12
    btn.AutoButtonColor = false
    btn.Parent = TabContainer
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(1, -12, 1, -12)
    content.Position = UDim2.new(0, 6, 0, 6)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.ScrollBarThickness = 4
    content.ScrollBarImageColor3 = Color3.fromRGB(102, 86, 226)
    content.Visible = false
    content.Parent = ContentHolder

    table.insert(tabs, {Button = btn, Content = content})
    return content
end

-- Aktifkan Tab
local function SwitchTab(selected)
    for _,tab in ipairs(tabs) do
        tab.Content.Visible = tab == selected
        tab.Button.BackgroundColor3 = tab == selected and Color3.fromRGB(70, 58, 180) or Color3.fromRGB(40, 36, 68)
        tab.Button.TextColor3 = tab == selected and Color3.new(1,1,1) or Color3.fromRGB(160, 150, 220)
    end
end

-- Buat Semua Tab
local tabSurvivor = CreateTab("🧑 SURVIVOR", 0)
local tabKiller = CreateTab("💀 KILLER", 125)
local tabAim = CreateTab("🎯 AIM & AIMBOT", 250)
local tabGeneral = CreateTab("⚙️ UMUM", 375)

-- Hubungkan Klik ke Tab
tabs[1].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[1]) end)
tabs[2].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[2]) end)
tabs[3].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[3]) end)
tabs[4].Button.MouseButton1Click:Connect(function() SwitchTab(tabs[4]) end)

SwitchTab(tabs[1])

-- 🛠️ FUNGSI PEMBUATAN ELEMEN
local function AddSwitch(parent, posY, label, path)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.96, 0, 0, 34)
    container.Position = UDim2.new(0.02, 0, 0, posY)
    container.BackgroundColor3 = Color3.fromRGB(38, 34, 64)
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
    switchBg.BackgroundColor3 = Color3.fromRGB(55, 50, 85)
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
            BackgroundColor3 = newVal and Color3.fromRGB(102, 86, 226) or Color3.fromRGB(55, 50, 85)
        }):Play()
        TweenService:Create(switchDot, TweenInfo.new(0.15), {
            Position = newVal and UDim2.new(0.6, 0, 0.5, -6) or UDim2.new(0.1, 0, 0.5, -6)
        }):Play()
    end)
end

local function AddSlider(parent, posY, label, path, min, max)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.96, 0, 0, 42)
    container.Position = UDim2.new(0.02, 0, 0, posY)
    container.BackgroundColor3 = Color3.fromRGB(38, 34, 64)
    container.BorderSizePixel = 0
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 6)

    local val = _G.RheyzHub
    for _,k in ipairs(path) do val = val[k] end

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0.9, 0, 0.4, 0)
    text.Position = UDim2.new(0.05, 0, 0.1, 0)
    text.Text = label .. ": " .. val .. "/" .. max
    text.Font = Enum.Font.Gotham
    text.TextColor3 = Color3.new(1,1,1)
    text.TextSize = 11
    text.BackgroundTransparency = 1
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Parent = container

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0.9, 0, 0, 6)
    bar.Position = UDim2.new(0.05, 0, 0.75, 0)
    bar.BackgroundColor3 = Color3.fromRGB(55, 50, 85)
    bar.Parent = container
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 3)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((val-min)/(max-min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(102, 86, 226)
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
AddSlider(tabSurvivor, 410, "Flee Distance", {"Survivor", "FleeDistance"}, 5, 100)
tabSurvivor.CanvasSize = UDim2.new(0,0,0,460)

-- Tab KILLER
AddSwitch(tabKiller, 10, "No Cooldown Skill", {"Killer", "NoCooldown"})
AddSwitch(tabKiller, 48, "Instant Hit", {"Killer", "InstantHit"})
AddSwitch(tabKiller, 86, "No Stun", {"Killer", "NoStun"})
AddSwitch(tabKiller, 124, "Speed Boost", {"Killer", "SpeedBoost"})
AddSlider(tabKiller, 162, "Speed Multiplier", {"Killer", "SpeedMultiplier"}, 1, 3)
AddSwitch(tabKiller, 210, "Wallhack", {"Killer", "Wallhack"})
AddSwitch(tabKiller, 248, "Instant Grab", {"Killer", "InstantGrab"})
tabKiller.CanvasSize = UDim2.new(0,0,0,290)

-- Tab AIM & AIMBOT
AddSlider(tabAim, 10, "Flash Head Offset (Y)", {"Aim", "FlashHeadOffset"}, 0, 15)
AddSwitch(tabAim, 58, "Lock Aim (Pistol)", {"Aim", "LockAimPistol"})
AddSwitch(tabAim, 96, "Hide Silent Laser", {"Aim", "HideSilentLaser"})
AddSwitch(tabAim, 134, "Pistol FOV Mode", {"Aim", "PistolFOVMode"})
AddSwitch(tabAim, 172, "Show Pistol FOV", {"Aim", "ShowPistolFOV"})
AddSlider(tabAim, 210, "FOV Radius", {"Aim", "PistolFOVRadius"}, 50, 500)
AddSwitch(tabAim, 260, "Aimbot Killer", {"Aim", "AimbotKiller"})
AddSwitch(tabAim, 298, "Aimbot Survivor", {"Aim", "AimbotSurvivor"})
tabAim.CanvasSize = UDim2.new(0,0,0,340)

-- Tab UMUM
AddSwitch(tabGeneral, 10, "Mode Terbang", {"General", "Fly"})
AddSwitch(tabGeneral, 48, "No Clip", {"General", "NoClip"})
AddSwitch(tabGeneral, 86, "Tak Terkalahkan", {"General", "GodMode"})
AddSlider(tabGeneral, 124, "Kecepatan Jalan", {"General", "WalkSpeed"}, 16, 100)
AddSwitch(tabGeneral, 172, "ESP Aktif", {"General", "ESP", "Enabled"})
AddSwitch(tabGeneral, 210, "No Fog", {"General", "Graphics", "NoFog"})
AddSwitch(tabGeneral, 248, "Full Bright", {"General", "Graphics", "FullBright"})
AddSwitch(tabGeneral, 286, "No Shadow", {"General", "Graphics", "NoShadow"})
tabGeneral.CanvasSize = UDim2.new(0,0,0,330)

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
            hum.JumpPower = 55
        end
        if _G.RheyzHub.Survivor.SelfHeal and hum.Health < hum.MaxHealth then
            hum.Health = math.min(hum.Health + 1.2, hum.MaxHealth)
        end

        -- Killer
        if _G.RheyzHub.Killer.SpeedBoost then
            hum.WalkSpeed = 20 * _G.RheyzHub.Killer.SpeedMultiplier
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
        Lighting.FogEnd = _G.RheyzHub.General.Graphics.NoFog and 100000 or 1000
        Lighting.GlobalShadows = not _G.RheyzHub.General.Graphics.NoShadow
        Lighting.Brightness = _G.RheyzHub.General.Graphics.FullBright and 3 or 1
        Lighting.Ambient = _G.RheyzHub.General.Graphics.FullBright and Color3.new(1,1,1) or Color3.new(0.35,0.35,0.35)
    end)
end)

ToggleBtn.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
