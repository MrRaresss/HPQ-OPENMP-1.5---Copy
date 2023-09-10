new 
	PlayerText:machine_TD[MAX_PLAYERS][47], bool:toggleAuto[MAX_PLAYERS], 
	machine_Bet[MAX_PLAYERS], bool:machine_in_progress[MAX_PLAYERS], rMP[MAX_PLAYERS],
	m_collumn[MAX_PLAYERS][15], r_m_collumn[15] = {-1,...}, winCredits[MAX_PLAYERS],
	lastCard[MAX_PLAYERS]
;

static const object_machine[7] = {1247, 1241, 1314, 1276, 1240, 1254, 1274};
static const object_machine_reward[7][3] = {{10, 40, 100}, {4, 10, 40}, {4, 10, 40}, {10, 40, 100}, {4, 10, 40}, {4, 10, 40}, {20, 200, 1000}};

new const Float:machine_pos[63][3] = {
	{2221.9761,1613.6327,1006.2},
	{2221.9519,1613.6327,1006.2},
	{2220.7271,1613.6327,1006.2},
	{2219.4412,1613.6327,1006.2},
	{2217.8982,1613.6327,1006.2},
	{2216.6143,1613.6327,1006.2},
	{2215.3730,1613.6327,1006.2},
	{2215.2871,1593.4922,1006.2},
	{2216.5803,1593.4922,1006.2},
	{2217.8784,1593.4922,1006.2},
	{2219.4653,1593.4922,1006.2},
	{2220.6946,1593.4922,1006.2},
	{2221.9045,1593.4922,1006.2},
	{2251.8433,1609.0236,1006.2},
	{2253.0916,1609.0236,1006.2},
	{2254.3572,1609.0236,1006.2},
	{2255.9817,1609.0236,1006.2},
	{2257.2676,1609.0236,1006.2},
	{2258.5098,1609.0236,1006.2},
	{2268.6563,1610.0208,1006.2},
	{2268.6563,1608.7550,1006.2},
	{2268.6563,1607.4374,1006.2},
	{2268.6563,1605.8323,1006.2},
	{2268.6563,1604.6045,1006.2},
	{2268.6563,1603.2960,1006.2},
	{2215.3020,1617.9688,1006.2},
	{2215.9529,1617.9688,1006.2},
	{2216.6270,1617.9688,1006.2},
	{2217.2644,1617.9688,1006.2},
	{2217.9202,1617.9688,1006.2},
	{2219.5164,1617.9688,1006.2},
	{2220.1079,1617.9688,1006.2},
	{2220.7527,1617.9688,1006.2},
	{2221.3914,1617.9688,1006.2},
	{2221.9875,1617.9688,1006.2},
	{2216.4480,1605.0542,1006.2},
	{2216.4480,1602.8094,1006.2},
	{2218.1304,1604.9969,1006.2},
	{2218.1301,1602.7886,1006.2},
	{2220.1033,1605.0775,1006.2},
	{2220.1038,1602.8341,1006.2},
	{2221.7866,1605.0376,1006.2},
	{2221.7864,1602.8112,1006.2},
	{2221.9561,1589.1877,1006.2},
	{2221.2627,1589.1877,1006.2},
	{2220.6536,1589.1877,1006.2},
	{2220.0718,1589.1877,1006.2},
	{2219.3972,1589.1877,1006.2},
	{2217.8047,1589.1877,1006.2},
	{2217.1069,1589.1877,1006.2},
	{2216.6008,1589.1877,1006.2},
	{2215.9885,1589.1877,1006.2},
	{2215.3071,1589.1877,1006.2},
	{2251.8684,1616.9611,1006.2},
	{2252.5283,1616.9611,1006.2},
	{2253.1265,1616.9611,1006.2},
	{2253.8323,1616.9611,1006.2},
	{2254.3530,1616.9611,1006.2},
	{2255.9702,1616.9611,1006.2},
	{2256.5930,1616.9611,1006.2},
	{2257.2285,1616.9611,1006.2},
	{2257.9458,1616.9611,1006.2},
	{2258.4666,1616.9611,1006.2}
};

stock showMachine(playerid) {
	if(player_selected[playerid]) return true;

	loadPlayerMachineTD(playerid);

	machine_Bet[playerid] = 0;
	rMP[playerid] = 1;
	machine_in_progress[playerid] = false;
	m_collumn[playerid] = r_m_collumn;
	lastCard[playerid] = 0;

	SetPlayerCameraPos(playerid, 2230.718750, 1570.108520, 1013.678466);
	SetPlayerCameraLookAt(playerid, 2234.230468, 1569.698974, 1010.142944);
	SetPlayerInterior(playerid, 1);
	SelectTextDraw(playerid, 0xA9D549FF);
	new i=-1;
	while(++i<22) PlayerTextDrawShow(playerid, machine_TD[playerid][i]);
	player_selected[playerid] = 21;
	return true;
}

stock startMachine(playerid) {
	if(!machine_Bet[playerid] || PlayerInfo[playerid][pCasinoCredit] < machine_Bet[playerid])
		return true;

	PlayerInfo[playerid][pCasinoCredit] -= machine_Bet[playerid];
	machine_in_progress[playerid] = true;
	SetTimerEx(#machine_rolling__, 300, false, "i", playerid);
	PlayerPlaySound(playerid, 1, 0.0, 0.0, 0.0);
	return true;
}

redist::machine_rolling__(playerid) {
	PlayerTextDrawSetPreviewModel(playerid, 
		machine_TD[playerid][++rMP[playerid]], 
		object_machine[(m_collumn[playerid][rMP[playerid]-1]=random(7))]
	);
	PlayerTextDrawShow(playerid, machine_TD[playerid][rMP[playerid]]);
	if(rMP[playerid] < 16) SetTimerEx(#machine_rolling__, 300, false, "i", playerid);
	else {
		new x=-1;
		while(++x<7) {
			if(m_collumn[playerid][0] == x && m_collumn[playerid][4] == x && m_collumn[playerid][8] == x) 
				return finishMachine(playerid, x, 0, 1);

			if(m_collumn[playerid][3] == x && m_collumn[playerid][4] == x && m_collumn[playerid][6] == x) 
				return finishMachine(playerid, x, 0, 1);

			if(m_collumn[playerid][0] == x && m_collumn[playerid][3] == x && m_collumn[playerid][6] == x) 
				return finishMachine(playerid, x, 0+_:(m_collumn[playerid][9]==x)+_:(m_collumn[playerid][12]==x), 0);

			if(m_collumn[playerid][1] == x && m_collumn[playerid][4] == x && m_collumn[playerid][7] == x) 
				return finishMachine(playerid, x, 0+_:(m_collumn[playerid][10]==x)+_:(m_collumn[playerid][13]==x), 0);

			if(m_collumn[playerid][2] == x && m_collumn[playerid][5] == x && m_collumn[playerid][8] == x) 
				return finishMachine(playerid, x, 0+_:(m_collumn[playerid][11]==x)+_:(m_collumn[playerid][14]==x), 0);
		}
		va_SendClientMessage(playerid, COLOR_MONEY, "(-) Ai pierdut %d credite!", machine_Bet[playerid]), GameTextForPlayer(playerid, "~r~YOU LOSE!", 2000, 6);
		SetTimerEx(#restart_machine__, 1000, false, "i", playerid);
	}
	return true;
}

redist::restart_machine__(playerid) {
	new i=-1;
	machine_in_progress[playerid] = false;
	m_collumn[playerid] = r_m_collumn;
	rMP[playerid] = 1;
	while(++i<15) PlayerTextDrawSetPreviewModel(playerid, machine_TD[playerid][i+2], 23424), PlayerTextDrawShow(playerid, machine_TD[playerid][i+2]);
	if(toggleAuto[playerid]) {
		if(!machine_Bet[playerid] || PlayerInfo[playerid][pCasinoCredit] < machine_Bet[playerid])
			return true;

		SetTimerEx(#machine_rolling__, 300, false, "i", playerid);
		machine_in_progress[playerid] = true;
		PlayerInfo[playerid][pCasinoCredit] -= machine_Bet[playerid];
	}
	return true;
}

redist::finishMachine(playerid, prize, linie, type) {
	winCredits[playerid] = object_machine_reward[prize][linie]*machine_Bet[playerid];
	va_SendClientMessage(playerid, COLOR_MONEY, "(+) Ai castigat %d credite!", winCredits[playerid]), GameTextForPlayer(playerid, "~g~YOU WIN!", 1000, 6);
	SetTimerEx(#double_machine__, 1000, false, "i", playerid);
	return true;
}

redist::double_machine__(playerid) {
	new i=35;
	while(++i<47) PlayerTextDrawShow(playerid, machine_TD[playerid][i]); i=1;
	while(++i<22) PlayerTextDrawHide(playerid, machine_TD[playerid][i]);
	PlayerTextDrawShow(playerid, machine_TD[playerid][17]);
	player_selected[playerid] = 23;
	machine_in_progress[playerid] = false;

	va_PlayerTextDrawSetString(playerid, machine_TD[playerid][36], "miza gamble~n~~y~%d credite", winCredits[playerid]);
	va_PlayerTextDrawSetString(playerid, machine_TD[playerid][37], "castig cu gamble~n~~y~%d credite", winCredits[playerid] * 2);
	return true;
}

redist::chooseCardMachine(playerid, chooseid) {
	if(machine_in_progress[playerid]) return true;
	new win;
	if((win=random(13+13)) < 13) {
		if(!chooseid) va_SendClientMessage(playerid, COLOR_MONEY, "(-) Ai pierdut (gambling): %d credite!", winCredits[playerid]), GameTextForPlayer(playerid, "~r~YOU LOSE!", 2000, 6), winCredits[playerid]=0, SetTimerEx(#resetCardMachine, 1000, false, "i", playerid);
		else {
			winCredits[playerid] *= 2;
			va_SendClientMessage(playerid, COLOR_MONEY, "(+) Ai castigat (gambling): %d credite!", winCredits[playerid]), GameTextForPlayer(playerid, "~g~YOU WIN!", 1000, 6);
		}
	} else {
		if(chooseid) va_SendClientMessage(playerid, COLOR_MONEY, "(-) Ai pierdut (gambling): %d credite!", winCredits[playerid]), GameTextForPlayer(playerid, "~r~YOU LOSE!", 2000, 6), winCredits[playerid]=0, SetTimerEx(#resetCardMachine, 1000, false, "i", playerid);
		else {
			winCredits[playerid] *= 2;
			va_SendClientMessage(playerid, COLOR_MONEY, "(+) Ai castigat (gambling): %d credite!", winCredits[playerid]), GameTextForPlayer(playerid, "~g~YOU WIN!", 1000, 6);
		}
	}

	va_PlayerTextDrawSetString(playerid, machine_TD[playerid][(lastCard[playerid]%5)+39], "LD_CARD:cd%d%s", (win%13)+1, win/13?("d"):("c"));
	va_PlayerTextDrawSetString(playerid, machine_TD[playerid][46], "LD_CARD:cd%d%s", (win%13)+1, win/13?("d"):("c"));
	machine_in_progress[playerid] = true; ++lastCard[playerid];
	SetTimerEx(#reset_chooseCard, 1000, false, "i", playerid);
	return true;
}

redist::resetCardMachine(playerid) {
	PlayerInfo[playerid][pCasinoCredit] += winCredits[playerid];
	winCredits[playerid] = 0;
	new i=35;
	while(++i<47) PlayerTextDrawHide(playerid, machine_TD[playerid][i]); i=1;
	while(++i<22) PlayerTextDrawShow(playerid, machine_TD[playerid][i]);
	SetTimerEx(#restart_machine__, 1000, false, "i", playerid);
	player_selected[playerid] = 21;
	machine_in_progress[playerid] = true;
	SelectTextDraw(playerid, 0xA9D549FF);
	return true;
}

redist::reset_chooseCard(playerid) {
	machine_in_progress[playerid] = false;
	va_PlayerTextDrawSetString(playerid, machine_TD[playerid][46], "ld_card:cdback");
	va_PlayerTextDrawSetString(playerid, machine_TD[playerid][36], "miza gamble~n~~y~%d credite", winCredits[playerid]);
	va_PlayerTextDrawSetString(playerid, machine_TD[playerid][37], "castig cu gamble~n~~y~%d credite", winCredits[playerid] * 2);
	return true;
}

stock loadPlayerMachineTD(playerid, x=-1) {
	machine_TD[playerid][0] = CreatePlayerTextDraw(playerid, 308.708374, 114.579910, "box");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][0], 0.000000, 26.253555);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][0], 0.000000, 318.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][0], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, machine_TD[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, machine_TD[playerid][0], -2147450820);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][0], 255);
	PlayerTextDrawFont(playerid, machine_TD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][0], 0);

	machine_TD[playerid][1] = CreatePlayerTextDraw(playerid, 308.318206, 117.399871, "box");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][1], 0.000000, 25.716346);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][1], 0.000000, 314.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][1], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, machine_TD[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, machine_TD[playerid][1], 85);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][1], 255);
	PlayerTextDrawFont(playerid, machine_TD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][1], 0);	

	while(++x<15) {
		machine_TD[playerid][x+2] = CreatePlayerTextDraw(playerid, 206.90  + ((x/3) * 40.6), 168.90 + ((x%3) * 47.2), "");
		PlayerTextDrawLetterSize(playerid, machine_TD[playerid][x+2], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, machine_TD[playerid][x+2], 39.000000, 46.000000);
		PlayerTextDrawAlignment(playerid, machine_TD[playerid][x+2], 1);
		PlayerTextDrawColor(playerid, machine_TD[playerid][x+2], -1);
		PlayerTextDrawSetShadow(playerid, machine_TD[playerid][x+2], 0);
		PlayerTextDrawSetOutline(playerid, machine_TD[playerid][x+2], 0);
		PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][x+2], -246);
		PlayerTextDrawFont(playerid, machine_TD[playerid][x+2], 5);
		PlayerTextDrawSetProportional(playerid, machine_TD[playerid][x+2], 0);
		PlayerTextDrawSetShadow(playerid, machine_TD[playerid][x+2], 0);
		PlayerTextDrawSetPreviewModel(playerid, machine_TD[playerid][x+2], 23424);
		PlayerTextDrawSetPreviewRot(playerid, machine_TD[playerid][x+2], 0.000000, 0.000000, 0.000000, 1.000000);
	}

	machine_TD[playerid][17] = CreatePlayerTextDraw(playerid, 308.837554, 135.239929, "slot machine deluxe");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][17], 0.394000, 1.600000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][17], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][17], 255);
	PlayerTextDrawFont(playerid, machine_TD[playerid][17], 3);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][17], 0);

	machine_TD[playerid][18] = CreatePlayerTextDraw(playerid, 174.476104, 328.839965, "PLAY");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][18], 0.393000, 1.659999);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][18], 15.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][18], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][18], -1);
	PlayerTextDrawUseBox(playerid, machine_TD[playerid][18], 1);
	PlayerTextDrawBoxColor(playerid, machine_TD[playerid][18], -2147450625);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][18], 1);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][18], 96);
	PlayerTextDrawFont(playerid, machine_TD[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, machine_TD[playerid][18], true);
	PlayerTextID[playerid][PlayerText:machine_TD[playerid][18]] = 0;

	machine_TD[playerid][19] = CreatePlayerTextDraw(playerid, 219.947616, 328.833404, "AUTO");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][19], 0.393000, 1.659999);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][19], 15.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][19], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][19], -1);
	PlayerTextDrawUseBox(playerid, machine_TD[playerid][19], 1);
	PlayerTextDrawBoxColor(playerid, machine_TD[playerid][19], -2147450625);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][19], 1);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][19], 96);
	PlayerTextDrawFont(playerid, machine_TD[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, machine_TD[playerid][19], true);
	PlayerTextID[playerid][PlayerText:machine_TD[playerid][19]] = 1;

	machine_TD[playerid][20] = CreatePlayerTextDraw(playerid, 442.747528, 328.866607, "INFO");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][20], 0.393000, 1.659999);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][20], 15.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][20], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][20], -1);
	PlayerTextDrawUseBox(playerid, machine_TD[playerid][20], 1);
	PlayerTextDrawBoxColor(playerid, machine_TD[playerid][20], -2147450625);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][20], 1);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][20], 96);
	PlayerTextDrawFont(playerid, machine_TD[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, machine_TD[playerid][20], true);
	PlayerTextID[playerid][PlayerText:machine_TD[playerid][20]] = 2;

	machine_TD[playerid][21] = CreatePlayerTextDraw(playerid, 392.476776, 328.612915, "BET~N~0 CREDITS");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][21], 0.195285, 0.845066);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][21], 15.000000, 50.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][21], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][21], -1);
	PlayerTextDrawUseBox(playerid, machine_TD[playerid][21], 1);
	PlayerTextDrawBoxColor(playerid, machine_TD[playerid][21], -2147450625);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][21], 1);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][21], 96);
	PlayerTextDrawFont(playerid, machine_TD[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, machine_TD[playerid][21], true);
	PlayerTextID[playerid][PlayerText:machine_TD[playerid][21]] = 3;

	machine_TD[playerid][22] = CreatePlayerTextDraw(playerid, 159.666961, 167.099929, "");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][22], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][22], 39.000000, 46.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][22], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][22], -156);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][22], -246);
	PlayerTextDrawFont(playerid, machine_TD[playerid][22], 5);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][22], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][22], 0);
	PlayerTextDrawSetPreviewModel(playerid, machine_TD[playerid][22], 1247);
	PlayerTextDrawSetPreviewRot(playerid, machine_TD[playerid][22], 0.000000, 0.000000, 0.000000, 1.000000);

	machine_TD[playerid][23] = CreatePlayerTextDraw(playerid, 194.200073, 177.179931, "~p~3. ~w~~h~100 credite~n~~p~4. ~w~~h~400 credite~n~~p~5. ~w~~h~1.000 credite");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][23], 0.167238, 0.930133);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][23], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][23], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][23], 1);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][23], 78);
	PlayerTextDrawFont(playerid, machine_TD[playerid][23], 2);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][23], 0);

	machine_TD[playerid][24] = CreatePlayerTextDraw(playerid, 159.585968, 230.547393, "");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][24], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][24], 39.000000, 46.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][24], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][24], -156);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][24], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][24], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][24], -246);
	PlayerTextDrawFont(playerid, machine_TD[playerid][24], 5);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][24], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][24], 0);
	PlayerTextDrawSetPreviewModel(playerid, machine_TD[playerid][24], 1241);
	PlayerTextDrawSetPreviewRot(playerid, machine_TD[playerid][24], 0.000000, 0.000000, 0.000000, 1.000000);

	machine_TD[playerid][25] = CreatePlayerTextDraw(playerid, 193.595382, 242.000030, "~p~3. ~w~~h~40 credite~n~~p~4. ~w~~h~100 credite~n~~p~5. ~w~~h~400 credite");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][25], 0.167238, 0.930133);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][25], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][25], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][25], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][25], 1);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][25], 78);
	PlayerTextDrawFont(playerid, machine_TD[playerid][25], 2);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][25], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][25], 0);

	machine_TD[playerid][26] = CreatePlayerTextDraw(playerid, 159.943176, 291.347167, "");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][26], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][26], 39.000000, 46.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][26], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][26], -156);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][26], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][26], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][26], -246);
	PlayerTextDrawFont(playerid, machine_TD[playerid][26], 5);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][26], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][26], 0);
	PlayerTextDrawSetPreviewModel(playerid, machine_TD[playerid][26], 1314);
	PlayerTextDrawSetPreviewRot(playerid, machine_TD[playerid][26], 0.000000, 0.000000, 0.000000, 1.000000);

	machine_TD[playerid][27] = CreatePlayerTextDraw(playerid, 194.204711, 301.673065, "~p~3. ~w~~h~40 credite~n~~p~4. ~w~~h~100 credite~n~~p~5. ~w~~h~400 credite");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][27], 0.167238, 0.930133);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][27], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][27], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][27], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][27], 1);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][27], 78);
	PlayerTextDrawFont(playerid, machine_TD[playerid][27], 2);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][27], 0);

	machine_TD[playerid][28] = CreatePlayerTextDraw(playerid, 417.410369, 165.706008, "");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][28], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][28], 39.000000, 46.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][28], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][28], -156);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][28], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][28], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][28], -246);
	PlayerTextDrawFont(playerid, machine_TD[playerid][28], 5);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][28], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][28], 0);
	PlayerTextDrawSetPreviewModel(playerid, machine_TD[playerid][28], 1276);
	PlayerTextDrawSetPreviewRot(playerid, machine_TD[playerid][28], 0.000000, 0.000000, 0.000000, 1.000000);

	machine_TD[playerid][29] = CreatePlayerTextDraw(playerid, 422.276000, 175.040039, "100 credite ~p~3.~n~~w~~h~400 credite ~p~4.~n~~w~~h~1.000 credite ~p~5.");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][29], 0.167238, 0.930133);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][29], 3);
	PlayerTextDrawColor(playerid, machine_TD[playerid][29], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][29], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][29], 1);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][29], 78);
	PlayerTextDrawFont(playerid, machine_TD[playerid][29], 2);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][29], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][29], 0);

	machine_TD[playerid][30] = CreatePlayerTextDraw(playerid, 417.010345, 231.039657, "");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][30], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][30], 39.000000, 46.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][30], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][30], -156);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][30], -246);
	PlayerTextDrawFont(playerid, machine_TD[playerid][30], 5);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][30], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][30], 0);
	PlayerTextDrawSetPreviewModel(playerid, machine_TD[playerid][30], 1240);
	PlayerTextDrawSetPreviewRot(playerid, machine_TD[playerid][30], 0.000000, 0.000000, 0.000000, 1.000000);

	machine_TD[playerid][31] = CreatePlayerTextDraw(playerid, 421.462036, 239.466705, "40 credite ~p~3.~n~~w~~h~100 credite ~p~4.~n~~w~~h~400 credite ~p~5.");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][31], 0.167238, 0.930133);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][31], 3);
	PlayerTextDrawColor(playerid, machine_TD[playerid][31], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][31], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][31], 1);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][31], 78);
	PlayerTextDrawFont(playerid, machine_TD[playerid][31], 2);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][31], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][31], 0);

	machine_TD[playerid][32] = CreatePlayerTextDraw(playerid, 416.291687, 293.766601, "");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][32], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][32], 39.000000, 46.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][32], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][32], -156);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][32], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][32], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][32], -246);
	PlayerTextDrawFont(playerid, machine_TD[playerid][32], 5);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][32], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][32], 0);
	PlayerTextDrawSetPreviewModel(playerid, machine_TD[playerid][32], 1254);
	PlayerTextDrawSetPreviewRot(playerid, machine_TD[playerid][32], 0.000000, 0.000000, 0.000000, 1.000000);

	machine_TD[playerid][33] = CreatePlayerTextDraw(playerid, 421.457397, 301.839935, "40 credite ~p~3.~n~~w~~h~100 credite ~p~4.~n~~w~~h~400 credite ~p~5.");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][33], 0.167238, 0.930133);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][33], 3);
	PlayerTextDrawColor(playerid, machine_TD[playerid][33], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][33], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][33], 1);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][33], 78);
	PlayerTextDrawFont(playerid, machine_TD[playerid][33], 2);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][33], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][33], 0);

	machine_TD[playerid][34] = CreatePlayerTextDraw(playerid, 283.120330, 164.853103, "");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][34], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][34], 54.000000, 66.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][34], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][34], -156);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][34], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][34], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][34], -246);
	PlayerTextDrawFont(playerid, machine_TD[playerid][34], 5);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][34], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][34], 0);
	PlayerTextDrawSetPreviewModel(playerid, machine_TD[playerid][34], 1274);
	PlayerTextDrawSetPreviewRot(playerid, machine_TD[playerid][34], 0.000000, 0.000000, 0.000000, 1.000000);

	machine_TD[playerid][35] = CreatePlayerTextDraw(playerid, 310.109558, 232.246948, "~p~3. ~w~~h~200 credite~n~~p~4. ~w~~h~2.000 credite~n~~p~5. ~w~~h~10.000 credite");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][35], 0.167238, 0.930133);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][35], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][35], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][35], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][35], 1);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][35], 78);
	PlayerTextDrawFont(playerid, machine_TD[playerid][35], 2);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][35], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][35], 0);

	machine_TD[playerid][36] = CreatePlayerTextDraw(playerid, 213.081115, 169.706909, "miza gamble~n~~y~40 credite");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][36], 0.188952, 1.181866);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][36], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][36], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][36], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][36], 1);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][36], 40);
	PlayerTextDrawFont(playerid, machine_TD[playerid][36], 2);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][36], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][36], 0);

	machine_TD[playerid][37] = CreatePlayerTextDraw(playerid, 395.362365, 169.846679, "castig cu gamble~n~~y~80 credite");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][37], 0.188952, 1.181866);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][37], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][37], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][37], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][37], 1);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][37], 40);
	PlayerTextDrawFont(playerid, machine_TD[playerid][37], 2);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][37], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][37], 0);

	machine_TD[playerid][38] = CreatePlayerTextDraw(playerid, 266.405120, 207.480255, "cartile anterioare:");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][38], 0.188952, 1.181866);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][38], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][38], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][38], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][38], 1);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][38], 40);
	PlayerTextDrawFont(playerid, machine_TD[playerid][38], 2);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][38], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][38], 0);

	machine_TD[playerid][39] = CreatePlayerTextDraw(playerid, 312.656707, 204.240417, "ld_card:cdback");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][39], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][39], 14.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][39], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][39], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][39], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][39], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][39], 255);
	PlayerTextDrawFont(playerid, machine_TD[playerid][39], 4);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][39], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][39], 0);

	machine_TD[playerid][40] = CreatePlayerTextDraw(playerid, 328.256622, 204.240417, "ld_card:cdback");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][40], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][40], 14.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][40], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][40], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][40], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][40], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][40], 255);
	PlayerTextDrawFont(playerid, machine_TD[playerid][40], 4);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][40], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][40], 0);

	machine_TD[playerid][41] = CreatePlayerTextDraw(playerid, 343.809112, 204.140411, "ld_card:cdback");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][41], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][41], 14.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][41], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][41], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][41], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][41], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][41], 255);
	PlayerTextDrawFont(playerid, machine_TD[playerid][41], 4);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][41], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][41], 0);

	machine_TD[playerid][42] = CreatePlayerTextDraw(playerid, 359.366241, 204.167053, "ld_card:cdback");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][42], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][42], 14.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][42], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][42], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][42], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][42], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][42], 255);
	PlayerTextDrawFont(playerid, machine_TD[playerid][42], 4);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][42], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][42], 0);

	machine_TD[playerid][43] = CreatePlayerTextDraw(playerid, 375.223388, 204.267059, "ld_card:cdback");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][43], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][43], 14.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][43], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][43], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][43], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][43], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][43], 255);
	PlayerTextDrawFont(playerid, machine_TD[playerid][43], 4);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][43], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][43], 0);

	machine_TD[playerid][44] = CreatePlayerTextDraw(playerid, 219.300094, 274.479949, "ROSU");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][44], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][44], 15.000000, 55.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][44], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][44], -1);
	PlayerTextDrawUseBox(playerid, machine_TD[playerid][44], 1);
	PlayerTextDrawBoxColor(playerid, machine_TD[playerid][44], -16776961);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][44], 1);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][44], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][44], 255);
	PlayerTextDrawFont(playerid, machine_TD[playerid][44], 1);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][44], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][44], 1);
	PlayerTextDrawSetSelectable(playerid, machine_TD[playerid][44], true);
	PlayerTextID[playerid][PlayerText:machine_TD[playerid][44]] = 0;

	machine_TD[playerid][45] = CreatePlayerTextDraw(playerid, 387.800048, 274.353302, "NEGRU");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][45], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][45], 15.000000, 55.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][45], 2);
	PlayerTextDrawColor(playerid, machine_TD[playerid][45], -1);
	PlayerTextDrawUseBox(playerid, machine_TD[playerid][45], 1);
	PlayerTextDrawBoxColor(playerid, machine_TD[playerid][45], 255);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][45], 1);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][45], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][45], 255);
	PlayerTextDrawFont(playerid, machine_TD[playerid][45], 1);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][45], 1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][45], 1);
	PlayerTextDrawSetSelectable(playerid, machine_TD[playerid][45], true);
	PlayerTextID[playerid][PlayerText:machine_TD[playerid][45]] = 1;

	machine_TD[playerid][46] = CreatePlayerTextDraw(playerid, 277.323516, 242.260498, "ld_card:cdback");
	PlayerTextDrawLetterSize(playerid, machine_TD[playerid][46], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, machine_TD[playerid][46], 56.000000, 83.000000);
	PlayerTextDrawAlignment(playerid, machine_TD[playerid][46], 1);
	PlayerTextDrawColor(playerid, machine_TD[playerid][46], -1);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][46], 0);
	PlayerTextDrawSetOutline(playerid, machine_TD[playerid][46], 0);
	PlayerTextDrawBackgroundColor(playerid, machine_TD[playerid][46], 255);
	PlayerTextDrawFont(playerid, machine_TD[playerid][46], 4);
	PlayerTextDrawSetProportional(playerid, machine_TD[playerid][46], 0);
	PlayerTextDrawSetShadow(playerid, machine_TD[playerid][46], 0);
	return true;
}

#include <YSI_Coding\y_hooks>

hook OnGameModeInit() {
	new act = CreateDynamicActor(172, 2225.4939,1616.6460,1006.1868,257.6840, 1, 100.0, 3, 1); // 1
	ApplyDynamicActorAnimation(act, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);
	CreateDynamic3DTextLabel("{FF0000}Credit Menu\n{FFFFFF}Commands: /buycredit, /sellcredit", -1, 2225.4939,1616.6460,1006.1868, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	act = CreateDynamicActor(172, 2246.2166,1616.8920,1006.1858,88.4822, 1, 100.0, 3, 1); // 2
	ApplyDynamicActorAnimation(act, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);
	CreateDynamic3DTextLabel("{FF0000}Credit Menu\n{FFFFFF}Commands: /buycredit, /sellcredit", -1, 2246.2166,1616.8920,1006.1858, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	new i=-1;
	while(++i<62) {
		format(gString, sizeof gString, "#%d\n{993DF3}Slot Machine\n{FFFFFF}Press '{993DF3}F'", i+1);
		CreateDynamic3DTextLabel(gString, -1, machine_pos[i][0], machine_pos[i][1], machine_pos[i][2], 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	}
	return true;
}

cmd:buycredit(playerid) {
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, 2225.5159,1616.7375,1006.1867) && !IsPlayerInRangeOfPoint(playerid, 5.0, 2246.2036,1617.0869,1006.1856)) return true;
	return ShowPlayerDialog(playerid, DIALOG_BUYCREDIT, DIALOG_STYLE_INPUT, "{F4AD42}Buy {FFFFFF}Credit", "Cate credite doresti sa cumperi? (limita: 5000)\n\n1 credit = $100.000", "Select", "Cancel");
}

cmd:sellcredit(playerid) {
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, 2225.5159,1616.7375,1006.1867) && !IsPlayerInRangeOfPoint(playerid, 5.0, 2246.2036,1617.0869,1006.1856)) return true;
	
	format(gString, sizeof gString, "Cate credite doresti sa vinzi? (limita: 5000)\n\nTu ai %d credite. (1 credit vandut = $95.000)", PlayerInfo[playerid][pCasinoCredit]);
	return ShowPlayerDialog(playerid, DIALOG_SELLCREDIT, DIALOG_STYLE_INPUT, "{F4AD42}Sell {FFFFFF}Credit", gString, "Select", "Cancel");
}