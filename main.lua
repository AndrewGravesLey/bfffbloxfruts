-- BF Cheat | Delta iOS | @AiMornAi build
if not game:IsLoaded() then game.Loaded:Wait() end
local P=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local UIS=game:GetService("UserInputService")
local RUN=game:GetService("RunService")
local WS=game:GetService("Workspace")
local LP=P.LocalPlayer

local C={FruitESP=true,Names=true,Timer=true,Farm=false,FarmR=150,Aura=false,AuraR=30,Speed=false,Spd=100}
local FRUITS={"Rocket","Spin","Chop","Spring","Bomb","Smoke","Spike","Flame","Falcon","Ice","Sand","Dark","Diamond","Light","Rubber","Barrier","Ghost","Magma","Quake","Buddha","Love","Spider","Sound","Phoenix","Portal","Rumble","Pain","Blizzard","Gravity","Mammoth","T-Rex","Dough","Shadow","Venom","Control","Spirit","Dragon","Leopard","Kitsune","Yeti","Gas"}

-- ===== GUI =====
local SG=Instance.new("ScreenGui",game.CoreGui)
SG.Name="BF_Cheat"; SG.ResetOnSpawn=false
local M=Instance.new("Frame",SG)
M.Size=UDim2.new(0,320,0,440); M.Position=UDim2.new(0.5,-160,0.5,-220)
M.BackgroundColor3=Color3.fromRGB(20,20,25); M.BorderSizePixel=0; M.Active=true
Instance.new("UICorner",M).CornerRadius=UDim.new(0,8)
local TB=Instance.new("Frame",M)
TB.Size=UDim2.new(1,0,0,32); TB.BackgroundColor3=Color3.fromRGB(30,30,38); TB.BorderSizePixel=0
Instance.new("UICorner",TB).CornerRadius=UDim.new(0,8)
local T=Instance.new("TextLabel",TB)
T.Size=UDim2.new(1,-60,1,0); T.Position=UDim2.new(0,10,0,0); T.BackgroundTransparency=1
T.Text="BF Cheat | Delta iOS"; T.TextColor3=Color3.fromRGB(0,255,100)
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
local function sld(n,mn,mx,d,cb)
    local h=Instance.new("Frame",SC)
    h.Size=UDim2.new(1,0,0,44); h.BackgroundColor3=Color3.fromRGB(35,35,45); h.BorderSizePixel=0
    Instance.new("UICorner",h).CornerRadius=UDim.new(0,4)
    local l=Instance.new("TextLabel",h)
    l.Size=UDim2.new(1,-10,0,20); l.Position=UDim2.new(0,10,0,2)
    l.BackgroundTransparency=1; l.Text=n..": "..d; l.TextColor3=Color3.new(1,1,1)
    l.Font=Enum.Font.Gotham; l.TextSize=12; l.TextXAlignment=Enum.TextXAlignment.Left
    local bar=Instance.new("Frame",h)
    bar.Size=UDim2.new(1,-20,0,6); bar.Position=UDim2.new(0,10,1,-14)
    bar.BackgroundColor3=Color3.fromRGB(50,50,60); bar.BorderSizePixel=0
    Instance.new("UICorner",bar).CornerRadius=UDim.new(1,0)
    local f=Instance.new("Frame",bar)
    f.Size=UDim2.new((d-mn)/(mx-mn),0,1,0); f.BackgroundColor3=Color3.fromRGB(0,255,100)
    f.BorderSizePixel=0; Instance.new("UICorner",f).CornerRadius=UDim.new(1,0)
    bar.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            local cn
            local function u(inp)
                local r=math.clamp((inp.Position.X-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
                local v=math.floor(mn+(mx-mn)*r)
                f.Size=UDim2.new(r,0,1,0); l.Text=n..": "..v; cb(v)
            end
            u(i)
            cn=UIS.InputChanged:Connect(function(inp)
                if inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch then u(inp) end
            end)
            UIS.InputEnded:Connect(function(inp)
                if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
                    if cn then cn:Disconnect() end
                end
            end)
        end
    end)
end

-- ===== FRUIT =====
local function isFruit(o)
    if not (o:IsA("Tool") or o:IsA("Model") or o:IsA("BasePart")) then return false end
    for _,n in ipairs(FRUITS) do if o.Name:find(n) then return true end end
    return o.Name:find("Fruit")~=nil
end
local function wpos(o)
    if o:IsA("BasePart") then return o.Position end
    if o:IsA("Model") then
        local ok,p=pcall(function() return o:GetPivot().Position end)
        if ok then return p end
        local h=o:FindFirstChild("Handle") or o.PrimaryPart
        if h then return h.Position end
    end
end

local draws={}
local function addE(o)
    if draws[o] then return end
    local t=Drawing.new("Text")
    t.Size=14; t.Color=Color3.fromRGB(0,255,100); t.Center=true
    t.Outline=true; t.OutlineColor=Color3.new(0,0,0); t.Visible=false
    draws[o]=t
end
local function remE(o)
    if draws[o] then pcall(function() draws[o]:Remove() end); draws[o]=nil end
end
task.spawn(function()
    for _,o in ipairs(WS:GetDescendants()) do if isFruit(o) then addE(o) end end
end)
WS.DescendantAdded:Connect(function(o) task.wait(0.15); if isFruit(o) then addE(o) end end)
WS.DescendantRemoving:Connect(function(o) if draws[o] then remE(o) end end)

RUN.RenderStepped:Connect(function()
    local cam=WS.CurrentCamera; if not cam then return end
    for o,d in pairs(draws) do
        if not o or not o.Parent then pcall(function() d:Remove() end); draws[o]=nil
        elseif not C.FruitESP then d.Visible=false
        else
            local p=wpos(o)
            if p then
                local s,on=cam:WorldToViewportPoint(p)
                if on then
                    d.Position=Vector2.new(s.X,s.Y-20)
                    d.Text=C.Names and o.Name or "Fruit"
                    d.Visible=true
                else d.Visible=false end
            else d.Visible=false end
        end
    end
end)

-- ===== TIMER =====
local HUD=Instance.new("TextLabel",SG)
HUD.Size=UDim2.new(0,260,0,30); HUD.Position=UDim2.new(0,10,0,40)
HUD.BackgroundColor3=Color3.fromRGB(20,20,25); HUD.BackgroundTransparency=0.25
HUD.TextColor3=Color3.fromRGB(0,255,100); HUD.Font=Enum.Font.GothamBold; HUD.TextSize=14
HUD.Text="Fruits: 0 | Next: --:--"
Instance.new("UICorner",HUD).CornerRadius=UDim.new(0,6)
local lc=0; local ls=tick(); local INT=60*60
task.spawn(function()
    while task.wait(1) do
        if not C.Timer then HUD.Visible=false
        else
            HUD.Visible=true
            local c=0
            for _,o in ipairs(WS:GetDescendants()) do if isFruit(o) then c=c+1 end end
            if c>lc then ls=tick() end
            lc=c
            local rem=math.max(0,INT-(tick()-ls))
            HUD.Text=string.format("Fruits: %d | Next: %02d:%02d",c,math.floor(rem/60),math.floor(rem%60))
        end
    end
end)

-- ===== COMBAT REMOTE AUTO-DETECT =====
local PAT={"Comm","Attack","Damage","Hit","Swing","Combat"}
local function fireCombat()
    for _,o in ipairs(RS:GetDescendants()) do
        if o:IsA("RemoteEvent") or o:IsA("RemoteFunction") then
            for _,p in ipairs(PAT) do
                if o.Name:lower():find(p:lower()) then
                    pcall(function()
                        if o:IsA("RemoteEvent") then o:FireServer()
                        else o:InvokeServer() end
                    end)
                    break
                end
            end
        end
    end
end
local function nearNPC()
    local ch=LP.Character; local hrp=ch and ch:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local best,bd
    for _,v in ipairs(WS:GetDescendants()) do
        if v:IsA("Model") and v~=ch and not P:GetPlayerFromCharacter(v) then
            local h=v:FindFirstChildOfClass("Humanoid")
            local t=v:FindFirstChild("HumanoidRootPart")
            if h and t and h.Health>0 then
                local d=(t.Position-hrp.Position).Magnitude
                if d<=C.FarmR and (not bd or d<bd) then best=v; bd=d end
            end
        end
    end
    return best
end

task.spawn(function()
    while task.wait(0.25) do
        if C.Farm and LP.Character then
            local t=nearNPC()
            if t then
                local hrp=LP.Character:FindFirstChild("HumanoidRootPart")
                local thrp=t:FindFirstChild("HumanoidRootPart")
                if hrp and thrp then
                    local off=hrp.Position-thrp.Position
                    if off.Magnitude>6 then off=off.Unit*5 end
                    hrp.CFrame=CFrame.new(thrp.Position+off,thrp.Position)
                end
                fireCombat()
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.3) do
        if C.Aura and LP.Character then
            local m=LP.Character:FindFirstChild("HumanoidRootPart")
            if m then
                for _,v in ipairs(WS:GetDescendants()) do
                    if v:IsA("Model") and v~=LP.Character and not P:GetPlayerFromCharacter(v) then
                        local h=v:FindFirstChildOfClass("Humanoid")
                        local t=v:FindFirstChild("HumanoidRootPart")
                        if h and t and h.Health>0 and (t.Position-m.Position).Magnitude<=C.AuraR then
                            pcall(function() h:TakeDamage(5) end)
                        end
                    end
                end
                fireCombat()
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if C.Speed and LP.Character then
            local h=LP.Character:FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed=C.Spd end
        end
    end
end)

-- ===== UI =====
sec("ESP")
tog("Fruit ESP",true,function(v) C.FruitESP=v end)
tog("Show name",true,function(v) C.Names=v end)
tog("Fruit timer",true,function(v) C.Timer=v end)
sec("Combat")
tog("Auto Farm",false,function(v) C.Farm=v end)
sld("Farm range",30,400,150,function(v) C.FarmR=v end)
tog("Kill Aura",false,function(v) C.Aura=v end)
sld("Aura range",10,80,30,function(v) C.AuraR=v end)
sec("Movement")
tog("Speed hack",false,function(v) C.Speed=v end)
sld("Speed value",16,300,100,function(v) C.Spd=v end)

sec("Teleport")
local TP=Instance.new("TextButton",SC)
TP.Size=UDim2.new(1,0,0,32); TP.BackgroundColor3=Color3.fromRGB(0,180,100)
TP.BorderSizePixel=0; TP.Text="TP to nearest fruit"
TP.TextColor3=Color3.new(1,1,1); TP.Font=Enum.Font.GothamBold; TP.TextSize=13
Instance.new("UICorner",TP).CornerRadius=UDim.new(0,4)
TP.MouseButton1Click:Connect(function()
    local ch=LP.Character; if not ch then return end
    local hrp=ch:FindFirstChild("HumanoidRootPart"); if not hrp then return end
    local best,bd
    for o in pairs(draws) do
        if o and o.Parent then
            local p=wpos(o)
            if p then
                local d=(p-hrp.Position).Magnitude
                if not bd or d<bd then best=p; bd=d end
            end
        end
    end
    if best then hrp.CFrame=CFrame.new(best+Vector3.new(0,3,0)) end
end)
