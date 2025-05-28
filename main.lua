tinsert(UISpecialFrames, 'WeeklyRewardsFrame')

SLASH_GREATVAULTSLASHCOMMAND1 = '/vault'

local frame = WeeklyRewardsFrame
local hooked = false

local init = function()
    if hooked then
        return
    end

    if frame == nil then
        C_AddOns.LoadAddOn("Blizzard_WeeklyRewards")
        frame = WeeklyRewardsFrame
    end

    frame:HookScript(
        "OnShow",
        function()
            C_Timer.After(0, function()
                -- Disable the overlay that reminds the player to go to
                -- their vault.

                if frame.Overlay then
                    frame.Overlay:Hide()
                end

                -- Pass mouse events through the blackout.

                if frame.Blackout then
                    frame.Blackout:EnableMouse(false)
                end
            end)
        end)

    hooked = true
end

SlashCmdList['GREATVAULTSLASHCOMMAND'] = function()
    init()

    if frame:IsVisible() then
        frame:Hide()
    else
        frame:Show()
    end
end
