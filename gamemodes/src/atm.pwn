// var

#define MAX_ATM 	(50)

enum ATM_INFO {
	aID,
	Float:aX,
	Float:aY,
	Float:aZ,
	Float:aR,
	Text3D:aText,
	aObject
}
new 
	cache_atm,
	atmInfo[MAX_ATM][ATM_INFO],
	bool:is_zone_atm[MAX_PLAYERS];

redist::SQL_cache_atm() {
	new i=-1;cache_atm=cache_num_rows();
	printf("[MySQL]\t\t\tatm\t\t\t%d", cache_atm);
	while(++i<cache_atm) {
		cache_get_value_name_int(i,"ID",atmInfo[i][aID]);
		cache_get_value_name_float(i,"X",atmInfo[i][aX]);
		cache_get_value_name_float(i,"Y",atmInfo[i][aY]);
		cache_get_value_name_float(i,"Z",atmInfo[i][aZ]);
		cache_get_value_name_float(i,"R",atmInfo[i][aR]);

		AreaType[CreateDynamicSphere(atmInfo[i][aX], atmInfo[i][aY], atmInfo[i][aZ], 3.0)] = AREA_ATM;

		atmInfo[i][aObject] = CreateDynamicObject(19324, atmInfo[i][aX], atmInfo[i][aY], atmInfo[i][aZ], 0.0, 0.0, atmInfo[i][aR]);
		format(gString, 128, "{4AA529}ATM #%d\n{FFFFFF}(/withdraw)", atmInfo[i][aID]);
		atmInfo[i][aText] = CreateDynamic3DTextLabel(gString, -1, atmInfo[i][aX], atmInfo[i][aY], atmInfo[i][aZ], 10.0);
	}
	return true;
}

cmd:createatm(playerid) {
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid, x, y, z);
	editObjectType[playerid] = 5;
	EditDynamicObject(playerid, CreateDynamicObject(19324, x+3, y+1, z, 0.0, 0.0, 0.0));
	return true;
}

cmd:moveatm(playerid, params[]) {
	new id;
	if(sscanf(params, "i", id))
		return true;

	if id<1||--id>cache_atm *then
		return SendClientMessage(playerid, -1, "* Invalid ATM.");

	if !atmInfo[id][aID] *then
		return SendClientMessage(playerid, -1, "* Invalid ATM.");

	EditDynamicObject(playerid, atmInfo[id][aObject]);
	editObjectType[playerid] = 6;
	EditVehicleID[playerid] = id;
	return true;
}