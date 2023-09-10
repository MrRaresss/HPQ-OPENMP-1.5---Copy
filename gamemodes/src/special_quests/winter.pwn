#include <easyDialog>

#define QUEST_WINTER

new 
	total_quests[MAX_PLAYERS], temp_progress[MAX_PLAYERS], bool:quest_started[MAX_PLAYERS]
;

stock init_player_quest(playerid) {
	cache_get_value_name_int(0, "QuestProgress", total_quests[playerid]);
	SCMf(playerid, COLOR_WHITE, "{ff7e38}>> Winter Quest <<{FFFFFF} %d/20 objects.", total_quests[playerid]);
	temp_progress[playerid] = 0;
	return true;
}

cmd:startquest(playerid) {
	if(total_quests[playerid] >= 3)
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Ai terminat quest-ul special pe ziua de azi!");

	if(quest_started[playerid])
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Ai inceput deja acest quest!");

	if(!PlayerToPoint(3.0, playerid, 2718.9644,-2517.8184,17.3672))
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Nu esti la locul de unde poti incepe quest-ul special, du-te la checkpoint!"),
			   SetPlayerCheckpoint(playerid, 2718.9644,-2517.8184,17.3672, 1.0), CP[playerid] = 53, 1;

	quest_started[playerid] = true;
	switch(total_quests[playerid]) {
		case 0: SendClientMessage(playerid, -1, "Du-te la lumberjack si fa rost de lemne!");
		case 1: SendClientMessage(playerid, -1, "Du-te la job-ul curier si colecteza toate cadourile!");
		case 2: SendClientMessage(playerid, -1, "Du-te la job-ul forklift si incarca toate materialele in cadouri.");
	}
	return true;
}

cmd:questinfo(playerid) {
	SCMf(playerid, -1, "{ff7e38}Winter Quest (%d/3)", total_quests[playerid]);
	SendClientMessage(playerid, -1, "Mos Craciun s-a inbolnavit si nu a reusit sa faca cadourile pentru copii.");
	switch(total_quests[playerid]) {
		case 0: SendClientMessage(playerid, -1, "Prima datorie este sa te duci la lumberjack sa faci rost de lemne!");
		case 1: SendClientMessage(playerid, -1, "Trebuie sa te duci la curier sa colectez cadoruile pentru copii.");
		case 2: SendClientMessage(playerid, -1, "Trebuie sa te duci la forklift pentru a incarca materialele in cadouri.");
	}
	SendClientMessage(playerid, -1, "Pentru a incepe quest-ul trebuie sa folosesti comanda (/startquest) la locatia corespunzatoare.");
	SendClientMessage(playerid, -1, "Acest se reseteaza zilnic la 7 dimineata daca l-ai terminat. Daca nu l-ai terminat, progresul ramane salvat si a 2-a zi.");
	SendClientMessage(playerid, COLOR_LGREEN, "Premiu: $2,000,000 - $12,000,000, intre 150 si 250 giftpoints, intre 1-5 pp, 100-400 dark points, 1 si 4 rp");
	return true;
}

#include <YSI_Coding\y_hooks>
hook OnGameModeInit() {
	new act = CreateDynamicActor(57, 2718.9644,-2517.8184,17.3672,358.7935);
	ApplyDynamicActorAnimation(act, "GANGS","leanIDLE",4.0,0,1,1,1,0);
	CreateDynamic3DTextLabel("{3ED7DA}Winter Quest\n{FFFFFF}Use {3ED7DA}/startquest {FFFFFF}to start the special quest.", -1, 2718.9644,-2517.8184,17.3672, 15.0);
	return true;
}

hook OnPlayerSpawn(playerid) {
	if(quest_started[playerid]) callcmd::stopquest(playerid);
	return true;
}

cmd:stopquest(playerid) {
	if(!quest_started[playerid])
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Nu ai inceput questul special!");

	quest_started[playerid] = false;
	SCMf(playerid, COLOR_YELLOW, "Quest oprit! progres: %d/3", total_quests[playerid]);
	return true;
}

hook OnPlayerDisconnect(playerid) {
	if(quest_started[playerid]) callcmd::stopquest(playerid);
	return true;
}

stock resetSpecialQuest() {
	mysql_tquery(SQL, "UPDATE `users` SET `total_quests` = '0' WHERE `total_quests` = '3'");
	foreach(new p: Player) {
		if(total_quests[p]<3) continue;
		total_quests[p] = 0;
	}
	return true;
}