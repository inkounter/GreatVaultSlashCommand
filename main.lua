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
    end

    if frame:IsVisible() then
        frame:Hide()
    else
        frame:Show()
    end
end
