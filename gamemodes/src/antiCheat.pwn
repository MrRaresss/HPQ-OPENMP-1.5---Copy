
enum {
	SPEED,
	TELEPORT,
	AIRBREAK,
	TROLL_2
}


#define MAX_ANTICHEAT  			(10)
new bool: anticheats[MAX_ANTICHEAT] = {true, ...}, LastSpeed[MAX_PLAYERS];
#define antiCheat(%0)			anticheats[%0]

forward OnPlayerCheatDetect(playerid, cheatid);

new CheatName[][30] = {
	{"Fly"}, {"Speed"}, {"Teleport"}, {"Air Brake"}, {"Troll #1"}
};

stock GetPlayerSpeed(playerid) { 
    new Float:Pos[3]; 
    GetPlayerVelocity(playerid, Pos[0], Pos[1], Pos[2]); 
    return floatround(200*floatsqroot(Pos[0]*Pos[0] + Pos[1]*Pos[1] + Pos[2]*Pos[2])); 
}  

redist::HackSystem(playerid) {
	if(IsAdmin(playerid, 1)) return true;
	new vehicle = GetPlayerVehicleID(playerid), bool:x_rx; gString[0] = (EOS);
	if((!IsPlayerInAnyVehicle(playerid) && GetPlayerSpeed(playerid) > 200 && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && antiCheat(TROLL_2)) || (GetPlayerState(playerid) == PLAYER_STATE_DRIVER && (Carspeed(vehicle) > LastSpeed[playerid] + 100 && !x_rx) && AFKSeconds[playerid]<15 && antiCheat(TROLL_2))) {
		SendClientMessage(playerid, COLOR_CLIENT, "You got kicked for using cheats (troll #4).");
		SendClientMessage(playerid, COLOR_WHITE, "Stop using cheats!");
		KickEx(playerid);
		return true;
	}

	if((GetPlayerState(playerid) == PLAYER_STATE_ONFOOT || GetPlayerState(playerid) == PLAYER_STATE_DRIVER) && !Exception[playerid]) {
		if(!PlayerToPoint(IsPlayerInAnyVehicle(playerid) ? 125.0 : 50.0, playerid, LastPos[playerid][0], LastPos[playerid][1], LastPos[playerid][2]) && AFKSeconds[playerid] < 15 && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && antiCheat(TELEPORT)) {
			if(PlayerToPoint(13.0, playerid, 616.4669,-1.9651,1000.6123) || PlayerToPoint(13.0, playerid, -1936.2686,243.9019,34.1880)) return true;		
			format(gString, 128, "Anti-Cheat: %s(%d) is suspected of using teleport %s", GetName(playerid), playerid, !IsPlayerInAnyVehicle(playerid)?("onfoot"):("on vehicle"));
			SendAdminMessage(0xFFADADFF, gString, 1);

			CheatWarnings[playerid] ++;
			if(CheatWarnings[playerid] > 5) NightBot(playerid, "Cheats (Teleport-Hack)");
			return bool:true;
		}
	}
	return true;
}