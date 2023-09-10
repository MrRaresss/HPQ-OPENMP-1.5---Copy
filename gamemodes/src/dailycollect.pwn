cmd:collect(playerid) {
    if(player_selected[playerid]) return true;
	if(PlayerInfo[playerid][pDailyActivity] == -1) return SendErrorMsg(playerid, "Ai colectat deja acest bonus!");
    if(PlayerInfo[playerid][pDailyActivity] != 1) return SendErrorMsg(playerid, "Trebuie sa joci o ora (fara AFK) pentru a putea colecta bonusul.");

    for(new x = 9; x < 18; x++) PlayerTextDrawShow(playerid, DailyPTD[playerid][x]), PlayerTextID[playerid][PlayerText:DailyPTD[playerid][x]] = x;
    for(new z = 0; z < 5; z++) TextDrawShowForPlayer(playerid, DailyPTD1[z]);

	player_selected[playerid] = 4;
    return SelectTextDraw(playerid, COLOR_WHITE);
}

cmd:debug1(playerid) return PlayerInfo[playerid][pCollectReady] = 1;
cmd:debug2(playerid) return PlayerInfo[playerid][pDailyActivity] = 10;

task CollectTime[1000]() {
    foreach(new i : Player) {
        if(PlayerInfo[i][pDailyActivity] != 1 && !AFKSeconds[i]) {
            PlayerInfo[i][pDailyActivity] --;
            if(PlayerInfo[i][pDailyActivity] <= 3600) va_TextDrawSetString(CollectTD[0], "Daily Activity~n~Reward~n~~y~%02d:%02d", PlayerInfo[i][pDailyActivity] / 60, PlayerInfo[i][pDailyActivity] % 60);
            if(PlayerInfo[i][pDailyActivity] <= 1) TextDrawSetString(CollectTD[0], "Daily Activity~n~Reward~n~~y~(/collect)");
            if(PlayerInfo[i][pDailyActivity] == -1) TextDrawSetString(CollectTD[0], "Daily Activity~n~Reward~n~~y~Tomorrow");
        }
    }
    return true;
}	




timer HideDaily[5000](playerid) {
    for(new x = 9; x < 18; x++) {
        PlayerTextDrawHide(playerid, DailyPTD[playerid][x]);
        PlayerTextID[playerid][PlayerText:DailyPTD[playerid][x]] = x;
        PlayerTextDrawColor(playerid, DailyPTD[playerid][x], 0xFFFFFF50);
    }    
    for(new y = 0; y < 9; y++) PlayerTextDrawHide(playerid, DailyPTD[playerid][y]);
    for(new z = 0; z < 5; z++) TextDrawHideForPlayer(playerid, DailyPTD1[z]);
    
	player_selected[playerid] = 0;
	return CancelSelectTextDraw(playerid);
}



