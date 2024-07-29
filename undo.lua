-- Roblox Highlight Players and Name Display Script

-- Define a color for the highlight effect and text
local highlightColor = Color3.fromRGB(255, 215, 0) -- Gold color for highlights
local nameTextColor = Color3.fromRGB(255, 0, 0) -- Red color for name text

-- Function to create a highlight effect for a player
local function createHighlight(player)
    if player.Character then
        local character = player.Character
        local highlight = Instance.new("Highlight")
        highlight.Adornee = character
        highlight.FillColor = highlightColor
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0.1
        highlight.Parent = character

        -- Create a BillboardGui to display the player's name
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Adornee = character
        billboardGui.Size = UDim2.new(4, 0, 1, 0)
        billboardGui.StudsOffset = Vector3.new(0, 3, 0) -- Position above the character's head
        billboardGui.AlwaysOnTop = true
        billboardGui.Parent = character

        -- Create the TextLabel to display the player's name
        local textLabel = Instance.new("TextLabel")
        textLabel.Text = player.Name
        textLabel.TextColor3 = nameTextColor
        textLabel.TextStrokeTransparency = 0.5
        textLabel.BackgroundTransparency = 1
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextScaled = true
        textLabel.Parent = billboardGui
    end
end

-- Apply highlight and name display to all players in the game
local function highlightAllPlayers()
    for _, player in pairs(game.Players:GetPlayers()) do
        createHighlight(player)
    end
end

-- Event listener to apply effects when a new player joins
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createHighlight(player)
    end)
end)

-- Initial call to highlight all existing players
highlightAllPlayers()



