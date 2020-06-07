local library = loadstring(game:HttpGet("https://bit.ly/baconlib"))()
local window = library:CreateWindow("UI Lib Test")
local label = library:CreateLabel(window, "Main")
local textBox = library:CreateTextBox(window, Enum.Font.Legacy, "Text", "lol")
local button = library:CreateButton(window, "Warn Text", function()
    warn(textBox.Text)
end)

local toggled = false
local toggle = library:CreateToggle(window, "Spam Warn 'fat'", false, function(toggleState)
    toggled = toggleState
    if toggleState == true then
        print("true")
        spawn(function()
            repeat
                warn("fat")
                game:GetService("RunService").Heartbeat:Wait()
            until toggled == false
        end)
    else
        print("false")
    end
end)
