-- BaconLib v1.1 (Unreleased Update) by H3x0R
repeat game:GetService("RunService").RenderStepped:Wait() until game:IsLoaded() == true

local library = {}
local nextAllignmentAnchor = 10

for _, gui in pairs(game:GetService("CoreGui").RobloxGui:GetChildren()) do
    if gui:IsA("ScreenGui") and string.match(gui.Name, "_BACONLIB") then
        gui:Destroy()
    end
end

for _, gui in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
    if gui:IsA("ScreenGui") and string.match(gui.Name, "_BACONLIB") then
        gui:Destroy()
    end
end

function library:CreateWindow(name)
	if name == nil then error("Specify a name.", 0) return false end
	if not typeof(name) == "string" then error("Specify your name as a string.", 0) return false end
	
	local randomize = Instance.new("ScreenGui")
	local TopBar = Instance.new("Frame")
	local Container = Instance.new("Frame")
	local TopLabel = Instance.new("TextLabel")
	local SizeToggle = Instance.new("TextButton")
	local listLayout = Instance.new("UIListLayout")
	
	randomize.Name = tostring(math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9).."_BACONLIB")
	randomize.Parent = game:GetService("CoreGui").RobloxGui or game:GetService("Players").LocalPlayer.PlayerGui
	randomize.DisplayOrder = 100
	randomize.ResetOnSpawn = false
	
	TopBar.Name = "TopBar"
	TopBar.Parent = randomize
	TopBar.Active = true
	TopBar.Draggable = true
	TopBar.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0.489757448, 0, 0.489311516, 0)
	TopBar.Size = UDim2.new(0, 240, 0, 30)
	TopBar.ZIndex = 0
	
	Container.Name = "Container"
	Container.Parent = TopBar
	Container.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	Container.BorderSizePixel = 0
	Container.ClipsDescendants = true
	Container.Position = UDim2.new(-0.000485992437, 0, 0.974092603, 0)
	Container.Size = UDim2.new(0, 240, 0, 0)
	
	TopLabel.Name = "TopLabel"
	TopLabel.Parent = TopBar
	TopLabel.Active = true
	TopLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TopLabel.BackgroundTransparency = 1.000
	TopLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopLabel.BorderSizePixel = 0
	TopLabel.Position = UDim2.new(0.0291666668, 0, -0.00833333377, 0)
	TopLabel.Selectable = true
	TopLabel.Size = UDim2.new(0, 202, 0, 30)
	TopLabel.ZIndex = 0
	TopLabel.Text = name
	TopLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TopLabel.TextSize = 14.000
	TopLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	TopLabel.TextWrapped = true
	TopLabel.TextXAlignment = Enum.TextXAlignment.Left
	
	SizeToggle.Name = "SizeToggle"
	SizeToggle.Parent = TopBar
	SizeToggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	SizeToggle.BackgroundTransparency = 1.000
	SizeToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SizeToggle.BorderSizePixel = 0
	SizeToggle.Position = UDim2.new(0.872619033, 0, -0.00833332539, 0)
	SizeToggle.Size = UDim2.new(0, 30, 0, 30)
	SizeToggle.Modal = true
	SizeToggle.Text = "-"
	SizeToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	SizeToggle.TextScaled = true
	SizeToggle.TextSize = 14.000
	SizeToggle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	SizeToggle.TextWrapped = true
	
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder
	listLayout.Parent = Container
	
	-- Setup the scripting part
	spawn(function()
		local TweenService = game:GetService("TweenService") 
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		local tween
		
		local open = true
		local debounce = false
		
		local savedOffset = 0
		SizeToggle.MouseButton1Down:Connect(function()
			if debounce == false then
				debounce = true
				if open == true then
					savedOffset = Container.Size.Y.Offset
					tween = TweenService:Create(Container, tweenInfo, {Size = Container.Size - UDim2.new(0, 0, 0, Container.Size.Y.Offset)})
					tween:Play()
					SizeToggle.Text = "+"
					open = false
				else
					tween = TweenService:Create(Container, tweenInfo, {Size = Container.Size + UDim2.new(0, 0, 0, savedOffset)})
					tween:Play()
					SizeToggle.Text = "-"
					open = true
				end
				debounce = false
			end
		end)
	end)
	
	-- Align GUI
	TopBar.Position = UDim2.new(0, nextAllignmentAnchor, 0, 10)
	nextAllignmentAnchor = nextAllignmentAnchor + 250
	
	return randomize
end

function increase(window)
	window.TopBar.Container.Size = UDim2.new(0, 240, 0, window.TopBar.Container.Size.Y.Offset + 40)
end

function library:CreateLabel(window, text)
	if not window:IsA("ScreenGui") then error("Specify a gui.", 0) return false end
	if not window:FindFirstChild("TopBar") then error("That's not a gui created by the library!", 0) return false end
	if not typeof(text) == "string" then error("The second argument isn't a string!", 0) return false end
	
	local omg_its_a_label = Instance.new("Frame")
	local Label = Instance.new("TextLabel")
	
	omg_its_a_label.LayoutOrder = 1
	omg_its_a_label.Name = "omg_its_a_label"
	omg_its_a_label.Parent = window.TopBar.Container
	omg_its_a_label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	omg_its_a_label.BackgroundTransparency = 1.000
	omg_its_a_label.BorderColor3 = Color3.fromRGB(0, 0, 0)
	omg_its_a_label.BorderSizePixel = 0
	omg_its_a_label.Size = UDim2.new(0, 240, 0, 40)
	
	Label.Name = "Label"
	Label.Parent = omg_its_a_label
	Label.Active = true
	Label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Label.BackgroundTransparency = 1.000
	Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Label.BorderSizePixel = 0
	Label.Position = UDim2.new(0.0291666668, 0, 0.125, 0)
	Label.Selectable = true
	Label.Size = UDim2.new(0, 227, 0, 30)
	Label.Text = text
	Label.TextColor3 = Color3.fromRGB(255, 255, 255)
	Label.TextSize = 15.000
	Label.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	Label.TextWrapped = true
	increase(window)
	
	return Label
end

function library:CreateButton(window, text, func)
	if not window:IsA("ScreenGui") then error("Specify a gui.", 0) return false end
	if not window:FindFirstChild("TopBar") then error("That's not a gui created by the library!", 0) return false end
	if not typeof(text) == "string" then error("The second argument isn't a string!", 0) return false end
	if not typeof(func) == "function" then error("The third argument isn't a function!", 0) return false end
	
	local xd_button_yey = Instance.new("Frame")
	local Button = Instance.new("TextButton")
	
	xd_button_yey.LayoutOrder = 1
	xd_button_yey.Name = "xd_button_yey"
	xd_button_yey.Parent = window.TopBar.Container
	xd_button_yey.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	xd_button_yey.BackgroundTransparency = 1.000
	xd_button_yey.BorderColor3 = Color3.fromRGB(0, 0, 0)
	xd_button_yey.BorderSizePixel = 0
	xd_button_yey.Size = UDim2.new(0, 240, 0, 40)
	
	Button.Name = "Button"
	Button.Parent = xd_button_yey
	Button.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
	Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Button.BorderSizePixel = 0
	Button.Position = UDim2.new(0.0291666668, 0, 0.125, 0)
	Button.Size = UDim2.new(0, 227, 0, 30)
	Button.Text = text
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextSize = 15.000
	Button.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextWrapped = true
	increase(window)
	Button.MouseButton1Down:Connect(func)
	
	return Button
end

function library:CreateTextBox(window, font, placeholderText, text)
	if not window:IsA("ScreenGui") then error("Specify a gui.", 0) return false end
	if not window:FindFirstChild("TopBar") then error("That's not a gui created by the library!", 0) return false end
	if not typeof(font) == "EnumItem" then error("The second argument isn't a font enum!", 0) return false end
	if not typeof(text) == "string" then error("The third argument isn't a string!", 0) return false end
	if not typeof(placeholderText) == "string" then error("The fourth argument isn't a string!", 0) return false end
	
	local o_no_its_a_textbox = Instance.new("Frame")
	local _TextBox = Instance.new("TextBox")
	
	o_no_its_a_textbox.LayoutOrder = 1
	o_no_its_a_textbox.Name = "o_no_its_a_textbox"
	o_no_its_a_textbox.Parent = window.TopBar.Container
	o_no_its_a_textbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	o_no_its_a_textbox.BackgroundTransparency = 1.000
	o_no_its_a_textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	o_no_its_a_textbox.BorderSizePixel = 0
	o_no_its_a_textbox.Size = UDim2.new(0, 240, 0, 40)
	
	_TextBox.Name = "TextBox"
	_TextBox.Parent = o_no_its_a_textbox
	_TextBox.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	_TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_TextBox.BorderSizePixel = 0
	_TextBox.Position = UDim2.new(0.0291666668, 0, 0.125, 0)
	_TextBox.Size = UDim2.new(0, 227, 0, 30)
	_TextBox.ClearTextOnFocus = false
	_TextBox.Font = font
	_TextBox.Text = text
	_TextBox.PlaceholderText = placeholderText
	_TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	_TextBox.TextScaled = true
	_TextBox.TextSize = 15.000
	_TextBox.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	_TextBox.TextWrapped = true
	increase(window)
	
	return _TextBox
end

function library:CreateToggle(window, text, currentState, func)
	if not window:IsA("ScreenGui") then error("Specify a gui.", 0) return false end
	if not window:FindFirstChild("TopBar") then error("That's not a gui created by the library!", 0) return false end
	if not typeof(text) == "string" then error("The second argument isn't a string!", 0) return false end
	if not typeof(currentState) == "boolean" then error("The third argument isn't a boolean!", 0) return false end
	if not typeof(func) == "function" then error("The fourth argument isn't a function!", 0) return false end
	
	local wow_a_toggle_owo = Instance.new("Frame")
	local ToggleBtn = Instance.new("TextButton")
	local ToggleBtn_Roundify_4px = Instance.new("ImageLabel")
	local ToggleLabel = Instance.new("TextLabel")
	
	wow_a_toggle_owo.LayoutOrder = 1
	wow_a_toggle_owo.Name = "wow_a_toggle_owo"
	wow_a_toggle_owo.Parent = window.TopBar.Container
	wow_a_toggle_owo.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	wow_a_toggle_owo.BackgroundTransparency = 1.000
	wow_a_toggle_owo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	wow_a_toggle_owo.BorderSizePixel = 0
	wow_a_toggle_owo.Size = UDim2.new(0, 240, 0, 40)
	
	ToggleBtn.Name = "ToggleBtn"
	ToggleBtn.Parent = wow_a_toggle_owo
	ToggleBtn.Active = false
	ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ToggleBtn.BackgroundTransparency = 1.000
	ToggleBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleBtn.BorderSizePixel = 0
	ToggleBtn.Position = UDim2.new(0.850000024, 0, 0, 5)
	ToggleBtn.Selectable = false
	ToggleBtn.Size = UDim2.new(0, 30, 0, 30)
	ToggleBtn.Text = ""
	ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	ToggleBtn.TextSize = 1.000
	ToggleBtn.TextTransparency = 1.000
	ToggleBtn.TextWrapped = true
	
	ToggleBtn_Roundify_4px.Name = "ToggleBtn_Roundify_4px"
	ToggleBtn_Roundify_4px.Parent = ToggleBtn
	ToggleBtn_Roundify_4px.AnchorPoint = Vector2.new(0.5, 0.5)
	ToggleBtn_Roundify_4px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleBtn_Roundify_4px.BackgroundTransparency = 1.000
	ToggleBtn_Roundify_4px.Position = UDim2.new(0.5, 0, 0.5, 0)
	ToggleBtn_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
	ToggleBtn_Roundify_4px.Image = "rbxassetid://3570695787"
	
	if currentState == false then
		ToggleBtn_Roundify_4px.ImageColor3 = Color3.fromRGB(255, 57, 60)
	else
		ToggleBtn_Roundify_4px.ImageColor3 = Color3.fromRGB(96, 188, 25)
	end
	ToggleBtn_Roundify_4px.ScaleType = Enum.ScaleType.Slice
	ToggleBtn_Roundify_4px.SliceCenter = Rect.new(100, 100, 100, 100)
	ToggleBtn_Roundify_4px.SliceScale = 0.040
	
	ToggleLabel.Name = "ToggleLabel"
	ToggleLabel.Parent = wow_a_toggle_owo
	ToggleLabel.Active = true
	ToggleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ToggleLabel.BackgroundTransparency = 1.000
	ToggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleLabel.BorderSizePixel = 0
	ToggleLabel.Position = UDim2.new(0.0291666668, 0, 0.125, 0)
	ToggleLabel.Selectable = true
	ToggleLabel.Size = UDim2.new(0, 190, 0, 30)
	ToggleLabel.Text = text
	ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleLabel.TextSize = 15.000
	ToggleLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	ToggleLabel.TextWrapped = true
	ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
	increase(window)
	
	local TweenService = game:GetService("TweenService")
	local red = Color3.fromRGB(255, 57, 60)
	local green = Color3.fromRGB(96, 188, 25)
	
	local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	
	local toggled = currentState
	ToggleBtn.MouseButton1Down:Connect(function()
		-- warn("M C N U G G E T  G O O D  F O R  Y O U")
		
		local tween
		if toggled == true then
			toggled = false
			tween = TweenService:Create(ToggleBtn_Roundify_4px, tweenInfo, {ImageColor3 = red})
		else
			toggled = true
			tween = TweenService:Create(ToggleBtn_Roundify_4px, tweenInfo, {ImageColor3 = green})
		end
		
		tween:Play()
		func(toggled)
	end)
	
	return ToggleBtn
end

function library:GetContainer(window)
	if not window:IsA("ScreenGui") then error("Specify a gui.", 0) return false end
	if not window:FindFirstChild("TopBar") then error("That's not a gui created by the library!", 0) return false end
	
	return window.TopBar.Container
end

function library:GetTopBar(window)
	if not window:IsA("ScreenGui") then error("Specify a gui.", 0) return false end
	if not window:FindFirstChild("TopBar") then error("That's not a gui created by the library!", 0) return false end
	
	return window.TopBar
end

return library
