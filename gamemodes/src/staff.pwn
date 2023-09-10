cmd:dsprice(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[playerid][pHelper] < 1 && !PlayerInfo[playerid][pPremiumAccount]) 
		return true;

	if(sscanf(params, "s[180]", params)) 
		return SendClientMessage(playerid, COLOR_GREY, "USAGE: {FFFFFF}/dsprice <name/model>");

	new car, bool:x;
	if(!IsNumeric(params)) {
		for(new v = 0; v < 212; v++) {
			if(strfind(aVehicleNames[v], params, true) != -1) car = v+400;
		}
	} else car = strval(params);

	for(new i = 0; i < 59; i++) {
		if(DSModels[i][dModel] != car) continue;
		x = true;
		SCMf(playerid, -1, "Dealership Price - %s: {B9FF80}$%s, %d on stock, %d max. speed.", aVehicleNames[DSModels[i][dModel]-400], FormatNumber(DSModels[i][dPrice]), DSModels[i][dStock], GetVehicleMaxSpeed(DSModels[i][dModel]));
		break;
	}
	if(!x) return SendClientMessage(playerid, COLOR_GREY, "* Nu au fost gasite rezultate!");	
	return true;
}