

task load_panel_data[5000]() {
	mysql_format(SQL, gQuery, sizeof gQuery, "SELECT * FROM `panel_queue` LIMIT 10");
	mysql_tquery(SQL, gQuery, #cache_panel_data);
	return true;
}

redist::cache_panel_data() {
	new type, name[MAX_PLAYER_NAME], admin[MAX_PLAYER_NAME], playerid, Player_ID, reason[64], amount, am[20];

	new row=-1, bool:checked;
	while(++row<cache_num_rows()) {
		cache_get_value_name_int(row, "Type", type);
		cache_get_value_name_int(row, "playerid", playerid);
		cache_get_value_name(row, "Username", name);
		cache_get_value_name(row, "AdminName", admin);
		cache_get_value_name_int(row, "Userid", Player_ID);
		cache_get_value_name(row, "Reason", reason);
		cache_get_value_name_int(row, "Amount", amount);
		cache_get_value_name(row, "Amount", am);

		if(playerid!=-1) checked=PlayerInfo[playerid][pSQLID]==Player_ID;

		switch(type) {
			case 1: {
				if(checked) {
					if(amount) format(gString, 128, "AdmPanel: %s was banned by %s for %d days, reason: %s", name, admin, amount, reason);
					else format(gString, 128, "AdmPanel: %s has been permanent banned by %s, reason: %s", name, admin, reason);
					SCMf(playerid,COLOR_WARNING,"Ai fost banat! Daca consideri ca ai luat ban degeaba, poti face o cerere pe (%s).", serverInfo[sv_panel]);
					KickEx(playerid);
				} else {
					if(amount) format(gString, 128, "AdmPanel: %s (offline) was banned by %s for %d days, reason: %s", name, admin, amount, reason);
					else format(gString, 128, "AdmPanel: %s (offline) has been permanent banned by %s, reason: %s", name, admin, reason);
				}
				SendClientMessageToAll(COLOR_LIGHTRED, gString);
			}
			case 2: {
				if(checked) {
					PlayerInfo[playerid][pMuted] = 1;
					PlayerInfo[playerid][pMuteTime] = amount*60;
					PlayerInfo[playerid][pChatCMD] = 9;
				} 
				format(gString, 128, "AdmPanel: %s received mute from %s for %d minutes, reason: %s.", name, admin, amount, reason);
				SendClientMessageToAll(COLOR_LIGHTRED, gString);
			}
			case 3: {
				if(checked) {
					addBytes64(money[playerid], am);
					SCMf(playerid, COLOR_YELLOW, "AdmPanel: %s ti-a oferit $%s.", admin, FormatNumbers(am));
				}
				format(gString, sizeof gString, "(AdmPanel) {FFFFFF}%s i-a ofert $%s lui %s.", admin, FormatNumbers(am), name);
				SendAdminMessage(COLOR_LIGHTRED, gString, 1);
			}
			case 4: {
				if(checked) {
					addBytes64(bank[playerid], am);
					format(gString, 45, "$%s", formatBytes(bank[playerid]));
					PlayerTextDrawSetString(playerid, BancaTD, gString);
					SCMf(playerid, COLOR_YELLOW, "AdmPanel: %s ti-a oferit $%s in banca.", admin, FormatNumbers(am));
				}
				format(gString, sizeof gString, "(AdmPanel) {FFFFFF}%s i-a ofert $%s lui %s.", admin, FormatNumbers(am), name);
				SendAdminMessage(COLOR_LIGHTRED, gString, 1);
			}
			case 5: {
				if(checked) {
					PlayerInfo[playerid][pPremiumPoints] += amount;
					SCMf(playerid, COLOR_YELLOW, "AdmPanel: %s ti-a oferit %d premium points.", admin, amount);
				}
				format(gString, sizeof gString, "(AdmPanel) {FFFFFF}%s i-a ofert %d premium points lui %s.", admin, amount, name);
				SendAdminMessage(COLOR_LIGHTRED, gString, 1);
			}
			case 6: {
				if(checked) {
					resetBigInt(money[playerid]);
					addBytes64(money[playerid], am);
					SCMf(playerid, COLOR_YELLOW, "AdmPanel: %s ti-a setat $%s.", admin, FormatNumbers(am));
				}
				format(gString, sizeof gString, "(AdmPanel) {FFFFFF}%s i-a setat $%s lui %s.", admin, FormatNumbers(am), name);
				SendAdminMessage(COLOR_LIGHTRED, gString, 1);
			}
			case 7: {
				if(checked) {
					resetBigInt(bank[playerid]);
					addBytes64(bank[playerid], am);
					SCMf(playerid, COLOR_YELLOW, "AdmPanel: %s ti-a setat $%s din banca.", admin, FormatNumbers(am));
				}
				format(gString, sizeof gString, "(AdmPanel) {FFFFFF}%s i-a setat $%s (bank) lui %s.", admin, FormatNumbers(am), name);
				SendAdminMessage(COLOR_LIGHTRED, gString, 1);
			}
			case 8: {
				if(checked) {
					PlayerInfo[playerid][pPremiumPoints] = amount;
					SCMf(playerid, COLOR_YELLOW, "AdmPanel: %s ti-a setat %d premium points.", admin, amount);
				}
				format(gString, sizeof gString, "(AdmPanel) {FFFFFF}%s i-a setat %d premium points lui %s.", admin, amount, name);
				SendAdminMessage(COLOR_LIGHTRED, gString, 1);
			}
			case 9: {
				if(checked) {
					PlayerInfo[playerid][pConnectTime] = amount;
					SCMf(playerid, COLOR_YELLOW, "AdmPanel: %s ti-a setat %d ore jucate.", admin, amount);
				}
				format(gString, sizeof gString, "(AdmPanel) {FFFFFF}%s i-a setat %d ore jucate lui %s.", admin, amount, name);
				SendAdminMessage(COLOR_LIGHTRED, gString, 1);
			}
			case 10: {
				if(checked) {
					PlayerInfo[playerid][pLevel] = amount;
					SCMf(playerid, COLOR_YELLOW, "AdmPanel: %s ti-a setat %d level", admin, amount);
				}
				format(gString, sizeof gString, "(AdmPanel) {FFFFFF}%s i-a setat %d level lui %s.", admin, amount, name);
				SendAdminMessage(COLOR_LIGHTRED, gString, 1);
			}
			case 11: {
				if(checked) {
					PlayerInfo[playerid][pPremiumAccount] = amount;
					SCMf(playerid, COLOR_YELLOW, "AdmPanel: %s ti-a setat %d premium", admin, amount);
				}
				format(gString, sizeof gString, "(AdmPanel) {FFFFFF}%s i-a setat %d premium lui %s.", admin, amount, name);
				SendAdminMessage(COLOR_LIGHTRED, gString, 1);
			}
			case 12: {
				if(checked) {
					PlayerInfo[playerid][pVip] = amount;
					SCMf(playerid, COLOR_YELLOW, "AdmPanel: %s ti-a setat %d VIP", admin, amount);
				}
				format(gString, sizeof gString, "(AdmPanel) {FFFFFF}%s i-a setat %d VIP lui %s.", admin, amount, name);
				SendAdminMessage(COLOR_LIGHTRED, gString, 1);
			}
			case 13: {
				if(checked) {
					PlayerInfo[playerid][pMuted] = 1;
					PlayerInfo[playerid][pWarns] ++;
					PlayerInfo[playerid][pMuteTime] = amount*60;
					PlayerInfo[playerid][pChatCMD] = 9;

					if(PlayerInfo[playerid][pWarns] == 3) {
						sendSplittedMessage(COLOR_LIGHTRED, "Ban: %s was banned by %s for 3 days, reason: 3/3 warns", name, GetName(playerid));	
						KickEx(playerid);
					}
				} 
				format(gString, 128, "AdmPanel: %s received mute & warn from %s for %d minutes, reason: %s.", name, admin, amount, reason);
				SendClientMessageToAll(COLOR_LIGHTRED, gString);	
			}
			case 14: {
				if(checked) {
					PlayerInfo[playerid][pWarns] ++;

					if(PlayerInfo[playerid][pWarns] == 3) {	
						sendSplittedMessage(COLOR_LIGHTRED, "Ban: %s was banned by %s for 3 days, reason: 3/3 warns", name, GetName(playerid));	
						KickEx(playerid);
					}
				} 
				format(gString, 128, "AdmPanel: %s received warn from %s for %d minutes, reason: %s.", name, admin, amount, reason);
				SendClientMessageToAll(COLOR_LIGHTRED, gString);
			}
			case 15: {
				if(checked) {
					if PlayerInfo[playerid][pJailTime] == 0 *then {
						PlayerInfo[playerid][pWantedLevel] = 0;
						PlayerTextDrawHide(playerid, WantedTD);
						Iter_Remove(servicePlayers<8>, playerid);
						PlayerInfo[playerid][pJailed] = 2;
						PlayerInfo[playerid][pDM]++;
						PlayerInfo[playerid][pJailTime] = amount * 15 * 60;
						PlayerInfo[playerid][pAJail] = 1;
						PlayerInfo[playerid][pGunLicS] = 3;
						PlayerInfo[playerid][pGunLic] = 0;
						PlayerInfo[playerid][pGunLicT] = -1;	
						SendClientMessage(playerid, COLOR_WARNING, "Licenta ta de arme a fost confiscata timp de 3 ore deoarece ai primit jail pentru DM!");
						sendSplittedMessage(COLOR_LIGHTRED, "AdmPanel: %s a fost bagat in inchisoare de %s pentru %d minute, motiv: DM #%d", name, admin, amount * 15, PlayerInfo[playerid][pDM]);
						SpawnPlayer(playerid);
					}
				}
			}
		}
	}
	_query("DELETE FROM `panel_queue` LIMIT 10",0);
	return true;
}