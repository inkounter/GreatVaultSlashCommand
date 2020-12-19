tinsert(UISpecialFrames, 'WeeklyRewardsFrame')

SLASH_GREATVAULTSLASHCOMMAND1 = '/vault'

SlashCmdList['GREATVAULTSLASHCOMMAND'] = function()
    local frame = WeeklyRewardsFrame
    if frame == nil then
        LoadAddOn("Blizzard_WeeklyRewards")
        frame = WeeklyRewardsFrame
    end

    if frame:IsVisible() then
        frame:Hide()
    else
        frame:Show()
    end
end
