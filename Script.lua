local function GloveSlap()
    if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") == nil and game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") ~= nil and game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool").Name == "Lantern" then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Lantern) end
    wait()
    if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") ~= nil then game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate() end
end

local function AutoRocket(Value)
	Rocket = Value
	while Rocket == true do task.wait(.5)
		for i, v in pairs(workspace:GetChildren()) do
		    if v.Name == "TrackGloveMissile" then
				GloveSlap()
		        local args = {
		            [1] = "Hit",
		            [2] = v
		        }
		
		        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
		    end
		end
	end
end


local function AutoGuide(Value)
	Guide = Value
	while Guide == true do task.wait(.1)
		for i, v in pairs(workspace:GetChildren()) do
		    if v.Name == "GuideNPC" then
				GloveSlap()
		        local args = {
		            [1] = "Hit",
		            [2] = v:FindFirstChild("HumanoidRootPart")
		        }
		
		        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
		    end
		end
	end
end

local function AutoGolem(Value)
	Golem = Value
	while Golem == true do task.wait(.25)
		for i, v in pairs(workspace:GetChildren()) do
		    if v.Name == "golem" then
				GloveSlap()
		        local args = {
		            [1] = "Hit",
		            [2] = v:FindFirstChild("Hitbox")
		        }
		
		        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
		    end
		end
	end
end

local function AutoNPC(Value)
	NPC = Value
	while NPC == true do task.wait(.5)
		for i, v in pairs(workspace:GetChildren()) do
		    if v.Name == "ReplicaNPC" then 
				GloveSlap()
		        local args = {
		            [1] = "Hit",
		            [2] = v:FindFirstChild("HumanoidRootPart")
		        }
		
		        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
		    end
		end
	end
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

OrionLib:MakeNotification({
	Name = "Hey!",
	Content = "I only made UI better, OG script creator is OMOHOTA",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Window = OrionLib:MakeWindow({Name = "Slap Battles | Guide Hub", HidePremium = true, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
    Name = "Credits!",
    Icon = "rbxassetid://18505728201",
    PremiumOnly = false
})

Tab:AddLabel("Redisings discord: .gg/zKVVGwzcmH")

local Tab1 = Window:MakeTab({
	Name = "Teleports!",
	Icon = "rbxassetid://12941020168",
	PremiumOnly = false
})
local Section = Tab1:AddSection({
	Name = "Teleports"
})
Tab1:AddButton({
	Name = "Teleport to Lever!",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3273,-75,822)
  	end    
})
Tab1:AddButton({
	Name = "Teleport to Safe Zone!",
	Callback = function()
            local SF = Instance.new("Part", workspace)
	        SF.Size = Vector3.new(400,5,400)
        	SF.Transparency = .8
        	SF.Anchored = true
        	SF.CanCollide = true
        	SF.Position = Vector3.new(595, 146, -330)
        	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(595, 150, -330)
  	end    
})

local Tab2 = Window:MakeTab({
	Name = "Main!",
	Icon = "rbxassetid://11425913735",
	PremiumOnly = false
})

local Section2 = Tab2:AddSection({
	Name = "Autos!"
})

Tab2:AddButton({
	Name = "Hit Replicas!",
	Callback = function()
		GloveSlap()
		task.wait(.5)
		AutoNPC(true)
	end    
})

Tab2:AddButton({
	Name = "Hit Golem!",
	Callback = function()
        AutoGolem(true)
	end    
})

Tab2:AddButton({
	Name = "Auto Rockets!",
	Callback = function()
        AutoRocket(true)
	end    
})

Tab2:AddButton({
	Name = "Auto Kill Guide!",
	Callback = function()
        AutoGuide(true)
	end    
})

local Section3 = Tab2:AddSection({
	Name = "Actions!"
})

Tab2:AddButton({
	Name = "Spare Guide!",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Data.AnswerInCutscene:FireServer("Spare")
	end    
})

Tab2:AddButton({
    Name = "No Spare Guide!",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Data.AnswerInCutscene:FireServer("Eliminate")
    end
})
