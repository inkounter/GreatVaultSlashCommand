tinsert(UISpecialFrames, 'WeeklyRewardsFrame')

SLASH_GREATVAULTSLASHCOMMAND1 = '/vault'

SlashCmdList['GREATVAULTSLASHCOMMAND'] = function()
    local frame = WeeklyRewardsFrame
    if frame == nil then
        C_AddOns.LoadAddOn("Blizzard_WeeklyRewards")
        frame = WeeklyRewardsFrame
        frame:HookScript(
            "OnShow",
            function()
                -- Disable the overlay that reminds the player to go to their
                -- vault.

                frame.Overlay.Show = function() end
                frame.Overlay:Hide()

                -- Pass mouse events through the blackout.

                frame.Blackout:EnableMouse(false)
            end)
    end

    if frame:IsVisible() then
        frame:Hide()
    else
        frame:Show()
    end
end
