local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")


ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.421961784, 0, 0.512284994, 0)
Frame.Size = UDim2.new(0, 100, 0, 100)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Size = UDim2.new(0, 100, 0, 24)
TextLabel.Font = Enum.Font.SciFi
TextLabel.Text = "TriggerBot"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Position = UDim2.new(0, 0, 0.370000005, 0)
TextButton.Size = UDim2.new(0, 100, 0, 44)
TextButton.Font = Enum.Font.SciFi
TextButton.Text = "Off"
TextButton.TextColor3 = Color3.fromRGB(255, 0, 0)
TextButton.TextSize = 30.000
TextButton.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)

-- Scripts:

local function YIHREB_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	_G.triggerbot = false
	local player = game:GetService("Players").LocalPlayer
	local mouse = player:GetMouse()
	script.Parent.MouseButton1Click:Connect(function()
		if _G.triggerbot then
			_G.triggerbot = false
			script.Parent.TextColor3 = Color3.fromRGB(255,0,0)
			script.Parent.Text = "Off"
		else
			_G.triggerbot = true
			script.Parent.TextColor3 = Color3.fromRGB(85,255,0)
			script.Parent.Text = "On"
			game:GetService("RunService").RenderStepped:Connect(function()
				if mouse.Target.Parent:FindFirstChild("Humanoid") and _G.triggerbot and mouse.Target.Parent.Name ~= player.Name then
					mouse1press() wait() mouse1release()
				end
			end)
		end
	end)
end
coroutine.wrap(YIHREB_fake_script)()
