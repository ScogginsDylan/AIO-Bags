SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI

SLASH_FRAMESTK1 = "/fs"
SlashCmdList.FRAMESTK = function()
    LoadAddon('Blizzard_DebugTools')
    FrameStackTooltip_Toggle()
end

-- Creates parent frame for bag interface; sets default size and position on screen
local bagFrame = CreateFrame("Frame", "AIO_BagFrame", UIParent, "BasicFrameTemplateWithInset")
bagFrame:SetSize(600, 420)
bagFrame:SetPoint("CENTER", UIParent, "CENTER")

-- Title Frame
bagFrame.title = bagFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
bagFrame.title:SetPoint("LEFT", bagFrame.TitleBg, "LEFT", 5, 0)
bagFrame.title:SetText(UnitName("player") .. "'s Bags")

-- Grid Frame