local autoClickerEnabled = false
local autoClickInterval = 0.00000000000000000000000000000000001
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
_G.ToggleColor = Color3.fromRGB(255,0,0)
_G.ButtonColor = Color3.fromRGB(0,255,0)
_G.SliderColor = Color3.fromRGB(0,0,255)

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/refs/heads/main/wall%20v3')))() -- It's obfuscated, I won't let you see my ugly coding skills. =)
local w = library:CreateWindow("Holdable CPS")

local b = w:CreateFolder("Main")
local function clickLoop()
    while autoClickerEnabled do
        if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(autoClickInterval)
            game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(autoClickInterval)
        else
            wait(0.1)
        end
    end
end

local function enableAutoClicker()
    autoClickerEnabled = true
    RunService:BindToRenderStep("AutoClicker", Enum.RenderPriority.Input.Value, clickLoop)
end

local function disableAutoClicker()
    autoClickerEnabled = false
    RunService:UnbindFromRenderStep("AutoClicker")
end

b:Label("NoCPSLimit",{
    TextSize = 25;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
    
}) 

b:Toggle("AutoClicker",function(bool)
 if bool == true then
        enableAutoClicker()
else
    disableAutoClicker()
end
end)

b:Slider("CPS",{
    min = 0.00000000000000000000000000000000001;
    max = 50;
    precise = true;
},function(value)
    autoClickInterval = value
end)


