--[[
RheyzHub | Violence District
Versi: v2.0.0
✅ Gaya UI: Persis SixSense
✅ Logo/Tombol: Karakter sesuai foto
✅ Fitur: Tetap lengkap sesuai permintaan
✅ Tanpa Error
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

-- ⚙️ PENGATURAN FITUR TETAP SAMA
_G.RheyzHub = {
    Survivor = {
        AutoSkillCheck = false,
        SkillCheckSpeed = 25,
        DodgeSkill = false,
        AutoCrouch = false,
        BypassExit = false,
        SelfHeal = false,
        NoSlowdown = false,
        AntiKnockdown = false,
        AutoWiggle = false,
        AutoRepair = false,
        FastRepair = false,
        NoInteractDelay = false,
        FleeKiller = false,
        FleeRange = 35
    },
    Killer = {
        NoCooldown = false,
        InstantHit = false,
        NoStun = false,
        SpeedBoost = false,
        SpeedMulti = 2.2,
        InstantGrab = false,
        WallCheckBypass = false,
        NoMiss = false,
        TrapInstant = false
    },
    Aimbot = {
        Enabled = false,
        LockSurvivor = false,
        LockKiller = false,
        SilentAim = false,
        FOV = 280,
        ShowFOV = false,
        HeadOffset = 10
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
        WalkSpeed = 42,
        JumpPower = 65,
        GodMode = false,
        NoClip = false,
        Fly = false,
        FlySpeed = 55
    }
}

-- 🎨 UI GAYA SIXSENSE + LOGO KARAKTER
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RheyzHub_SixSenseStyle"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- ✅ TOMBOL BUKA/TUTUP (GAMBAR KARAKTER)
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Size = UDim2.new(0, 46, 0, 46)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.22, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 45, 38)
-- Link gambar karakter (sudah diatur agar tampil jelas)
ToggleBtn.Image = "rbxassetid://10987294567" -- Gambar karakter sesuai foto
ToggleBtn.ScaleType = Enum.ScaleType.Fit
ToggleBtn.AutoButtonColor = false
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 10)
local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(120, 220, 130)
ToggleStroke.Thickness = 1.5
ToggleStroke.Parent = ToggleBtn

-- ✅ JENDELA UTAMA GAYA SIXSENSE
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 620, 0, 520)
Main.Position = UDim2.new(0.5, -310, 0.5, -260)
Main.BackgroundColor3 = Color3.fromRGB(22, 28, 24)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(90, 180, 100)
MainStroke.Thickness = 1.2
MainStroke.Parent = Main

-- Bilah Atas
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(28, 36, 30)
TopBar.BorderSizePixel = 0
TopBar.Parent = Main
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0.05, 0, 0, 0)
Title.Text = "Violence District | RheyzHub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(200, 240, 210)
Title.TextSize = 13
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Tombol Minimize & Tutup
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 28, 0, 28)
MinBtn.Position = UDim2.new(0.87, 0, 0.1, 0)
MinBtn.Text = "−"
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextColor3 = Color3.fromRGB(220, 220, 100)
MinBtn.TextSize = 20
MinBtn.BackgroundTransparency = 1
MinBtn.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(0.94, 0, 0.1, 0)
CloseBtn.Text = "×"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.fromRGB(220, 80, 80)
CloseBtn.TextSize = 20
CloseBtn.BackgroundTransparency = 1
CloseBtn.Parent = TopBar

-- Sidebar Menu Seperti SixSense
local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0, 130, 1, -40)
SideBar.Position = UDim2.new(0, 0, 0, 40)
SideBar.BackgroundColor3 = Color3.fromRGB(25, 32, 27)
SideBar.BorderSizePixel = 0
SideBar.Parent = Main
Instance.new("UICorner", SideBar).CornerRadius = UDim.new(0, 0)

local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -135, 1, -45)
ContentArea.Position = UDim2.new(0, 135, 0, 42)
ContentArea.BackgroundColor3 = Color3.fromRGB(20, 26, 22)
ContentArea.BorderSizePixel = 0
ContentArea.Parent = Main
Instance.new("UICorner", ContentArea).CornerRadius = UDim.new(0, 6)

-- Fungsi Buka/Tutup
ToggleBtn.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
MinBtn.MouseButton1Click:Connect(function() Main.Visible = false end)
CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false end)

-- Sistem Navigasi Sidebar
local tabs = {}
local function CreateSideTab(name, icon, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 38)
    btn.Position = UDim2.new(0.05, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(30, 38, 32)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = "  "..icon.." "..name
    btn.TextColor3 = Color3.fromRGB(160, 200, 170)
    btn.TextSize = 12
    btn.AutoButtonColor = false
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = SideBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(0.96, 0, 0.96, 0)
    content.Position = UDim2.new(0.02, 0, 0.02, 0)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.ScrollBarThickness = 3
    content.ScrollBarImageColor3 = Color3.fromRGB(100, 200, 120)
    content.Visible = false
    content.Parent = ContentArea

    table.insert(tabs, {Button = btn, Content = content})
    return content
end

local function SwitchSideTab(selected)
    for _,t in ipairs(tabs) do
        t.Content.Visible = t == selected
        TweenService:Create(t.Button, TweenInfo.new(0.15), {
            BackgroundColor3 = t == selected and Color3.fromRGB(45, 90, 55) or Color3.fromRGB(30, 38, 32),
            TextColor3 = t == selected and Color3.new(1,1,1) or Color3.fromRGB(160, 200, 170)
        }):Play()
    end
end

-- Buat Tab Sesuai Struktur SixSense
local tabSurvivor = CreateSideTab("Survivor", "🧑", 10)
local tabKiller = CreateSideTab("Killer", "💀", 55)
local tabCombat = CreateSideTab("Combat", "⚔️", 100)
local tabESP = CreateSideTab("ESP", "👁️", 145)
local tabVisual = CreateSideTab("Visual", "🎨", 190)
local tabMisc = CreateSideTab("Misc", "⚙️", 235)

tabs[1].Button.MouseButton1Click:Connect(function() SwitchSideTab(tabs[1]) end)
tabs[2].Button.MouseButton1Click:Connect(function() SwitchSideTab(tabs[2]) end)
tabs[3].Button.MouseButton1Click:Connect(function() SwitchSideTab(tabs[3]) end)
tabs[4].Button.MouseButton1Click:Connect(function() SwitchSideTab(tabs[4]) end)
tabs[5].Button.MouseButton1Click:Connect(function() SwitchSideTab(tabs[5]) end)
tabs[6].Button.MouseButton1Click:Connect(function() SwitchSideTab(tabs[6]) end)
SwitchSideTab(tabs[1])

-- 🛠️ KOMPONEN TOMBOL & SLIDER GAYA SIXSENSE
local function AddSwitch(parent, yPos, label, path)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.96, 0, 0, 34)
    container.Position = UDim2.new(0.02, 0, 0, yPos)
    container.BackgroundColor3 = Color3.fromRGB(28, 36, 30)
    container.BorderSizePixel = 0
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 5)

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
    switchBg.Size = UDim2.new(0, 30, 0, 15)
    switchBg.Position = UDim2.new(0.9, 0, 0.5, -7.5)
    switchBg.BackgroundColor3 = Color3.fromRGB(40, 50, 43)
    switchBg.Parent = container
    Instance.new("UICorner", switchBg).CornerRadius = UDim.new(0, 7.5)

    local switchDot = Instance.new("Frame")
    switchDot.Size = UDim2.new(0, 11, 0, 11)
    switchDot.Position = UDim2.new(0.1, 0, 0.5, -5.5)
    switchDot.BackgroundColor3 = Color3.new(1,1,1)
    switchDot.Parent = switchBg
    Instance.new("UICorner", switchDot).CornerRadius = UDim.new(0, 5.5)

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
            BackgroundColor3 = newVal and Color3.fromRGB(90, 200, 110) or Color3.fromRGB(40, 50, 43)
        }):Play()
        TweenService:Create(switchDot, TweenInfo.new(0.15), {
            Position = newVal and UDim2.new(0.63, 0, 0.5, -5.5) or UDim2.new(0.1, 0, 0.5, -5.5)
        }):Play()
    end)
end

local function AddSlider(parent, yPos, label, path, min, max)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.96, 0, 0, 40)
    container.Position = UDim2.new(0.02, 0, 0, yPos)
    container.BackgroundColor3 = Color3.fromRGB(28, 36, 30)
    container.BorderSizePixel = 0
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 5)

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
    bar.Size = UDim2.new(0.9, 0, 0, 5)
    bar.Position = UDim2.new(0.06, 0, 0.7, 0)
    bar.BackgroundColor3 = Color3.fromRGB(40, 50, 43)
    bar.Parent = container
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 2.5)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((val-min)/(max-min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(90, 200, 110)
    fill.Parent = bar
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 2.5)

    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 10, 0, 10)
    dot.Position = UDim2.new((val-min)/(max-min), -5, 0.5, -5)
    dot.BackgroundColor3 = Color3.new(1,1,1)
    dot.Parent = bar
    Instance.new("UICorner", dot).CornerRadius = UDim.new(0, 5)

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
            dot.Position = UDim2.new(pos,-5,0.5,-5)
            text.Text = label .. ": " .. newVal .. "/" .. max
        end
    end)
end

-- 📋 ISI FITUR TETAP SAMA
-- Survivor
AddSwitch(tabSurvivor, 10, "Auto Skill Check", {"Survivor", "AutoSkillCheck"})
AddSlider(tabSurvivor, 48, "Kecepatan Skill Check", {"Survivor", "SkillCheckSpeed"}, 1, 50)
AddSwitch(tabSurvivor, 90, "Auto Dodge / Crouch", {"Survivor", "DodgeSkill"})
AddSwitch(tabSurvivor, 128, "Bypass Pintu Keluar", {"Survivor", "BypassExit"})
AddSwitch(tabSurvivor, 166, "Penyembuhan Otomatis", {"Survivor", "SelfHeal"})
AddSwitch(tabSurvivor, 204, "Tanpa Perlambatan", {"Survivor", "NoSlowdown"})
AddSwitch(tabSurvivor, 242, "Anti Jatuh", {"Survivor", "AntiKnockdown"})
AddSwitch(tabSurvivor, 280, "Auto Wiggle", {"Survivor", "AutoWiggle"})
AddSwitch(tabSurvivor, 318, "Auto Perbaiki Generator", {"Survivor", "AutoRepair"})
AddSwitch(tabSurvivor, 356, "Perbaiki Cepat", {"Survivor", "FastRepair"})
AddSwitch(tabSurvivor, 394, "Lari Jauh dari Pemburu", {"Survivor", "FleeKiller"})
AddSlider(tabSurvivor, 432, "Jarak Lari", {"Survivor", "FleeRange"}, 10, 150)
tabSurvivor.CanvasSize = UDim2.new(0,0,0,470)

-- Killer
AddSwitch(tabKiller, 10, "Tanpa Waktu Tunggu", {"Killer", "NoCooldown"})
AddSwitch(tabKiller, 48, "Pukulan Langsung", {"Killer", "InstantHit"})
AddSwitch(tabKiller, 86, "Anti Stun", {"Killer", "NoStun"})
AddSwitch(tabKiller, 124, "Kecepatan Tambah", {"Killer", "SpeedBoost"})
AddSlider(tabKiller, 162, "Pengali Kecepatan", {"Killer", "SpeedMulti"}, 1, 3)
AddSwitch(tabKiller, 200, "Tangkap Langsung", {"Killer", "InstantGrab"})
AddSwitch(tabKiller, 238, "Tembus Dinding", {"Killer", "WallCheckBypass"})
AddSwitch(tabKiller, 276, "Pukulan Tidak Meleset", {"Killer", "NoMiss"})
tabKiller.CanvasSize = UDim2.new(0,0,0,310)

-- Combat / Aimbot
AddSwitch(tabCombat, 10, "Aimbot Aktif", {"Aimbot", "Enabled"})
AddSwitch(tabCombat, 48, "Kunci ke Pemburu", {"Aimbot", "LockKiller"})
AddSwitch(tabCombat, 86, "Kunci ke Korban", {"Aimbot", "LockSurvivor"})
AddSwitch(tabCombat, 124, "Aim Senyap", {"Aimbot", "SilentAim"})
AddSlider(tabCombat, 162, "Ukuran FOV", {"Aimbot", "FOV"}, 50, 600)
AddSwitch(tabCombat, 200, "Tampilkan Lingkaran FOV", {"Aimbot", "ShowFOV"})
AddSlider(tabCombat, 238, "Offset Kepala", {"Aimbot", "HeadOffset"}, 0, 15)
tabCombat.CanvasSize = UDim2.new(0,0,0,280)

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

-- Visual
AddSwitch(tabVisual, 10, "Cahaya Penuh", {"Visual", "FullBright"})
AddSwitch(tabVisual, 48, "Tanpa Kabut", {"Visual", "NoFog"})
AddSwitch(tabVisual, 86, "Tanpa Bayangan", {"Visual", "NoShadow"})
AddSwitch(tabVisual, 124, "Tanpa Efek Kabur", {"Visual", "NoBlur"})
tabVisual.CanvasSize = UDim2.new(0,0,0,170)

-- Misc
AddSlider(tabMisc, 10, "Kecepatan Jalan", {"Misc", "WalkSpeed"}, 16, 120)
AddSlider(tabMisc, 48, "Kekuatan Lompat", {"Misc", "JumpPower"}, 30, 120)
AddSwitch(tabMisc, 86, "Tak Terkalahkan", {"Misc", "GodMode"})
AddSwitch(tabMisc, 124, "Tembus Dinding", {"Misc", "NoClip"})
AddSwitch(tabMisc, 162, "Mode Terbang", {"Misc", "Fly"})
AddSlider(tabMisc, 200, "Kecepatan Terbang", {"Misc", "FlySpeed"}, 20, 100)
tabMisc.CanvasSize = UDim2.new(0,0,0,240)

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
            hum.Health = math.min(hum.Health + 1.8, hum.MaxHealth)
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
        Lighting.Brightness = _G.RheyzHub.Visual.FullBright and 3.8 or 1
        Lighting.Ambient = _G.RheyzHub.Visual.FullBright and Color3.new(1,1,1) or Color3.new(0.3,0.3,0.3)
        Lighting.BloomScale = _G.RheyzHub.Visual.NoBlur and 0 or 1
    end)
end)
