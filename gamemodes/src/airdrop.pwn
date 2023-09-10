#include <YSI_Coding\y_hooks>

static const Float:airDropPos[][] = 
{{1821.2141,614.7939,10.8203}, 
{766.0845,-1252.3445,13.5607},
{908.7318,2433.6978,10.7515},
{567.7434,-1856.4894,4.6989},
{962.8083,-1878.9890,8.3993},
{20.2699,743.6553,24.9549},
{1548.3301,-2346.5774,13.5469},
{2820.3743,2396.8979,10.8203}
};

static const airHP[3] = {7000, 10500, 14000};

static const airColor[3] = {0x01b708FF, 0x04A3E2FF, 0xec9302FF};

new 
	airDropObject=INVALID_OBJECT_ID, airDropObject_flare=INVALID_OBJECT_ID, air_Type, airHealth, airID, Text3D:airDropLabel=Text3D:INVALID_3DTEXT_ID, give_arrow[MAX_PLAYERS], GiftTime = 1800,
	Iterator:air_Players<MAX_PLAYERS>, air_Top[3] = {INVALID_PLAYER_ID, ...}, bool:collectGift[MAX_PLAYERS], air_time=-1,
	p_AirDropObject[MAX_PLAYERS] = {INVALID_OBJECT_ID, ...}, Text3D:p_AirDropLabel[MAX_PLAYERS] = {Text3D:INVALID_3DTEXT_ID, ...}, giftHits[MAX_PLAYERS],
	gift_collect, Text3D:gift_collect_text, Iterator:drop_prize<MAX_PLAYERS>
;

stock createAirDrop() {
	if(airDropObject!=INVALID_OBJECT_ID) DestroyDynamicObject(airDropObject);
	if(airDropLabel!=Text3D:INVALID_3DTEXT_ID) DestroyDynamic3DTextLabel(airDropLabel);
	airID = random(696969)%(sizeof(airDropPos)); air_Type = random(696969)%3;
	airHealth = airHP[air_Type];
	GiftTime=0;
	SetProgressBarMaxValue(giftbar, airHP[air_Type]);
	TextDrawSetString(GiftTD[1], "~y~dropped");
	airDropObject = CreateDynamicObject(18849, airDropPos[airID][0], airDropPos[airID][1], airDropPos[airID][2] + 200.0, 0.0, 0.0, 0.0, -1, -1, -1, 300.00);
	MoveDynamicObject(airDropObject, airDropPos[airID][0], airDropPos[airID][1], airDropPos[airID][2], 10);
	format(gString, 180, "{01df76}(Gift Info) {FFFFFF}Un cadou de nivel %d (%dHP) a cazut dintr-un avion, acesta este in curs de aterizare...", air_Type+1, airHP[air_Type]);
	SendClientMessageToAll(COLOR_WHITE, gString);
}

public OnDynamicObjectMoved(objectid) {
	if(objectid!=airDropObject) return true;
	new x = airID;
	DestroyDynamicObject(airDropObject);
	Iter_Clear(air_Players);
	air_Top[0] = INVALID_PLAYER_ID;
	air_Top[1] = INVALID_PLAYER_ID;
	air_Top[2] = INVALID_PLAYER_ID;
	airDropObject = CreateDynamicObject(GetDropObject(air_Type+1), airDropPos[x][0], airDropPos[x][1], airDropPos[x][2], 0.0, 0.0, 0.0, -1, -1, -1, 300.00);
	airDropObject_flare = CreateDynamicObject(18728, airDropPos[x][0], airDropPos[x][1], airDropPos[x][2]-1.5, 0.0, 0.0, 0.0, -1, -1, -1, 300.00);
	gString[0] = EOS;
	format(gString, 128, "{01df76}(Gift Info) {FFFFFF}Cadoul a aterizat in zona %s, se asteapta jucatori pentru a fi desfacut cat mai repede.", Get3DZone(airDropPos[x][0], airDropPos[x][1], airDropPos[x][2]));
	SendClientMessageToAll(COLOR_WHITE, gString);
	format(gString, 75, "{%s}Giftbox level %d\n{FFFFFF}Health: %d/%d", GetDropColor(air_Type+1), air_Type+1, airHealth, airHP[air_Type]);
	airDropLabel = CreateDynamic3DTextLabel(gString, -1, airDropPos[x][0], airDropPos[x][1], airDropPos[x][2]+1.0, 25.0);
	//CreateDynamicMapIcon(Float:x, Float:y, Float:z, 19, color, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_MAP_ICON_SD, style = MAPICON_LOCAL, STREAMER_TAG_AREA areaid = STREAMER_TAG_AREA -1, priority = 0)
	foreach(new i : Player) {
		give_arrow[i] = 0, collectGift[i] = false;
		if(p_AirDropLabel[i]!=Text3D:INVALID_3DTEXT_ID) DestroyDynamic3DTextLabel(p_AirDropLabel[i]), p_AirDropLabel[i]=Text3D:INVALID_3DTEXT_ID;
		if(p_AirDropObject[i]!=INVALID_OBJECT_ID) DestroyPlayerObject(i, p_AirDropObject[i]), p_AirDropObject[i]=INVALID_OBJECT_ID;
		SetPlayerMapIcon(i, 12, airDropPos[x][0], airDropPos[x][1], airDropPos[x][2], 19, 0, MAPICON_GLOBAL);
	}
	return true;
}

cmd:debugdrop(playerid, params[]) {
	if(!IsAdmin(playerid, 6))
		return true;
	createAirDrop();
	return true;
}

cmd:gotodrop(playerid, params[]) {
	if(!IsAdmin(playerid, 6))
		return true;

	SetPlayerPos(playerid, airDropPos[airID][0], airDropPos[airID][1]+5, airDropPos[airID][2]);
	return true;
}

attack_gift(playerid, weaponid, objectid) {
	if(objectid!=airDropObject) return false;
	new demage = 0;
	switch(weaponid) {
		case 24: demage = 8; 
		case 31: demage = 3;
		case 30: demage = 4;
		case 29: demage = 2;
		case 38: demage = 24;
		default: return true;
	}
	if(!Iter_Contains(air_Players, playerid)) {
		Iter_Add(air_Players, playerid);
		TextDrawShowForPlayer(playerid, _giftboxTD);
	}
	if(airHealth<=0) {
		if(air_time!=-1) KillTimer(air_time), air_time=-1;
		DestroyDynamicObject(airDropObject);
		DestroyDynamic3DTextLabel(airDropLabel);
		airDropObject=INVALID_OBJECT_ID;
		airDropLabel=Text3D:INVALID_3DTEXT_ID;
		new amount=1,szString[500],players; gString[0] = (EOS);
		foreach(new i : air_Players) if(give_arrow[i]) {
			TextDrawHideForPlayer(i, _giftboxTD);
			HideProgressBarForPlayer(i, giftbar);
			collectGift[i] = true;
			players++;
			SendClientMessage(i, COLOR_YELLOW, "Felicitari! Foloseste comanda (/collectgift) pentru a lua premium pentru activitatea depusa.");
			SCMf(i, COLOR_YELLOW, "Statistici: %d lovituri si %d DMG dat.", give_arrow[i], giftHits[i]);
			Iter_Add(drop_prize, i);
			PlayerTextDrawHide(i, drop_dmg);
		}
		for(new i=0;i<3;i++) {
			foreach(new p : air_Players) if(give_arrow[p] > amount) amount = give_arrow[p], air_Top[i] = p;
			Iter_Remove(air_Players, air_Top[i]);
			amount=0;
		}
		gift_collect = CreateObject(1580, airDropPos[airID][0], airDropPos[airID][1], airDropPos[airID][2], 0.0, 0.0, 0.0, 300.0);
		//gift_collect = CreateDynamicObject(1580, airDropPos[airID][0], airDropPos[airID][1], airDropPos[airID][2], 0.0, 0.0, 0.0, 0, 0, 0, 0.0, 0.0);
		DestroyDynamicObject(airDropObject_flare);
		airDropObject_flare=INVALID_OBJECT_ID;
		format(gString, MAX_PLAYER_NAME+60, "{d20706}Collect Gift\n{FFFFFF}Use ({d20706}/collectgift{FFFFFF}) to collect");
		gift_collect_text = CreateDynamic3DTextLabel(gString, -1, airDropPos[airID][0], airDropPos[airID][1], airDropPos[airID][2]+0.5, 300.0);		
		format(szString, 128, "{01df76}(Gift Info) {FFFFFF}Cadoul a fost desfacut de %d jucatori:", players);
		for(new i=0;i<3;i++) if(air_Top[i]!=INVALID_PLAYER_ID) format(gString, MAX_PLAYER_NAME+5, " %s,", GetName(air_Top[i])), strcat(szString, gString);
		foreach(new i : air_Players) format(gString, MAX_PLAYER_NAME+5, " %s,", GetName(i)), strcat(szString, gString);
		sendSplittedMessage(COLOR_WHITE, szString);
		GiftTime = 1800;
		SendClientMessageToAll(COLOR_WHITE, "{01df76}(Gift Info) {FFFFFF}Felicitari tutror jucatoriilor ce au participat!");
		return true;
	}
	airHealth -= demage;
	giftHits[playerid] += demage;
	give_arrow[playerid] ++;
	format(gString, 160, "~g~+1~w~~h~ hit with ~r~%d dmg~w~~h~~n~(%d hits, %d dmg)", demage, give_arrow[playerid], giftHits[playerid]);
	PlayerTextDrawSetString(playerid, drop_dmg, gString);
	PlayerTextDrawShow(playerid, drop_dmg);
	SetProgressBarValue(giftbar, airHealth);
	ShowProgressBarForPlayer(playerid, giftbar);
	SetProgressBarColor(giftbar, airColor[air_Type]);
	format(gString, 80, "Giftbox Level %d~n~%d/%d", air_Type+1, airHealth, airHP[air_Type]);
	TextDrawSetString(_giftboxTD, gString);
	format(gString, 75, "{%s}Giftbox level %d\n{FFFFFF}Health: %d/%d", GetDropColor(air_Type+1), air_Type+1, airHealth, airHP[air_Type]);
	UpdateDynamic3DTextLabelText(airDropLabel, -1, gString);
	return true;
}

cmd:collectgift(playerid, params[]) {
	if(!collectGift[playerid]||!PlayerToPoint(2.5, playerid, airDropPos[airID][0],airDropPos[airID][1],airDropPos[airID][2]))
		return true;

	new szString[500] = {"#\tGift Owner\tPrize\n"}, count=0; gString[0] = EOS;
	for(new i=0;i<3;i++) if(air_Top[i]!=INVALID_PLAYER_ID&&IsPlayerConnected(air_Top[i])) {
		Selected[playerid][count][0] = air_Top[i];
		count++;
		format(gString, MAX_PLAYER_NAME+40, "%d.\t%s\t$%s, %s\n", count, GetName(air_Top[i]), FormatNumber(give_arrow[air_Top[i]] * 15000), !i?("1-20PP."):i!=2?("100-300BP."):("1-5RP."));
		strcat(szString, gString);
	}
	foreach(new i: air_Players) {
		Selected[playerid][count][0] = i;
		count++;
		format(gString, MAX_PLAYER_NAME+40, "%d.\t%s\t$%s.\n", count, GetName(i), FormatNumber(give_arrow[i] * 15000));
		strcat(szString, gString);		
	}
	ShowPlayerDialogEx(playerid, DIALOG_CGIFT, DIALOG_STYLE_TABLIST_HEADERS, "Collect Gift", szString, "Collect", "Cancel");
	return true;
}

task gift_protect[600]() {
	foreach(new i : logged_players) {
		if(IsPlayerInAnyVehicle(i)&&GiftTime==0&&PlayerToPoint(30.0, i, airDropPos[airID][0],airDropPos[airID][1],airDropPos[airID][2])) {
			SlapPlayer(i);
			SendClientMessage(i, COLOR_YELLOW, "Ai fost dat afara din vehicul deoarece esti in apropierea drop-lui.");
		}
	}
	return 1;
} 

hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart) {
	new Float: HP;
	GetPlayerHealthEx(damagedid, HP);
	if(GiftTime==0&&PlayerToPoint(60.0, playerid, airDropPos[airID][0],airDropPos[airID][1],airDropPos[airID][2])) {
		SetPlayerHealth(playerid, HP);
		GameTextForPlayer(playerid, "~R~DON'T ABUSE!", 3000,3);
	}
	return true;
}

stock GetDropObject(drop_level) {
	new drop_obj;
	switch(drop_level) {
		case 1: { drop_obj = 19054; }
		case 2: { drop_obj = 19055; }
		case 3: { drop_obj = 19056; }
	}
	return drop_obj;
}

stock GetDropColor(drop_level) {
	new string[45];
	switch(drop_level) {
		case 1: { string = "01b708"; }
		case 2: { string = "04A3E2"; }
		case 3: { string = "ec9302"; }
	}
	return string;
}