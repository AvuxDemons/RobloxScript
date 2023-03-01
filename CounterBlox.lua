local plrs = game:GetService("Players")
local espkey = "t"
local esploopkey = "l"
local TeamBased = true ; local teambasedswitch = "o"
local presskeytoaim = true; local aimkey = "e"
local raycast = false
local espupdatetime = 5; autoesp = false
local lockaim = true; local lockangle = 2

local Gui = Instance.new("ScreenGui")
local Move = Instance.new("Frame")
local Main = Instance.new("Frame")
local EspStatus = Instance.new("TextLabel")
local st1 = Instance.new("TextLabel")
local st1_2 = Instance.new("TextLabel")
local st1_3 = Instance.new("TextLabel")
local Name = Instance.new("TextLabel")
--Properties:
Gui.Name = "Gui"
Gui.Parent = plrs.LocalPlayer:WaitForChild("PlayerGui")

Move.Name = "Move"
Move.Parent = Gui
Move.BackgroundColor3 = Color3.new(109, 110, 108)
Move.BackgroundTransparency = 0.2
Move.BorderSizePixel = 0
Move.Position = UDim2.new(0.898, 0,0.45, 0)
Move.Size = UDim2.new(0.1, 0, 0.0320388414, 0)

Main.Name = "Main"
Main.Parent = Move
Main.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
Main.BackgroundTransparency = 0.69999998807907
Main.Position = UDim2.new(0, 0, 0.995670795, 0)
Main.Size = UDim2.new(1.0000006, 0, 2.79697132, 0)

EspStatus.Name = "EspStatus"
EspStatus.Parent = Main
EspStatus.BackgroundColor3 = Color3.new(1, 1, 1)
EspStatus.BackgroundTransparency = 1
EspStatus.Position = UDim2.new(0.05, 0, 0.1, 0)
EspStatus.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
EspStatus.Font = Enum.Font.GothamBlack
EspStatus.Text = ""..string.upper(espkey).." | Update ESP"
EspStatus.TextColor3 = Color3.new(242, 243, 243)
EspStatus.TextScaled = true
EspStatus.TextSize = 8
EspStatus.TextWrapped = true
EspStatus.TextXAlignment = Enum.TextXAlignment.Left

st1.Name = "st1"
st1.Parent = Main
st1.BackgroundColor3 = Color3.new(1, 1, 1)
st1.BackgroundTransparency = 1
st1.Position = UDim2.new(0.05, 0, 0.3, 0)
st1.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1.Font = Enum.Font.GothamBlack
st1.Text = ""..string.upper(aimkey).." | Toggle Aimlock"
st1.TextColor3 = Color3.new(242, 243, 243)
st1.TextScaled = true
st1.TextSize = 8
st1.TextWrapped = true
st1.TextXAlignment = Enum.TextXAlignment.Left

st1_2.Name = "st1"
st1_2.Parent = Main
st1_2.BackgroundColor3 = Color3.new(1, 1, 1)
st1_2.BackgroundTransparency = 1
st1_2.Position = UDim2.new(0.05, 0, 0.5, 0)
st1_2.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_2.Font = Enum.Font.GothamBlack
st1_2.Text = ""..string.upper(esploopkey).." | Toggle ESP Loop"
st1_2.TextColor3 = Color3.new(242, 243, 243)
st1_2.TextScaled = true
st1_2.TextSize = 8
st1_2.TextWrapped = true
st1_2.TextXAlignment = Enum.TextXAlignment.Left

st1_3.Name = "st1"
st1_3.Parent = Main
st1_3.BackgroundColor3 = Color3.new(1, 1, 1)
st1_3.BackgroundTransparency = 1
st1_3.Position = UDim2.new(0.05, 0, 0.7, 0)
st1_3.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_3.Font = Enum.Font.GothamBlack
st1_3.Text = ""..string.upper(teambasedswitch).." | Change Team ESP"
st1_3.TextColor3 = Color3.new(242, 243, 243)
st1_3.TextScaled = true
st1_3.TextSize = 8
st1_3.TextWrapped = true
st1_3.TextXAlignment = Enum.TextXAlignment.Left

local teambasedstatus = st1_3:Clone()
teambasedstatus.Parent = st1_3
teambasedstatus.TextScaled = true
teambasedstatus.Position = UDim2.new(0, 0,0.694, 0)
teambasedstatus.Text = tostring(TeamBased)

Name.Name = "Name"
Name.Parent = Move
Name.BackgroundColor3 = Color3.new(1, 1, 1)
Name.BackgroundTransparency = 1
Name.Position = UDim2.new(0, 0, 0.2, 0)
Name.Size = UDim2.new(1, 0, 0.75, 0)
Name.Font = Enum.Font.GothamBlack
Name.Text = "CounterBlox"
Name.TextColor3 = Color3.new(0, 0, 0)
Name.TextScaled = true
Name.TextSize = 8
Name.TextWrapped = true
Name.TextXAlignment = Enum.TextXAlignment.Center
-- Scripts:


local plrsforaim = {}

local lplr = game:GetService("Players").LocalPlayer
Move.Draggable = true
Gui.ResetOnSpawn = false
Gui.Name = "Chat"
Gui.DisplayOrder = 999

Gui.Parent = plrs.LocalPlayer.PlayerGui


f = {}
local espforlder

f.addesp = function()
if espforlder then
else
    espforlder = Instance.new("Folder")
    espforlder.Parent = game.Workspace.CurrentCamera
end
for i, v in pairs(espforlder:GetChildren()) do
    v:Destroy()
end
for _, plr in pairs(plrs:GetChildren()) do
    if plr.Character and plr.Character.Humanoid.Health > 0 and plr.Name ~= lplr.Name then
        if TeamBased == true then
            if plr.Team.Name ~= plrs.LocalPlayer.Team.Name  then
                local e = espforlder:FindFirstChild(plr.Name)
                if not e then
                    -- Esp Team Change
                    local bill = Instance.new("BillboardGui", espforlder)
                    bill.Name = plr.Name
                    bill.AlwaysOnTop = true
                    bill.Size = UDim2.new(1,0,1,0)
                    bill.Adornee = plr.Character.Head
                    local Frame = Instance.new('Frame',bill)
                    Frame.Active = true
                    Frame.BackgroundColor3 = Color3.new(255/255,0/255,0/255)
                    Frame.BackgroundTransparency = 0
                    Frame.BorderSizePixel = 0
                    Frame.AnchorPoint = Vector2.new(.5, .5)
                    Frame.Position = UDim2.new (0.5,0,0.5,0)
                    Frame.Size = UDim2.new (1,0,1,0)
                    Frame.Rotation = 0
                    plr.Character.Humanoid.Died:Connect(function()
                    bill:Destroy()
                    end)
                end
            end
        else
            local e = espforlder:FindFirstChild(plr.Name)
            if not e then
                -- Esp Update
                local bill = Instance.new("BillboardGui", espforlder)
                bill.Name = plr.Name
                bill.AlwaysOnTop = true
                bill.Size = UDim2.new(1,0,1,0)
                bill.Adornee = plr.Character.Head
                local Frame = Instance.new('Frame',bill)
                Frame.Active = true
                Frame.BackgroundColor3 = Color3.new(255/255,0/255,0/255)
                Frame.BackgroundTransparency = 0
                Frame.BorderSizePixel = 0
                Frame.AnchorPoint = Vector2.new(.5, .5)
                Frame.Position = UDim2.new (0.5,0,0.5,0)
                Frame.Size = UDim2.new (1,0,1,0)
                Frame.Rotation = 0
                plr.Character.Humanoid.Died:Connect(function()
                bill:Destroy()
                end)
            end
        end


    end
end
end
local cam = game.Workspace.CurrentCamera

local mouse = lplr:GetMouse()
local switch = false
local key = "k"
local aimatpart = nil
mouse.KeyDown:Connect(function(a)
if a == espkey then
f.addesp()
game.StarterGui:SetCore("SendNotification", {
    Title = "CounterBlox";
    Text = "ESP Updated";
    Duration = 5
})
elseif a == esploopkey then
if autoesp == false then
    autoesp = true
    game.StarterGui:SetCore("SendNotification", {
        Title = "CounterBlox";
        Text = "ESP Loop Enabled";
        Duration = 5
    })
else
    autoesp = false
end
end
if a == "j" then
if mouse.Target then
    mouse.Target:Destroy()
end
end
if a == key then
if switch == false then
    switch = true
else
    switch = false
    if aimatpart ~= nil then
        aimatpart = nil
    end
end
elseif a == teambasedswitch then
game.StarterGui:SetCore("SendNotification", {
    Title = "CounterBlox";
    Text = "Change Team ESP";
    Duration = 5
})
if TeamBased == true then
    TeamBased = false
    teambasedstatus.Text = tostring(TeamBased)
else
    TeamBased = true
    teambasedstatus.Text = tostring(TeamBased)
end
elseif a == aimkey then
if not aimatpart then
    local maxangle = math.rad(20)
    for i, plr in pairs(plrs:GetChildren()) do
        if plr.Name ~= lplr.Name and plr.Character and plr.Character.Head and plr.Character.Humanoid and plr.Character.Humanoid.Health > 1 then
            if TeamBased == true then
                if plr.Team.Name ~= lplr.Team.Name then
                    local an = checkfov(plr.Character.Head)
                    if an < maxangle then
                        maxangle = an
                        aimatpart = plr.Character.Head
                    end
                end
            else
                local an = checkfov(plr.Character.Head)
                if an < maxangle then
                    maxangle = an
                    aimatpart = plr.Character.Head
                end
                print(plr)
            end
            plr.Character.Humanoid.Died:Connect(function()
            if aimatpart.Parent == plr.Character or aimatpart == nil then
                aimatpart = nil
            end
            end)
        end
    end
else
    aimatpart = nil
end
end
end)

function getfovxyz (p0, p1, deg)
local x1, y1, z1 = p0:ToOrientation()
local cf = CFrame.new(p0.p, p1.p)
local x2, y2, z2 = cf:ToOrientation()
--local d = math.deg
if deg then
    --return Vector3.new(d(x1-x2), d(y1-y2), d(z1-z2))
else
    return Vector3.new((x1-x2), (y1-y2), (z1-z2))
end
end

function getaimbotplrs()
plrsforaim = {}
for i, plr in pairs(plrs:GetChildren()) do
    if plr.Character and plr.Character.Humanoid and plr.Character.Humanoid.Health > 0 and plr.Name ~= lplr.Name and plr.Character.Head then

        if TeamBased == true then
            if plr.Team.Name ~= lplr.Team.Name then
                local cf = CFrame.new(game.Workspace.CurrentCamera.CFrame.p, plr.Character.Head.CFrame.p)
                local r = Ray.new(cf, cf.LookVector * 10000)
                local ign = {}
                for i, v in pairs(plrs.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        table.insert(ign , v)
                    end
                end
                local obj = game.Workspace:FindPartOnRayWithIgnoreList(r, ign)
                if obj.Parent == plr.Character and obj.Parent ~= lplr.Character then
                    table.insert(plrsforaim, obj)
                end
            end
        else
            local cf = CFrame.new(game.Workspace.CurrentCamera.CFrame.p, plr.Character.Head.CFrame.p)
            local r = Ray.new(cf, cf.LookVector * 10000)
            local ign = {}
            for i, v in pairs(plrs.LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    table.insert(ign , v)
                end
            end
            local obj = game.Workspace:FindPartOnRayWithIgnoreList(r, ign)
            if obj.Parent == plr.Character and obj.Parent ~= lplr.Character then
                table.insert(plrsforaim, obj)
            end
        end


    end
end
end

function aimat(part)
cam.CFrame = CFrame.new(cam.CFrame.p, part.CFrame.p)
end
function checkfov (part)
local fov = getfovxyz(game.Workspace.CurrentCamera.CFrame, part.CFrame)
local angle = math.abs(fov.X) + math.abs(fov.Y)
return angle
end

game:GetService("RunService").RenderStepped:Connect(function()
if aimatpart then
aimat(aimatpart)
if aimatpart.Parent == plrs.LocalPlayer.Character then
    aimatpart = nil
end
end
if raycast == true and switch == false and not aimatpart then
getaimbotplrs()
aimatpart = nil
local maxangle = 999
for i, v in ipairs(plrsforaim) do
    if v.Parent ~= lplr.Character then
        local an = checkfov(v)
        if an < maxangle and v ~= lplr.Character.Head then
            maxangle = an
            aimatpart = v
            print(v:GetFullName())
            v.Parent.Humanoid.Died:connect(function()
            aimatpart = nil
            end)
        end
    end
end

end
end)
delay(0, function()
while wait(espupdatetime) do
if autoesp == true then
    pcall(function()
    f.addesp()
    end)
end
end
end)
game.StarterGui:SetCore("SendNotification", {
Title = "CounterBlox";
Text = "Successfully Loaded";
Duration = 30
})
