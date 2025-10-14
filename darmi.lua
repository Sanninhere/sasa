-- SANN GUI dengan toggle teleport berurutan

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "SANNXHUB"
gui.ResetOnSpawn = false

-- Frame utama
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 170)
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = gui

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 12)

-- Header
local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(10, 15, 25)
Header.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "SANNHUB"
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16

local CloseUICorner = Instance.new("UICorner", CloseBtn)
CloseUICorner.CornerRadius = UDim.new(0, 6)

-- Isi
local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, -20, 1, -50)
ContentFrame.Position = UDim2.new(0, 10, 0, 45)
ContentFrame.BackgroundTransparency = 1

local FeatureLabel = Instance.new("TextLabel", ContentFrame)
FeatureLabel.Size = UDim2.new(0.6, 0, 0, 30)
FeatureLabel.Position = UDim2.new(0, 0, 0, 0)
FeatureLabel.BackgroundTransparency = 1
FeatureLabel.Text = "MOUNT PEDAUNAN"
FeatureLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FeatureLabel.Font = Enum.Font.Gotham
FeatureLabel.TextSize = 16
FeatureLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Toggle modern
local ToggleBtn = Instance.new("TextButton", ContentFrame)
ToggleBtn.Size = UDim2.new(0, 50, 0, 25)
ToggleBtn.Position = UDim2.new(1, -60, 0, 2)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ToggleBtn.Text = ""
ToggleBtn.AutoButtonColor = false

local ToggleCorner = Instance.new("UICorner", ToggleBtn)
ToggleCorner.CornerRadius = UDim.new(1, 0)

local Knob = Instance.new("Frame", ToggleBtn)
Knob.Size = UDim2.new(0, 23, 0, 23)
Knob.Position = UDim2.new(0, 1, 0, 1)
Knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)

local KnobCorner = Instance.new("UICorner", Knob)
KnobCorner.CornerRadius = UDim.new(1, 0)

-- Tombol close
CloseBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
end)

-- Data posisi teleport
local positions = {
    CFrame.new(926.164124, 18.634167, -858.732544) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 1
    CFrame.new(8.438072, 60.255459, -698.194824) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 2
    CFrame.new(666.115906, 60.974869, -557.102783) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 3
    CFrame.new(842.251587, 162.250504, -263.138733) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 4
    CFrame.new(189.763382, 166.151703, -240.754135) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 5
    CFrame.new(62.757019, 194.073700, 40.300152) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 6
    CFrame.new(787.518860, 271.473816, 60.770248) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 7
    CFrame.new(699.127014, 509.798645, 398.098755) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 8
    CFrame.new(44.698132, 530.198059, 399.063446) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 9
    CFrame.new(-36.218323, 815.138428, 657.914368) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 10
    CFrame.new(853.441223, 826.278992, 686.610413) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 11
    CFrame.new(809.687317, 897.325867, 1411.727051) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 12
    CFrame.new(475.914032, 990.780151, 1766.853394) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 13
    CFrame.new(-190.291046, 1182.778931, 1720.364624) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 14
    CFrame.new(82.307121, 1304.627075, 1568.127686) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 15
    CFrame.new(-398.054718, 1399.995117, 1501.369751) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 16
    CFrame.new(-1351.000122, 1781.850220, 1483.999878) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 17
    CFrame.new(-1563.291016, 2063.559082, 1455.098755) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 18
    CFrame.new(-1904.074219, 2330.643066, 1368.130493) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 19
    CFrame.new(-2202.031006, 2420.013184, 1114.459839) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 20
    CFrame.new(-2339.653076, 2877.115967, 756.349426) * CFrame.Angles(0, math.rad(-8.28), 0), -- Posisi 21
    CFrame.new(-4302.066895, 3309.928955, -1511.856689) * CFrame.Angles(0, 0, math.rad(-90))     -- Posisi 22
}

-- Toggle script teleport
local isOn = false

ToggleBtn.MouseButton1Click:Connect(function()
	isOn = not isOn
	if isOn then
		-- UI ON
		ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 255)
		Knob:TweenPosition(UDim2.new(1, -24, 0, 1), "Out", "Quad", 0.2, true)
		print("MOUNT PEDAUNAN: ON")

		-- Start teleport loop
		task.spawn(function()
			local i = 1
			while isOn do
				local char = player.Character or player.CharacterAdded:Wait()
				local hrp = char:FindFirstChild("HumanoidRootPart")
				if hrp then
					hrp.CFrame = positions[i]
					i = (i % #positions) + 1 -- urut 1 → 2 → 1 → 2
				end
				task.wait(2.0) -- laju teleport lebih lambat (smooth)
			end
		end)
	else
		-- UI OFF
		ToggleBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
		Knob:TweenPosition(UDim2.new(0, 1, 0, 1), "Out", "Quad", 0.2, true)
		print("MOUNT PEDAUNAN: OFF")
	end
end)
