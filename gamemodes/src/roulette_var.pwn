new 
	TotalBetPlace[3], PrizePlace[3], PlaceBet[MAX_PLAYERS][3], 
	PlaceAlerdy[MAX_PLAYERS], RulettStatus = 0, Text: RoulettaTD[17], 
	Iterator:IsRuletta<MAX_PLAYERS>, RulettaTime[3]
;

enum R_INFO {
	R_NAME[10],
	R_COLOR,
	R_VALUE,
	R_COL[8]
}
new const RouletteType[][7] = {
	{1,0,1,0,1,0,2},
	{0,1,0,1,0,2,1},
	{1,0,1,0,2,1,0},
	{0,1,0,2,1,0,1},
	{1,0,2,1,0,1,0},
	{0,2,1,0,1,0,1},
	{2,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1},
	{0,1,0,1,0,1,0},
	{0,1,0,1,0,1,0},
	{1,0,1,0,1,0,1}
},
RouletteInfo[3][R_INFO] = {
	{
		"BLACK", 
		0x000000FF, 
		2, 
		"37333A"
	}, 
	{
		"RED", 
		0xFF0000FF, 
		2, 
		"D90006"
	}, 
	{
		"GREEN", 
		0x01FF02FF, 
		14, 
		"20A20C"
	}
};