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
    local button = CreateFrame("Button", nil, mainFrame.ScrollFrame, "GameMenuButtonTemplate")
    button:SetPoint(point, relativeFrame, relativePoint, 0, yOffset)
    button:SetSize(80,40)
    button:SetText(text)
    button:SetNormalFontObject("GameFontNormalLarge")
    button:SetHighlightFontObject("GameFontHighlightLarge")
    return button
end

local function ScrollFrame_OnMouseWheel(self, delta)
    local newValue = self:GetVerticalScroll() - (delta * 20)
    if (newValue < 0) then
        newValue = 0
    elseif (newValue > self:GetVerticalScrollRange()) then
        newValue = slef:GetVerticalScrollRange()
    end

    self:SetVerticalScroll(newValue)
end

-- Creates parent/child frames for main interface; sets default size and position on screen
function Config:CreateMainFrame()
    mainFrame = CreateFrame("Frame", "MainFrameConfig", UIParent, "BasicFrameTemplateWithInset")
    mainFrame:SetSize(400, 400)
    mainFrame:SetPoint("CENTER", UIParent, "CENTER")

    -- Title Frame --
    mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    mainFrame.title:SetPoint("LEFT", MainFrameConfig.TitleBg, "LEFT", 5, 0)
    mainFrame.title:SetText(UnitName("player") .. "'s Notes")

    -- Scroll Frame --
    mainFrame.ScrollFrame = CreateFrame("ScrollFrame", nil, mainFrame, "UIPanelScrollFrameTemplate")
    mainFrame.ScrollFrame:SetPoint("TOPLEFT", MainFrameConfig.InsetBg, "TOPLEFT", 4, -8)
    mainFrame.ScrollFrame:SetPoint("BOTTOMRIGHT", MainFrameConfig.InsetBg, "BOTTOMRIGHT", -3, 4)
    mainFrame.ScrollFrame:SetClipsChildren(true)
    mainFrame.ScrollFrame:SetScript("OnMouseWheel", ScrollFrame_OnMouseWheel)

    mainFrame.ScrollFrame.ScrollBar:ClearAllPoints()
    mainFrame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", mainFrame.ScrollFrame, "TOPRIGHT", -12, -18)
    mainFrame.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", mainFrame.ScrollFrame, "BOTTOMRIGHT", -7, 18)

    -- Child Frame --
    local childFrame = CreateFrame("Frame", nil, mainFrame.ScrollFrame)
    childFrame:SetSize(350, 500)
    mainFrame.ScrollFrame:SetScrollChild(childFrame)

    -- Button widgets attached to child frame --
    ---- New Button ----
    mainFrame.newButton = self:CreateButton("CENTER", childFrame, "TOP", -70, "New")

    ---- Delete Button ----
    mainFrame.delButton = self:CreateButton("CENTER", mainFrame.newButton, "BOTTOM", -20, "Delete")

    mainFrame:Hide()
    return mainFrame
end
