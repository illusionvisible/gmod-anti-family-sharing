illusionantifamily = {} /*
###############################################################

	Contact:
		steam: steamcommunity.com/id/illusionvisible
		discord: illusion#1111
		github: github.com/illusionvisible

###############################################################
*/

// Admin Mode Selection
// ULX == 1
// SAM == 2
// SERVERGUARD == 3
illusionantifamily.adminmode = 1

// When someone using family sharing, it prints on console.
illusionantifamily.printfamilysharing = true

// If owner is banned and trying to connect with alt account its going to ban alt account.
illusionantifamily.ban = true
illusionantifamily.banlength = 0

// If player using family sharing, cant join server.
illusionantifamily.blockfamilysharing = false

// Not effected by blcok or ban module.
illusionantifamily.whitelist = {
    -- ["76561198974698455"] = true,
}

// Its explains itself.
illusionantifamily.language = {
    kickmessage = "Please connect with account that own Garry's Mod.",
    banreason = "Own account is banned.",
    printmessage = "%s (%s) uses family sharing. (Owner Account %s)",
    bannedplayer = "%s (%s) will be banned because own account is banned. (Owner Account %s)",
}