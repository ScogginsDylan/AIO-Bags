-- Namespace
local _, core = ...
core.Config = {}

local Config = core.Config
local bagFrame

-- Config functions
-- Toggles the creation/display of the widget frame
function Config:Toggle()
    local bag = bagFrame or Config:CreateBagFrame()
    bag:SetShown(not bag:IsShown())
end

-- Creates parent frame for bag interface; sets default size and position on screen
function Config:CreateBagFrame()
    bagFrame = CreateFrame("Frame", "BagFrameConfig", UIParent, "BasicFrameTemplateWithInset")
    bagFrame:SetSize(600, 420)
    bagFrame:SetPoint("CENTER", UIParent, "CENTER")

    -- Title Frame
    bagFrame.title = bagFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    bagFrame.title:SetPoint("LEFT", bagFrame.TitleBg, "LEFT", 5, 0)
    bagFrame.title:SetText(UnitName("player") .. "'s Bags")

    bagFrame:Hide()
    return bagFrame
end