function givePlayerSkin(thePlayer, skinID)
    if (thePlayer) and (skinID) then
        if not tonumber(skinID) then
            return false
        end
        skinID = tonumber(skinID)
        return exports.global:giveItem(thePlayer, 16, skinID)
    end
end

addCommandHandler(Command, function(thePlayer, cmd, targetPlayer, skin)
    if tonumber(getElementData(thePlayer, "admin_level")) >= AdminLevelCanGive then
        if not targetPlayer or not tonumber(skin) then return
            return outputChatBox("SYNTAX : /"..cmd.." [Player Partial Nick / ID] [Skin ID]", thePlayer, 255, 194, 14)
        end
        targetPlayer, targetPlayerNick = exports.global:findPlayerByPartialNick(thePlayer, targetPlayer)
        skin = tonumber(skin)
        if targetPlayer then
            if tonumber(getElementData(targetPlayer, "loggedin") or 0) == 1 then
                if skin[getValidPedModels()] then
                    if givePlayerSkin(targetPlayer, skin) then
                        outputChatBox("You given skin id #"..skin.." to player "..targetPlayerNick, thePlayer, 0, 255, 0)
                        outputChatBox(exports.global:getPlayerAdminTitle(thePlayer).." "..getPlayerName(thePlayer):gsub("_", " ").." gived you skin id #"..skin, targetPlayer, 0, 255, 0)
                    else
                        outputChatBox("Error on script! contact the scripter", thePlayer, 255, 0, 0)
                    end
                end
            end
        end
    end
end)