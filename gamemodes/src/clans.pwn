cmd:claninfo(playerid, params[]) {	
	if(!IsAdmin(playerid, 6)) return true;
	mysql_format(SQL, gQuery, 128, "SELECT * FROM `Clans` WHERE `Days`='0'", PlayerInfo[playerid][pMember]);
	mysql_tquery(SQL, gQuery, "cache_get_expired_clans", "i", playerid);
	return true;
}

redist::cache_get_expired_clans(playerid) {
	SendClientMessage(playerid, COLOR_RED, "Clanuri Expirate:");
	new c=-1;
	while(++c<cache_num_rows()) {
		new clanid;
		cache_get_value_name_int(0, "ID", clanid);   
		SCMf(playerid, -1, "* /deleteclan: %d", clanid);
	}
	SendClientMessage(playerid, COLOR_RED, "--");
	return true;
}

cmd:ac(playerid, params[]) {
	if(!IsAdmin(playerid, 1)) 
		return SendClientMessage(playerid, -1, AdminOnly);

	new id;
	if(sscanf(params, "u", id)) 
		return SendClientMessage(playerid, COLOR_GREY, "Syntax: {FFFFFF}/ac <playerid/name>");

	if(!IsPlayerConnected(id)) 
		return SendClientMessage( playerid, COLOR_GREY, "That user is not connected." ); 

	if(!request_clan[id])
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Acel player nu are o solicitare!");

	mysql_format( SQL, gString, sizeof gString, "SELECT * FROM `users` WHERE `name` = '%s'", change_name[id]);
	mysql_tquery( SQL, gString, "cache_sql_accept_clan", "dd", id, playerid);
	return true; 
}

redist::cache_sql_accept_clan(playerid, by) {
	PlayerInfo[playerid][pPremiumPoints] -= 300;
	UpdateVar(playerid, "GoldPoints", PlayerInfo[playerid][pPremiumPoints]);					
	
	new Year, Month, Day, Hour, Minute, Second;
	getdate(Year, Month, Day); gettime(Hour, Minute, Second);
	format(gString,  128, "%02d/%02d/%d - %02d:%02d:%02d", Day, Month, Year, Hour, Minute, Second);
	mysql_format(SQL, gQuery, sizeof gQuery, "INSERT INTO `clans` (`Name`, `Owner`, `OwnerSQL`, `RegisterDate`, `Color`, `Slots`) VALUES ('%e', '%e', '%d', '%e', 'FFFFFF', '90')", ClanRequest[playerid], PlayerInfo[playerid][pUsername], PlayerInfo[playerid][pSQLID], gString, sSlot[playerid]);
	mysql_tquery(SQL, gQuery, "SQL_INSERT_CLAN", "iss", playerid, ClanRequest[playerid], gString);

	request_clan[by] = false;
	Iter_Remove(report<CLAN>, playerid);
	ABroadcast(-1, 1, "{00820d}(/ac): {FFFFFF}%s i-a acceptat clanul '%s' #2 lui %s.", GetName(by), ClanRequest[playerid], GetName(playerid));
	return true;
}

cmd:removetuning(playerid, params[]) {
	if(PersonalClanCar(playerid) == -1) return true;

	ShowPlayerDialog(playerid, DIALOG_CLAN_REMOVET, DIALOG_STYLE_MSGBOX, "{bf0000}Remove{FFFFFF} Tuning", "Esti sigur ca doresti sa stergi tuning-ul de pe acest vehicul?", "Da", "Nu");
	return true;
}