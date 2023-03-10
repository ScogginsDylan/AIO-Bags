-- Namespace
local _, core = ...

-- Custom Slash Commmands
core.commands = {
    ["show"] = core.Config.Toggle,

    ["help"] = function()
        print(" ")
        core:Print("List of slash commands:")
        core:Print("/at show|r - shows bag menu")
        core:Print("/at help|r - shows help info")
        print(" ")
    end,

    ["example"] = {
        ["test"] = function(...)
            core:Print("My Value:", tostringall(...))
        end
    }
}

-- Slash Command Handler
local function HandleSlashCommands(str)
    if (#str == 0) then
        core.commands.help()
        return
    end

    local args = {}
    for _, arg in ipairs({string.split(' ', str)}) do
        if (#args > 0) then
            table.insert(args, arg)
        end
    end

    local path = core.commands

    for id, arg in ipairs(args) do
        if (#arg > 0) then
            arg = arg:lower()
            if (path[arg]) then
                if (type(path[arg]) == "function") then
                    path[arg](select(id + 1, unpack(args)))
                    return
                elseif (type(pathp[arg]) == "table") then
                    path = path[arg]
                end
            else
                core.commands.help()
                return
            end
        end
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