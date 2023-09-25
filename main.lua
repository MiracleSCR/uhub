local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🏠 Horrific Housing | Miracle Scripts 🔥",
   LoadingTitle = "🏠 Horrific Housing Script 🏠",
   LoadingSubtitle = "by Miracle Scripts",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "HH", -- Create a custom folder for your hub/game
      FileName = "HHSave"
   },
   Discord = {
      Enabled = true,
      Invite = "YBgSw4cMFr", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "🔑 Key System",
      Subtitle = "Join Our Discord to Get Key",
      Note = "Key In Discord Server\nJoin And Get 🔑",
      FileName = "HubKey1", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "ROBLOX" -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🏠 Main", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "🏠 Horrific Housing Script Enabled!",
   Content = "Thx For Using Miracle Script",
   Duration = 5,
   Image = "🏠",
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "OK",
         Callback = function()
         print("Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="🏠"; Text="Infinite Jump Activated!"; Duration=5;})

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {1, 200},
   Increment = 1,
   Suffix = nil,
   CurrentValue = 16,
   Flag = "sliderws", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider2 = MainTab:CreateSlider({
   Name = "JumpPower",
   Range = {1, 200},
   Increment = 1,
   Suffix = nil,
   CurrentValue = 50,
   Flag = "sliderjp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local Farm = MainTab:CreateButton({
   Name = "Farm Money",
   Callback = function()
	_G.farm = not _G.farm

if _G.farmStarted == nil then
	--Ensures this only runs once to save resources
	_G.farmStarted = true
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.farm then
			if k:byte() == 32 then
			while true do
				wait(0)
				local Target = game:GetService("ReplicatedStorage").LoginRewards;
				Target:FireServer();
				end
			end
		end
	end)
end
   end,
})

local TPTab = Window:CreateTab("🎲 Credits", nil) -- Title, Image
local CSection = TPTab:CreateSection("Credits")
local LBS1 = TPTab:CreateLabel("This Script Been Made by Miracle Scripts!")
local Button = TPTab:CreateButton({
   Name = "Destroy Menu",
   Callback = function()
   	Rayfield:Destroy()
   end,
})
