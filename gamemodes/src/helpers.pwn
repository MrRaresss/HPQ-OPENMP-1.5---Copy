stock IsHelper(playerid, level) return PlayerInfo[playerid][pHelper] >= level?true:false;

cmd:hh(playerid, params[]) {
	if(PlayerInfo[playerid][pHelper] == 0) return true;
	if(PlayerInfo[playerid][pHelper] >= 1) {
		SendClientMessage(playerid, 0x67aab1FF, "Helper Commands:");
		SendClientMessage(playerid, -1, "[/e] - Chat-ul helperilor. ");
		SendClientMessage(playerid, -1, "[/hduty] - Te pui/iesi din helper duty.");
		SendClientMessage(playerid, -1, "[/pm <id> <mesaj>] - Mesaj privat.");
		SendClientMessage(playerid, -1, "[/re <id> <mesaj>] - Dai mesaj respectivului (vad si helperii/adminii mesajul)");
		SendClientMessage(playerid, -1, "[/checkhelp] - Verifici intrebarea pe care o ai.");
		SendClientMessage(playerid, -1, "[/helps] - Vezi toate intrebarile puse de toti jucatorii.");
		SendClientMessage(playerid, -1, "[/nre <raspuns>] - Raspunzi la intrebare (toti jucatorii vad intrebarea & raspunsul)");
		SendClientMessage(playerid, -1, "[/nskip] - Sari peste o intrebare.");
		SendClientMessage(playerid, -1, "/nd <motiv>] - Stergi o intrebare.");
		SendClientMessage(playerid, -1, "[/da <motiv>] - Stergi un anunt.");
		SendClientMessage(playerid, -1, "[/slap <id>] - Dai slap respectivului.");
		SendClientMessage(playerid, -1, "[/spec | /specoff <id>] - Te pui/iesi spec(tasta 'LALT' prescurtare iesi din spec).");
	}
	if(PlayerInfo[playerid][pHelper] >= 2) {
		SendClientMessage(playerid, -1, "[+2] [/freeze <id>] - blochezi un player.");
		SendClientMessage(playerid, -1, "[+2] [/unfreeze <id>] - deblochezi un player.");
		SendClientMessage(playerid, -1, "[+2] [/kick <id>] - dai kick unui player.");
	}
	return true;
}