-- Namespace
local _, core = ...

-- Custom Slash Commmands
core.commands = {
    [""] = core.Config.Toggle
}

-- Slash Command Handler
local function HandleSlashCommands(str)
    if (#str == 0) then
        core.commands.Toggle
    end
end

-- Innitializer
function core:init(event, name)
    if (name ~= "AIOBags") then return end

    -- Slash Commands
    SLASH_RELOADUI1 = "/rl"
    SlashCmdList.RELOADUI = ReloadUI

    SLASH_FRAMESTK1 = "/fs"
    SlashCmdList.FRAMESTK = function()
        LoadAddon('Blizzard_DebugTools')
        FrameStackTooltip_Toggle()
    end

    SLASH_AIOBags1 = "/ab"
    SlashCmdList.AIOBags = HandleSlashCommands
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:SetScript("OnEvent", core.init)