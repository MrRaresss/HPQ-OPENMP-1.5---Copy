/*
	0 = disabled
	1 = enabled
*/

new bLevels[][] = {"", "Standard", "Medium", "High quality"};

enum e_BACKPACK {
	e_PP,
	e_BP
}
new bPrice[][e_BACKPACK] = {
	{0, 1}, {500, 2500}, {500, 5000}
};

cmd:backpack(playerid, params[]) {
	if(!PlayerInfo[playerid][pVip]) return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Doar utilizatorii VIP au acces la aceasta comanda.");

	format(gQuery, sizeof(gQuery), "{daa520}[+] Upgrade to backpack level %d", PlayerInfo[playerid][pBackpackLevel]+1);

	format(gString, sizeof gString, "\
	{FFFFFF}Backpack: {ffff00}%s (level: %d/3)\n\
	{FFFFFF}Backpack Capacity: {ffff00}%d fishs / %d flour sacks\n\
	{FFFFFF}Backpack Status: %s\n\
	%s", 
	bLevels[PlayerInfo[playerid][pBackpackLevel]], PlayerInfo[playerid][pBackpackLevel],
	PlayerInfo[playerid][pBackpackLevel]+1, PlayerInfo[playerid][pBackpackLevel]+1,
	togBackpack[playerid]?("{3BBF0B}Enabled"):("{ff0000}Disabled"), 
	PlayerInfo[playerid][pBackpackLevel]<3?(gQuery):(""));
	Dialog_Show(playerid, backpack_system, DIALOG_STYLE_LIST, "Backpack Menu", gString, "Select", "Cancel");
	return true;
}

Dialog:backpack_system(playerid, response, listitem, inputtext[])
{
    if(!response) return true;
    switch(listitem) {
    	case 2: {
    		togBackpack[playerid] = !togBackpack[playerid];
			UpdateVar(playerid, "TogBackpack", togBackpack[playerid]);

			SCMf(playerid, -1, "Backpack: %s", togBackpack[playerid]?"{3BBF0B}Enabled":"{FF0000}Disabled");
			if(togBackpack[playerid]==1) {
				print("atat");
				switch(PlayerInfo[playerid][pBackpackLevel]) {
					case 1: {
						//nimic, backpack level 1 nu ii se aplica nicio textura (culoare)
						print("1");
						PlayerInfo[playerid][pBackpack] = SetPlayerAttachedObject(playerid, 8, 3026, 1, -0.172813, -0.112569, -0.022387, 0.000000, 0.000000, 3.390071, 1.000000, 1.000000, 1.130721);
					}
					case 2: {
						PlayerInfo[playerid][pBackpack] = SetPlayerAttachedObject(playerid, 8, 3026, 1, -0.172813, -0.112569, -0.022387, 0.000000, 0.000000, 3.390071, 1.000000, 1.000000, 1.130721, 0xff2ecc71);
						print("2");
					}
					case 3: {
						PlayerInfo[playerid][pBackpack] = SetPlayerAttachedObject(playerid, 8, 3026, 1, -0.172813, -0.112569, -0.022387, 0.000000, 0.000000, 3.390071, 1.000000, 1.000000, 1.130721, 0xffff0000);
						print("3");
					}
				}
			}
			else if(togBackpack[playerid]==0) RemovePlayerAttachedObject(playerid, 8);
    	}
    	case 3: {
    		format(gQuery, sizeof(gQuery), "Backpack Upgrade (level %d)", PlayerInfo[playerid][pBackpackLevel]+1);
    		format(gString, sizeof(gString), "Esti sigur ca vrei sa achizitionezi backpack level %d?\nPret: %d premium points & %d bpoints.", PlayerInfo[playerid][pBackpackLevel]+1, bPrice[PlayerInfo[playerid][pBackpackLevel]][e_PP], bPrice[PlayerInfo[playerid][pBackpackLevel]][e_BP]);
    		Dialog_Show(playerid, backpack_upgrade, DIALOG_STYLE_MSGBOX, gQuery, gString, "Yes", "No");
    	}
    }
    return 1;
}

Dialog:backpack_upgrade(playerid, response, listitem, inputtext[])
{
    if(!response) return true;
    SCMf(playerid, COLOR_YELLOW, "Ti-ai upgradat cu succes backpack-ul la nivel %d. (-%d pp & %dbp)", PlayerInfo[playerid][pBackpackLevel]+1, bPrice[PlayerInfo[playerid][pBackpackLevel]][e_PP], bPrice[PlayerInfo[playerid][pBackpackLevel]][e_BP]);
    PlayerInfo[playerid][pBackpackLevel] += 1; 
    PlayerInfo[playerid][pPremiumPoints] -= bPrice[PlayerInfo[playerid][pBackpackLevel]-1][e_PP];
    PlayerInfo[playerid][pBPoints] -= bPrice[PlayerInfo[playerid][pBackpackLevel]-1][e_BP];
    _query("UPDATE `users` SET `BackpackLevel`='%i' WHERE `ID`='%i'", PlayerInfo[playerid][pBackpackLevel], PlayerInfo[playerid][pSQLID]);

    switch(PlayerInfo[playerid][pBackpackLevel]) {
		case 1: {
			//nimic, backpack level 1 nu ii se aplica nicio textura (culoare)
		}
		case 2: {
			SetPlayerObjectMaterial(playerid, PlayerInfo[playerid][pBackpack], 0, 3026, "none", "none", 0x2ecc71FF);
		}
		case 3: {
			SetPlayerObjectMaterial(playerid, PlayerInfo[playerid][pBackpack], 0, 3026, "none", "none", 0xff0000FF);
		}
	}
    return 1;
}

cmd:debugbackpack(playerid) {
	SCMf(playerid, -1, "tog %d | level %d | backpack %d", togBackpack[playerid], PlayerInfo[playerid][pBackpackLevel], PlayerInfo[playerid][pBackpack]);
	return true;
}