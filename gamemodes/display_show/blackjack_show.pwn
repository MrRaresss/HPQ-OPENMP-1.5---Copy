
load_bl() {
	new _y=-1,_x=-1,_z=-1;
	blackjack_td[0] = TextDrawCreate(267.100036, 165.537475, "hit");
	TextDrawLetterSize(blackjack_td[0], 0.267001, 1.220623);
	TextDrawTextSize(blackjack_td[0], 10.000000, 54.000000);
	TextDrawAlignment(blackjack_td[0], 2);
	TextDrawColor(blackjack_td[0], -1);
	TextDrawUseBox(blackjack_td[0], 1);
	TextDrawBoxColor(blackjack_td[0], 87);
	TextDrawSetShadow(blackjack_td[0], 0);
	TextDrawSetOutline(blackjack_td[0], 1);
	TextDrawBackgroundColor(blackjack_td[0], 255);
	TextDrawFont(blackjack_td[0], 2);
	TextDrawSetProportional(blackjack_td[0], 1);
	TextDrawSetShadow(blackjack_td[0], 0);
	TextDrawSetSelectable(blackjack_td[0], true);
	TextID[Text:blackjack_td[0]] = 0;

	blackjack_td[1] = TextDrawCreate(328.800018, 165.762786, "stand");
	TextDrawLetterSize(blackjack_td[1], 0.267001, 1.220623);
	TextDrawTextSize(blackjack_td[1], 10.000000, 54.000000);
	TextDrawAlignment(blackjack_td[1], 2);
	TextDrawColor(blackjack_td[1], -1);
	TextDrawUseBox(blackjack_td[1], 1);
	TextDrawBoxColor(blackjack_td[1], 87);
	TextDrawSetShadow(blackjack_td[1], 0);
	TextDrawSetOutline(blackjack_td[1], 1);
	TextDrawBackgroundColor(blackjack_td[1], 255);
	TextDrawFont(blackjack_td[1], 2);
	TextDrawSetProportional(blackjack_td[1], 1);
	TextDrawSetShadow(blackjack_td[1], 0);
	TextDrawSetSelectable(blackjack_td[1], true);
	TextID[Text:blackjack_td[1]] = 1;

	blackjack_td[2] = TextDrawCreate(389.700012, 165.487640, "fold");
	TextDrawLetterSize(blackjack_td[2], 0.267001, 1.220623);
	TextDrawTextSize(blackjack_td[2], 10.000000, 54.000000);
	TextDrawAlignment(blackjack_td[2], 2);
	TextDrawColor(blackjack_td[2], -1);
	TextDrawUseBox(blackjack_td[2], 1);
	TextDrawBoxColor(blackjack_td[2], 87);
	TextDrawSetShadow(blackjack_td[2], 0);
	TextDrawSetOutline(blackjack_td[2], 1);
	TextDrawBackgroundColor(blackjack_td[2], 255);
	TextDrawFont(blackjack_td[2], 2);
	TextDrawSetProportional(blackjack_td[2], 1);
	TextDrawSetShadow(blackjack_td[2], 0);
	TextDrawSetSelectable(blackjack_td[2], true);
	TextID[Text:blackjack_td[2]] = 2;

	while(++_y<6) {
		while(++_x<8) {
			bl_player[_y][_x] = TextDrawCreate(bl_name_pos[_x][0], bl_name_pos[_x][1], "");
			TextDrawLetterSize(bl_player[_y][_x], 0.182998, 0.987496);
			TextDrawAlignment(bl_player[_y][_x], 2);
			TextDrawColor(bl_player[_y][_x], -1);
			TextDrawSetShadow(bl_player[_y][_x], 0);
			TextDrawSetOutline(bl_player[_y][_x], 1);
			TextDrawBackgroundColor(bl_player[_y][_x], 255);
			TextDrawFont(bl_player[_y][_x], 2);
			TextDrawSetProportional(bl_player[_y][_x], 1);
			TextDrawSetShadow(bl_player[_y][_x], 0);
		}
		blackjack_time[_y] = TextDrawCreate(329.999908, 180.274566, " ");
		TextDrawLetterSize(blackjack_time[_y], 0.200000, 0.978748);
		TextDrawAlignment(blackjack_time[_y], 2);
		TextDrawColor(blackjack_time[_y], -1);
		TextDrawSetShadow(blackjack_time[_y], 0);
		TextDrawSetOutline(blackjack_time[_y], 1);
		TextDrawBackgroundColor(blackjack_time[_y], 255);
		TextDrawFont(blackjack_time[_y], 2);
		TextDrawSetProportional(blackjack_time[_y], 1);
		TextDrawSetShadow(blackjack_time[_y], 0);
		_x=-1;
	}

	_y=-1,_x=-1;
	while(++_y<6) {
		while(++_x<8) {
			while(++_z<5) {
				bl_card_td[_y][_x][_z] = TextDrawCreate(bl_card[_x][0]+(_z*6.3), bl_card[_x][1]+((_z%2)?(4.5+(_z*0.5)):-(_z*0.5)), "");
				TextDrawLetterSize(bl_card_td[_y][_x][_z], 0.000000, 0.000000);
				TextDrawTextSize(bl_card_td[_y][_x][_z], 18.600013, 31.909997);
				TextDrawAlignment(bl_card_td[_y][_x][_z], 1);
				TextDrawColor(bl_card_td[_y][_x][_z], -1);
				TextDrawSetShadow(bl_card_td[_y][_x][_z], 0);
				TextDrawSetOutline(bl_card_td[_y][_x][_z], 0);
				TextDrawBackgroundColor(bl_card_td[_y][_x][_z], 255);
				TextDrawFont(bl_card_td[_y][_x][_z], 4);
				TextDrawSetProportional(bl_card_td[_y][_x][_z], 0);
				TextDrawSetShadow(bl_card_td[_y][_x][_z], 0);
			}
			_z=-1;
		}
		_x=-1;
	}
	return true;
}

blackjack_show(playerid, pos, i) {
	SetPlayerCameraPos(playerid, _jack[pos], 1629.1731, 1009.6569);
	SetPlayerCameraLookAt(playerid, _jack[pos], 1630.1, 1008.0);
	SelectTextDraw(playerid, 0x8F9900FF);
	player_selected[playerid] = 19;

	for(new _x=0;_x<3;_x++) TextDrawShowForPlayer(playerid, blackjack_td[_x]);
	TextDrawShowForPlayer(playerid, blackjack_time[pos]);

	format(gString, 80, "%s - %d~n~~g~$%s", GetName(playerid), bl_amount[pos][i], FormatNumber(bl_bet[pos][i]));
	TextDrawSetString(bl_player[pos][i], gString);
	TextDrawShowForPlayer(playerid, bl_player[pos][i]);
	new bool:s;
	for(new _x=0,_player;_x<7;_x++) {
		if((_player=bl_slot[pos][_x])==-1) 
			continue;

		TextDrawShowForPlayer(playerid, bl_player[pos][bl_slot_id[_player][0]]);
		TextDrawShowForPlayer(_player, bl_player[pos][i]);
		s=true;
	}
	if(!s) {
		TextDrawSetString(blackjack_time[pos], "");
		bl_time[pos] = 15;
		TextDrawSetString(bl_player[pos][7], "dealer - 0");
	}
	bl_count[pos]++;
	format(gString, 128, "{FFFFFF}Table #%d\nPlayers: %d/7\nBet: {029913}$%s - $%s\n{FFDD00}Waiting for players", pos+1, bl_count[pos], FormatNumber(_jack_bet_[pos/2][0]), FormatNumber(_jack_bet_[pos/2][1]));
	UpdateDynamic3DTextLabelText(bl_label[pos], 0xFFFFFFAA, gString);
	bl_slot[pos][i]=playerid;
	TextDrawShowForPlayer(playerid, bl_player[pos][7]);
	return true;
}

static const card_col[4] = {'c','s','h','d'};
bl_givePlayerCard(playerid) {
	new 
		_s=bl_slot_id[playerid][1], 
		slot=bl_slot_id[playerid][0],
		_player, new_=bl_card_[_s][slot],
		_am=RandomEx(1, 13)
	;
	if bl_card_[_s][slot]>=5 *then return true;
	bl_amount[_s][slot]+=_am!=1?(_am>10?10:_am):(bl_amount[_s][slot]+11>21?1:11),bl_card_[_s][slot]++;

	if bl_card_[_s][slot]!=2||bl_amount[_s][slot]!=21 *then format(gString, 80, "%s - %d %s~n~~g~$%s", GetName(playerid), bl_amount[_s][slot], bl_amount[_s][slot]>21?("~r~(lost)"):(""), FormatNumber(bl_bet[_s][slot]));
	else format(gString, 80, "%s ~y~(blackjack)", GetName(playerid));
	TextDrawSetString(bl_player[_s][slot], gString);

	format(gString,30,"LD_CARD:cd%d%c", _am, card_col[random(sizeof card_col)]);
	TextDrawSetString(bl_card_td[_s][slot][new_], gString);
	for(new _x=0;_x<7;_x++) 
		if((_player=bl_slot[_s][_x])==-1) continue; 
		else TextDrawShowForPlayer(_player, bl_card_td[_s][slot][new_]);

	if bl_amount[_s][slot] > 21 *then {
		SCMf(playerid, -1, "You {FF0000}LOST {FFFFFF}the amount of $%s.", FormatNumber(bl_bet[_s][slot]));
		check_player_cards(_s, slot);
		bl_amount[_s][slot] = -1;
	}
	return true;
}

bl_hide_player(playerid, i=-1, _x=-1, _player=-1) {
	new slot=bl_slot_id[playerid][1],_i=bl_slot_id[playerid][0];
	while(++i<40) TextDrawHideForPlayer(playerid, bl_card_td[slot][i/5][i%5]); i=-1;
	while(++i<8) TextDrawHideForPlayer(playerid, bl_player[slot][i]); i=-1;
	while(++i<3) TextDrawHideForPlayer(playerid, blackjack_td[i]);
	TextDrawHideForPlayer(playerid, blackjack_time[slot]);

	while(++_x<7) {
		if((_player=bl_slot[slot][_x])==-1) continue;

		TextDrawHideForPlayer(_player, bl_player[slot][_i]); i=-1;
		while(++i<5) TextDrawHideForPlayer(_player, bl_card_td[slot][_i][i]);
	}

	// reset var
	if(!(--bl_count[slot])) bl_time[slot] = 0, bl_status[slot] = BL_WAITING;
	format(gString, 128, "{FFFFFF}Table #%d\nPlayers: %d/7\nBet: {029913}$%s - $%s\n%s", slot+1, bl_count[slot], FormatNumber(_jack_bet_[slot/2][0]), FormatNumber(_jack_bet_[slot/2][1]),bl_status[slot]!=BL_WAITING?("{FF0000}The match has started"):("{FFDD00}Waiting for players"));
	UpdateDynamic3DTextLabelText(bl_label[slot], 0xFFFFFFAA, gString);
	bl_slot[slot][_i]=-1;
	bl_amount[slot][_i]=bl_bet[slot][_i]=bl_card_[slot][_i]=
	bl_slot_id[playerid][1]=bl_slot_id[playerid][0]=0;

	SetCameraBehindPlayer(playerid);
	player_selected[playerid] = 0;
	CancelSelectTextDraw(playerid);
	return true;
}

give_dealer_card(slot, _x=-1) {
	new new_=bl_card_[slot][7],_am=RandomEx(1, 13);
	bl_amount[slot][7]+=_am!=1?(_am>10?10:_am):(bl_amount[slot][7]+11>21?1:11),bl_card_[slot][7]++;

	format(gString, 80, "dealer - %d", bl_amount[slot][7]);
	TextDrawSetString(bl_player[slot][7], gString);

	format(gString,30,"LD_CARD:cd%d%c", _am, card_col[random(sizeof card_col)]);
	TextDrawSetString(bl_card_td[slot][7][new_], gString);
	TextDrawSetString(bl_card_td[slot][7][new_+1], "LD_CARD:cdback");
	while(++_x<7)
		if bl_slot[slot][_x]==-1 *then continue; 
		else 
			TextDrawShowForPlayer(bl_slot[slot][_x], bl_card_td[slot][7][new_]),
			TextDrawShowForPlayer(bl_slot[slot][_x], bl_card_td[slot][7][new_+1]);

	ApplyDynamicActorAnimation(bl_actor[slot], "PED","IDLE_CHAT",4.0,0,0,0,0,0);
	return true;
}

check_player_cards(slot, i, bool:_ret=false) {
	if bl_amount[slot][i]<21&&bl_card_[slot][i]<5&&!_ret *then
		return true;

	while(++i<7) {
		if bl_slot[slot][i]==-1 *then continue;

		bl_turn[slot]=bl_slot[slot][i];
		format(gString, 70, "it's ~r~%s ~w~~h~turn~n~00:15", GetName(bl_slot[slot][i]));
		TextDrawSetString(blackjack_time[i], gString);
		bl_time[slot] = 15;
		return true;
	}
	check_bl_dealer(slot);
	return true;
}

check_bl_dealer(slot, _x=-1,_p=-1) {
	if bl_card_[slot][7]>=5 *then return true;
	new new_=bl_card_[slot][7],_am=RandomEx(1, bl_amount[slot][7]<15?13:5);
	bl_amount[slot][7]+=_am!=1?(_am>10?10:_am):(bl_amount[slot][7]+11>21?1:11),bl_card_[slot][7]++;

	format(gString, 80, "dealer - %d%s", bl_amount[slot][7], bl_amount[slot][7]==21?(" ~g~(blackjack)"):bl_amount[slot][7]>21?(" ~r~(busted)"):(""));
	TextDrawSetString(bl_player[slot][7], gString);

	TextDrawSetString(blackjack_time[slot], "it's ~r~dealer ~w~~h~turn~n~00:00");

	format(gString,30,"LD_CARD:cd%d%c", _am, card_col[random(sizeof card_col)]);
	TextDrawSetString(bl_card_td[slot][7][new_], gString);
	ApplyDynamicActorAnimation(bl_actor[slot], "PED","IDLE_CHAT",4.0,0,0,0,0,0);
	if bl_amount[slot][7] >= 18 *then {
		while(++_x<7) {
			if((_p=bl_slot[slot][_x])==-1) 
				continue; 

			TextDrawShowForPlayer(_p, bl_card_td[slot][7][new_]);

			if bl_amount[slot][_x] == -1 *then continue;
			if bl_amount[slot][7]>21 *then {
				SCMf(_p, COLOR_WHITE, "The round is over. You {1CBA00}WON {FFFFFF}the amount of $%s.", FormatNumber(bl_bet[slot][_x]*2));
				GivePlayerCash(_p,bl_bet[slot][_x]*2);
				PlayerPlaySound(_p, 4201, 0.0, 0.0, 0.0);
				continue;
			}

			if bl_amount[slot][_x]<=21 *then {
				if bl_amount[slot][_x]>bl_amount[slot][7] *then {
					SCMf(_p, COLOR_WHITE, "The round is over. You {1CBA00}WON {FFFFFF}the amount of $%s.", FormatNumber(bl_bet[slot][_x]*2));
					GivePlayerCash(_p,bl_bet[slot][_x]*2);
					PlayerPlaySound(_p, 4201, 0.0, 0.0, 0.0);
					continue;
				}
				else if bl_amount[slot][_x]==bl_amount[slot][7] *then {
					SCMf(_p, COLOR_WHITE, "You received $%s back the bet for this round.", FormatNumber(bl_bet[slot][_x]));
					GivePlayerCash(_p,bl_bet[slot][_x]);
					PlayerPlaySound(_p, 4201, 0.0, 0.0, 0.0);
					continue;
				}
			}
			SCMf(_p, COLOR_WHITE, "The round is over. You {FF0000}LOST {FFFFFF}the amount of $%s.", FormatNumber(bl_bet[slot][_x]));
			PlayerPlaySound(_p, 1085, 0.0, 0.0, 0.0);
		}

		bl_status[slot] = BL_REFRESH;
		bl_time[slot] = 4;
		return true;
	} 
	SetTimerEx(#fresh_dealer, 300, false, #i, slot);
	return true;
}

redist::fresh_dealer(slot) {
	check_bl_dealer(slot);
	return true;
}