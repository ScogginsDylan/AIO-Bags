-- Namespace
local _, core = ...
core.Config = {}

local Config = core.Config
local mainFrame

-- Config functions
-- Toggles the creation/display of the widget frame
function Config:Toggle()
    local frame = mainFrame or Config:CreateMainFrame()
    frame:SetShown(not frame:IsShown())
end

-- Creates parent frame for bag interface; sets default size and position on screen
function Config:CreateMainFrame()
    mainFrame = CreateFrame("Frame", "MainFrameConfig", UIParent, "BasicFrameTemplateWithInset")
    mainFrame:SetSize(600, 420)
    mainFrame:SetPoint("CENTER", UIParent, "CENTER")

    -- Title Frame
    mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    mainFrame.title:SetPoint("LEFT", mainFrame.TitleBg, "LEFT", 5, 0)
    mainFrame.title:SetText(UnitName("player") .. "'s Notes")

    -- bagFrame:Hide()
    return mainFrame
end