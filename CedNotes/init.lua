-- Namespace
local _, core = ...

-- Custom Slash Commmands


-- Slash Command Handler


-- Innitializer
function core:init(event, name)
    if (name ~= "CedNotes") then return end

    -- Slash Commands
    SLASH_RELOADUI1 = "/rl"
    SlashCmdList.RELOADUI = ReloadUI

    SLASH_FRAMESTK1 = "/fs"
    SlashCmdList.FRAMESTK = function()
        LoadAddon('Blizzard_DebugTools')
        FrameStackTooltip_Toggle()
    end

    SLASH_CEDNOTES1 = "/cn"
    SlashCmdList.CEDNOTES = function()
        
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:SetScript("OnEvent", core.init)