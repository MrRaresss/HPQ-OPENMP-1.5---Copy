
#define HASH_ALIAS			"youtube.com/iamCibu"
#define ACCOUNT_UPDATE_TIME (60000 * 5)
#define GetVehicleName(%0) aVehicleNames[%0-400]

///////////////////////////////////////////////////
////// ** Settings ** /////////////////////////////
///////////////////////////////////////////////////
                                                 //
#define MAX_PLAYER_VEHICLE			(45)         //
#define MAX_LOGIN 					(10)         //
#define MAX_LOGIN_WAITING			(200)		 //
#define MAX_FACTIONS     			(27)	 	 //
#define MAX_GARAGES     			(100)		 //
#define MAX_COBJECTS				(50)		 //
#define MAX_SYSTEMS 				(14)		 //
#define MAX_SAFEZONES   			(75)		 //
#define RefuelWait 					(10000)		 //
#define MAX_MINIGAMES 				(3)			 //
#define MAX_STAND					(50)		 //
#define MAX_CLANS 					(300)		 //
#define MAX_JOBS 					(16 + 1)	 //
#define MAX_CLANHQ 					(20)		 //
#define MAX_RADIO					(21)   		 //
#define MAX_AREA 					(600)		 //
#define MAX_TURFS 					(75)		 //
#define MAX_SKINS 					(40)		 //
#define MAX_CRATES 					(12)		 //
#define MAX_VOUCHERS				(5)			 //
#define MAX_TICKETS					(10)	     //
#define MAX_NEON_TICKETS			(7)	         //
#define COLOR_TEAL                  0x008080FF   //
#define C_TEAL	                    "{008080}"   //
#define C_WHITE                     "{ffffff}"   //
#define C_RED                       "{ff0000}"   //
#define C_LIGHTGREY                 "{bfbfbf}"   //
#define C_SERVER                    "{FFFF50}"   //
#define MAX_SPAWNED_CARS 	        (50)         //
///////////////////////////////////////////////////


#define int.Range(%0)<%1,%2> (%0>%1&&%0<%2)

#include "./src/data/positions.pwn"

new bool:BlockEnter[MAX_PLAYERS], StatusJob[MAX_PLAYERS];

enum hInfo {
	hID,
	Float:hEntrancex,
	Float:hEntrancey,
	Float:hEntrancez,
	Float:hExitx,
	Float:hExity,
	Float:hExitz,
	hOwner[25], 
	hDiscription[64],
	hValue, 
	hHel, 
	hArm,
	hInterior, 
	hLock,
	hOwned, 
	hRentabil, 
	hTakings, 
	hLevel, 
	hVirtual, 
	hPickupID, 
	hRadio
};

enum gInfo {
	gID, Float: gEnterX, Float: gEnterY, Float: gEnterZ, gHouses, gPickup
}
new GarageInfo[MAX_GARAGES][gInfo] = {{-1, 0.0, 0.0, 0.0, 0, -1}, ...}, Text3D:GarageLabel[sizeof(GarageInfo)];

enum bInfo {
	bID,
	Float:bEntranceX, Float:bEntranceY,
	Float:bEntranceZ, Float:bExitX,
	Float:bExitY, Float:bExitZ,
    bOwned, bOwner[25], bMessage[50], 
    bLevel, bBuyPrice, bFee, bBalance, 
    bLocked, bInterior, bProducts, bVirtual, 
    bStatic, bRadio, bPickup, bGas, bType
};
new BizzInfo[100][bInfo], Text3D:BizzLabel[sizeof(BizzInfo)];

enum svInfo {
	vID, vModel,
	Float: vLocation[3], Float: vAngle, vJob,
	vColor[2], vFaction, vRank, vVirtual, vSpawned
}
new ServerVehicles[MAX_VEHICLES][svInfo];

enum e_Accesories {
	e_AccessoryName[50],
	e_AccessoryCategory[50],
	e_Model
}

new const Accessories[][e_Accesories] = {
	{"santa hat", "head", 19065},
	{"halloween hat", "head", 19528},
	{"mask 1", "face", 19036},
	{"mask 2", "face", 18919},
	{"mask 3", "face", 18912},
	{"mask 4", "face", 18918},
	{"mask 5", "face", 18914},
	{"mask 6", "face", 18915},
	{"mask 7", "face", 18911},
	{"devil mask", "face", 11704},
	{"dildo", "right hand", 321},
	{"skateboard", "left hand", 19878},
	{"bodyarmour", "chest", 1242},
	{"surf board", "left hand", 2410},
	{"police armour", "chest", 19142},
	{"mp3 guitar", "back", 19317},
	{"pink laser", "right hand", 19081},
	{"yellow laser", "right hand", 19084},
	{"red laser", "right hand", 18643},
	{"purple laser", "right hand", 19080},
	{"orange laser", "right hand", 19082},
	{"green laser", "right hand", 19083}
};

enum e_Voucher {
	voucherName[64],
	voucherColor[32],
	voucherInfo
}

new const VoucherName[][e_Voucher] = {
	{"Rare Voucher", "3061ff", 50},
	{"Epic Voucher", "b030ff", 100},
	{"Mythic Voucher", "ffc849", 250},
	{"Legendary Voucher", "ff3030", 500},
	{"Millionaires Voucher", "04f0fc", 1000}
};

enum e_Crate {
	general[30],
	short[30],
	confirm[30],
	opening[30],
	crateList[30]
}

new CratePrice[][] = {
	{200, 20},
	{450, 40},
	{1000, 100},
	{2000, 150},
	{3500, 250},
	{5000, 300},
	{-1, -1},
	{7000, 200},
	{350, 350},
	{425, 425},
	{6666,250}
};

new const CrateColors[][] = {
	{"0a68ff"}, 
	{"b619ff"},
	{"ffae18"},
	{"ffc849"},
	{"ff0c0c"},
	{"7556ff"},
	{"1bcc82"},
	{"00ffea"},
	{"77ff00"},
	{"77ff00"},
	{"ff6363"}
};

enum e_Emote {
	emoteObject,
	emoteName[11]
}

new const emoteInfo[][e_Emote] = {
	{1212, "money"}, {1240, "heart"}, {1274, "dollar"}, {1254, "killfrenzy"}, {18631, "what?"}, {1247, "star"}, {1654, "dynamite"}, {2061, "bullets"}, {1276, "tiki"}, {362, "minigun"}, {19320, "pumpkin"}
};

#define FactionName(%0) 	DynamicFactions[%0][fName]

enum Factions {
	fID,
	fName[128],
	Float:fcX, Float:fcY, Float:fcZ, Float:extX, Float:extY, Float:extZ,
	fVW, fInterior, fAnn[180], fApp, bool:fLock,
	Text3D: fLabel, fPickup, Float: svfX, Float:svfY,Float:svfZ,
	Float: svf_v_X, Float:svf_v_Y,Float:svf_v_Z, Float:svf_v_Rot,
	Float: svf_e_X, Float:svf_e_Y,Float:svf_e_Z, Float:svf_e_Rot,
	Text3D: svfLabel, svfPickup, fMaxMembers, fTop, fLevel
};
new DynamicFactions[MAX_FACTIONS + 1][Factions], fRankNames[MAX_FACTIONS + 1][7][180];

enum zInfo {
    zID, zName[64], zOwned, zTime,
    Float:zMinX, Float:zMinY, Float:zMaxX, Float:zMaxY
};
new TurfInfo[MAX_TURFS][zInfo], Turfs[MAX_TURFS];

enum wInfo {
    wFaction, wAttacker, wTime,
};

new 
	WarInfo[sizeof(TurfInfo)][wInfo],
	Float: WarScoreF[MAX_FACTIONS + 1][sizeof(TurfInfo)],
	worstscoreat[sizeof(TurfInfo)],
	worstmemberat[sizeof(TurfInfo)],
	bestscoreat[sizeof(TurfInfo)],
	bestmemberat[sizeof(TurfInfo)],
	InWarTurf[MAX_FACTIONS + 1] = {-1, ...}
;

enum pSpec {
	Float:sPx, Float:sPy, Float:sPz, sInVehicle, sInInterior, sInInteriorID
};
new Unspec[MAX_PLAYERS][pSpec];

enum szInfo {
	szID,
	Float: szX, Float: szY, Float: szZ,
	szRange, szArea
}
new SafeZone[MAX_SAFEZONES][szInfo];

new ClanTop, FactionTop;

enum sInfo {
	sID, sFactionID,
	Float: sPosX, Float: sPosY, Float: sPosZ,
	sMoney, sDrugs, sMaterials, sVirtualID
}
new SafeInfo[MAX_FACTIONS + 1][sInfo];

enum clInfo {
	cID, string:clName[32], string:clOwner[32], clMotd[128], clTag[32], clRankName1[32], clRankName2[32], clRankName3[32], clRankName4[32], clRankName5[32], clRankName6[32], clRankName7[32], clHQ,
 	clColor[7], clSlots, clRegisterDate[32], clTags, clDays, ClanBank, clPremiumPoints, clBonus, clTop, clColorInt, clPremium, clVip
}
enum cHQInfo {
	cID, Float: cPosX, Float: cPosY, Float: cPosZ, Float: cEnterX, Float: cEnterY, Float: cEnterZ, cPrice, cStatus, cClan, cVirtualWorld, cPickup
}
new ClanHQInfo[MAX_CLANHQ][cHQInfo], Text3D: ClanHqLabel[sizeof(ClanHQInfo)];

enum vInfo {
	vColorOne, vColorTwo
};
new VehicleStats[MAX_VEHICLES][vInfo];

enum cInfo {
	cID, cModel, bool:cPFuel, cLicenseColor[10], bool:cCustomLicense, bool:cVip, bool:Confiscated, cTax, cClan, cRank, cStage, bool:cPremium, cRainBow, Dayss, cNeon,
	cTimeGoto, cOnline, cTime,
	Float:cLocationx, Float:cLocationy, Float:cLocationz, Float:cAngle, Float:KM, Float: cLastPos[3], Float: cVipPos[6],
	cColorOne, cColorTwo, cOwner[24], cValue, cLicense[14], bool:cLock, Userid, Spawned, cPoints, paintjob, cFuel, cText[64], cTextColor, 
	cMod[14], cGarage, cNeonObj[2], cNeonObj_[2], bool:cSNeon, bool:cRainbows[4]
};
new init_personal_vehicle[cInfo] = 
{0, 400, false, "none", false, false, false, 0, 0, 0, 0, false, false, 0, 0,
-1, -1, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 
{0.0, 0.0, 0.0}, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, 1, 
1, "Dealership", 1, "New Car", true, -1, 0, 5, 3, 100, EOS, 0,
{0,0,0,0,0,0,0,0,0,0,0,0,0,0}, -1, {-1, -1}, {0, 0}, false, {false, false, false, false}};
#define v_init() init_personal_vehicle

enum pPick {
	psID, psType, psWeapon, psAmmo, psWar, psAmount
}

enum dInfo {
	dID, dModel, dPrice, dStock
};

enum gfInfo {
	gfID,
	Float:gfX, Float:gfY, Float:gfZ, Float:gfRotX, Float: gfRotY, Float: gfRotZ, 
	gfOwned, gfObject, gfAttacked, gfDeelay, gfPlayerSpray
}

enum jInfo {
	jID, jName[128],		
	jLevel,
	jOwner[24], jBalance,
	Float:jPosX, Float:jPosY, Float:jPosZ,
	jLegal, jSkill1Veh,	jSkill2Veh, jSkill3Veh,	jSkill4Veh,	jSkill5Veh, jSkill6Veh,	jSkill7Veh,	
	Text3D: jLabel,
	jPickup,
	Float:jWPosX, Float:jWPosY, Float:jWPosZ, jDescription[64]
}

new
	GraffitiInfo[MAX_SAFEZONES][gfInfo],
	JobInfo[MAX_JOBS][jInfo],
	CarInfo[MAX_VEHICLES][cInfo],
	Pickups[MAX_PICKUPS][pPick],
	DSModels[59][dInfo],	
	ClanInfo[MAX_CLANS][clInfo],
	ClanTurfs[MAX_SAFEZONES];

new LumberjackObject[MAX_PLAYERS][5];

new ColorFaction[MAX_FACTIONS + 1][] = {
	{"FFFFFF"}, {"112EF2"}, {"2b45f5"}, {"01026b"}, {"0CAB3C"}, {"11F2F2"},
	{"FAD400"}, {"00FF80"}, {"FFFFA8"}, {"FFABFC"}, {"AB00FA"}, {"7E3937"},
	{"FFFF00"}, {"f86448"}, {"112EF2"}, {"91FF00"}, {"00FF80"}, {"252527"},
	{"1B376D"}, {"112EF2"}, {"f86448"}, {"00FF80"}, {"FFFFA8"}, {"A60505"},
	{"000000"}, {"88421D"}, {"669900"}, {"CC3300"}
};

new const CrateName[][e_Crate] = {
	{"Rare", "rara", "rare", "rare crate", "Rare Crate"},
	{"Epic", "epica", "epic", "epic crate", "Epic Crate"}, 
	{"Legendary", "(legendara)", "legendary", "legendary crate", "Legendary Crate"}, 
	{"Mythic", "(mythic)", "mythic", "mythic crate", "Mythic Crate"},
	{"Transcendent", "(transcendent)", "transcendent", "transcendent crate", "Transcendent Crate"}, 
	{"Vehicle", "(vehicle)", "vehicle", "vehicle crate", "Vehicle Crate"},
	{"Emotes", "(emote)", "emotes", "emotes crate", "Emotes Crate"},
	{"Summer", "(summer)", "summer", "summer crate", "Summer Crate"},
	{"Premium", "(premium)", "premium", "premium crate", "Premium Crate"},
	{"Premium Crate V2", "(premium v2)", "premium v2", "premium crate v2", "Premium Crate V2"},
	{"Feeling Lucky Today?", "(FLT?)", "FLT?", "Feeling Lucky Today?", "Feeling Lucky Today?"}
};

new 
	HouseInfo[200][hInfo], 
	Text3D:HouseLabel[sizeof(HouseInfo)], 
	MapIconHouse[sizeof(HouseInfo)]
;

new 
	news_50min[MAX_PLAYERS],
	bool:SpecialJobWorking[MAX_PLAYERS],
	player_td_page[MAX_PLAYERS]=0,
	free_request_inactivity[MAX_PLAYERS],
	delay_yo[MAX_PLAYERS];

new 
	dmvCPmax=16,
	p_carPlate[MAX_PLAYERS][50];

new Float: DMVCP[18][3] = {
	{2173.1377,2299.7346,10.2803},
	{2219.3286,2363.0457,10.3051},
	{2244.2312,2410.7241,10.3015},
	{2374.8657,2410.6655,10.3233},
	{2424.8511,2350.6602,10.3032},
	{2424.7461,2264.7708,10.2554},
	{2488.9534,2231.1567,10.3038},
	{2525.4595,2184.8135,10.3066},
	{2525.6470,2066.6709,10.2241},
	{2450.7058,2055.5020,10.2847},
	{2356.7173,2075.9392,10.2130},
	{2357.1685,2111.3330,10.3053},
	{2305.7739,2149.9456,10.3017},
	{2194.3813,2150.9373,10.3013},
	{2149.6995,2177.1025,10.2094},
	{2153.6885,2254.0894,10.2932},
	{2177.5461,2280.4351,10.6719},
	{0.0, 0.0, 0.0}
};

new 
BizzName[20][] = {
	{"Banca"},
	{"Gun Shop"},
	{"Club"},
	{"Restaurant"},
	{"Sex Shop"},
	{"24/7"}, 
	{"Binco"}, 
	{"Burger"},
	{"Casino"}, 
	{"CNN"},
	{"Rent Moto"}, 
	{"Rent Car"}, 
	{"GYM"},
	{"Car Color"},
	{"Paintball"},
	{"Gas Station"}, 
	{"Race Arena"},
	{"PNS"}, 
	{"Pizza"},
	{"Tunning"}
};


new const Float:pnsPos[10][4] = {
	{1962.2139,2162.3630,10.5474,89.8759},
	{1024.8511,-1033.1448,31.4581,179.6511},
	{488.7823,-1730.6229,10.9130,354.6299},
	{720.1098,-469.0536,16.0708,180.6643},
	{2076.7058,-1831.4351,13.1924,269.0537},

	{1974.0223,2162.4673,10.7974,270.6375},
	{1024.7582,-1024.8143,31.8286,1.4516},
	{487.7106,-1739.6200,10.8652,173.5913},
	{719.9748,-458.1300,16.0630,0.8340},
	{2065.8750,-1831.2563,13.2740,269.0483}
};

enum sv_enum {
	sv_license[128],
	sv_host[128],
	sv_user[128],
	sv_password[128],
	sv_database[128],

	sv_generalname[128],
	sv_dns[128],
	sv_logo[128],
	sv_panel[128],
	sv_forum[128],
	sv_discord[128],
	sv_battlepass,
	sv_blackjack
}

new serverInfo[sv_enum];

enum e_GunMafie {
	gunRank,
	gunName[11]
}

new GunMafie[4][e_GunMafie] = {
	{1, "Deagle"}, {1, "M4"}, {1, "AK47"}, {3, "Rifle"}
};

new GunMafieID[2][4] = {
	{24, 31, 30, 33},
	{40, 200, 200, 30}
};

new ValueMafie[4][2] = {
	{220, 200}, {310, 320}, {450, 400}, {535, 320}
};

new MonthName[12][] = {
	{"january"},
	{"february"},
	{"march"},
	{"april"},
	{"may"},
	{"june"},
	{"july"},
	{"august"},
	{"september"},
	{"october"},
	{"november"},
	{"december"}
};

new const e_Nums[][] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};

// DEFINES - OTHERS

// Logs ID
enum {
	LOG_INVALID, LOG_SHOP, LOG_SELLCAR, LOG_TRADE, LOG_MONEY,
	LOG_CAR, LOG_GIFTBOX, LOG_LEVEL, LOG_SELL, LOG_CHAT
}
	
#define AdmBot 		  -1
#define KICK 		  1
#define BAN 		  2
#define JAIL 		  3
#define WARN 		  4
#define MUTE 		  5

#define redist::%0(%1) \
	forward %0(%1); public %0(%1)
#define std::%0(%1)	\
	stock %0(%1)
#define cout::			\
	SendClientMessage
#define std_cout::(%0,%1,%2,%3)  \
	format(gString,144,%2,%3) && cout::(%0,%1,gString)

#define AdminOnly "Nu esti autorizat sa folosesti aceasta comanda!"
#define SetPlayerHoldingObject(%1,%2,%3,%4,%5,%6,%7,%8,%9) SetPlayerAttachedObject(%1,MAX_PLAYER_ATTACHED_OBJECTS-1,%2,%3,%4,%5,%6,%7,%8,%9)
#define StopPlayerHoldingObject(%1) RemovePlayerAttachedObject(%1,MAX_PLAYER_ATTACHED_OBJECTS-1)
#define IsPlayerHoldingObject(%1) IsPlayerAttachedObjectSlotUsed(%1,MAX_PLAYER_ATTACHED_OBJECTS-1)
#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

#define p_Procent(%0,%1) \
    ((%0/100)*%1)

#define PlayerToPoint(%0,%1,%2,%3,%4) IsPlayerInRangeOfPoint(%1,%0,%2,%3,%4)

#define GetNameEx(%0)	\
	 PlayerInfo[%0][pUsername]

new srsString[144];
#define SCMf(%0,%1,%2,%3)				format(srsString,sizeof srsString,%2,%3)&&SendClientMessage(%0,%1,srsString)

#define GetPlayerInregisters()  	ServerAccounts
#define GetVehicleSlots(%0)			PlayerInfo[%0][pSlot]
#define INVALID_PET	 				(Text3D:0xFFFF)

#define 	SKIN_RARE 				(0x3061FF20)
#define 	SKIN_EPIC 				(0xB030FF20)
#define 	SKIN_LEGENDARY 			(0xFFAE1820)
#define 	SKIN_MYTHIC 			(0xFFC84920)
#define 	SKIN_TRANSCENDENT 		(0xFF0C0C20)
#define 	SKIN_PREMIUM			(0x1FFF0020)
#define 	SKIN_PREMIUMV2			(0x1FFF0021)
#define 	SKIN_SUMMER				(0x61EA4B20)
#define     SKIN_SUMMERV2           (0x00ffea20)
#define 	SKIN_GIRL 				(0xF08F9010)
#define     SKIN_HALLOWEEN          (0x10e38220)
#define     SKIN_SPECIAL            (0x03fce320)
#define 	SKIN_NONE				(0xFFFFFF20)

redist::Kick_Ban ( playerid, bool: kickban ) return ( !kickban ) ? Kick ( playerid ) : Ban ( playerid );
#define KickEx(%1) 			SetTimerEx ( "Kick_Ban", 500, false, "ii", %1, false )
#define Ban(%1) 			SetTimerEx ( "Kick_Ban", 500, false, "ii", %1, true )

#define MAXGOALSTR  		"69.000.000"
#define MAXGOAL 			(69000000)
#define MAXGOALM			(0)

new GetVehicleColors[256][] = {
// Normale
{"000000"}, {"F5F5F5"}, {"2A77A1"}, {"840410"}, {"263739"}, {"86446E"}, {"D78E10"}, {"4C75B7"}, {"BDBEC6"}, {"5E7072"},
{"46597A"}, {"656A79"}, {"5D7E8D"}, {"58595A"}, {"D6DAD6"}, {"9CA1A3"}, {"335F3F"}, {"730E1A"}, {"7B0A2A"}, {"9F9D94"},
{"3B4E78"}, {"732E3E"}, {"691E3B"}, {"96918C"}, {"515459"}, {"3F3E45"}, {"A5A9A7"}, {"635C5A"}, {"3D4A68"}, {"979592"},
{"421F21"}, {"5F272B"}, {"8494AB"}, {"767B7C"}, {"646464"}, {"5A5752"}, {"252527"}, {"2D3A35"}, {"93A396"}, {"6D7A88"},
{"221918"}, {"6F675F"}, {"7C1C2A"}, {"5F0A15"}, {"193826"}, {"5D1B20"}, {"9D9872"}, {"7A7560"}, {"989586"}, {"ADB0B0"},
{"848988"}, {"304F45"}, {"4D6268"}, {"162248"}, {"272F4B"}, {"7D6256"}, {"9EA4AB"}, {"9C8D71"}, {"6D1822"}, {"4E6881"},
{"9C9C98"}, {"917347"}, {"661C26"}, {"949D9F"}, {"A4A7A5"}, {"8E8C46"}, {"341A1E"}, {"6A7A8C"}, {"AAAD8E"}, {"AB988F"},
{"851F2E"}, {"6F8297"}, {"585853"}, {"9AA790"}, {"601A23"}, {"20202C"}, {"A4A096"}, {"AA9D84"}, {"78222B"}, {"0E316D"},
{"722A3F"}, {"7B715E"}, {"741D28"}, {"1E2E32"}, {"4D322F"}, {"7C1B44"}, {"2E5B20"}, {"395A83"}, {"6D2837"}, {"A7A28F"},
{"AFB1B1"}, {"364155"}, {"6D6C6E"}, {"0F6A89"}, {"204B6B"}, {"2B3E57"}, {"9B9F9D"}, {"6C8495"}, {"4D8495"}, {"AE9B7F"},
{"406C8F"}, {"1F253B"}, {"AB9276"}, {"134573"}, {"96816C"}, {"64686A"}, {"105082"}, {"A19983"}, {"385694"}, {"525661"},
{"7F6956"}, {"8C929A"}, {"596E87"}, {"473532"}, {"44624F"}, {"730A27"}, {"223457"}, {"640D1B"}, {"A3ADC6"}, {"695853"},
{"9B8B80"}, {"620B1C"}, {"5B5D5E"}, {"624428"}, {"731827"}, {"1B376D"}, {"EC6AAE"}, {"000000"},
// Hidden
{"177517"}, {"210606"}, {"125478"}, {"452A0D"}, {"571E1E"}, {"010701"}, {"25225A"}, {"2C89AA"}, {"8A4DBD"}, {"35963A"},
{"B7B7B7"}, {"464C8D"}, {"84888C"}, {"817867"}, {"817A26"}, {"6A506F"}, {"583E6F"}, {"8CB972"}, {"824F78"}, {"6D276A"},
{"1E1D13"}, {"1E1306"}, {"1F2518"}, {"2C4531"}, {"1E4C99"}, {"2E5F43"}, {"1E9948"}, {"1E9999"}, {"999976"}, {"7C8499"},
{"992E1E"}, {"2C1E08"}, {"142407"}, {"993E4D"}, {"1E4C99"}, {"198181"}, {"1A292A"}, {"16616F"}, {"1B6687"}, {"6C3F99"},
{"481A0E"}, {"7A7399"}, {"746D99"}, {"53387E"}, {"222407"}, {"3E190C"}, {"46210E"}, {"991E1E"}, {"8D4C8D"}, {"805B80"},
{"7B3E7E"}, {"3C1737"}, {"733517"}, {"781818"}, {"83341A"}, {"8E2F1C"}, {"7E3E53"}, {"7C6D7C"}, {"020C02"}, {"072407"},
{"163012"}, {"16301B"}, {"642B4F"}, {"368452"}, {"999590"}, {"818D96"}, {"99991E"}, {"7F994C"}, {"839292"}, {"788222"},
{"2B3C99"}, {"3A3A0B"}, {"8A794E"}, {"0E1F49"}, {"15371C"}, {"15273A"}, {"375775"}, {"060820"}, {"071326"}, {"20394B"},
{"2C5089"}, {"15426C"}, {"103250"}, {"241663"}, {"692015"}, {"8C8D94"}, {"516013"}, {"090F02"}, {"8C573A"}, {"52888E"},
{"995C52"}, {"99581E"}, {"993A63"}, {"998F4E"}, {"99311E"}, {"0D1842"}, {"521E1E"}, {"42420D"}, {"4C991E"}, {"082A1D"},
{"96821D"}, {"197F19"}, {"3B141F"}, {"745217"}, {"893F8D"}, {"7E1A6C"}, {"0B370B"}, {"27450D"}, {"071F24"}, {"784573"},
{"8A653A"}, {"732617"}, {"319490"}, {"56941D"}, {"59163D"}, {"1B8A2F"}, {"38160B"}, {"041804"}, {"355D8E"}, {"2E3F5B"},
{"561A28"}, {"4E0E27"}, {"706C67"}, {"3B3E42"}, {"2E2D33"}, {"7B7E7D"}, {"4A4442"}, {"28344E"}
};
enum e_SKIN_TYPE {
	e_SKIN_RARE[11],
	e_SKIN_EPIC[12],
	e_SKIN_LEGENDARY[15],
	e_SKIN_MYTHIC[12],
	e_SKIN_TRANSCENDENT[15],
	e_SKIN_SUMMER[13],
	e_SKIN_PREMIUM[11],
	e_SKIN_HALLOWEEN[1],
	e_SKIN_GIRL[12],
	e_SKIN_PREMIUMV2[20],
	e_SKIN_SPECIAL[1],
	e_SKIN_SUMMERV2[14]
}
new const loadSkins[e_SKIN_TYPE] = {
	{11, 33, 46, 59, 72, 123, 127, 171, 178, 188, 291},//rare
	{83, 84, 177, 204, 228, 248, 254, 289, 290, 295, 296, 299},//epic
	{0, 3, 93, 104, 107, 116, 115, 149, 164, 195, 211, 285, 292, 293, 294},//legendary
	{106, 120, 121, 184, 186, 219, 221, 260, 263, 269, 273, 297},//mythic
	{98, 108, 124, 125, 126, 191, 217, 223, 233, 242, 264, 270, 271, 272, 298},//trans
	{18, 19, 35, 40, 45, 87, 88, 97, 140, 154, 193, 214, 252},//summer
	{69, 90, 91, 105, 113, 119, 144, 167, 169, 185, 206},//premium
	{162},//halloween
	{12, 41, 55, 85, 92, 138, 141, 152, 172, 194, 216, 251},//girl
	{118, 122, 128, 145, 146, 147, 148, 150, 153, 173, 174, 175, 176, 179, 180, 181, 183, 187, 189, 190},//premium v2
	{241},//special
	{14, 36, 51, 64, 80, 102, 130, 131, 157, 159, 199, 207, 237, 245}//summer v2
};
enum pInfo {
    pSQLID,Float: pConnectTime, Float: pSHealth, Float: pSeconds, pReborn, pShard[3],pDM,pUsername[MAX_PLAYER_NAME],pAdmin,pKey[128],pLevel,pHelper,pPremiumAccount,pSex,pAge,
    pMuted,pMuteTime,pExp,pCash, pModel,pPnumber,pHouse,pBizz,pCarLicS,pFlyLicS,pBoatLicS,pGunLicS,pCarLicT,pCarLic,pFlyLicT,pFlyLic,pBoatLicT,pBoatLic,pFishLic,pGunLicT,pGunLic,
    pTag,pHat,pShowHat,pEscapePoints,pShowDMG,pColor,pShowHP,pShowAP,pAJail,pDays,pGlasses,pShowGlasses,pGasCan,pWantedDeaths,pPhoneBook,pPhone[30], pExpFW,
	pWantedLevel,pJob,pJailed,pJailTime,pMats,pDrugs,pHeroin,pLeader,pMember,pRank,pFACWarns,pFpunish,pLawyer, pJobSkill[MAX_JOBS + 1], pJobSkillPoints[MAX_JOBS + 1],
	pFightStyle, pHunger[5], bool:pEmotes[11], pKeyEmote[2], pCaseBattle, pRaportTime, pJobGoal, bool:pTester, bool:pResponsabil, bool:pRestriction, pClanAccess[3],
 	pRob,pWarns,pFuel,bool:pSleeping,pRented,pSpeaker,pWTalkie,pLighter,pCigarettes,pEmail[32], pFireworks, Float:pConnectMonth, pExpLW, pExpHW, pExpAW,
	pMP3,pReferral,pReferralRP,pReferralMoney,pShowJob,pShowFaction,pShowFP,pShowCeas,pPremiumPoints,pClan,pClanRank,pClanWarn, bool: pGuns[6],
	pClanDays,pHelpedPlayersToday,pPin,pPinLogged,pCommands[3], pSpecialPet[6], pGiftPoints,pNewbieMute,pHelpedPlayers,pReportTime, pShowProgress[5],pHudGen,pVip,pAW,pLW,pHW,pAchievementStatus[35],
	pSlot, string:pCrime[64], pHats[13], pLasers[6], bool:pStatsInfo[5], pChatCMD, pChatColor[7], pClanMoney, pClanPP, pTier, pBpExp, bool:pGoldPass, bpClaimed[40],
	pDailyLogin,pBackpack,pBackpackLevel,pNeedProgress[5],pDailyMission[5],pProgress[5],pPet,bool:pPetStatus,pPetLevel,pPetName[30],pPetPoints,pSkins[MAX_SKINS], pCarKey[MAX_PLAYER_VEHICLE],
	pTutorial, pBPoints, pCrates[MAX_CRATES], pVoucher[MAX_VOUCHERS], pDailyBonus, pShowBanca, pHidden, pJobOwner, pYouTuber, pTickets[MAX_TICKETS], pNeonTickets[MAX_NEON_TICKETS], 
	pCredit, pDailyActivity, pRainbowType, pCasinoCredit, pActivePaydays, pLotto[6], pAccessories[23], pAccessoriesOn[23], pFactionInactivity, pCollectReady,
};
new PlayerInfo[MAX_PLAYERS + 1][pInfo], playerBPTask[MAX_PLAYERS][40];


enum pkInfo {
	pkID,
	pkType
}
new PickupInfo[MAX_PICKUPS][pkInfo];

enum e_EXAM_INFO {
	e_TITLE[84],
	e_RASP1[30],
	e_RASP2[30],
	e_RASP3[30],
	bool:e_STATUS[3]
}

#define procentage(%0,%1) ((%0*100)/%1)

new const examInfo[][e_EXAM_INFO] = {
	{{"Cu ce se foloseste aceasta licenta? (0/5)"}, {"1. Barca."}, {"2. Motor"}, {"3. Masina"}, {false, false, true}},
	{{"Dupa ce ora trebuie sa aprinzi farurile? (1/5)"}, {"1. 20:00."}, {"2. Niciodata."}, {"3. 23:00."}, {true, false, false}},
	{{"Ce faci cand te someaza un politist? (2/5)"}, {"1. Tragi pe dreapta"}, {"2. Continui sa mergi."}, {"3. Iesi de pe joc."}, {true, false, false}},
	{{"Cum pornesti motorul masinii? (3/5)"}, {"1. Apasand pe tasta 2."}, {"2. /engine."}, {"3. CTRL."}, {true, true, false}},
	{{"Ce sanctiune primesti daca folosesti NOS? (4/5)"}, {"1. Suspendarea licentei."}, {"2. Amenda."}, {"3. Nimic."}, {false, true, false}}
};

// TOW CAR CHECKPOINT
new Float:TowCarCk[3][3] = {
	{1638.0239,2198.6133,10.8203},{2483.8311,-2120.2344,13.5469},{-1978.0508,289.2409,35.1719}
};

new wantedList[16][2] = {
	{1, 0},
	{1, 0},
	{2, 0},
	{2, 0},
	{2, 0},
	{3, 0},
	{3, 0},
	{3, 1},
	{3, 0},
	{4, 0},
	{4, 0},
	{4, 0},
	{5, 0},
	{5, 1},
	{6, 1},
	{6, 1}
};


new const HudName[13][180] = {
	{"{FFFFFF}Dezactivat"},
	{"{B8BFC2}Black"},
	{"{FF0000}Red"},
	{"{00FF2F}Green"},
	{"{0E8C19}Dark Green"},	
	{"{0022FF}Blue"},
	{"{00AAFF}Lightblue"},
	{"{00FFD0}Cyan"},	
	{"{FFFB00}Yellow"},
	{"{FF8800}Orange"},	
	{"{FFB957}Gold"},
	{"{8000FF}Purple"},
	{"{FF0077}Pink"}	
};

new RadioNames[][180] = {
	{"{FF3838}Turn OFF Radio"},
	{"Pro FM Romania"},
	{"Radio Bandit Romania"},	
	{"Radio Taraf Romania"},	
	{"Radio Hot Romania"},	
	{"Dubstep.fm"},
	{"Radio Hit Romania"},
	{"Radio ClubMix Romania"},
	{"Kiss FM Romania [Audio Plugin]"},	
	{"Radio Zu Romania [Audio Plugin]"},
	{"Radio Popular"},	
	{"Trap.FM"},
	{"Rock FM"},
	{"PirateFM Rap"},
	{"Radio Vocea Strazii"},
	{"Radio Traditional HIP HOP"},
	{"Hot 108 Jamz"},
	{"Radio Taraf Colinde"},
	{"Radio Tequila"},
	{"Radio Gangsta Manele"},
	{"Radio Teen Trap"}
};

new RadioLink[][180] = {
	{""},
	{"http://www.profm.ro/static/radio/winamp/profm.m3u"},
	{"http://live.radiobandit.ro:8000"},	
	{"http://radiotaraf.com/live.m3u"},	
	{"http://live.radiohot.ro:8000/"},	
	{"http://dubstep.fm/128.pls"},
	{"http://www.radio-hit.ro/asculta.m3u"},
	{"http://live.radioclubmix.ro:9999"},
	{"http://80.86.106.136/listen.pls"},	
	{"http://www.radiozu.ro/live.m3u"},
	{"http://livemp3.radiopopular.ro:7777"},	
	{"http://radio.trap.fm/listen128.pls"},	
	{"http://80.86.106.143:9128/rockfm.aacp"},
	{"http://live.piratefm.ro:1200"},
	{"http://radio.voceastrazii.net:8012"},
	{"http://traditionalhiphop.zapto.org:7500/listen.pls"},
	{"http://sc.hot108.com:4020/listen.pls"},
	{"http://www.radiotaraf.ro/colinde.m3u"},
	{"http://necenzurat.radiotequila.ro:7000/"},
	{"http://asculta.radiogangsta.ro:8800/listen.pls"},
	{"http://136.243.227.13:9304/"}
};



new StagePrice[5]={0, 120, 275, 500, 777};
new StageSpeed[5] = {0, 10, 15, 25, 85};
new aVehicleNames[][] = {
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel",
	"Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus",
	"Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection",
	"Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus",
	"Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie",
	"Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral",
	"Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder",
	"Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van",
	"Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale",
	"Oceanic","Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy",
	"Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX",
	"Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper",
	"Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring Racer C", "Sandking",
	"Blista Compact", "Police Maverick", "Boxville", "Benson", "Mesa", "RC Goblin",
	"Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher", "Super GT",
	"Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt",
 	"Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra",
 	"FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
 	"Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer",
 	"Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent",
    "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo",
	"Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite",
	"Windsor", "Monster", "Monster", "Uranus", "Jester", "Sultan", "Stratum",
	"Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper",
	"Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
	"News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
	"Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car",
 	"Police Car", "Police Car", "Police Ranger", "Picador", "S.W.A.T", "Alpha",
 	"Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs", "Boxville",
 	"Tiller", "Utility Trailer"
};

new const name_hats[][] = {
	{"Santa Hat"},
	{"Halloween Hat"},
	{"Mask #1"},
	{"Mask #2"},
	{"Mask #3"},
	{"Mask #4"},
	{"Mask #5"},
	{"Mask #6"},
	{"Mask #7"},
	{"Devil Mask"},
	{"Dildo"},
	{"Armour"},
	{"Surf"}
};

new const laser_color[][] = {
	{"Pink"}, {"Yellow"}, {"Red"}, {"Purple"}, {"Orange"}, {"Green"}
};

enum r_enum {
	r_vehicle,
	r_biz_type,
	r_biz_id,
	r_actor,
	r_time,
	bool:r_in_rob,
	r_backs,
	r_time_left,
	bool:r_role,
	r_coPlayer
}
new p_rob[MAX_PLAYERS + 1][r_enum] = {{INVALID_PLAYER_ID, 0, 0, 0, 0, false, 0, -1, false, -1},...};

new const truckerRoute[][] = {"Food", "Clothes", "Materials", "Explosible", "Guns", "Ores"};
new VehicleSpeed[212] = {
	149,139,176,104,125,155,104,140,94,149,122,209,159,104,100,181,145,127,109,141,137,145,132,93,128,
	191,164,156,148,190,100,123,89,104,158,-1,141,149,135,159,128,71,131,119,104,155,140,126,106,169,-1,
	182,141,58,115,119,100,90,138,128,128,151,105,136,33,33,139,132,136,122,148,104,110,94,141,163,200,
	176,111,132,174,68,148,116,52,94,60,168,143,132,148,141,132,
	168,203,166,153,168,115,116,132,33,203,203,163,132,169,156,102,74,95,111,120,138,
	113,126,148,148,155,155,258,150,166,142,123,151,149,141,166,141,57,66,104,157,159,
	149,163,-1,-1,94,141,191,155,142,140,139,141,135,138,145,137,148,114,173,136,149,
	104,104,147,168,159,145,168,120,83,155,151,163,138,-1,-1,88,58,104,57,149,140,220,
	123,149,144,101,115,66,-1,144,132,155,102,153,-1,-1,248,130,57,104,166,166,166,149,
	142,104,160,162,139,142,-1,-1,-1,102,-1,-1
};
#define GetVehicleMaxSpeed(%0) VehicleSpeed[%0-400]
#define GetPlayerSkill(%0) PlayerInfo[%0][pJobSkill][PlayerInfo[%0][pJob]]
	
enum {
	DIALOG_INVALID, DIALOG_LOGIN1, DIALOG_LOGIN2, DIALOG_LOCATIONS, DIALOG_TOWCARLOC,
	DIALOG_STORE, DIALOG_TRANSFER, DIALOG_NEWPASS, DIALOG_NEWPASS1, DIALOG_REGISTER, 
	DIALOG_REGISTER2, DIALOG_REGISTER3, DIALOG_REGISTER4, DIALOG_REGISTER5, DIALOG_EDITRAPORT,
	DIALOG_REGISTER6, DIALOG_CARSELL, DIALOG_WALKSTYLE, DIALOG_HELP, DIALOG_EDITJOB, 
	DIALOG_JOBS, DIALOG_TRUCKER, DIALOG_SHOW, DIALOG_SHOP, DIALOG_SHOP1, DIALOG_JOBTYPE,
	DIALOG_CLAN, DIALOG_CLAN2, DIALOG_CLAN3, DIALOG_CLAN_GRANK, DIALOG_CLAN_MANAGE2, 
	DIALOG_CLAN_MEMBERS, DIALOG_CLAN_COMMAND, DIALOG_CLAN_SETTINGS, DIALOG_CLAN_COLOR, 
	DIALOG_CLAN_MOTD, DIALOG_CLAN_RANK, DIALOG_CLAN_RANK2, DIALOG_CLANTURFS, DIALOG_FOOD,
	DIALOG_GARAGE, DIALOG_GARAGE1, DIALOG_SELLCAR, DIALOG_CHANGENAME, DIALOG_MEMBERS, 
	DIALOG_RESETKM, DIALOG_EDITSF, DIALOG_EDITSF1, DIALOG_EDITSF2, DIALOG_CGIFT,
	DIALOG_TOG, DIALOG_CHECKPOINT, DIALOG_MODE, DIALOG_LOCATIONS3, DIALOG_ROB,
	DIALOG_LOCATIONS2, DIALOG_IPHONE, DIALOG_CLANTAG, DIALOG_QUITFACTION, DIALOG_BID, 
	DIALOG_CARRADIO, DIALOG_INSURANCE, DIALOG_CHANGEPIN, DIALOG_VOTE, DIALOG_HUDSELECT, 
	DIALOG_PCOLOR, DIALOG_TAX, DIALOG_HRADIO, DIALOG_BRADIO, DIALOG_FACTIONS, DIALOG_EMOTES,
	DIALOG_FRIENDS, DIALOG_BLACKLIST, DIALOG_QUITCLAN, DIALOG_SELLBIZ, DIALOG_EMAILS,
	DIALOG_SELLHOUSE, DIALOG_FDEPOSIT, DIALOG_FWITHDRAW, DIALOG_BUYGUN, DIALOG_SERVICE,
	DIALOG_CARRADIO2, DIALOG_WANTED, DIALOG_HMENU, DIALOG_TENANTS, DIALOG_BMENU, DIALOG_GYM,
	DIALOG_MYBL, DIALOG_SUSPECT, DIALOG_BUYGUN2, DIALOG_SPAWNCHANGE, DIALOG_CHANGETAG, 
	DIALOG_CLANNAME, DIALOG_SHOPCAR, DIALOG_WHEELS, DIALOG_EMAIL, DIALOG_SYSTEMS, DIALOG_GOTOJOB,
	DIALOG_REFERRALS, DIALOG_STAFF, DIALOG_RAPORTS, DIALOG_DILDO, DIALOG_TRADE, DIALOG_RAINBOWSPEED,
	DIALOG_TICKET, DIALOG_MP3, DIALOG_YOUTUBE, DIALOG_TELEPORT, DIALOG_BACK, DIALOG_STAFF2,
	DIALOG_MOVEHOUSE, DIALOG_MOVEBIZ, DIALOG_SECURITY, DIALOG_EDITFACTION1, DIALOG_RESETDAYS,
	DIALOG_UPGRADEVIP, DIALOG_CALLS, DIALOG_REASON, DIALOG_EDITVEHICLE, DIALOG_PESCARIE, DIALOG_EMOTE,
	DIALOG_BETCASINO, DIALOG_REPORT, DIALOG_SELLAP, DIALOG_LOCATIONS5, DIALOG_EAT,
	DIALOG_PET, DIALOG_PETNAME, DIALOG_SKIN, DIALOG_SKINS, DIALOG_BUYLICENSE, DIALOG_CRATES, DIALOG_GETHIT,
	DIALOG_SERVER, DIALOG_RAINBOW, DIALOG_RENTCAR, DIALOG_PAROLAADMIN, DIALOG_VOUCHERS, DIALOG_RENTBIKE,
	DIALOG_VIPVEHICLES, DIALOG_VOUCHERSS, DIALOG_UPSTAGE, DIALOG_BUYCRATES, DIALOG_BUYCRATES1, DIALOG_EDITFACTION,
	DIALOG_UPGRADERAINBOW, DIALOG_TRADESKIN, DIALOG_GIVECRATES, DIALOG_TOGRAINBOW, DIALOG_SHOPMENU, 
	DIALOG_EDITCARS, DIALOG_EDITCARS1, DIALOG_BETP, DIALOG_CLANVEHICLES, DIALOG_CLANRAINBOW, DIALOG_CLANBUY,
	DIALOG_SELECTC, DIALOG_UPDATES, DIALOG_DEPOSITPP, DIALOG_UPGRADEVIPL, DIALOG_TRADEHIDDEN, DIALOG_TRADEMILIARD, 
	DIALOG_TRADEVOUCHERR, DIALOG_TRADEVOUCHERV, DIALOG_SETGUN, DIALOG_VIPNAME, DIALOG_NEON, DIALOG_BUYNEON, DIALOG_TOWCAR, 
	DIALOG_FINDCAR, DIALOG_STICKET, DIALOG_VIPNAME1, DIALOG_TRADE1, DIALOG_TRADE2, DIALOG_SENDMAIL1,
	DIALOG_BMENU1, DIALOG_HMENU1, DIALOG_HMENU2, DIALOG_HMENU3, DIALOG_FWITHDRAW1, DIALOG_FDEPOSIT1, DIALOG_BUYCASE,
	DIALOG_BLACKLIST1, DIALOG_BLACKLIST2, DIALOG_FRIENDS1, DIALOG_FRIENDS2, DIALOG_FRIENDS3, DIALOG_FRIENDS4,
	DIALOG_FACTIONS1, DIALOG_MEMBERS1, DIALOG_MEMBERS2, DIALOG_MEMBERS3, DIALOG_EDITCARS2, DIALOG_EDITCARS3, DIALOG_CLANVEHICLES1, 
	DIALOG_CLAN_COLOR_RANK1, DIALOG_SHOPMENU1, DIALOG_EDITJOB1, DIALOG_VOUCHERSS1, DIALOG_VOUCHERSS2, DIALOG_SERVER1,
	DIALOG_MATERIALS, DIALOG_MATERIALS1, DIALOG_DRUGS, DIALOG_CLANVRANK, DIALOG_SELLCLANV, DIALOG_SVF,
	DIALOG_RAPORTRANK, DIALOG_RAPORTVALUE, DIALOG_REGULAMENT, DIALOG_CLANVCOLOR, DIALOG_TOGTURFS,
	DIALOG_ESCAPE, DIALOG_JAIL, DIALOG_ANTICHEAT, DIALOG_PET_OBJ, DIALOG_MEMBERS4, CHOSE_BUSROUTE,
	DIALOG_VOUCHERSS4, DIALOG_VOUCHERSS5, DIALOG_CHANGENEON, DIALOG_CHANGENEON_, DIALOG_SKILLUPGRADE,
	DIALOG_SHARD, DIALOG_HATS, DIALOG_LASERS, DIALOG_UPGRADESHARD, DIALOG_VOTECOLLESION, DIALOG_BETRACE,
	DIALOG_ROBINVITE, DIALOG_BUYRAINBOW, DIALOG_TRADECLAN, DIALOG_TRADEHATS, DIALOG_TRADELASERS, DIALOG_TRADEMATERIALS,
	DIALOG_TRADEPFUEL, DIALOG_TRADECUSTOM, DIALOG_MOVESVF_V, DIALOG_MOVESVF_E, DIALOG_BET_BL,
 	DIALOG_RED, DIALOG_GREEN, DIALOG_BLACK, DIALOG_STATSINFO, DIALOG_CHATCMD, DIALOG_BETMACHINE,
 	DIALOG_ACOLOR,COLOR_LEGENDCOLOR, DIALOG_CLANVP, DIALOG_CUSTOMNUNBER,
 	DIALOG_BUYCREDIT, DIALOG_SELLCREDIT, DIALOG_NEWNUMBER, DIALOG_CARPLATE, DIALOG_CARPLATECOLOR, 
 	DIALOG_CARPLATECOLOR_CONFIRM, DIALOG_NEONTICKETS, DIALOG_NEONTICKETS_C, DIALOG_BACKPACK, DIALOG_BLOCKCMD, 
 	DIALOG_SHOP_CNUMBER, DIALOG_PHONECREDITS, DIALOG_GO, DIALOG_GO1, DIALOG_GO2, DIALOG_GO3, 
 	DIALOG_GO4, DIALOG_GO5, DIALOG_GO6, DIALOG_STAFF_ADMINS, DIALOG_CLAN_ACCESS, DIALOG_CLAN_PREMIUM, DIALOG_CLAN_VIP,
 	DIALOG_CLAN_REMOVET, DIALOG_CONFIRM, DIALOG_SPAWNCHANGE_DEP, DIALOG_SPAWNCHANGE_SI, DIALOG_SPAWNCHANGE_PARA,
 	DIALOG_SPAWNCHANGE_TRAN, DIALOG_SPAWNCHANGE_TTC, DIALOG_CONFIRMRAINBOW
}

#define COLOR_ERROR         0xC0241FFF
#define COLOR_DARKNICERED 	0x9D000096
#define COLOR_LIGHTGREEN 	0x9ACD32AA
#define COLOR_CHATBUBBLE    0xFFFFFFCC
#define COLOR_LIGHTBLUE 	0x00C3FFFF
#define COLOR_LIGHTRED 		0xFF6347FF
#define COLOR_ADMLOGS       0xFF6200FF
#define COLOR_LGREEN 		0xD7FFB3FF
#define COLOR_ORANGE        0xFFA500FF
#define COLOR_GOLD          0xFFB95EFF
#define COLOR_LIGHTGOLD 	0xFFEC8BFF
#define COLOR_MONEY 		0x4dad2bFF
#define COLOR_CLIENT        0xA9C4E4FF
#define COLOR_SERVER        0x5F9CC9FF
#define COLOR_WARNING 		0xDE1414FF
#define COLOR_ADMCHAT 		0xFFC266AA
#define COLOR_GRAD1 		0xB4B5B7FF
#define COLOR_GRAD2 		0xBFC0C2FF
#define COLOR_GRAD3 		0xCBCCCEFF
#define COLOR_GRAD4 		0xD8D8D8FF
#define COLOR_GRAD5 		0xE3E3E3FF
#define COLOR_GRAD6 		0xF0F0F0FF
#define COLOR_GREY 			0xAFAFAFAA
#define COLOR_GREEN 		0x33AA33AA
#define COLOR_RED 			0xFF0000FF
#define COLOR_NEWS 			0xFFA500AA
#define COLOR_LOGIN 		0x00D269FF
#define COLOR_DEPAR 		0x4646FFFF
#define COLOR_YELLOW 		0xFFFF00FF
#define COLOR_WHITE 		0xFFFFFFFF
#define COLOR_FADE1 		0xE6E6E6E6
#define COLOR_FADE2 		0xC8C8C8C8
#define COLOR_FADE3 		0xAAAAAAAA
#define COLOR_FADE4 		0x8C8C8C8C
#define COLOR_FADE5 		0x6E6E6E6E
#define COLOR_PURPLE 		0xC2A2DAAA
#define COLOR_DBLUE 		0x2641FEAA
#define COLOR_ALLDEPT 		0xFF8282AA
#define COLOR_NEWS 			0xFFA500AA
#define COLOR_DEPART 		0xFF8040FF
#define COLOR_DEPART2 		0xff3535FF
#define COLOR_LOGS 			0xb5591bFF
#define COLOR_BLUE      	0x211CDEC8
#define COLOR_DARKPINK      0xE7AAA5A5
#define COLOR_DGREEN    	0xAAFF82FF
#define COLOR_TUTORIAL      0x2CBD7AFF
#define COLOR_NICEGREEN     0x8DDE00FF
#define COLOR_PAYDAY		0x73bec6FF
#define COLOR_ADMRED        0xde1414FF

#define CHECKPOINT_NONE 		0
#define CHECKPOINT_HOME 		12
#define CHECKPOINT_LOCATE   	53
#define KEY_HANDBRAKE 			(128)         
#define SCMTA SendClientMessageToAll  
new MaxSeats[212] = {
4,2,2,2,4,4,1,2,2,4,2,2,2,4,2,2,4,2,4,2,4,4,2,2,2,1,4,4,4,2,1,9,1,2,2,1,2,9,4,2,
4,1,2,2,2,4,1,2,1,6,1,2,1,1,1,2,2,2,4,4,2,2,2,2,2,2,4,4,2,2,4,2,1,1,2,2,1,2,2,4,
2,1,4,3,1,1,1,4,2,2,4,2,4,1,2,2,2,4,4,2,2,2,2,2,2,2,2,4,2,1,1,2,1,1,2,2,4,2,2,1,
1,2,2,2,2,2,2,2,2,4,1,1,1,2,2,2,2,0,0,1,4,2,2,2,2,2,4,4,2,2,4,4,2,1,2,2,2,2,2,2,
4,4,2,2,1,2,4,4,1,0,0,1,1,2,1,2,2,2,2,4,4,2,4,1,1,4,2,2,2,2,6,1,2,2,2,1,4,4,4,2,
2,2,2,2,4,2,1,1,1,4,1,1
};
new VehicleSQL[MAX_VEHICLES] = {-1, ...};
//3,17,18,22,43,58,74,115,117,121,124,85


new RainBowColor[63] = {
121,80,78,181,182,183,158,222,216,231,61,228,6,219,6,194,197,145,154,241,226,229,86,234,187,
189,44,4,75,53,101,95,20,207,255,247,87,108,106,209,210,146,176,178,232,167,144,176,171,179,242,
249,248,132,43,45,17,18,21,117,132,212,3},
RainbowRed[]={74, 124, 58, 117, 121, 43, 3, 17, 18, 85, 22},
RainbowBlue[]={53,101,95,20,207,255,247,87,108,106,209,210},
RainbowGreen[]={189, 44, 86, 229, 226, 241, 154, 86, 234, 187},
RainbowYellow[]={231, 61, 228, 6, 194, 216},
r_Colors[][]={"Red", "Blue", "Green", "Yellow"};


new Float:gTruckerCP[6][3][3] = {
	{{2107.4604,-1772.5559,13.3931}, {1902.5742,2072.9832,10.8203}, {-1903.0089,822.1929,35.0156}},
	{{1465.6860,-1157.6171,23.6993}, {2091.4531,2219.4153,10.8203}, {-2463.7173,731.1428,35.0223}},
	{{2222.8184,-1160.9349,25.7331}, {1891.5741,2305.9604,10.8203}, {-1821.5892,4.0482,15.1172}},
	{{1942.3304,-1758.5311,13.3828}, {2353.3604,2756.1812,10.8203}, {-1649.9506,435.5851,7.1797}},
	{{1360.1035,-1280.4358,13.3828}, {2579.4526,2056.7419,10.8203}, {-2624.9041,214.7089,4.4984}},
	{{1844.4014,-1430.9994,13.3906}, {2585.8044,1684.7369,10.8203}, {2038.8242,57.5042,28.3906}}
}, truckerRoot[MAX_PLAYERS];

new Float:gNewTruckerCP[6][3][3] = {
	{{2139.6179,-1754.5127,13.3959}, {1853.8628,2055.2607,10.7035}, {-1903.5035,742.9004,45.2969}},
	{{1526.5319,-1163.9711,23.9063}, {2050.1270,2262.1350,10.8203}, {-2528.5117,693.3447,27.8385}},
	{{2257.1931,-1146.8032,26.6393}, {1846.7633,2275.2844,11.0004}, {-1802.1342,-102.6065,6.0680}},
	{{1983.3439,-1755.3252,13.3828}, {2393.6885,2717.0781,10.7277}, {-1666.7853,393.2119,7.0313}},
	{{1383.2676,-1243.0338,13.3828}, {2580.8965,2010.7632,10.6719}, {-2694.8425,220.4555,4.1797}},
	{{1844.4014,-1430.9994,13.3906}, {2526.1113,1715.4995,10.6797}, {-2003.0209,92.0231,27.5391}}
};

new const Float:trashObj[][] = {
	{2296.40674, 617.91541, 10.56340, 89.94000},
	{2032.99121, 1635.14746, 10.54889, 90.00000},
	{1857.54102, 2355.66968, 10.67915, 90.00000},
	{1715.25354, 1250.31763, 10.44071, 0.00000},
	{1353.02698, 483.74533, 19.87527, 22.74001},
	{1979.51379, 944.25549, 10.55433, 0.00000},
	{2564.86230, 1054.40051, 10.53339, 90.00000},
	{1683.65405, 1772.08472, 10.52151, 90.00000},
	{2922.13770, 2418.26930, 10.77070, 90.00000},
	{2267.24463, 2045.16174, 10.53708, 0.00000},
	{2469.80590, 1962.49050, 10.51617, 0.00000},
	{2823.76904, 1276.16589, 10.47549, 90.00000},
	{1378.65271, 1923.54382, 10.56059, 90.00000}
};

enum {
	INVALID_AREA_ID,
	AREA_TURF,
	AREA_CLANZONE,
	AREA_SAFEZONE,
	AREA_GARAGE,
	AREA_ATM,
}

enum {
	INVALID_INTERIOR,
	HOUSE_INTERIOR,
	BUSINESS_INTERIOR,
	HQ_INTERIOR,
	CLANHQ_INTERIOR
}
enum {
	HELPER,
	ADMIN
}

enum {
	NORMAL,
	LEGEND
}

enum {
	NICKNAME,
	CLAN,
	NUMBER
}


new Float:cp_pos_x[MAX_PLAYERS], Float:cp_pos_y[MAX_PLAYERS], Float:cp_pos_z[MAX_PLAYERS];
stock SetPlayerRaceCheckpointEx(playerid, type, Float:x, Float:y, Float:z, Float:nextx, Float:nexty, Float:nextz, Float:size) {
	SetPlayerRaceCheckpoint(playerid, CP_TYPE:type, x, y, z, nextx, nexty, nextz, size);
	cp_pos_x[playerid] = x;
	cp_pos_y[playerid] = y;
	cp_pos_z[playerid] = z;
	return true;
}

#if defined _ALS_SetPlayerRaceCheckpoint
    #undef SetPlayerRaceCheckpoint
#else
    #define _ALS_SetPlayerRaceCheckpoint
#endif
#define SetPlayerRaceCheckpoint SetPlayerRaceCheckpointEx

stock SetPlayerCheckpointEx(playerid, Float:x, Float:y, Float:z, Float:size) {
	SetPlayerCheckpoint(playerid, x, y, z, size);
	cp_pos_x[playerid] = x;
	cp_pos_y[playerid] = y;
	cp_pos_z[playerid] = z;
	return true;
}

#if defined _ALS_SetPlayerCheckpoint
    #undef SetPlayerCheckpoint
#else
    #define _ALS_SetPlayerCheckpoint
#endif
#define SetPlayerCheckpoint SetPlayerCheckpointEx

new MySQL:SQL, resetVarPTD[MAX_PLAYER_TEXT_DRAWS] = {-1, ...}, PlayerText: dailyptd2[MAX_PLAYERS][21],
	// Local
	ServerAccounts, ServerOnlinePlayers, TrivalEvent, TrivalPremium, TrivalText[30], jobTrade[MAX_PLAYERS], sql_eatstand, server_name[128], server_password[32], server_bonus, sql_lotto_bets,
	Text3D:lotto_label[MAX_PLAYERS],
	areape, bool:RestartPayday, JailGate[12], StartDate[50], FactionMembers[MAX_FACTIONS + 1], ClanMembers[MAX_CLANS],
	bussines, GateStatus, dsvehs, GpsBizzType[20], sql_jobs, sql_houses, SQL_Turfs, sql_garages, gate_mipol, //mipol_bar,
	skinlist = mS_INVALID_LISTID, TimpLicitatie, TipLicitatie, IDLicitatie, NumarLicitatie[60], LastPlayer, RestartTime, BizzTypeID[20][15],
	PaintballWinnerScore[2], PaintballWinner[2], PaintTime[2] = -1,	EventStatus, EventVW, EventInt,	glasses = mS_INVALID_LISTID, hats = mS_INVALID_LISTID, gatelvpd[3],
	ghour = 0, gminute = 0, gsecond = 0, realtime = 1,wotime = 15, timeshift = -1, shifthour, gatesfpd, sfpdbar, helper_raport, admin_raport,
	FactionChat[MAX_FACTIONS], Questions, Tax, TaxValue,gatelspd, gateng,lspdbar, gateng2,clanhqid, gString[3000], gQuery[500], request_num[MAX_PLAYERS][10],
	AreaID[MAX_AREA], AreaType[MAX_AREA], hat_trade[MAX_PLAYERS], laser_trade[MAX_PLAYERS], material_trade[MAX_PLAYERS], request_number[MAX_PLAYERS] = {-1, ...},
	// Global	
	Aduty[MAX_PLAYERS], NearPNS[MAX_PLAYERS], WarKills[MAX_PLAYERS], WarDeaths[MAX_PLAYERS], Exception[MAX_PLAYERS], InInterior[MAX_PLAYERS],InInteriorID[MAX_PLAYERS],
	TradeID[MAX_PLAYERS], TradeItems[MAX_PLAYERS], TradeReady[MAX_PLAYERS], Escape[MAX_PLAYERS], Escape2[MAX_PLAYERS], EscapeProces[MAX_PLAYERS],
	Question[MAX_PLAYERS], QuestText[MAX_PLAYERS][128],SpecClan[MAX_PLAYERS], bool:Refueling[MAX_PLAYERS], bool:is_player_death[MAX_PLAYERS],
	Blocked[MAX_PLAYERS][100], MDCOn[MAX_PLAYERS], FactionDeelay[MAX_FACTIONS + 1], CheatWarnings[MAX_PLAYERS], cerereFriends[MAX_PLAYERS] = {-1, ...}, call_player[MAX_PLAYERS] = {-1, ...},
	TurfTime[MAX_PLAYERS], License[MAX_PLAYERS], LicenseOffer[MAX_PLAYERS], togclan[MAX_PLAYERS], jobInvite[MAX_PLAYERS], GarageArea[MAX_PLAYERS] = {-1, ...},
	nameobject[MAX_VEHICLES] = {INVALID_OBJECT_ID, ...}, PlayerHit[MAX_PLAYERS], LastTextTime[MAX_PLAYERS], TextCount[MAX_PLAYERS], fishCount[MAX_PLAYERS],
	TradePlayer[MAX_PLAYERS], TradeMoney[MAX_PLAYERS], TradeType[MAX_PLAYERS], SelectedHud[MAX_PLAYERS], PlayRadio[MAX_PLAYERS], Helmet[MAX_PLAYERS], IsSafeZone[MAX_PLAYERS],
	ReportTimer[MAX_PLAYERS], DebugClanVehicleTimer[MAX_PLAYERS], DiceMoney[MAX_PLAYERS], DiceID[MAX_PLAYERS], TradeTime[MAX_PLAYERS], TotalMoney[MAX_PLAYERS], inGarage[MAX_PLAYERS], 
	Reply[MAX_PLAYERS], Freezed[MAX_PLAYERS], SpecFaction[MAX_PLAYERS], AFKSeconds[MAX_PLAYERS], HeadValue[MAX_PLAYERS], PlayerAreaID[MAX_PLAYERS], PlayerAreaType[MAX_PLAYERS],
	jobWork[MAX_PLAYERS], editObjectType[MAX_PLAYERS], vehicle_in_garage[MAX_PLAYERS][MAX_PLAYER_VEHICLE], value_report[MAX_PLAYERS],dialogID[MAX_PLAYERS],
	HaveBag[MAX_PLAYERS], BagTime[MAX_PLAYERS], toglicitatie[MAX_PLAYERS], vehicle_in_garage_pos[MAX_PLAYERS], bool:DontSpec[MAX_PLAYERS],
	PaintType[MAX_PLAYERS], PKills[MAX_PLAYERS], PDeaths[MAX_PLAYERS], PaintMap[MAX_MINIGAMES], MapVotes[MAX_MINIGAMES][6], total_vehicle_in_garage[MAX_PLAYERS],
	PaintVote[MAX_MINIGAMES], Voted[MAX_PLAYERS], PaintText[MAX_MINIGAMES], HaveFish[MAX_PLAYERS], KG[MAX_PLAYERS], JobSeconds[MAX_PLAYERS], AdText[MAX_PLAYERS][128], AdTimer[MAX_PLAYERS],
	HaveHelp[MAX_PLAYERS],HelperDuty[MAX_PLAYERS], bool:NewbieChat[MAX_PLAYERS], HaveHelper[MAX_PLAYERS], OnHelper[MAX_PLAYERS], Ajutor[MAX_PLAYERS], HelpText[MAX_PLAYERS][128], ClanRequest[MAX_PLAYERS][128],
	UsedFly[MAX_PLAYERS],JobTime[MAX_PLAYERS], WantedTime[MAX_PLAYERS], LastCar[MAX_PLAYERS], PlayerText: LoginQueuePTD[MAX_PLAYERS], PlayerText: safeTD, bool: enterVehicle[MAX_PLAYERS],
	pPret[MAX_PLAYERS], pNivel[MAX_PLAYERS], DealerCar[MAX_PLAYERS], Iterator:IsValidNos<212>, togLancher[MAX_PLAYERS], togStage[MAX_PLAYERS], togJobGoal[MAX_PLAYERS], togCrate[MAX_PLAYERS],
	togding[MAX_PLAYERS], togsurf[MAX_PLAYERS],ClanDuty[MAX_PLAYERS], StartedSpray[MAX_PLAYERS], StartedSpray2[MAX_PLAYERS], StartedSprayOn[MAX_PLAYERS], ClanProces[MAX_PLAYERS],
	szRank[MAX_PLAYERS][32], sName[MAX_PLAYERS][MAX_PLAYER_NAME], Selected[MAX_PLAYERS][50][MAX_PLAYER_NAME], pInteriorID[MAX_PLAYERS], pVirtual[MAX_PLAYERS],SInterior[MAX_PLAYERS], pDrunkLevelLast[MAX_PLAYERS],FPS2[MAX_PLAYERS],
	MoneyEarned[MAX_PLAYERS],CurseFacute[MAX_PLAYERS],JobWorking[MAX_PLAYERS],JobVehicle[MAX_PLAYERS],Trailer[MAX_PLAYERS],EditJob[MAX_PLAYERS],EditJobID[MAX_PLAYERS],togevent[MAX_PLAYERS],
	TestingModel[MAX_PLAYERS], TreeObj[MAX_PLAYERS][26], bool:InHand[MAX_PLAYERS], LumberObj[MAX_PLAYERS][6], CaseInvite[MAX_PLAYERS], CaseBattle[MAX_PLAYERS], bool: CaseType[MAX_PLAYERS] = {false, ...},
	DealerID[MAX_PLAYERS], sSlot[MAX_PLAYERS], InvitedType[MAX_PLAYERS], listitemmm[MAX_PLAYERS], debugClanVehicle[MAX_PLAYERS], sql_clans, togTransfer[MAX_PLAYERS], bool: togClanTurf[MAX_PLAYERS], report_type[MAX_PLAYERS], Iterator:newbie_players<MAX_PLAYERS>,
	InvitedBy[MAX_PLAYERS],CarRadio[MAX_VEHICLES],CarLink[MAX_VEHICLES][128], SelectedFaction[MAX_PLAYERS],PlayerSellCar[MAX_PLAYERS], SelectedItem[MAX_PLAYERS], Iterator:report_players<MAX_PLAYERS>,
	AcceptedService[MAX_PLAYERS], AcceptedPlayerService[MAX_PLAYERS][9]= {{-1,...}, ...}, tograport[MAX_PLAYERS],Fare[MAX_PLAYERS],TaxiDriver[MAX_PLAYERS], bool:TaxiDuty[MAX_PLAYERS], TaxiMoney[MAX_PLAYERS],
	SeifID[MAX_PLAYERS], SelectedPlayers[MAX_PLAYERS][50],ServerSystem[MAX_SYSTEMS], CarTrade[MAX_PLAYERS], togFriend[MAX_PLAYERS], lastPlayerInTaxi[MAX_PLAYERS], vehiclePlayerID[MAX_VEHICLES] = {INVALID_PLAYER_ID, ...},
	bool: Weapons[MAX_PLAYERS][47], WeaponAmmo[MAX_PLAYERS][47], LoginTime[MAX_PLAYERS][2], ClanSpawn[MAX_CLANS], lastKill[MAX_PLAYERS], temp_work[MAX_PLAYERS],
	EmailID[MAX_PLAYERS][10], shotTime[MAX_PLAYERS], shot[MAX_PLAYERS], total_ads, td_page[MAX_PLAYERS], bool:togLegend[MAX_PLAYERS], bool:togReborn[MAX_PLAYERS], togHeadText[MAX_PLAYERS],
 	toglc[MAX_PLAYERS], bool:Carspawn[MAX_VEHICLES], togvip[MAX_PLAYERS], togBackpack[MAX_PLAYERS], SpamCheck[MAX_PLAYERS], _bid_name[MAX_PLAYER_NAME], LastSpeed[MAX_PLAYERS],
	tazer[MAX_PLAYERS], playerDeath[MAX_PLAYERS], IsPin[MAX_PLAYERS], hideInfo[MAX_PLAYERS], Iterator:InPaint<3,MAX_PLAYERS>, rob_invite[MAX_PLAYERS],
	drug[MAX_PLAYERS],togfind[MAX_PLAYERS], TradeAccepted[MAX_PLAYERS], Iterator:youtubers<MAX_PLAYERS>, clan_trade[MAX_PLAYERS], posible_wanted[MAX_PLAYERS] = {-1, ...},
	IsSmoking[MAX_PLAYERS], targetfind[MAX_PLAYERS], WTToggle[MAX_PLAYERS], WTChannel[MAX_PLAYERS], bool:forcenamechange[MAX_PLAYERS], bool:request_name[MAX_PLAYERS], change_name[MAX_PLAYERS][24], bool:request_clan[MAX_PLAYERS],
	UsingDrugs[MAX_PLAYERS], vehEngine[MAX_VEHICLES],AcceptOffer[MAX_PLAYERS], AcceptPrice[MAX_PLAYERS], FreeOffer[MAX_PLAYERS], FreePrice[MAX_PLAYERS], MatsOffer[MAX_PLAYERS], togpremium[MAX_PLAYERS],
	MatsPrice[MAX_PLAYERS], MatsAmmo[MAX_PLAYERS],SellgunOffer[MAX_PLAYERS], SellgunPrice[MAX_PLAYERS], SellgunMats[MAX_PLAYERS], SellgunAmmo[MAX_PLAYERS], SellgunID[MAX_PLAYERS], bool: RegisrationStep[MAX_PLAYERS][4],
	Iterator:MySpec<MAX_PLAYERS,MAX_PLAYERS>, _fishObj[MAX_PLAYERS], missed_calls[MAX_PLAYERS][13], laserStock[2] = {2, 2}, payday_power,
	TakingLesson[MAX_PLAYERS], UsedFind[MAX_PLAYERS], player_selected[MAX_PLAYERS], route_selected[MAX_PLAYERS], bid_money, Iterator:logged_players<MAX_PLAYERS>,
	TicketOffer[MAX_PLAYERS], TicketMoney[MAX_PLAYERS], SkinTrade[MAX_PLAYERS], PlayerStoned[MAX_PLAYERS], SpawnChange[MAX_PLAYERS], FactionSpawn[MAX_PLAYERS], MoneyTrade[MAX_PLAYERS],
	MiliardTrade[MAX_PLAYERS], Iterator:clan_players<MAX_CLANS,MAX_PLAYERS>, report_by[MAX_PLAYERS][24], playerIP[MAX_PLAYERS][16],
	PlayerTied[MAX_PLAYERS],PlayerCuffed[MAX_PLAYERS], PlayerCuffed2[MAX_PLAYERS], PlayerCuffedTime[MAX_PLAYERS], PlayerTazeTime[MAX_PLAYERS], LiveOffer[MAX_PLAYERS], TalkingLive[MAX_PLAYERS],
	CP[MAX_PLAYERS],SpawnActor, HouseTrade[MAX_PLAYERS], Bar: giftbar, Text: _giftboxTD, report_ago[MAX_PLAYERS], InLesson[MAX_PLAYERS], Lesson[MAX_PLAYERS],
	RepairOffer[MAX_PLAYERS], RepairPrice[MAX_PLAYERS],RefillOffer[MAX_PLAYERS], RefillPrice[MAX_PLAYERS], RepairCar[MAX_PLAYERS], Rapairx[MAX_PLAYERS], Refillx[MAX_PLAYERS],
	TransferMoney[MAX_PLAYERS], DrugOffer[MAX_PLAYERS],DrugPrice[MAX_PLAYERS], DrugGram[MAX_PLAYERS], OnDuty[MAX_PLAYERS], VehicleRent[MAX_PLAYERS], bool:TerminatJobGoal = false,
	gPlayerLogTries[MAX_PLAYERS], gLastCar[MAX_VEHICLES], gOoc[MAX_PLAYERS], gNews[MAX_PLAYERS], gFam[MAX_PLAYERS],RentStock[10] = {30, ...}, FishTimer[MAX_PLAYERS],
	BusinessTrade[MAX_PLAYERS], HiddenTrade[MAX_PLAYERS], PlayerPickup[MAX_PLAYERS], PlayerTextID[MAX_PLAYERS][MAX_PLAYER_TEXT_DRAWS] = {-1,...}, TextID[MAX_TEXT_DRAWS] = {-1, ...},
	PlayerText: HPAlert, togjob[MAX_PLAYERS], tograinbow[MAX_PLAYERS], PlayerText: CpTDD, PlayerText: HudTD[2], PlayerText: InfoPTD, Iterator:Acovers<MAX_PLAYERS>,
	Text3D:deathLabel[MAX_PLAYERS], Text3D:vipLabel[MAX_PLAYERS], PlayerBar:HudProgress[MAX_PLAYERS][3], EnableBoast[MAX_PLAYERS], Text: CSTD, playerKills[MAX_PLAYERS], Iterator:player_in_blocks[MAX_PLAYERS]<MAX_PLAYERS>,
	Iterator:Staff<2,MAX_PLAYERS>, Iterator:report<3,MAX_PLAYERS>, Iterator:IsSpeed<MAX_PLAYERS>, Text3D:Pet[MAX_PLAYERS], StepExam[MAX_PLAYERS], ExamTime[MAX_PLAYERS], VehicleKey[MAX_PLAYERS],
 	listitemm[MAX_PLAYERS], Float: VehicleHealth[MAX_PLAYERS], TradeTicket[MAX_PLAYERS][2], hideHungry[MAX_PLAYERS], Iterator:freq_members<100 + 1, MAX_PLAYERS>,
	PlayerText:FindSkinTD,Text: RegisterTD[14], TimerPayDay[MAX_PLAYERS], VoucherTrade[MAX_PLAYERS][5], Iterator:FactionVehicle<9,MAX_VEHICLES>, 
	Text: StageTD[2], PlayerText: StagePTD, SkinsActions[MAX_PLAYERS], Text: LoginTD[2], PlayerText: GunPTD, Iterator:faction_leaders<MAX_PLAYERS>,
	CrateModel[MAX_PLAYERS], PlayerText: GoalPTD, TimerInfo[MAX_PLAYERS], GunObject[MAX_PLAYERS], ServerStock[9], UnFreezeTimer[MAX_PLAYERS], p_Ticket[MAX_PLAYERS], c_Ticket[MAX_PLAYERS],
	Text:DataT[3], PlayerText: BancaTD, PlayerText: RegisterPTD[MAX_PLAYERS][7], CarEID[MAX_PLAYERS], PlayerText: PinPTD[11], PinInsert[MAX_PLAYERS][10],
	PlayerText: CratePTD[MAX_PLAYERS][2], Text: CrateTD[4], CrateTime[MAX_PLAYERS], ShopType[MAX_PLAYERS], EditVehicleID[MAX_PLAYERS], PlayerText: MissionTD, GunID[MAX_PLAYERS], Iterator:servicePlayers<9,MAX_PLAYERS>, Iterator:faction_players<MAX_FACTIONS+1,MAX_PLAYERS>,
    PlayerText: SkinsPTD[11], Text: SkinsTD[11], AlegeCrates[MAX_PLAYERS], RegisterPass[MAX_PLAYERS][32], RegisterReferral[MAX_PLAYERS][64], BetPacanele[MAX_PLAYERS], TotalBet[MAX_PLAYERS],
    masinaRainbow[MAX_PLAYERS], masinaStage[MAX_PLAYERS], K[MAX_PLAYERS], Text: GunTD[3], SQL_clanzone, Iterator:Rainbows<4,MAX_PLAYERS>, deelayTaxi[MAX_PLAYERS], ClanID[MAX_CLANS],
    Iterator:MyVehicle<MAX_PLAYERS+MAX_CLANS,MAX_VEHICLES>, Iterator:LoginQueue<2,MAX_PLAYERS>, PlayerText: InfoEx[3], PlayerRainbow[MAX_PLAYERS], PlayerStage[MAX_PLAYERS],
    Iterator:PlayerVips<2,MAX_PLAYERS>, Iterator:PlayerPremiums<MAX_PLAYERS>,	PnsTimer[MAX_PLAYERS], LastPns[MAX_PLAYERS] = {-1, ...}, Iterator:PersonalVSpawned<MAX_VEHICLES>, MyVehicleSpawn[MAX_PLAYERS], Iterator:RadioCount<MAX_RADIO,MAX_PLAYERS>,
	Spectate[MAX_PLAYERS],	CellTime[MAX_PLAYERS], HidePM[MAX_PLAYERS], PhoneOnline[MAX_PLAYERS], PhoneCalls[MAX_PLAYERS], PhoneMessages[MAX_PLAYERS], TurfsDisp[MAX_PLAYERS], IsPlayerOnTurf[MAX_PLAYERS], pizzaProgress[MAX_PLAYERS][4], Iterator:turf_in_war<MAX_TURFS>,
	Mobile[MAX_PLAYERS],DeelayCommand[MAX_PLAYERS][35],Combo[MAX_PLAYERS],DMGTimer[MAX_PLAYERS], InExamen[MAX_PLAYERS], ExamCar[MAX_PLAYERS],JobDeelay[MAX_PLAYERS], bool:Float_payday=false,
	togAdmin[MAX_PLAYERS], togHelper[MAX_PLAYERS], Iterator:server_Vehicles<MAX_SPAWNED_CARS>,

	// factions raport //
	FactionRaport[MAX_FACTIONS + 1][7 + 1][3],

	// Textdraws		
	Text: Jailtime[MAX_PLAYERS], Text: TradeTD[21], Text: txtDateDisp, Text: txtTimeDisp,	Text: CountTD, Text: ShopTD[5], Text:AccsTD[5], PlayerText:AccsPTD[3], PlayerText: dutyTD,
	
	PlayerText: UndercoverTD, PlayerText: CpTD, PlayerText: DMGTD[2], PlayerText: TradePTD[MAX_PLAYERS][7], Text: GoalTD[2], Text: CaseTD[3], PlayerText: CasePTD[9],
	PlayerText: TradeIcon[MAX_PLAYERS][10], PlayerText: TradeTitle[MAX_PLAYERS][10], PlayerText: JobTD, PlayerText: ShopTDs[2], PlayerText: InfosTD, 
	PlayerText: PaintTD, PlayerText: ShowFPS, PlayerText: SpeedometerPTD[3], Text: PinTD[8], PlayerText: HungreyTD, Text:GarageTD[5], PlayerText:GaragePTD,
	PlayerText: CeasPTD, Text: CeasTD, PlayerText: InfoDS, Text: ExamTD[8], PlayerText: ExamPTD[MAX_PLAYERS][5], Text: GiftTD[2], Text: CollectTD[3], Text:PizzaTD[11], PlayerText:PizzaPTD,
	PlayerText: FindTD, PlayerText: SpectatorTD, PlayerText: WantedTD, PlayerText:GarbagePTD, Text: RaceTD[3], PlayerText:ChatCMD,
	PlayerText: CleoTD[2], PlayerText: FareTD, PlayerText: TestTD, Text: DSTD[6], Text: ShardTD[4], PlayerText: ShardPTD[5], PlayerText: RacePTD[3],
	PlayerText: GamePTD[7], Text: ReportTD, PlayerText:RobTD,
	PlayerText: LogoPlayer, Text: Logo,
	
	Text3D:areap, Text3D: LabelCrates, Text3D: LabelCrates1, Text3D: LabelCrates2,
	// Vehicles
	ttcgate[3],gLastDriver[600],Gas[MAX_VEHICLES] = {100, ...},
	// Float
	Float: pPos[MAX_PLAYERS][3], Float:etp[5], Float: TeleportDest[MAX_PLAYERS][3], Float: LastPos[MAX_PLAYERS][3], Float: Health[MAX_PLAYERS], Float: Armour[MAX_PLAYERS],
	PlayerText:drop_dmg;

new Text:DailyPTD1[5];
new PlayerText:DailyPTD[MAX_PLAYERS][20];

new BigInt:money[MAX_PLAYERS];
new BigInt:bank[MAX_PLAYERS];
new BigInt:serverGoal;

#undef GetIP
#define GetIP(%0)				playerIP[%0]

new NeonColor[7][10] = {
	{"FFFFFF"},
	{"ff00c9"},
	{"fff000"},
	{"64ff00"},
	{"0046ff"},
	{"ff0400"},
	{"ff0400"}
};

enum _sInfo {_sID, Float:_sX, Float:_sY, Float:_sZ, Float:_sRot}
new standInfo[MAX_STAND][_sInfo];

redist::ShowPlayerDialogEx(playerid, dialogid, dialogtype, const title[], const string[], const btn1[], const btn2[]) {
	dialogID[playerid] = dialogid;
	return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE:dialogtype, title, string, btn1, btn2);
}	

#if defined _ALS_ShowPlayerDialog
    #undef ShowPlayerDialog
#else
    #define _ALS_ShowPlayerDialog
#endif
#define ShowPlayerDialog ShowPlayerDialogEx

stock SetPlayerWantedLevelEx(playerid, level) {
	SetPlayerWantedLevel(playerid, level);
	PlayerInfo[playerid][pWantedLevel]=level;
	return level?Iter_Add(servicePlayers<8>, playerid):Iter_Remove(servicePlayers<8>, playerid);
}

#if defined _ALS_SetPlayerWantedLevel
    #undef SetPlayerWantedLevel
#else
    #define _ALS_SetPlayerWantedLevel
#endif
#define SetPlayerWantedLevel SetPlayerWantedLevelEx

#define FindSpawnID(%0) 	VehicleSQL[%0]
#define IsPlayerLogged(%0)  Iter_Contains(logged_players, %0)

stock IsComponentidCompatible(modelid, componentid) {
	switch componentid do { case 1025, 1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080, 1081, 1082, 1083, 1084, 1085, 1096, 1097, 1098, 1087, 1086: return true; }
    switch(modelid)
    {
        case 400: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 401: return (componentid == 1005 || componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 114 || componentid == 1020 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003 || componentid == 1017 || componentid == 1007);
        case 402: return (componentid == 1009 || componentid == 1009 || componentid == 1010);
        case 404: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007);
        case 405: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1014 || componentid == 1023 || componentid == 1000);
        case 409: return (componentid == 1009);
        case 410: return (componentid == 1019 || componentid == 1021 || componentid == 1020 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
        case 411: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 412: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 415: return (componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
        case 418: return (componentid == 1020 || componentid == 1021 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1016);
        case 419: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 420: return (componentid == 1005 || componentid == 1004 || componentid == 1021 || componentid == 1019 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1003);
        case 421: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1023 || componentid == 1016 || componentid == 1000);
        case 422: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1017 || componentid == 1007);
        case 426: return (componentid == 1005 || componentid == 1004 || componentid == 1021 || componentid == 1019 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003);
        case 429: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 436: return (componentid == 1020 || componentid == 1021 || componentid == 1022 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003 || componentid == 1017 || componentid == 1007);
        case 438: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 439: return (componentid == 1003 || componentid == 1023 || componentid == 1001 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1017 || componentid == 1007 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1013);
        case 442: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 445: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 451: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 458: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 466: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 467: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 474: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 475: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 477: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1017 || componentid == 1007);
        case 478: return (componentid == 1005 || componentid == 1004 || componentid == 1012 || componentid == 1020 || componentid == 1021 || componentid == 1022 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 479: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 480: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 489: return (componentid == 1005 || componentid == 1004 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1016 || componentid == 1000);
        case 491: return (componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
        case 492: return (componentid == 1005 || componentid == 1004 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1016 || componentid == 1000);
        case 496: return (componentid == 1006 || componentid == 1017 || componentid == 1007 || componentid == 1011 || componentid == 1019 || componentid == 1023 || componentid == 1001 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1003 || componentid == 1002 || componentid == 1142 || componentid == 1143 || componentid == 1020);
        case 500: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 506: return (componentid == 1009);
        case 507: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 516: return (componentid == 1004 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1015 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007);
        case 517: return (componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1023 || componentid == 1016 || componentid == 1003 || componentid == 1017 || componentid == 1007);
        case 518: return (componentid == 1005 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
        case 526: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 527: return (componentid == 1021 || componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1014 || componentid == 1015 || componentid == 1017 || componentid == 1007);
        case 529: return (componentid == 1012 || componentid == 1011 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
        case 533: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 534: return (componentid == 1126 || componentid == 1127 || componentid == 1179 || componentid == 1185 || componentid == 1100 || componentid == 1123 || componentid == 1125 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1180 || componentid == 1178 || componentid == 1101 || componentid == 1122 || componentid == 1124 || componentid == 1106);
        case 535: return (componentid == 1109 || componentid == 1110 || componentid == 1113 || componentid == 1114 || componentid == 1115 || componentid == 1116 || componentid == 1117 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1120 || componentid == 1118 || componentid == 1121 || componentid == 1119);
        case 536: return (componentid == 1104 || componentid == 1105 || componentid == 1182 || componentid == 1181 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1184 || componentid == 1183 || componentid == 1128 || componentid == 1103 || componentid == 1107 || componentid == 1108);
        case 540: return (componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007);
        case 541: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 542: return (componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1015);
        case 545: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 546: return (componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007);
        case 547: return (componentid == 1142 || componentid == 1143 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1016 || componentid == 1003 || componentid == 1000);
        case 549: return (componentid == 1012 || componentid == 1011 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
        case 550: return (componentid == 1005 || componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003);
        case 551: return (componentid == 1005 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1023 || componentid == 1016 || componentid == 1003);
        case 555: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 558: return (componentid == 1092 || componentid == 1089 || componentid == 1166 || componentid == 1165 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1168 || componentid == 1167 || componentid == 1088 || componentid == 1091 || componentid == 1164 || componentid == 1163 || componentid == 1094 || componentid == 1090 || componentid == 1095 || componentid == 1093);
        case 559: return (componentid == 1065 || componentid == 1066 || componentid == 1160 || componentid == 1173 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1159 || componentid == 1161 || componentid == 1162 || componentid == 1158 || componentid == 1067 || componentid == 1068 || componentid == 1071 || componentid == 1069 || componentid == 1072 || componentid == 1070 || componentid == 1009);
        case 560: return (componentid == 1028 || componentid == 1029 || componentid == 1169 || componentid == 1170 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1141 || componentid == 1140 || componentid == 1032 || componentid == 1033 || componentid == 1138 || componentid == 1139 || componentid == 1027 || componentid == 1026 || componentid == 1030 || componentid == 1031);
        case 561: return (componentid == 1064 || componentid == 1059 || componentid == 1155 || componentid == 1157 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1154 || componentid == 1156 || componentid == 1055 || componentid == 1061 || componentid == 1058 || componentid == 1060 || componentid == 1062 || componentid == 1056 || componentid == 1063 || componentid == 1057);
        case 562: return (componentid == 1034 || componentid == 1037 || componentid == 1171 || componentid == 1172 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1149 || componentid == 1148 || componentid == 1038 || componentid == 1035 || componentid == 1147 || componentid == 1146 || componentid == 1040 || componentid == 1036 || componentid == 1041 || componentid == 1039);
        case 565: return (componentid == 1046 || componentid == 1045 || componentid == 1153 || componentid == 1152 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1150 || componentid == 1151 || componentid == 1054 || componentid == 1053 || componentid == 1049 || componentid == 1050 || componentid == 1051 || componentid == 1047 || componentid == 1052 || componentid == 1048);
        case 566: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 567: return (componentid == 1129 || componentid == 1132 || componentid == 1189 || componentid == 1188 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1187 || componentid == 1186 || componentid == 1130 || componentid == 1131 || componentid == 1102 || componentid == 1133);
        case 575: return (componentid == 1044 || componentid == 1043 || componentid == 1174 || componentid == 1175 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1176 || componentid == 1177 || componentid == 1099 || componentid == 1042);
        case 576: return (componentid == 1136 || componentid == 1135 || componentid == 1191 || componentid == 1190 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1192 || componentid == 1193 || componentid == 1137 || componentid == 1134);
        case 579: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 580: return (componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007);
        case 585: return (componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
        case 587: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 589: return (componentid == 1005 || componentid == 1004 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1024 || componentid == 1013 || componentid == 1006 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007);
        case 600: return (componentid == 1005 || componentid == 1004 || componentid == 1020 || componentid == 1022 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1017 || componentid == 1007);
        case 602: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
        case 603: return (componentid == 1144 || componentid == 1145 || componentid == 1142 || componentid == 1143 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007);
    }
    return false;
}


enum {
	INVALID_VEH_TOGGLE,
	TOGGLE_VEH_ENGINE,
	TOGGLE_VEH_LIGHTS,
	TOGGLE_VEH_ALARM,
	TOGGLE_VEH_DOORS,
	TOGGLE_VEH_BONNET,
	TOGGLE_VEH_BOOT,
	TOGGLE_VEH_OBJECTIVE
}

#define compare(%0,%1) \
	!strcmp(%0,%1,true)

stock toggleVehicleParams(const vehicleid, toggleid=0, engine=0, lights=0, alarm=0, doors=0, bonnet=0, boot=0, objective=0) {
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	switch(toggleid) {
		case INVALID_VEH_TOGGLE: return false;
		case TOGGLE_VEH_ENGINE: SetVehicleParamsEx(vehicleid, !engine, lights, alarm, doors, bonnet, boot, objective), vehEngine[vehicleid] = !engine;
		case TOGGLE_VEH_LIGHTS: SetVehicleParamsEx(vehicleid, engine, !lights, alarm, doors, bonnet, boot, objective);
		case TOGGLE_VEH_ALARM: SetVehicleParamsEx(vehicleid, engine, lights, !alarm, !doors, bonnet, boot, objective);
		case TOGGLE_VEH_BONNET: SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, !bonnet, boot, objective);
		case TOGGLE_VEH_BOOT: SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, !boot, objective);
		case TOGGLE_VEH_OBJECTIVE: SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, !boot, !objective);
	}
	return true;
}