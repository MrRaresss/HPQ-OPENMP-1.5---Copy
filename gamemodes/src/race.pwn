#include "./src/race_position.pwn"

new 
	bool:race_collision, current_map=-1,raceVoted[MAX_PLAYERS][2] = {-1,...}, 
	race_map_votes[6], select_race_map[MAX_PLAYERS], total_players_in_race, bool:_started,
	Iterator:race_players<MAX_PLAYERS>, raceVeh[MAX_PLAYERS] = {INVALID_VEHICLE_ID,...},
	raceCP[MAX_PLAYERS], race_position_cp[36] = {0, ...}, raceTime[MAX_PLAYERS]={-1, ...},
	raceCount, map_record_name[6][MAX_PLAYER_NAME], map_record_time[6], race_bet=0, player_race_pos[MAX_PLAYERS],
	bool:place_bet[MAX_PLAYERS]
;

static const 
	race_map[][]={"LD_RCE3:race15", "LD_RCE3:race16", "LD_RCE2:race10", "LD_RCE2:race09", "LD_RCE4:race22", "LD_RCE4:race19"},
	race_map_name[][]={"SF TO LV", "Dam Rider", "Bandito County", "Dirtbike Danger", "Chopper Checkpoint", "WORLD WAR ACE"},
	race_type_name[][]={"SPORT CARS", "BIKES", "OFF-ROAD", "BIKES OFF-ROAD", "HELICOPTERS", "AIRPLANES"}
;

stock showRace(playerid) {
	if(player_selected[playerid]) return true;
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 1099.5540,1601.4554,12.5469)) {
		if(PlayerInfo[playerid][pLevel] < 3) return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Nu ai level 3!");
		if(PlayerInfo[playerid][pCarLicT] <= 0 || PlayerInfo[playerid][pFlyLicT] <= 0)
			return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Ai nevoie de licenta de driving si de fly pentru a participa.");
		
		new biz=BizzTypeID[16][0];
		if(!PlayerToPoint(3.0, playerid, BizzInfo[biz][bEntranceX], BizzInfo[biz][bEntranceY], BizzInfo[biz][bEntranceZ])) return true;
		if(current_map!=-1) return SendClientMessage(playerid, COLOR_LGREEN, "Nu se mai poate intra acum deoarece este o cursa pornita!");
		if(CP[playerid] != 0 || targetfind[playerid] != -1) return ShowPlayerDialog(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Ai deja un checkpoint activ.\nDoresti sa-l anulezi? Daca da, apasa pe 'Ok'.", "Ok", "Exit");
		SetPlayerCameraPos(playerid, 1122.621093, 1730.419677, 49.193172);
		SetPlayerCameraLookAt(playerid, 1121.597045, 1725.856689, 47.423755);
		for(new i=0;i<2;i++) TextDrawShowForPlayer(playerid, RaceTD[i]), PlayerTextDrawShow(playerid, RacePTD[i]);
		TextDrawShowForPlayer(playerid, RaceTD[2]);
		raceVoted[playerid][0] = -1;
		raceVoted[playerid][1] = (false);
		select_race_map[playerid] = raceCP[playerid] = 0;
		player_selected[playerid] = 17;
		raceTime[playerid] = -1;
		player_race_pos[playerid] = 0;
		place_bet[playerid] = false;
		SelectTextDraw(playerid, 0xFFFFFF80);
		showRaceInfo(playerid, 0);
		raceVeh[playerid] = INVALID_VEHICLE_ID;
		SendClientMessage(playerid, -1, "Useful Commands: (/votecollision), (/placebet).");
		SetPlayerPos(playerid, 1106.1451,1797.3655,10.8203);
		if !Iter_Count(race_players)&&!_started *then {
			_started=true;
		 	SetTimer(#_startRace, 60000, false);
		 	race_collision=false;
		 	race_bet=0;
		}
		Iter_Add(race_players, playerid);
		SetPlayerVirtualWorld(playerid, 69);
	}
	return true;
}

redist::_startRace() {
	_started=false;
	if(Iter_Count(race_players) < 3) {
	 	foreach(new i : race_players) {
	 		new idd=BizzTypeID[16][0];
			SetPlayerPos(i, BizzInfo[idd][bEntranceX]+random(3), BizzInfo[idd][bEntranceY]+random(3), BizzInfo[idd][bEntranceZ]);
	 		TogglePlayerControllable(i, true);
			for(new t=0;t<2;t++) TextDrawHideForPlayer(i, RaceTD[t]), PlayerTextDrawHide(i, RacePTD[t]);
			TextDrawHideForPlayer(i, RaceTD[2]);
			SetPlayerVirtualWorld(i, 0);
			SetCameraBehindPlayer(i);
			CancelSelectTextDraw(i);
			player_selected[i] = 0;
	 		SendClientMessage(i, COLOR_YELLOW, "Cursa nu a inceput deoarece sunt mai putini de 3 jucatori!");
		}
		Iter_Clear(race_players);
		return true;
	}
	
	if(race_map_votes[0] >= race_map_votes[1] && race_map_votes[0] >= race_map_votes[2] && race_map_votes[0] >= race_map_votes[3] && race_map_votes[0] >= race_map_votes[4] && race_map_votes[0] >= race_map_votes[5]) current_map = 0;
	else if(race_map_votes[1] >= race_map_votes[0] && race_map_votes[1] >= race_map_votes[2] && race_map_votes[1] >= race_map_votes[3] && race_map_votes[1] >= race_map_votes[4] && race_map_votes[1] >= race_map_votes[5]) current_map = 1;
	else if(race_map_votes[2] >= race_map_votes[0] && race_map_votes[2] >= race_map_votes[1] && race_map_votes[2] >= race_map_votes[3] && race_map_votes[2] >= race_map_votes[4] && race_map_votes[2] >= race_map_votes[5]) current_map = 2;
	else if(race_map_votes[3] >= race_map_votes[0] && race_map_votes[3] >= race_map_votes[1] && race_map_votes[3] >= race_map_votes[2] && race_map_votes[3] >= race_map_votes[4] && race_map_votes[3] >= race_map_votes[5]) current_map = 3;
	else if(race_map_votes[4] >= race_map_votes[0] && race_map_votes[4] >= race_map_votes[1] && race_map_votes[4] >= race_map_votes[2] && race_map_votes[4] >= race_map_votes[3] && race_map_votes[4] >= race_map_votes[5]) current_map = 4;
	else if(race_map_votes[5] >= race_map_votes[0] && race_map_votes[5] >= race_map_votes[1] && race_map_votes[5] >= race_map_votes[2] && race_map_votes[5] >= race_map_votes[3] && race_map_votes[5] >= race_map_votes[4]) current_map = 5;
	else current_map=0;
	new x=0,for_yes,for_no,reset_var[36]={0,...},reset[6]={0,...},model;
	switch current_map do {
		case 0: {
			static const random_veh[] = {415, 429, 477, 541, 451, 502, 411};
			model = random_veh[random(sizeof random_veh)];
		}
		case 1: {
			static const random_veh[] = {521, 522, 581, 461};
			model = random_veh[random(sizeof random_veh)];
		}
		case 2: {
			static const random_veh[] = {568, 424, 505, 495};
			model = random_veh[random(sizeof random_veh)];
		}
		case 3: {
			static const random_veh[] = {468, 586};
			model = random_veh[random(sizeof random_veh)];
		}
	}
	foreach(new i : race_players) {
		if raceVoted[i][1] *then for_yes++; else for_no++;
		TogglePlayerControllable(i, false);
		for(new t=0;t<2;t++) TextDrawHideForPlayer(i, RaceTD[t]), PlayerTextDrawHide(i, RacePTD[t]);
		TextDrawHideForPlayer(i, RaceTD[2]);
		PlayerTextDrawSetString(i, RacePTD[2], " ");
		PlayerTextDrawShow(i, RacePTD[2]);
		SetCameraBehindPlayer(i);
		CancelSelectTextDraw(i);
		player_selected[i] = 0;
		CP[i] = 724;
		switch current_map do {
			case 0: raceVeh[i] = CreateVehicleEx(model, race_pos_1[x][0], race_pos_1[x][1], race_pos_1[x][2], race_pos_1[x][3], -1, -1, -1);
			case 1: raceVeh[i] = CreateVehicleEx(model, race_pos_2[x][0], race_pos_2[x][1], race_pos_2[x][2], race_pos_2[x][3], -1, -1, -1);
			case 2: raceVeh[i] = CreateVehicleEx(model, race_pos_3[x][0], race_pos_3[x][1], race_pos_3[x][2], race_pos_3[x][3], -1, -1, -1);
			case 3: raceVeh[i] = CreateVehicleEx(model, race_pos_4[x][0], race_pos_4[x][1], race_pos_4[x][2], race_pos_4[x][3], -1, -1, -1);
			case 4: raceVeh[i] = CreateVehicleEx(488, race_pos_5[x][0], race_pos_5[x][1], race_pos_5[x][2], race_pos_5[x][3], -1, -1, -1);
			case 5: raceVeh[i] = CreateVehicleEx(512, race_pos_6[x][0], race_pos_6[x][1], race_pos_6[x][2], race_pos_6[x][3], -1, -1, -1);
		}
		SetVehicleParamsEx(raceVeh[i], VEHICLE_PARAMS_ON, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF);
		SetVehicleVirtualWorld(raceVeh[i], 69);
		vehEngine[raceVeh[i]] = true;
		PutPlayerInVehicleEx(i, raceVeh[i], 0);
		setRaceCheckpoint(i);
		raceTime[i] = 0;
		race_position_cp=reset_var;
		race_map_votes=reset;
		AFKSeconds[i] = 0;
		x++;
	}
	total_players_in_race=Iter_Count(race_players);
	race_collision=for_yes>for_no?true:false;
	format(gString, 128, "[INFO] Current Map: %s (%d votes) | Collisions: %s | Bet: $%s", race_map_name[current_map], race_map_votes[current_map], race_collision?("off"):("on"), FormatNumber(race_bet));
	sendRaceMessage(COLOR_WHITE, gString);
	raceCount=6;
	SetTimer(#startRace, 1000, false);
	return true;
}

stock setRaceCheckpoint(playerid) {
	new i=raceCP[playerid];
	switch current_map do {
		case 0: {
			switch(i) {
				case 26: SetPlayerRaceCheckpoint(playerid, true, race_cp_1[i][0], race_cp_1[i][1], race_cp_1[i][2], race_cp_1[i+1][0], race_cp_1[i+1][1], race_cp_1[i+1][2], 10.0);
				case 27: finishRace(playerid);
				default: SetPlayerRaceCheckpoint(playerid, false, race_cp_1[i][0], race_cp_1[i][1], race_cp_1[i][2], race_cp_1[i+1][0], race_cp_1[i+1][1], race_cp_1[i+1][2], 10.0);
			}
		}
		case 1: {
			switch(i) {
				case 24: SetPlayerRaceCheckpoint(playerid, true, race_cp_2[i][0], race_cp_2[i][1], race_cp_2[i][2], race_cp_2[i+1][0], race_cp_2[i+1][1], race_cp_2[i+1][2], 10.0);
				case 25: finishRace(playerid);
				default: SetPlayerRaceCheckpoint(playerid, false, race_cp_2[i][0], race_cp_2[i][1], race_cp_2[i][2], race_cp_2[i+1][0], race_cp_2[i+1][1], race_cp_2[i+1][2], 10.0);
			}
		}
		case 2: {
			switch(i) {
				case 16: SetPlayerRaceCheckpoint(playerid, true, race_cp_3[i][0], race_cp_3[i][1], race_cp_3[i][2], race_cp_3[i+1][0], race_cp_3[i+1][1], race_cp_3[i+1][2], 10.0);
				case 17: finishRace(playerid);
				default: SetPlayerRaceCheckpoint(playerid, false, race_cp_3[i][0], race_cp_3[i][1], race_cp_3[i][2], race_cp_3[i+1][0], race_cp_3[i+1][1], race_cp_3[i+1][2], 10.0);
			}
		}
		case 3: {
			switch(i) {
				case 18: SetPlayerRaceCheckpoint(playerid, true, race_cp_4[i][0], race_cp_4[i][1], race_cp_4[i][2], race_cp_4[i+1][0], race_cp_4[i+1][1], race_cp_4[i+1][2], 10.0);
				case 19: finishRace(playerid);
				default: SetPlayerRaceCheckpoint(playerid, false, race_cp_4[i][0], race_cp_4[i][1], race_cp_4[i][2], race_cp_4[i+1][0], race_cp_4[i+1][1], race_cp_4[i+1][2], 10.0);
			}
		}
		case 4: {
			switch(i) {
				case 25: SetPlayerRaceCheckpoint(playerid, 4, race_cp_5[i][0], race_cp_5[i][1], race_cp_5[i][2], race_cp_5[i+1][0], race_cp_5[i+1][1], race_cp_5[i+1][2], 10.0);
				case 26: finishRace(playerid);
				default: SetPlayerRaceCheckpoint(playerid, 3, race_cp_5[i][0], race_cp_5[i][1], race_cp_5[i][2], race_cp_5[i+1][0], race_cp_5[i+1][1], race_cp_5[i+1][2], 10.0);
			}
		}
		case 5: {
			switch(i) {
				case 25: SetPlayerRaceCheckpoint(playerid, 4, race_cp_6[i][0], race_cp_6[i][1], race_cp_6[i][2], race_cp_6[i+1][0], race_cp_6[i+1][1], race_cp_6[i+1][2], 10.0);
				case 26: finishRace(playerid);
				default: SetPlayerRaceCheckpoint(playerid, 3, race_cp_6[i][0], race_cp_6[i][1], race_cp_6[i][2], race_cp_6[i+1][0], race_cp_6[i+1][1], race_cp_6[i+1][2], 10.0);
			}
		}
	}
	raceCP[playerid]++;
	race_position_cp[i+1] ++;
	player_race_pos[playerid] = race_position_cp[i+1];
	return true;
}

finishRace(playerid) {
	finishAchievement(playerid, 4);
	format(gString, 128, "* %s finished the race on place %d in %02d:%02d.", GetName(playerid), player_race_pos[playerid], raceTime[playerid]/60, raceTime[playerid]%60);
	sendRaceMessage(COLOR_YELLOW, gString);
	if raceTime[playerid]<map_record_time[current_map]||!map_record_time[current_map] *then {
		format(gString, 128, "* New record on map %s by %s in %02d:%02d. Congratulations!", race_map_name[current_map], GetName(playerid), player_race_pos[playerid], raceTime[playerid]/60, raceTime[playerid]%60);
		sendRaceMessage(COLOR_YELLOW, gString);
		map_record_time[current_map] = raceTime[playerid];
		strmid(map_record_name[current_map], PlayerInfo[playerid][pUsername], 0, MAX_PLAYER_NAME), map_record_time[current_map]=raceTime[playerid];
		SCMf(playerid, COLOR_MONEY, "(+) Felicitari! Ai primit $%s si %d bpoints deoarece ai batut recordul acestui mape.", FormatNumber(total_players_in_race*500000), 5*total_players_in_race);
		GivePlayerCash(playerid, total_players_in_race*500000);
		givePoints(playerid, total_players_in_race*5);
	}
	if player_race_pos[playerid]==1&&race_bet *then {
		SCMf(playerid, COLOR_MONEY, "(+) Ai primit $%s deoarece ai finalizat cursa pe locul intai.", FormatNumber(race_bet));
		GivePlayerCash(playerid, race_bet);
	}
	destroy_race_vehicle(playerid);
	SetPlayerVirtualWorld(playerid, 0);
	new idd=BizzTypeID[16][0];
	SetPlayerPos(playerid, BizzInfo[idd][bEntranceX], BizzInfo[idd][bEntranceY], BizzInfo[idd][bEntranceZ]);
}

stock countCheckpoints(id) {
	switch id do {
		case 0: return sizeof race_cp_1;
		case 1: return sizeof race_cp_2;
		case 2: return sizeof race_cp_3;
		case 3: return sizeof race_cp_4;
		case 4: return sizeof race_cp_5;
		case 5: return sizeof race_cp_6;
	}
	return 0;
}

stock destroy_race_vehicle(playerid) {
	if(raceVeh[playerid]!=INVALID_VEHICLE_ID) DestroyVehicleEx(raceVeh[playerid], "Race"), raceVeh[playerid] = INVALID_VEHICLE_ID;
	Iter_Remove(race_players, playerid);
	if(!Iter_Count(race_players)) current_map=-1;
	DisablePlayerRaceCheckpoint(playerid);
	PlayerTextDrawHide(playerid, RacePTD[2]);
	SetPlayerVirtualWorld(playerid, 0);
	TogglePlayerControllable(playerid, true);
	CP[playerid] = 0;
	new idd=BizzTypeID[16][0];
	SetPlayerPos(playerid, BizzInfo[idd][bEntranceX]+random(3), BizzInfo[idd][bEntranceY]+random(3), BizzInfo[idd][bEntranceZ]);
	return true;
}

redist::startRace() {
	raceCount--;
	if raceCount *then {
		format(gString, 30, "~y~%d", raceCount);
		foreach(new i : race_players) GameTextForPlayer(i, gString, 5000, 4);
		SetTimer(#startRace, 1000, false);
		return true;
	}
	foreach(new i : race_players) {
		GameTextForPlayer(i, "~y~go! go! go!", 2000, 4);
		TogglePlayerControllable(i, true);
		if(!race_collision) DisableRemoteVehicleCollisions(i, true);
	}
	format(gString, 128, "News: The Race Arena has started with %d/20 players.", Iter_Count(race_players));
	OOCNews(COLOR_NEWS, gString);	
	return true;
}

cmd:votecollision(playerid, params[]) {
	if(player_selected[playerid]!=17) return true;
	ShowPlayerDialog(playerid, DIALOG_VOTECOLLESION, DIALOG_STYLE_MSGBOX, "Collision", "Doresti sa fie dezactivate coliziunile in aceasta cursa?", "Da", "Nu");
	return true;
}

cmd:placebet(playerid, params[]) {
	if !Iter_Contains(race_players, playerid) *then 
		return true;
	
	if place_bet[playerid] *then 
		return SendClientMessage(playerid, COLOR_LGREEN, "Ai pariat deja un bet.");

	ShowPlayerDialog(playerid, DIALOG_BETRACE, DIALOG_STYLE_INPUT, "Race bet", "Scrie putin mai jos suma pe care vrei s-o pariezi.\nOdata ce pariezi, nu mai poti face vreo modificare.\nMinim: $50,000 - Maxim: $5,000,000.", "Ok", "Exit");
	return true;
}

showRaceInfo(playerid, id) {
	PlayerTextDrawSetString(playerid, RacePTD[0], race_map[id]);
	gQuery = ("~r~record by none");
	if(map_record_time[id]) format(gQuery, 60, "~y~record by %s (%02d:%02d)", map_record_name[id], map_record_time[id]/60, map_record_time[id]%60);
	format(gString, 128, "map: %s~n~vehicles type: %s~n~checkpoints: %d~n~votes: %d~n~~n~%s", race_map_name[id], race_type_name[id], countCheckpoints(id), race_map_votes[id], gQuery);
	PlayerTextDrawSetString(playerid, RacePTD[1], gString);
}

updateRaceStatus(id) {
	gQuery = ("~r~record by none");
	if(map_record_time[id]) format(gQuery, 60, "~y~record by %s (%02d:%02d)", map_record_name[id], map_record_time[id]/60, map_record_time[id]%60);
	format(gString, 128, "map: %s~n~vehicles type: %s~n~checkpoints: %d~n~votes: %d~n~~n~%s", race_map_name[id], race_type_name[id], countCheckpoints(id), race_map_votes[id], gQuery);
	foreach(new i : race_players) if(select_race_map[i]==id) PlayerTextDrawSetString(i, RacePTD[1], gString);
}


stock sendRaceMessage(color, const string[], va_args<>) {
	static out[168];
	va_format(out, sizeof out, string, va_start<3>);

    foreach(new i : race_players) SendClientMessage(i, color, out);
	return true;
}