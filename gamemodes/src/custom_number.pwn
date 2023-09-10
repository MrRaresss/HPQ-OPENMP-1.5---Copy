redist::cache_sql_shop_cnumber(playerid, const PhoneNr[]) {
	if(cache_num_rows()) {
		SendClientMessage(playerid, -1, "Acest numar este deja luat.");
		ShowPlayerDialog(playerid, DIALOG_NEWNUMBER, DIALOG_STYLE_INPUT, "Choose number:", "Introdu numarul de telefon pe care il doresti (-999 - 999).", "Ok", "Back");
		return true;
	}
	strmid(request_num[playerid], PhoneNr, 0, 10);
	strmid(HelpText[playerid], PhoneNr, 0, 128);			
	request_number[playerid]=value_report[playerid]
	=0;
	report_type[playerid] = 3;
	report_ago[playerid] = gettime();
	strmid(report_by[playerid], PlayerInfo[playerid][pUsername], 0, MAX_PLAYER_NAME);
	Iter_Add(report_players, playerid);
	Iter_Add(report<NUMBER>, playerid);
	show_admin_report();
	ABroadcast(-1, 1, "{00820d}(/anumber): {FFFFFF}%s doreste sa-si puna numarul custom '%s'. [/anumber %d]", GetName(playerid), PhoneNr, playerid);
	return true;
}

