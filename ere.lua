local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua", true))()

local Window = Luna:CreateWindow({
    Name = "RINGTA",
    Subtitle =        "discord.gg/ringta",
    LogoID = "82795327169782",
    LoadingEnabled = true,
    LoadingTitle = "RINGTA loading",
    LoadingSubtitle = "discord.gg/ringta",
    ConfigSettings = {
        RootFolder = nil,
        ConfigFolder = "Big Hub"
    },
    KeySystem = false
})

local Tabs = {
    Main = Window:CreateTab({
        Name = "RedLight",
        Icon = "lightbulb",
        ImageContent = "Material",
        ShowTitle = true
    }),
    Player = Window:CreateTab({
        Name = "Dalgona",
        Icon = "cake",
        ImageContent = "Material",
        ShowTitle = true
    }),
    Tug = Window:CreateTab({
        Name = "Tug Of War",
        Icon = "sports_kabaddi",
        ImageContent = "Material",
        ShowTitle = true
    }),
    Hide = Window:CreateTab({
        Name = "Hide And Seek",
        Icon = "visibility",
        ImageContent = "Material",
        ShowTitle = true
    }),
    Jump = Window:CreateTab({
        Name = "Jump Rope/Glass Bridge",
        Icon = "sports_handball",
        ImageContent = "Material",
        ShowTitle = true
    }),
    Mingle = Window:CreateTab({
        Name = "Mingle",
        Icon = "group",
        ImageContent = "Material",
        ShowTitle = true
    }),
    Random = Window:CreateTab({
        Name = "Random Features",
        Icon = "casino",
        ImageContent = "Material",
        ShowTitle = true
    }),
    Rebel = Window:CreateTab({
        Name = "Rebel",
        Icon = "dangerous",
        ImageContent = "Material",
        ShowTitle = true
    }),
    Final = Window:CreateTab({
        Name = "Final",
        Icon = "sports_kabaddi",
        ImageContent = "Material",
        ShowTitle = true
    })
}


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function getPlayerNamesForDropdown()
    local names = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(names, player.Name)
        end
    end
    return names
end

local selectedPlayerName = nil

local PlayerDropdown = Tabs.Random:CreateDropdown({
    Name = "Select Player",
    Values = getPlayerNamesForDropdown(),
    CurrentValue = nil,
    Multi = false,
    Callback = function(option)
        selectedPlayerName = option
    end
}, "SelectPlayerDropdown")

Tabs.Random:CreateButton({
    Name = "Teleport to Selected Player",
    Description = nil,
    Callback = function()
        if not selectedPlayerName then return end
        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local myChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local myHRP = myChar:FindFirstChild("HumanoidRootPart")
            local targetHRP = targetPlayer.Character.HumanoidRootPart
            if myHRP then
                myHRP.CFrame = targetHRP.CFrame + Vector3.new(0, 2, 0)
            end
        end
    end
})

Tabs.Random:CreateButton({
    Name = "Refresh Player List",
    Description = nil,
    Callback = function()
        PlayerDropdown:Refresh(getPlayerNamesForDropdown())
    end
})
