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
   
    CFrame.new(-13, 2.5, 1008) * CFrame.Angles(0, 0, math.rad(-90))     -- Posisi 22
}

-- Toggle script teleport
local isOn = false

ToggleBtn.MouseButton1Click:Connect(function()
	isOn = not isOn
	if isOn then
		-- UI ON
		ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 255)
		Knob:TweenPosition(UDim2.new(1, -24, 0, 1), "Out", "Quad", 0.2, true)
		print("P BALAP: ON")

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
		print("P BALAP: OFF")
	end
end)
