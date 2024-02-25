commands:Register("spec", function(playerid, args, argsCount, silent)
    local player = GetPlayer(playerid)
    if not player then return end
    local playername = player:GetName()
    
    local movingplayerid = GetPlayerId(args[1])
    if movingplayerid == -1 then return player:SendMsg(MessageType.Chat, FetchTranslation("movecommands.PlayerNotFound")) end

    local movingplayer = GetPlayer(movingplayerid)
    local movingplayername = movingplayer:GetName()
    if not movingplayer then return end

    local isAdmin = exports["swiftly_admins"]:CallExport("HasFlags", playerid, "b")
    if isAdmin == 0 then
        player:SendMsg(MessageType.Chat, FetchTranslation("movecommands.NoAcces"))
    end
    if isAdmin == 1 then
        local team = movingplayer:team():Get()
        if team == TEAM_SPECTATOR then return player:SendMsg(MessageType.Chat, string.format(FetchTranslation("movecommands.PlayerAlreadySPEC"), movingplayername)) end
        movingplayer:team():Set(TEAM_SPECTATOR)
        playermanager:SendMsg(MessageType.Chat, string.format(FetchTranslation("movecommands.MovedSPEC"), movingplayername, playername))
    end
end)

commands:Register("ct", function(playerid, args, argsCount, silent)
    local player = GetPlayer(playerid)
    if not player then return end
    local playername = player:GetName()
    
    local movingplayerid = GetPlayerId(args[1])
    if movingplayerid == -1 then return player:SendMsg(MessageType.Chat, FetchTranslation("movecommands.PlayerNotFound")) end

    local movingplayer = GetPlayer(movingplayerid)
    local movingplayername = movingplayer:GetName()
    if not movingplayer then return end

    local isAdmin = exports["swiftly_admins"]:CallExport("HasFlags", playerid, "b")
    if isAdmin == 0 then
        player:SendMsg(MessageType.Chat, FetchTranslation("movecommands.NoAcces"))
    end
    if isAdmin == 1 then
        local team = movingplayer:team():Get()
        if team == TEAM_CT then return player:SendMsg(MessageType.Chat, string.format(FetchTranslation("movecommands.PlayerAlreadyCT"), movingplayername)) end
        movingplayer:team():Set(TEAM_CT)
        playermanager:SendMsg(MessageType.Chat, string.format(FetchTranslation("movecommands.MovedCT"), movingplayername, playername))
    end
end)

commands:Register("t", function(playerid, args, argsCount, silent)
    local player = GetPlayer(playerid)
    if not player then return end
    local playername = player:GetName()
    
    local movingplayerid = GetPlayerId(args[1])
    if movingplayerid == -1 then return player:SendMsg(MessageType.Chat, FetchTranslation("movecommands.PlayerNotFound")) end

    local movingplayer = GetPlayer(movingplayerid)
    local movingplayername = movingplayer:GetName()
    if not movingplayer then return end

    local isAdmin = exports["swiftly_admins"]:CallExport("HasFlags", playerid, "b")
    if isAdmin == 0 then
        player:SendMsg(MessageType.Chat, FetchTranslation("movecommands.NoAcces"))
    end
    if isAdmin == 1 then
        local team = movingplayer:team():Get()
        if team == TEAM_T then return player:SendMsg(MessageType.Chat, string.format(FetchTranslation("movecommands.PlayerAlreadyT"), movingplayername)) end
        movingplayer:team():Set(TEAM_T)
        playermanager:SendMsg(MessageType.Chat, string.format(FetchTranslation("movecommands.MovedT"), movingplayername, playername))
    end
end)

commands:Register("joint", function(playerid, args, argsCount, silent)
    local player = GetPlayer(playerid)
    if not player then return end

    local playername = player:GetName()
    local team = player:team():Get()
    
    if team == TEAM_T then return player:SendMsg(MessageType.Chat, FetchTranslation("movecommands.YouAlreadyT")) end
    playermanager:SendMsg(MessageType.Chat, string.format(FetchTranslation("movecommands.YouMovedT"), playername))
    player:team():Set(TEAM_T)
end)

commands:Register("joinct", function(playerid, args, argsCount, silent)
    local player = GetPlayer(playerid)
    if not player then return end

    local playername = player:GetName()
    local team = player:team():Get()
    
    if team == TEAM_CT then return player:SendMsg(MessageType.Chat, FetchTranslation("movecommands.YouAlreadyCT")) end
    playermanager:SendMsg(MessageType.Chat, string.format(FetchTranslation("movecommands.YouMovedCT"), playername))
    player:team():Set(TEAM_CT)
end)

commands:Register("afk", function(playerid, args, argsCount, silent)
    local player = GetPlayer(playerid)
    if not player then return end

    local playername = player:GetName()
    local team = player:team():Get()
    
    if team == TEAM_SPECTATOR then return player:SendMsg(MessageType.Chat, FetchTranslation("movecommands.YouAlreadyAFK")) end
    playermanager:SendMsg(MessageType.Chat, string.format(FetchTranslation("movecommands.YouMovedAFK"), playername))
    player:team():Set(TEAM_SPECTATOR)
end)

function GetPluginAuthor()
    return "Swiftly Solution"
end
function GetPluginVersion()
    return "v1.0.0"
end
function GetPluginName()
    return "Swiftly Move Commands"
end
function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_movecommands"
end