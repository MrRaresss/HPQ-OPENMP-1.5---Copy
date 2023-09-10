



#include <YSI_Coding\y_hooks>
// var
new 
	Text:blackjack_td[3], 
	Text:bl_player[6][8],
	bl_slot[6][7] = {{-1, ...}, ...}, bl_time[6], 
	bl_slot_id[MAX_PLAYERS][2] = {{-1, ...}, ...},
	bl_amount[6][8], bl_bet[6][7], bl_turn[6],
	bl_status[6], bl_card_[6][8],
	Text:bl_card_td[6][8][5],
	Text:blackjack_time[6],
	Text3D:bl_label[6],
	bl_count[6], bl_actor[6]
;
enum {
	BL_WAITING,
	BL_PROGRESS,
	BL_REFRESH
}

#include "./src/blackjack_position.pwn"
#include "./display_show/blackjack_show.pwn"

show_player_blackjack(playerid, pos=0) {
	if bl_count[pos]>=6 *then
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Aceasta masa e deja plina!");

	if bl_status[pos]!=BL_WAITING *then
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Este deja o runda inceputa la aceasta masa de blackjack!");

	bl_slot_id[playerid][1] = pos;
	format(gQuery, 60, "Blackjack: Table #%d", pos+1);
	format(gString, 128, "Insert the bet amount\nLimit: $%s - $%s", FormatNumber(_jack_bet_[pos/2][0]), FormatNumber(_jack_bet_[pos/2][1]));
	ShowPlayerDialog(playerid, DIALOG_BET_BL, DIALOG_STYLE_INPUT, gQuery, gString, "Select", "Cancel");
	return true;
}

enum {
	CLICK_HIT,
	CLICK_STAND,
	CLICK_FOLD
}

redist::actionBlackjack(playerid, actionid) {
	new i=bl_slot_id[playerid][0],slot=bl_slot_id[playerid][1];
	if bl_status[slot]!=BL_PROGRESS *then
		return SendClientMessage(playerid, COLOR_LGREEN, "Wait for the match to start.");

	if bl_turn[slot]!=playerid *then
		return true;

	switch actionid do {
		case CLICK_HIT: bl_givePlayerCard(playerid);
		case CLICK_STAND: {
			if bl_amount[slot][i]!=21 *then {
	 			format(gString, 60, "%s - %d ~r~(stand)~n~~g~$%s", GetName(playerid), bl_amount[slot][i], FormatNumber(bl_bet[slot][i]));
				TextDrawSetString(bl_player[slot][i], gString);
			}

			check_player_cards(slot, i, true);
		}
		case CLICK_FOLD: {
			format(gString, 60, "%s - %d ~r~(fold)~n~~g~$%s", GetName(playerid), bl_amount[slot][i], FormatNumber(bl_bet[slot][i]));
			TextDrawSetString(bl_player[slot][i], gString);
			for(new _x=0,_player;_x<7;_x++) {
				if((_player=bl_slot[slot][_x])==-1) 
					continue;

				for(new _r=0;_r<5;_r++)
					TextDrawHideForPlayer(_player, bl_card_td[slot][i][_r]);
			}
			bl_amount[slot][i] = -1;
			check_player_cards(slot, i, true);
		}
	}
	return true;
}

start_blackjack(slot) {
	bl_turn[slot]=0;
	new _player,bool:_s,i=-1;
	while((++i)<7) {
		if((_player=bl_slot[slot][i])==-1) 
			continue;

		if GetPlayerCash(_player) < bl_bet[slot][i] *then {
			SendClientMessage(_player, COLOR_WHITE, "Ai fost scos de la masa pentru ca nu ai aceasta suma.");
			bl_hide_player(_player);
			continue;
		}
		if(!_s) {
			bl_turn[slot]=_player;
			format(gString, 70, "it's ~r~%s ~w~~h~turn~n~00:15", GetName(_player));
			TextDrawSetString(blackjack_time[i], gString);
			bl_time[slot] = 15;
			_s=true;
		}
		GivePlayerCash(_player,-bl_bet[slot][i]);
		PlayerPlaySound(_player,17802,0.0,0.0,0.0);
		bl_givePlayerCard(_player);
		bl_givePlayerCard(_player);
	}
	if(!bl_count[slot]) {
		bl_time[slot] = 0;
		bl_status[slot] = BL_WAITING;
		format(gString, 128, "{FFFFFF}Table #%d\nPlayers: %d/7\nBet: {029913}$%s - $%s\n{FFDD00}Waiting for players", slot+1, bl_count[slot], FormatNumber(_jack_bet_[slot/2][0]), FormatNumber(_jack_bet_[slot/2][1]));
		UpdateDynamic3DTextLabelText(bl_label[slot], 0xFFFFFFAA, gString);
		return true;
	}
	bl_status[slot] = BL_PROGRESS;
	format(gString, 128, "{FFFFFF}Table #%d\nPlayers: %d/7\nBet: {029913}$%s - $%s\n{FF0000}The match has started", slot+1, bl_count[slot], FormatNumber(_jack_bet_[slot/2][0]), FormatNumber(_jack_bet_[slot/2][1]));
	UpdateDynamic3DTextLabelText(bl_label[slot], 0xFFFFFFAA, gString);
	give_dealer_card(slot);
	return true;
}

dealer_refresh(slot) {
	for(new i=0;i<7;i++) {
		if bl_slot[slot][i]==-1 *then continue;
		bl_amount[slot][i]=bl_card_[slot][i]=0;
		format(gString, 80, "%s - 0~n~~g~$%s", GetName(bl_slot[slot][i]), FormatNumber(bl_bet[slot][i]));
		TextDrawSetString(bl_player[slot][i], gString);

		for(new x=0;x<40;x++) 
			TextDrawHideForPlayer(bl_slot[slot][i], bl_card_td[slot][x/5][x%5]);
	}
	bl_amount[slot][7]=bl_card_[slot][7]=0;
	format(gString, 128, "{FFFFFF}Table #%d\nPlayers: %d/7\nBet: {029913}$%s - $%s\n{FFDD00}Waiting for players", slot+1, bl_count[slot], FormatNumber(_jack_bet_[slot/2][0]), FormatNumber(_jack_bet_[slot/2][1]));
	UpdateDynamic3DTextLabelText(bl_label[slot], 0xFFFFFFAA, gString);
	TextDrawSetString(bl_player[slot][7], "");
	bl_status[slot] = BL_WAITING;
	bl_time[slot] = 15;
	return true;
}


removePlayerFromBl(playerid, slot) {
	new i = bl_slot_id[playerid][0];
	SendClientMessage(playerid,-1,"Ai fost scos de la masa de la blackjack deoarece nu ai selectat o actiune!");
	bl_hide_player(playerid);
	check_player_cards(slot, i, true);
	return true;
}