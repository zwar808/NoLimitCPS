local autoClickerEnabled = false
local autoClickInterval = 0.00000000000000000000000000000000001
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

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
