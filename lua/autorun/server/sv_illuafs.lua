/*
###############################################################


	You dont need to edit this file.
	
	Contact:
		steam: steamcommunity.com/id/illusionvisible
		discord: illusion#1111
		github: github.com/illusionvisible


###############################################################
*/

local language = {}
local function L(s, ...)
	if (language[s]) then
		return language[s]
	end

	local tx = illusionantifamily.language[s] or s

	local a = {...}
	if (#a > 0) then
		return string.format(tx, ...)
	else
		language[s] = tx
		return tx
	end
end

hook.Add( "PlayerAuthed", "illusion-antifamilysharing", function( ply )
    local steamid64 = ply:SteamID64()
    local steamownerid64 = ply:OwnerSteamID64()
	local steamownerid = util.SteamIDFrom64(steamownerid64)

	-- console message
	if illusionantifamily.printfamilysharing then
		if !ply:IsBot() and steamownerid64 != steamid64 and !illusionantifamily.whitelist[steamid64] then
			MsgC(Color(255,0,0), "[illusion family sharing] ", Color(255,255,255), string.format(L"printmessage",
				ply:Nick(),
				steamid64,
				steamownerid64
			))
			print("")
		end
	end

	-- block
	if illusionantifamily.blockfamilysharing then
		if !ply:IsBot() and steamownerid64 != steamid64 and !illusionantifamily.whitelist[steamid64] then
			ply:Kick(L"kickmessage")
		end
	end

	-- ban
	if illusionantifamily.ban then
		-- ulx
		if illusionantifamily.adminmode == 1 then
			if ULib.bans[steamownerid] and !illusionantifamily.whitelist[steamid64] then
				RunConsoleCommand("ulx", "banid", ply:SteamID(), illusionantifamily.banlength, L"banreason")
				RunConsoleCommand("ulx", "banid", steamownerid, illusionantifamily.banlength, L"banreason")

				MsgC(Color(255,0,0), "[illusion family sharing] ", Color(255,255,255), string.format(L"bannedplayer",
					ply:Nick(),
					steamid64,
					steamownerid64
				))
				print("")
			end
		elseif illusionantifamily.adminmode == 2 then
			sam.player.is_banned(steamownerid, function(banned)
				if banned then
					RunConsoleCommand("sam", "banid", ply:SteamID(), illusionantifamily.banlength, L"banreason")
					RunConsoleCommand("sam", "banid", steamownerid, illusionantifamily.banlength, L"banreason")
					
					MsgC(Color(255,0,0), "[illusion family sharing] ", Color(255,255,255), string.format(L"bannedplayer",
						ply:Nick(),
						steamid64,
						steamownerid64
					))
					print("")
				end
			end)
		elseif illusionantifamily.adminmode == 3 then
			if serverguard.banTable[steamownerid] then
				serverguard:BanPlayer(nil, ply:SteamID(), illusionantifamily.banlength, L"banreason")
				serverguard:BanPlayer(nil, steamownerid, illusionantifamily.banlength, L"banreason")

				MsgC(Color(255,0,0), "[illusion family sharing] ", Color(255,255,255), string.format(L"bannedplayer",
					ply:Nick(),
					steamid64,
					steamownerid64
				))
				print("")
			end
		elseif illusionantifamily.adminmode != (1 or 2 or 3) then
			MsgC(Color(255,0,0), "[illusion family sharing] ", Color(255,255,255), ply:Nick().. " cant be verified because admin mode selection is wrong! Anti family sharing wont work!") print("")
		end
	end
end)