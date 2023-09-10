#include "./src/roulette_var.pwn"

stock static Float:percentage(Float:value, Float:max_value) return (value / max_value) * 100.0;
HideRoulette(playerid) {
	if RulettStatus&&PlaceAlerdy[playerid] *then return SelectTextDraw(playerid, COLOR_WHITE);
	if(!Iter_Contains(IsRuletta, playerid)) return true;
	Iter_Remove(IsRuletta, playerid);
	player_selected[playerid] = 0;
	CancelSelectTextDraw(playerid);
	if(!Iter_Count(IsRuletta)) RulettStatus = 0;
	for(new i=0;i<17;i++) TextDrawHideForPlayer(playerid, RoulettaTD[i]);
	return true;
}
SendRulettaMessage(color, const amount[]) foreach(new i : IsRuletta) SendClientMessage(i, color, amount);
PutRouletteBet(playerid, money, type) {
	if(money < 1000000 || money > 100000000) return SendClientMessage(playerid, COLOR_GREY, "Invalid Amount.");
	if(GetPlayerCash(playerid) < money) return SendClientMessage(playerid, COLOR_GREY, "You don't have this amount of money");
	GivePlayerCash(playerid, -money); PlaceBet[playerid][type] = money; TotalBetPlace[type] ++; PrizePlace[type] += money; gString[0] = EOS;
	static const _x_[3] = {2, 0, 1};
	format(gString, 50, "%d bets~n~$%s", TotalBetPlace[type], FormatNumber(PrizePlace[type]));
	TextDrawSetString(RoulettaTD[14 + _x_[type]], gString);
	format(gString, 100, "%s a pariat suma de $%s pe {%s}%s{FFFFFF} (WIN %dx).", GetName(playerid), FormatNumber(money), RouletteInfo[type][R_COL], RouletteInfo[type][R_NAME], RouletteInfo[type][R_VALUE]);
	foreach(new i : IsRuletta) SendClientMessage(i, -1, gString);
	PlaceAlerdy[playerid] = type + 1;
	return true;
}
OnPlayerClickRoulette(playerid, _id) {
	if(PlaceAlerdy[playerid] || RulettStatus > 1) return true;
	format(gString, 128, "Bet on {5F9CC9}%s %dx WIN\n{A9C4E4}Enter how much you want to bet ($1.000.000 - $100.000.000)", RouletteInfo[_id][R_NAME], RouletteInfo[_id][R_VALUE]);
	ShowPlayerDialog(playerid, DIALOG_RED+_id, DIALOG_STYLE_INPUT, "Roulette: Place a bet", gString, "Bet", "Cancel");
	return true;
}
OnRoulettaUpdate() {
	switch RulettStatus do {
		case 0: return true;
		case 1: {
			if(!RulettaTime[0]) {
				RulettStatus = 2;
				TextDrawSetString(RoulettaTD[9], "THE ROULETTE IS SPINNING..");
				return true;
			}
			format(gString, 30, "SPINNING IN %d SECONDS..", RulettaTime[0]);
			TextDrawSetString(RoulettaTD[9], gString);
			RulettaTime[0] --;
		}
		default: {
			RulettaTime[1] = RulettaTime[1] > 35 ? 0 : RulettaTime[1] + 1;
			for(new i=0;i<7;i++) TextDrawColor(RoulettaTD[i+1], RouletteInfo[RouletteType[RulettaTime[1]][i]][R_COLOR]);
			RulettaTime[2] --;
			printf("%d", RulettaTime[2]);
			foreach(new i : IsRuletta) for(new x=0;x<7;x++) TextDrawShowForPlayer(i, RoulettaTD[x+1]);
			if(RulettaTime[2] <= 0) return RulettStatus = 0, SetTimer(#GiveRouletteParize, 1000, false), 1;
		}
	}
	return true;
}
redist::GiveRouletteParize() {
	new x = RouletteType[RulettaTime[1]][3];
	TextDrawSetString(RoulettaTD[9], "WAITING FOR BETS..");
	format(gString, 50, "The roulette landed on {%s}%s", RouletteInfo[x][R_COL], RouletteInfo[x][R_NAME]);
	SendRulettaMessage(-1, gString);
	foreach(new i : IsRuletta) {
		if(!PlaceAlerdy[i]) continue;
		if(x == PlaceAlerdy[i]-1) {
			GivePlayerCash(i, PlaceBet[i][x]*RouletteInfo[x][R_VALUE]);			
			format(gString, 50, "(+) You won $%s (%dx)", FormatNumber(PlaceBet[i][x]*RouletteInfo[x][R_VALUE]), RouletteInfo[x][R_VALUE]);
		} else format(gString, 50, "(-) You lost $%s.", FormatNumber(PlaceBet[i][PlaceAlerdy[i]-1]));
		SendClientMessage(i, COLOR_MONEY, gString);		
		PlaceBet[i][x] = 0;
		PlaceAlerdy[i] = 0;
	}
	for(new c = 0; c < 3; c++) TotalBetPlace[c]=0,PrizePlace[c]=0,TextDrawSetString(RoulettaTD[c+14], "0 bets~n~$0");
	RulettStatus = 1;
	RulettaTime[0] = 15;
 	RulettaTime[2] = RandomEx(25, 35) + (GetTickCount() % 2);
	return true;
}

LoadRouletta() {
	RulettaTime[1] = 3;

	CreateDynamicActor(172, 2197.5576,1603.7146,1005.0625,271.3319, 1, 100.0, 9, 1);
	CreateDynamic3DTextLabel("{D90006}Roulette\n{FFFFFF}Press {D90006}F {FFFFFF}to play this game\n(only reborns)", -1, 2197.5576,1603.7146,1005.0625+1.2, 5.0);

	RoulettaTD[0] = TextDrawCreate(312.045196, 131.466232, "box");
	TextDrawLetterSize(RoulettaTD[0], 0.000000, 21.679046);
	TextDrawTextSize(RoulettaTD[0], 0.000000, 400.000000);
	TextDrawAlignment(RoulettaTD[0], 2);
	TextDrawColor(RoulettaTD[0], -1);
	TextDrawUseBox(RoulettaTD[0], 1);
	TextDrawBoxColor(RoulettaTD[0], 127);
	TextDrawSetShadow(RoulettaTD[0], 0);
	TextDrawSetOutline(RoulettaTD[0], 0);
	TextDrawBackgroundColor(RoulettaTD[0], 255);
	TextDrawFont(RoulettaTD[0], 1);
	TextDrawSetProportional(RoulettaTD[0], 1);
	TextDrawSetShadow(RoulettaTD[0], 0);

	static _x=-1;
	while((++_x)<7) {
		RoulettaTD[_x+1] = TextDrawCreate(110.356544 + (_x * 57.3), 168.699569, "LD_SPAC:white");
		TextDrawLetterSize(RoulettaTD[_x+1], 0.000000, 0.000000);
		TextDrawTextSize(RoulettaTD[_x+1], 57.142848, 43.159973);
		TextDrawAlignment(RoulettaTD[_x+1], 1);
		TextDrawColor(RoulettaTD[_x+1], RouletteInfo[RouletteType[3][_x]][R_COLOR]);
		TextDrawSetShadow(RoulettaTD[_x+1], 0);
		TextDrawSetOutline(RoulettaTD[_x+1], 0);
		TextDrawBackgroundColor(RoulettaTD[_x+1], 255);
		TextDrawFont(RoulettaTD[_x+1], 4);
		TextDrawSetProportional(RoulettaTD[_x+1], 0);
		TextDrawSetShadow(RoulettaTD[_x+1], 0);
	}

	RoulettaTD[8] = TextDrawCreate(314.794769, 122.399971, "casino roulette");
	TextDrawLetterSize(RoulettaTD[8], 0.395811, 1.450000);
	TextDrawAlignment(RoulettaTD[8], 2);
	TextDrawColor(RoulettaTD[8], -1);
	TextDrawSetShadow(RoulettaTD[8], 0);
	TextDrawSetOutline(RoulettaTD[8], 1);
	TextDrawBackgroundColor(RoulettaTD[8], 255);
	TextDrawFont(RoulettaTD[8], 3);
	TextDrawSetProportional(RoulettaTD[8], 1);
	TextDrawSetShadow(RoulettaTD[8], 0);

	RoulettaTD[9] = TextDrawCreate(316.374298, 134.583328, "SPINNING IN 15 SECONDS..");
	TextDrawLetterSize(RoulettaTD[9], 0.223458, 1.409167);
	TextDrawAlignment(RoulettaTD[9], 2);
	TextDrawColor(RoulettaTD[9], -1);
	TextDrawSetShadow(RoulettaTD[9], 0);
	TextDrawSetOutline(RoulettaTD[9], 1);
	TextDrawBackgroundColor(RoulettaTD[9], 255);
	TextDrawFont(RoulettaTD[9], 2);
	TextDrawSetProportional(RoulettaTD[9], 1);
	TextDrawSetShadow(RoulettaTD[9], 0);

	RoulettaTD[10] = TextDrawCreate(311.246704, 164.566757, "LD_SPAC:white");
	TextDrawLetterSize(RoulettaTD[10], 0.000000, 0.000000);
	TextDrawTextSize(RoulettaTD[10], 1.000000, 52.780204);
	TextDrawAlignment(RoulettaTD[10], 1);
	TextDrawColor(RoulettaTD[10], -1);
	TextDrawSetShadow(RoulettaTD[10], 0);
	TextDrawSetOutline(RoulettaTD[10], 0);
	TextDrawBackgroundColor(RoulettaTD[10], 255);
	TextDrawFont(RoulettaTD[10], 4);
	TextDrawSetProportional(RoulettaTD[10], 0);
	TextDrawSetShadow(RoulettaTD[10], 0);

	_x=-1;
	static _x_[3] = {1, 2, 0};
	while((++_x)<3) {
		RoulettaTD[_x+11] = TextDrawCreate(190.966674 + (_x * 118.45), 258.333190, _x!=1?"WIN 2X":"WIN 14X");
		TextDrawLetterSize(RoulettaTD[_x+11], 0.342462, 1.378332);
		TextDrawTextSize(RoulettaTD[_x+11], 15.079999, 97.000000);
		TextDrawAlignment(RoulettaTD[_x+11], 2);
		TextDrawColor(RoulettaTD[_x+11], -1);
		TextDrawUseBox(RoulettaTD[_x+11], 1);
		TextDrawBoxColor(RoulettaTD[_x+11], RouletteInfo[_x_[_x]][R_COLOR]);
		TextDrawSetShadow(RoulettaTD[_x+11], 0);
		TextDrawSetOutline(RoulettaTD[_x+11], 1);
		TextDrawBackgroundColor(RoulettaTD[_x+11], 255);
		TextDrawFont(RoulettaTD[_x+11], 1);
		TextDrawSetProportional(RoulettaTD[_x+11], 1);
		TextDrawSetShadow(RoulettaTD[_x+11], 0);
		TextDrawSetSelectable(RoulettaTD[_x+11], true);
		TextID[Text:RoulettaTD[_x+11]] = _x;

		RoulettaTD[_x+14] = TextDrawCreate(190.373443 + (_x * 121.66), 273.516540, "0 bets~n~$0");
		TextDrawLetterSize(RoulettaTD[_x+14], 0.197598, 1.209165);
		TextDrawAlignment(RoulettaTD[_x+14], 2);
		TextDrawColor(RoulettaTD[_x+14], -1);
		TextDrawSetShadow(RoulettaTD[_x+14], 0);
		TextDrawSetOutline(RoulettaTD[_x+14], 1);
		TextDrawBackgroundColor(RoulettaTD[_x+14], 255);
		TextDrawFont(RoulettaTD[_x+14], 2);
		TextDrawSetProportional(RoulettaTD[_x+14], 1);
		TextDrawSetShadow(RoulettaTD[_x+14], 0);
	}
}