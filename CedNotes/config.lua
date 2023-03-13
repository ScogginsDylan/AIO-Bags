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

-- Creattes button widgets associated with main frame
function Config:CreateButton(point, relativeFrame, relativePoint, yOffset, text)
    local button = CreateFrame("Button", nil, mainFrame, "GameMenuButtonTemplate")
    button:SetPoint(point, relativeFrame, relativePoint, 0, yOffset)
    button:SetSize(80,40)
    button:SetText(text)
    button:SetNormalFontObject("GameFontNormalLarge")
    button:SetHighlightFontObject("GameFontHighlightLarge")
    return button
end

-- Creates parent frame for main interface; sets default size and position on screen
function Config:CreateMainFrame()
    mainFrame = CreateFrame("Frame", "MainFrameConfig", UIParent, "BasicFrameTemplateWithInset")
    mainFrame:SetSize(400, 400)
    mainFrame:SetPoint("CENTER", UIParent, "CENTER")

    -- Title Frame
    mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    mainFrame.title:SetPoint("LEFT", mainFrame.TitleBg, "LEFT", 5, 0)
    mainFrame.title:SetText(UnitName("player") .. "'s Notes")

    -- Button widgets attached to main frame --
    ---- New Button ----
    mainFrame.newButton = self:CreateButton("CENTER", mainFrame, "BOTTOM", 85, "New")

    ---- Delete Button ----
    mainFrame.delButton = self:CreateButton("CENTER", mainFrame, "BOTTOM", 40, "Delete")

    mainFrame:Hide()
    return mainFrame
end
