-- BF Cheat | Delta iOS | @AiMornAi (Mobile Optimized)
print("[BF Cheat] Скрипт начал загрузку...")

if not game:IsLoaded() then 
    print("[BF Cheat] Ожидание загрузки игры...")
    game.Loaded:Wait() 
end

local P=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local UIS=game:GetService("UserInputService")
local RUN=game:GetService("RunService")
local WS=game:GetService("Workspace")
local LP=P.LocalPlayer
local PG=LP:WaitForChild("PlayerGui")

local C={FruitESP=true,Names=true,Timer=true,Farm=false,FarmR=150,Aura=false,AuraR=30,Speed=false,Spd=100}
local FRUITS={"Rocket","Spin","Chop","Spring","Bomb","Smoke","Spike","Flame","Falcon","Ice","Sand","Dark","Diamond","Light","Rubber","Barrier","Ghost","Magma","Quake","Buddha","Love","Spider","Sound","Phoenix","Portal","Rumble","Pain","Blizzard","Gravity","Mammoth","T-Rex","Dough","Shadow","Venom","Control","Spirit","Dragon","Leopard","Kitsune","Yeti","Gas"}

-- ===== GUI =====
local SG=Instance.new("ScreenGui")
SG.Name="BF_Cheat"
SG.ResetOnSpawn=false
SG.Parent=PG -- Используем PlayerGui для надежности

local M=Instance.new("Frame",SG)
M.Size=UDim2.new(0,300,0,400); M.Position=UDim2.new(0.5,-150,0.5,-200)
M.BackgroundColor3=Color3.fromRGB(20,20,25); M.BorderSizePixel=0; M.Active=true
Instance.new("UICorner",M).CornerRadius=UDim.new(0,8)
local TB=Instance.new("Frame",M)
TB.Size=UDim2.new(1,0,0,32); TB.BackgroundColor3=Color3.fromRGB(30,30,38); TB.BorderSizePixel=0
Instance.new("UICorner",TB).CornerRadius=UDim.new(0,8)
local T=Instance.new("TextLabel",TB)
T.Size=UDim2.new(1,-60,1,0); T.Position=UDim2.new(0,10,0,0); T.BackgroundTransparency=1
T.Text="BF Cheat | iOS"; T.TextColor3=Color3.fromRGB(0,255,100)
T.Font=Enum.Font.GothamBold; T.TextSize=14; T.TextXAlignment=Enum.TextXAlignment.Left
local X=Instance.new("TextButton",TB)
X.Size=UDim2.new(0,24,0,24); X.Position=UDim2.new(1,-30,0,4)
X.BackgroundColor3=Color3.fromRGB(200,40,40); X.BorderSizePixel=0
X.Text="X"; X.TextColor3=Color3.new(1,1,1); X.Font=Enum.Font.GothamBold; X.TextSize=12
Instance.new("UICorner",X).CornerRadius=UDim.new(0,4)
X.MouseButton1Click:Connect(function() SG:Destroy() end)

local dr,ds,sp=false,nil,nil
TB.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        dr=true; ds=i.Position; sp=M.Position
    end
end)
TB.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=false end
end)
UIS.InputChanged:Connect(function(i)
    if dr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local d=i.Position-ds
        M.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)
    end
end)

local SC=Instance.new("ScrollingFrame",M)
SC.Size=UDim2.new(1,-16,1,-48); SC.Position=UDim2.new(0,8,0,40)
SC.BackgroundTransparency=1; SC.BorderSizePixel=0; SC.ScrollBarThickness=3
SC.ScrollBarImageColor3=Color3.fromRGB(0,255,100); SC.CanvasSize=UDim2.new(0,0,0,0)
local L=Instance.new("UIListLayout",SC)
L.SortOrder=Enum.SortOrder.LayoutOrder; L.Padding=UDim.new(0,4)
L:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    SC.CanvasSize=UDim2.new(0,0,0,L.AbsoluteContentSize.Y+8)
end)

local function sec(t)
    local l=Instance.new("TextLabel",SC)
    l.Size=UDim2.new(1,0,0,22); l.BackgroundTransparency=1
    l.Text="-- "..t.." --"; l.TextColor3=Color3.fromRGB(0,255,100)
    l.Font=Enum.Font.GothamBold; l.TextSize=12
end
local function tog(n,d,cb)
    local b=Instance.new("TextButton",SC)
    b.Size=UDim2.new(1,0,0,30); b.BackgroundColor3=Color3.fromRGB(35,35,45)
    b.BorderSizePixel=0; b.Text="  "..n; b.TextColor3=Color3.new(1,1,1)
    b.Font=Enum.Font.Gotham; b.TextSize=12; b.TextXAlignment=Enum.TextXAlignment.Left
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
    local ind=Instance.new("Frame",b)
    ind.Size=UDim2.new(0,8,0,8); ind.Position=UDim2.new(1,-18,0.5,-4)
    ind.BackgroundColor3=d and Color3.fromRGB(0,255,100) or Color3.fromRGB(80,80,80)
    ind.BorderSizePixel=0; Instance.new("UICorner",ind).CornerRadius=UDim.new(1,0)
    local s=d
    b.MouseButton1Click:Connect(function()
        s=not s
        ind.BackgroundColor3=s and Color3.fromRGB(0,255,100) or Color3.fromRGB(80,80,80)
        cb(s)
    end)
end

-- ===== ESP через BillboardGui =====
local function isFruit(o)
    if not (o:IsA("Tool") or o:IsA("Model") or o:IsA("BasePart")) then return false end
    for _,n in ipairs(FRUITS) do if o.Name:find(n) then return true end end
    return o.Name:find("Fruit")~=nil
end

local function addESP(inst)
    if not inst:IsA("BasePart") and not inst:IsA("Model") then return end
    local target = inst:IsA("Model") and (inst.PrimaryPart or inst:FindFirstChild("Handle")) or inst
    if not target then return end
    
    if target:FindFirstChild("BF_ESP") then return end

    local bg = Instance.new("BillboardGui")
    bg.Name = "BF_ESP"
    bg.Size = UDim2.new(0, 100, 0, 30)
    bg.AlwaysOnTop = true
    bg.StudsOffset = Vector3.new(0, 3, 0)
    bg.Parent = target

    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.BackgroundTransparency = 1
    txt.TextColor3 = Color3.fromRGB(0, 255, 100)
    txt.TextStrokeTransparency = 0
    txt.Font = Enum.Font.GothamBold
    txt.TextSize = 14
    txt.Text = C.Names and inst.Name or "Fruit"
    txt.Parent = bg
end

task.spawn(function()
    for _,o in ipairs(WS:GetDescendants()) do 
        if isFruit(o) then addESP(o) end 
    end
end)
WS.DescendantAdded:Connect(function(o) 
    task.wait(0.5); if isFruit(o) then addESP(o) end 
end)

-- ===== Таймер =====
local HUD=Instance.new("TextLabel",SG)
HUD.Size=UDim2.new(0,260,0,30); HUD.Position=UDim2.new(0,10,0,40)
HUD.BackgroundColor3=Color3.fromRGB(20,20,25); HUD.BackgroundTransparency=0.25
HUD.TextColor3=Color3.fromRGB(0,255,100); HUD.Font=Enum.Font.GothamBold; HUD.TextSize=14
HUD.Text="Fruits: 0 | Next: --:--"
Instance.new("UICorner",HUD).CornerRadius=UDim.new(0,6)
task.spawn(function()
    while task.wait(1) do
        if not C.Timer then HUD.Visible=false
        else
            HUD.Visible=true
            local c=0
            for _,o in ipairs(WS:GetDescendants()) do if isFruit(o) then c=c+1 end end
            HUD.Text=string.format("Fruits: %d | Next: ~60m", c)
        end
    end
end)

-- ===== UI =====
sec("ESP")
tog("Fruit ESP",true,function(v) 
    C.FruitESP=v 
    for _,v2 in pairs(WS:GetDescendants()) do
        if v2.Name == "BF_ESP" then v2.Enabled = v end
    end
end)
tog("Show name",true,function(v) 
    C.Names=v
    for _,v2 in pairs(WS:GetDescendants()) do
        if v2.Name == "BF_ESP" and v2:FindFirstChildOfClass("TextLabel") then
            v2:FindFirstChildOfClass("TextLabel").Text = v and v2.Parent.Name or "Fruit"
        end
    end
end)

sec("Combat")
tog("Auto Farm",false,function(v) C.Farm=v end)
tog("Kill Aura",false,function(v) C.Aura=v end)

sec("Movement")
tog("Speed hack",false,function(v) C.Speed=v end)

print("[BF Cheat] Скрипт успешно загружен. GUI создан.")
