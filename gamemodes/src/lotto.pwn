#include <YSI_Coding\y_hooks>

hook OnGameModeInit() {
	CreateDynamicPickup(1212, 1, 2156.4937,1599.4507,1006.1797, 3, 1);
	CreateDynamicPickup(1212, 1, 2156.4937,1599.4507,1006.1797, 9, 1);
	return true;
}

cmd:playlotto(playerid, params[]) {
	if(!PlayerToPoint(2, playerid, 2156.4937,1599.4507,1006.1797))
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Nu esti la zona unde poti pune un bilet la lotto!");

	if(PlayerInfo[playerid][pLotto][0] > 0) 
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Nu mai poti pune un alt bilet la lotto!");

	extract params -> new n1, n2, n3, n4, n5, n6; else 
		return usage(playerid, "playlotto <number #1> <number #2> <number #3> <number #4> <number #5> <number #6>");

	if(!valid_lotto_number(n1, n2, n3, n4, n5, n6)) return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Numarul trebuie pus intre 1 si 49.");
	if(!is_the_same(n1, n2, n3, n4, n5, n6)) return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Nu poti pune aceleasi numere.");

	mysql_format(SQL, gQuery, 128, "SELECT * FROM `users` WHERE `LottoNumbers`='%d %d %d %d %d %d' LIMIT 1", n1, n2, n3, n4, n5, n6);
	mysql_tquery(SQL, gQuery, "cache_sql_play_lotto", "iiiiiii", playerid, n1, n2, n3, n4, n5, n6);
	return true;
}

redist::valid_lotto_number(n1, n2, n3, n4, n5, n6) {
	if(n1 < 1 || n1 > 49) return false;
	if(n2 < 1 || n2 > 49) return false;
	if(n3 < 1 || n3 > 49) return false;
	if(n4 < 1 || n4 > 49) return false;
	if(n5 < 1 || n5 > 49) return false;
	if(n6 < 1 || n6 > 49) return false;
	return true;
}

redist::is_the_same(n1, n2, n3, n4, n5, n6) {
	if(n1==n2||n1==n3||n1==n4||n1==n5||n1==n6) return false;
	if(n2==n1||n2==n3||n2==n4||n2==n5||n2==n6) return false;
	if(n3==n1||n3==n2||n3==n4||n3==n5||n3==n6) return false;
	if(n4==n1||n4==n2||n4==n3||n4==n5||n4==n6) return false;
	if(n5==n1||n5==n2||n5==n3||n5==n4||n5==n6) return false;
	if(n6==n1||n6==n2||n6==n3||n6==n4||n6==n5) return false;
	return true;
}

redist::cache_sql_play_lotto(playerid, n1, n2, n3, n4, n5, n6) {
	if(cache_num_rows()) 
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Aceste numere au fost deja alese de catre un alt jucator!");

	GivePlayerMoney(playerid, -10000000);
	PlayerInfo[playerid][pLotto][0] = n1; PlayerInfo[playerid][pLotto][1] = n2; PlayerInfo[playerid][pLotto][2] = n3; 
	PlayerInfo[playerid][pLotto][3] = n4; PlayerInfo[playerid][pLotto][4] = n5; PlayerInfo[playerid][pLotto][5] = n6;
	SCMf(playerid, COLOR_LGREEN, "(#) Ai pus un bilet la lotto cu numerele (%d, %d, %d, %d, %d, %d) si ai platit $10,000,000.", n1, n2, n3, n4, n5, n6);
	SendClientMessage(playerid, COLOR_LGREEN, "(#) Extragerile au loc in ziua de marti, joi, sambata si duminica la ora 20:30.");
	sql_lotto_bets++;
	format(gString, sizeof gString, "\
	{6fc400}Lotto System (6/49, /playlotto)\n\n\
	{FFFFFF}Pretul unui bilet este de {6fc400}$10.000.000{FFFFFF}.\n\
	Extragerile au loc marti, joi, sambata si duminica la ora 20:30.\n\
	Jackpot: {6fc400}$%s{FFFFFF} (%d bets)", FormatNumber(sql_lotto_bets*5000000), sql_lotto_bets);
	foreach(new i : logged_players) UpdateDynamic3DTextLabelText(lotto_label[i], -1, gString);

	_query("UPDATE `users` SET `LottoNumbers`='%d %d %d %d %d %d' WHERE `ID`='%d'", n1, n2, n3, n4, n5, n6, PlayerInfo[playerid][pSQLID]);
	return true;
}

redist::lotto_choose() {
	new 
		n1 = RandomEx(1, 49),
		n2 = RandomEx(1, 49),
		n3 = RandomEx(1, 49),
		n4 = RandomEx(1, 49),
		n5 = RandomEx(1, 49),
		n6 = RandomEx(1, 49);

	foreach(new i : logged_players) {
		SendClientMessage(i, COLOR_LGREEN, "--- Lotto System (6/49) ---");
		SCMf(i, COLOR_LGREEN, "(#) In acest moment a fost efectuata extragerea, numerele castigatoare fiind: %d, %d, %d, %d, %d, %d.", n1, n2, n3, n4, n5, n6);
		mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `users` WHERE `LottoNumbers`='%d %d %d %d %d %d'", n1, n2, n3, n4, n5, n6);
		mysql_tquery(SQL, gQuery, #cache_get_winner_lotto);
	}
	return true;
}

redist::cache_get_winner_lotto() {
	if(!cache_num_rows()) {
		foreach(new i : logged_players) {
			SendClientMessage(i, COLOR_LGREEN, "(#) Nimeni nu a castigat!"), SendClientMessage(i, COLOR_LGREEN, "---");
		}
		_query("UPDATE `users` SET `LottoNumbers`='0 0 0 0 0 0'", cache_num_rows());
		sql_lotto_bets=0;
		reset_lotto();
		return true;
	}

	new lotto_winner_username[24], lotto_winner_id;
	cache_get_value_name_int(0, "ID", lotto_winner_id);
	cache_get_value_name(0, "name", lotto_winner_username);
	foreach(new i : logged_players) {
		SCMf(i, COLOR_LGREEN, "(#) Castigatorul este %s si a primit suma de $%s.", lotto_winner_username, FormatNumber(sql_lotto_bets*5000000));
		SendClientMessage(i, COLOR_LGREEN, "---");
	}
	_query("UPDATE `users` SET `Money`=`Money`+'%d' WHERE `ID`='%d'", sql_lotto_bets*5000000, lotto_winner_id);
	_query("UPDATE `users` SET `LottoNumbers`='0 0 0 0 0 0'", cache_num_rows());
	sql_lotto_bets=0;
	reset_lotto();
	return true;
}

cmd:debuglotto(playerid, params[]) {
	lotto_choose();
	return true;
}

redist::reset_lotto() {
	format(gString, sizeof gString, "\
	{6fc400}Lotto System (6/49, /playlotto)\n\n\
	{FFFFFF}Pretul unui bilet este de {6fc400}$10.000.000{FFFFFF}.\n\
	Extragerile au loc marti, joi, sambata si duminica la ora 20:30.\n\
	Jackpot: {6fc400}$%s{FFFFFF} (%d bets)", FormatNumber(sql_lotto_bets*5000000), sql_lotto_bets);
	foreach(new i : logged_players) UpdateDynamic3DTextLabelText(lotto_label[i], -1, gString);
	return true;
}