///////////////////////////////////////////////////////
////////////// ** Function ** /////////////////////////
///////////////////////////////////////////////////////

new 
	Iterator:VehicleKeys[MAX_VEHICLES]<MAX_PLAYERS>, Iterator:PlayerKeys[MAX_PLAYERS]<MAX_VEHICLES>, 
	Iterator:VehOccupeid<MAX_VEHICLES,MAX_PLAYERS>
;

GiveVehicleKey(playerid, vehicleid) { Iter_Add(VehicleKeys[vehicleid], playerid); Iter_Add(PlayerKeys[playerid], vehicleid); }
RemoveVehicleKey(playerid, vehicleid) { Iter_Remove(VehicleKeys[vehicleid], playerid); Iter_Remove(PlayerKeys[playerid], vehicleid); }

redist::DestroyVehicleEx(vehid, const string:str[]) {
	if(Iter_Count(VehicleKeys[vehid])) {
		foreach(new playerid: VehicleKeys[vehid]) Iter_Remove(PlayerKeys[playerid], vehid);
		Iter_Clear(VehicleKeys[vehid]);
	}
	format(srsString, sizeof srsString, "[DESTROY CAR] %s", str);
	if vehid < 180 *then print(srsString);
	DestroyVehicle(vehid);
	vehEngine[vehid] = false;
	if(nameobject[vehid]!=INVALID_OBJECT_ID) DestroyDynamicObject(nameobject[vehid]), nameobject[vehid]=INVALID_OBJECT_ID;
	return true;
}

stock GetPlayerSpeed(playerid) { 
    new Float:Pos[3]; 
    GetPlayerVelocity(playerid, Pos[0], Pos[1], Pos[2]); 
    return floatround(200*floatsqroot(Pos[0]*Pos[0] + Pos[1]*Pos[1] + Pos[2]*Pos[2])); 
}  

#define IsVehicleOccupied(%0)			Iter_Count(VehOccupeid<%0>)

new const wSlot[47]={0,0,1,1,1,1,1,1,1,1,10,10,10,10,10,10,8,8,8,0,0,0,2,2,2,3,3,3,4,4,5,5,4,6,6,7,7,7,7,8,12,9,9,9,11,11,11};
#define GetWeaponSlot(%0) 				wSlot[%0]

stock GetVehicleSpeedUp(carid) 
	return StageSpeed[CarInfo[carid][cStage]]+(_:CarInfo[carid][cPremium]*100)+GetVehicleMaxSpeed(CarInfo[carid][cModel]);

#if defined _ALS_DestroyVehicle
    #undef DestroyVehicle
#else
    #define _ALS_DestroyVehicle
#endif
#define DestroyVehicle DestroyVehicleEx

stock CreateVehicleEx(modelid, Float:x, Float:y, Float:z, Float:angle, color1, color2, resp=-1, bool:siren=false) {
	new vehid = CreateVehicle(modelid, x, y, z, angle, color1, color2, resp, siren);
	VehicleStats[vehid][vColorOne] = color1;
	VehicleStats[vehid][vColorTwo] = color2;
	SetVehicleParamsEx(vehid, false, false, false, false, false, false, false);
	CarRadio[vehid] = 0;
	SetVehicleHealth(vehid, 999);
	return vehid;
}

stock ChangeVehicleColorEx(vehicleid, color1, color2) {
	VehicleStats[vehicleid][vColorOne] = color1;
	VehicleStats[vehicleid][vColorTwo] = color2;	
	ChangeVehicleColor(vehicleid, color1, color2);
	return true;
}

stock valstr_(val, ret[20]="\0") {format(ret,20,"%d",val);return ret;}

stock IsPlayerInRangeOfPlayer(playerid, id, Float:size, Float:x=0.0,Float:y=0.0,Float:z=0.0) {
	GetPlayerPos(playerid, x, y, z);
	return IsPlayerInRangeOfPoint(id, size, x, y, z);
}

PlayerLoginQueue(playerid) {
	gString[0] = EOS;
	format(gString, 100, "please wait!~n~%d/%d online players~n~~y~%d in login queue..", Iter_Count(Player), MAX_PLAYERS, Iter_Count(LoginQueue<1>));
	PlayerTextDrawSetString(playerid, LoginQueuePTD[playerid], gString);
	return true;
}
new Float:fish_cp_lv[][] = 
{{2087.5645,-121.6909,-0.3029},
{2016.3741,-100.0051,-0.2587},
{1997.3845,-170.4932,-0.2441},
{2020.3395,-163.6445,-0.1828},
{2028.6173,-111.4020,-0.1513}};

new Float:fish_cp_ls[][] = 
{{414.8502,-2177.9258,-0.5196},
{431.3940,-2227.8286,-0.5705},
{407.8915,-2237.6211,-0.3243},
{377.3179,-2204.3203,-0.3094},
{333.1658,-2185.3762,-0.3090}};

new Float:fish_cp_sf[][] = 
{{-3128.2148,479.7074,-0.324},
{-3130.0935,423.7882,0.0321},
{-3095.2847,413.5977,0.1106},
{-3079.6765,437.4300,-0.586},
{-3077.2388,481.6263,-0.035},
{-2979.6145,508.9251,-0.466}};

Float:get_distance_fish(playerid) {
	new Float:x, c=fishCount[playerid];
	switch(PlayerInfo[playerid][pJob]) {
		case 11: x = GetPlayerDistanceFromPoint(playerid, fish_cp_lv[c][0], fish_cp_lv[c][1], fish_cp_lv[c][2]);
		case 13: x = GetPlayerDistanceFromPoint(playerid, fish_cp_ls[c][0], fish_cp_ls[c][1], fish_cp_ls[c][2]);
		case 16: x = GetPlayerDistanceFromPoint(playerid, fish_cp_sf[c][0], fish_cp_sf[c][1], fish_cp_sf[c][2]);
	}
	return x;
}

stock factionLog(faction, const string[], va_args<>) 
{
	new h,m,s,y,mi,d, out[256]; 
	va_format(out, sizeof out, string, va_start<3>);

	gettime(h, m, s),getdate(y, mi, d);
	return _query("INSERT INTO `factionlog` (`Faction`, `Text`, `Date`) VALUES ('%d', '%s', '%02d-%02d-%d %02d:%02d:%02d')", faction, out, d,m,y,h,mi,s);
}

stock givePetPoint(playerid, amount) {
	if(!amount) return true;
	PlayerInfo[playerid][pPetPoints] += amount;
	UpdateVar(playerid, "PetPoints", PlayerInfo[playerid][pPetPoints]);

	SCMf(playerid, COLOR_MONEY, "(+) Pet points was modified: +%d (%d/%d pet points for level %d)", amount, PlayerInfo[playerid][pPetPoints], PlayerInfo[playerid][pPetLevel]*1500, PlayerInfo[playerid][pPetLevel]+1);
	return true;
}

FormatNumber(const number, const chars[] = ".") {
    static num[15]; 
	valstr(num,number);
	new length = strlen(num);

    while((length-=3)>0) strins(num, chars, length);
    return num;
}
FormatNumbers(const iNum[], const szChar[] = ".") {
    new _s[30]; 
	strcat(_s, iNum);
	new iLen = strlen(iNum);
    while((iLen-=3)>0) strins(_s, szChar, iLen);
    return _s;
}
enum {
	Duminica,
	Luni,
	Marti,
	Miercuri,
	Joi,
	Vineri,
	Sambata
}

GetWeekDay(day=0, month=0, year=0) {
	new j, e; getdate(year, month, day);
	if(month <= 2) month += 12, --year;
	j = year % 100;
	e = year / 100;
	return ((day + (month+1)*26/10 + j + j/4 + e/4 - 2*e) % 7);
}

new GunNames[48][] =
{
	"Nothink",
	"Brass Knuckles",
	"Golf Club",
	"Nitestick",
	"Knife",
	"Baseball Bat",
	"Showel",
	"Pool Cue",
	"Katana",
	"Chainsaw",
	"Purple Dildo",
	"Small White Dildo",
	"Long White Dildo",
	"Vibrator",
	"Flowers",
	"Cane",
	"Grenade",
	"Tear Gas",
	"Molotov",
	"Vehicle Missile",
	"Hydra Flare",
	"Jetpack",
	"Glock",
	"Silenced Colt",
	"Desert Eagle",
	"Shotgun",
	"Sawn Off",
	"Combat Shotgun",
	"Micro UZI",
	"MP5",
	"AK47",
	"M4",
	"Tec9",
	"Rifle",
	"Sniper Rifle",
	"Rocket Launcher",
	"HS Rocket Launcher",
	"Flamethrower",
	"Minigun",
	"Satchel Charge",
	"Detonator",
	"Spraycan",
	"Fire Extinguisher",
	"Camera",
	"Nightvision",
	"Infrared Vision",
	"Parachute",
	"Fake Pistol"
};

#define Broadcast(%0,%2,%3) \
	format(gString, 256, %2, %3) && SCMTA(%0,gString)