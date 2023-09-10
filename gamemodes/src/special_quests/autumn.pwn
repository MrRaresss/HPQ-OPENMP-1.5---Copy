#include <easyDialog>

#define QUEST_AUTUMN	(1)

new 
	quest_num1[MAX_PLAYERS], quest_num2[MAX_PLAYERS], total_quests[MAX_PLAYERS], 
	next_obiect[MAX_PLAYERS], quest_object[MAX_PLAYERS], 
	Text3D:quest_label[MAX_PLAYERS], bool:quest_started[MAX_PLAYERS], quest_vehicle[MAX_PLAYERS]
;

static const Float:quest_pos[][] = {
	{1774.3724,-1159.1256,23.8281},
	{2236.7361,1286.7241,25.6712},
	{1051.8251,2909.5303,47.8231},
	{1660.0811,1052.0798,10.8203},
	{2759.8262,415.0934,7.9197},
	{1604.1747,-1927.0035,26.8519},
	{1207.9817,-800.2192,81.8494},
	{2330.1282,2263.7510,10.8203},
	{598.0341,-617.5733,18.2430},
	{1749.8014,637.7985,10.8203},
	{626.0535,-1823.9709,6.0625},
	{2760.5640,-2575.2712,3.0000},
	{1184.2411,-758.1301,79.0405},
	{783.9380,-900.6025,46.8859},
	{1660.8900,-481.3177,47.2946},
	{1621.6090,22.2517,24.4234},
	{2815.0671,1290.3687,10.7500},
	{1839.8654,935.2743,10.8130},
	{1676.6791,1448.8125,10.783}
};

stock init_player_quest(playerid) {
	SCMf(playerid, COLOR_WHITE, "{ff7e38}>> Autumn Quest <<{FFFFFF} %d/20 objects.", total_quests[playerid]);
	return true;
}

cmd:startquest(playerid) {
	if(total_quests[playerid] >= 20)
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Ai terminat quest-ul special pe ziua de azi!");

	if(quest_started[playerid])
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Ai inceput deja acest quest!");

	if(!PlayerToPoint(3.0, playerid, 1370.7869,-1365.4082,13.5469))
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Nu esti la locul de unde poti incepe quest-ul special, du-te la checkpoint!"),
			   SetPlayerCheckpoint(playerid, 1370.7869,-1365.4082,13.5469, 1.0), CP[playerid] = 53, 1;

	quest_started[playerid] = true;

	quest_vehicle[playerid] = CreateVehicleEx(510,1359.6589,-1360.5061,12.9809,0.9958,-1,-1);
	PutPlayerInVehicleEx(playerid, quest_vehicle[playerid], 0);
	GiveVehicleKey(playerid, quest_vehicle[playerid]);

	new i = next_obiect[playerid] = random(sizeof(quest_pos));
	SetPlayerMapIcon(playerid, 80, quest_pos[i][0], quest_pos[i][1], quest_pos[i][2], 56, -1, MAPICON_GLOBAL);
	quest_object[playerid] = CreateDynamicObject(2059, quest_pos[i][0], quest_pos[i][1], quest_pos[i][2], 0.0, 0.0, 0.0, -1, -1, playerid);
	quest_label[playerid] = CreateDynamic3DTextLabel("Quest Object\nPress '{ff7e38}Y{FFFFFF}' to take the object.", -1, quest_pos[i][0], quest_pos[i][1], quest_pos[i][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, playerid);
	SCMf(playerid, COLOR_YELLOW, "* Urmatorul obiect se afla la %.02fm de tine, progres: %d/20.", GetPlayerDistanceFromPoint(playerid, quest_pos[i][0], quest_pos[i][1], quest_pos[i][2]), total_quests[playerid]);
	return true;
}

cmd:questinfo(playerid) {
	SCMf(playerid, -1, "{ff7e38}Autumn Quest (%d/20)", total_quests[playerid]);
	SendClientMessage(playerid, -1, "Datoria ta la acest quest este de colecta cele 20 de rechizite.");
	SendClientMessage(playerid, -1, "Pentru a incepe quest-ul trebuie sa folosesti comanda (/startquest) la locatia corespunzatoare.");
	SendClientMessage(playerid, -1, "Acest se reseteaza zilnic la 7 dimineata daca l-ai terminat. Daca nu l-ai terminat, progresul ramane salvat si a 2-a zi.");
	SendClientMessage(playerid, -1, "Pe langa premiul final, pe fiecare rechizita colectata se primeste random intre $50,000 si $100,000.");
	SendClientMessage(playerid, -1, "La acest quest a fost adaugata si posibilitatea de a raspunde la niste calcule matematice iar daca raspunsul este corect premiul este mai mare.");
	SendClientMessage(playerid, COLOR_LGREEN, "Premiu: $5,000,000 - $10,000,000, intre 100 si 300 giftpoints, intre 1-4 pp, 100-400 bpoints, 1 si 4 rp, sansa 30 la suta sa iei");
	SendClientMessage(playerid, COLOR_LGREEN, "...  hidden color.");
	return true;
}

stock checkObjectInRange(playerid) {
	if(!quest_started[playerid]) return true;
	if(PlayerToPoint(3.0,playerid, quest_pos[next_obiect[playerid]][0], quest_pos[next_obiect[playerid]][1], quest_pos[next_obiect[playerid]][2])) {
		format(gString, sizeof gString, "{FFFFFF}Cat face {ff7e38}%d * %d{FFFFFF}?\nDaca raspunzi corect vei primi mai multi bani.", (quest_num1[playerid]=RandomEx(1,10)), (quest_num2[playerid]=RandomEx(1,10)));
		Dialog_Show(playerid, check_quest, DIALOG_STYLE_INPUT, "Autumn Quest", gString, "Select", "Cancel");
		DestroyDynamicObject(quest_object[playerid]);
		DestroyDynamic3DTextLabel(quest_label[playerid]);
		RemovePlayerMapIcon(playerid, 80);
	}
	return true;
}

Dialog:check_quest(playerid, response, listitem, inputtext[]) {
	if(quest_num1[playerid]*quest_num2[playerid] == strval(inputtext)) {
		givePetPoint(playerid, 20);
		new money = RandomEx(100000, 200000);
		SCMf(playerid, COLOR_MONEY, "(+) Correct! You received $%s for the requisition found.", FormatNumber(money));
		GivePlayerCash(playerid, money);
	} else {
		givePetPoint(playerid, 20);
		new money = RandomEx(50000, 100000);
		SCMf(playerid, COLOR_MONEY, "(-) Incorrect! You received $%s for the requisition found.", FormatNumber(money));
		GivePlayerCash(playerid, money);
	}
	quest_num1[playerid] = -1;
	if(++total_quests[playerid] >= 20) {
		format(gString, sizeof gString, "(( {ff7e38}Autumn Quest: {FFFFFF}%s a terminat quest-ul special de toamna si a primit un premiu special. ))", GetName(playerid));
		SendClientMessageToAll(-1, gString);
		DestroyVehicleEx(quest_vehicle[playerid], "Special quest");
		SendClientMessage(playerid, -1, "{ff7e38}Quest completed!");
		new money = RandomEx(5000000, 10000000), gift = RandomEx(100, 300), pp = RandomEx(1, 4), bp = RandomEx(100, 400), exp = RandomEx(1,4);
		SCMf(playerid, COLOR_LGREEN, "> $%s, %d respect points, %d premium points, %d b-hood points, %d gift points", FormatNumber(money), exp, pp, bp, gift);
		if(random(100) < 30) SendClientMessage(playerid, COLOR_LGREEN, "+ Hidden color"), UpdateVar(playerid, "Hidden", ++PlayerInfo[playerid][pHidden]);
		GivePlayerCash(playerid, money);
		PlayerInfo[playerid][pGiftPoints] += gift;
		if(PlayerInfo[playerid][pGiftPoints]>2000) PlayerInfo[playerid][pGiftPoints]=2000;
		PlayerInfo[playerid][pPremiumPoints] += pp;
		PlayerInfo[playerid][pBPoints] += bp;
		PlayerInfo[playerid][pExp] += exp;
		mysql_format(SQL, gQuery, sizeof gQuery, "UPDATE `users` SET `GoldPoints` = '%i', `GiftPoints` = '%i', `BPoints` = '%i', `Respect` = '%i' WHERE `id` = '%i'", PlayerInfo[playerid][pPremiumPoints], PlayerInfo[playerid][pGiftPoints], PlayerInfo[playerid][pBPoints], PlayerInfo[playerid][pExp], PlayerInfo[playerid][pSQLID]);
		mysql_tquery(SQL, gQuery);
		quest_started[playerid] = false;
		return true;
	}
	new i = next_obiect[playerid] = random(sizeof(quest_pos));
	SCMf(playerid, COLOR_YELLOW, "* Urmatorul obiect se afla la %.02fm de tine, progres: %d/20.", GetPlayerDistanceFromPoint(playerid, quest_pos[i][0], quest_pos[i][1], quest_pos[i][2]), total_quests[playerid]);
	SetPlayerMapIcon(playerid, 80, quest_pos[i][0], quest_pos[i][1], quest_pos[i][2], 56, -1, MAPICON_GLOBAL);
	quest_object[playerid] = CreateDynamicObject(2059, quest_pos[i][0], quest_pos[i][1], quest_pos[i][2], 0.0, 0.0, 0.0, -1, -1, playerid);
	quest_label[playerid] = CreateDynamic3DTextLabel("Quest Object\nPress '{ff7e38}Y{FFFFFF}' to take the object.", -1, quest_pos[i][0], quest_pos[i][1], quest_pos[i][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, playerid);
	return true;
}

#include <YSI_Coding\y_hooks>

hook OnGameModeInit() {
	new act = CreateDynamicActor(57, 1370.7869,-1365.4082,13.5469,91.3257);
	ApplyDynamicActorAnimation(act, "GANGS","leanIDLE",4.0,0,1,1,1,0);
	CreateDynamic3DTextLabel("{ff7e38}Autumn Quest\n{FFFFFF}Use {ff7e38}/startquest {FFFFFF}to start the special quest.", -1, 1370.7869,-1365.4082,13.5469, 15.0);
	return true;
}

hook OnPlayerSpawn(playerid) {
	if(quest_started[playerid]) callcmd::stopquest(playerid);
	return true;
}

cmd:stopquest(playerid) {
	if(!quest_started[playerid])
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Nu ai inceput questul special!");

	DestroyDynamicObject(quest_object[playerid]);
	DestroyDynamic3DTextLabel(quest_label[playerid]);
	RemovePlayerMapIcon(playerid, 80);
	DestroyVehicleEx(quest_vehicle[playerid], "quest Car");
	quest_started[playerid] = false;
	SCMf(playerid, COLOR_YELLOW, "Quest oprit! progres: %d/20", total_quests[playerid]);
	return true;
}

hook OnPlayerDisconnect(playerid) {
	if(quest_started[playerid]) callcmd::stopquest(playerid);
	return true;
}

stock resetSpecialQuest() {
	mysql_tquery(SQL, "UPDATE `users` SET `total_quests` = '0' WHERE `total_quests` = '20'");
	foreach(new p: Player) {
		if(total_quests[p]<20) continue;
		total_quests[p] = 0;
	}
	return true;
}