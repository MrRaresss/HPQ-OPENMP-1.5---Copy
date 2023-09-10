#define MAX_BP_DAYS (20)

new PlayerText: bpPTD[MAX_PLAYERS][21], Text: bpTD[7], bpTime;

enum bp_ENUM_INFO {
	bpDays[5],
	bpFree[50],
	bpPro[50],
    bpNeed
}

cmd:debugbp(playerid, params[]) {

	new Text:fstd[21];
	new PlayerText:fstd_p[MAX_PLAYERS][27];

	fstd[20] = TextDrawCreate(99.666656, 138.977890, "box");
	TextDrawLetterSize(fstd[20], 0.000000, 19.133335);
	TextDrawTextSize(fstd[20], 516.000000, 0.000000);
	TextDrawAlignment(fstd[20], 1);
	TextDrawColor(fstd[20], 0xFFFFFFFF);
	TextDrawUseBox(fstd[20], 1);
	TextDrawBoxColor(fstd[20], 0xFFFFFF27);
	TextDrawSetShadow(fstd[20], 0);
	TextDrawSetOutline(fstd[20], 0);
	TextDrawBackgroundColor(fstd[20], 0xADD8E6FF);
	TextDrawFont(fstd[20], 1);
	TextDrawSetProportional(fstd[20], 1);
	TextDrawSetSelectable(fstd[20], 0);

	fstd[19] = TextDrawCreate(101.000046, 140.637039, "box");
	TextDrawLetterSize(fstd[19], 0.000000, 9.033328);
	TextDrawTextSize(fstd[19], 167.000000, 0.000000);
	TextDrawAlignment(fstd[19], 1);
	TextDrawColor(fstd[19], 0xFFFFFF07);
	TextDrawUseBox(fstd[19], 1);
	TextDrawBoxColor(fstd[19], 0x00000096);
	TextDrawSetShadow(fstd[19], 0);
	TextDrawSetOutline(fstd[19], 0);
	TextDrawBackgroundColor(fstd[19], 0x00000001);
	TextDrawFont(fstd[19], 1);
	TextDrawSetProportional(fstd[19], 1);
	TextDrawSetSelectable(fstd[19], 0);

	fstd[18] = TextDrawCreate(101.233391, 227.748184, "box");
	TextDrawLetterSize(fstd[18], 0.000000, 9.033328);
	TextDrawTextSize(fstd[18], 167.000000, 0.000000);
	TextDrawAlignment(fstd[18], 1);
	TextDrawColor(fstd[18], 0xFFFFFF07);
	TextDrawUseBox(fstd[18], 1);
	TextDrawBoxColor(fstd[18], 0xFFFF0096);
	TextDrawSetShadow(fstd[18], 0);
	TextDrawSetOutline(fstd[18], 0);
	TextDrawBackgroundColor(fstd[18], 0x00000001);
	TextDrawFont(fstd[18], 1);
	TextDrawSetProportional(fstd[18], 1);
	TextDrawSetSelectable(fstd[18], 0);

	fstd[17] = TextDrawCreate(171.100067, 140.637054, "box");
	TextDrawLetterSize(fstd[17], 0.000000, 9.033328);
	TextDrawTextSize(fstd[17], 235.200012, 0.000000);
	TextDrawAlignment(fstd[17], 1);
	TextDrawColor(fstd[17], 0xFFFFFF07);
	TextDrawUseBox(fstd[17], 1);
	TextDrawBoxColor(fstd[17], 0x00000096);
	TextDrawSetShadow(fstd[17], 0);
	TextDrawSetOutline(fstd[17], 0);
	TextDrawBackgroundColor(fstd[17], 0x00000001);
	TextDrawFont(fstd[17], 1);
	TextDrawSetProportional(fstd[17], 1);
	TextDrawSetSelectable(fstd[17], 0);

	fstd[16] = TextDrawCreate(171.100037, 228.163055, "box");
	TextDrawLetterSize(fstd[16], 0.000000, 9.033328);
	TextDrawTextSize(fstd[16], 235.000000, 0.000000);
	TextDrawAlignment(fstd[16], 1);
	TextDrawColor(fstd[16], 0xFFFFFF07);
	TextDrawUseBox(fstd[16], 1);
	TextDrawBoxColor(fstd[16], 0xFFFF0096);
	TextDrawSetShadow(fstd[16], 0);
	TextDrawSetOutline(fstd[16], 0);
	TextDrawBackgroundColor(fstd[16], 0x00000001);
	TextDrawFont(fstd[16], 1);
	TextDrawSetProportional(fstd[16], 1);
	TextDrawSetSelectable(fstd[16], 0);

	fstd[15] = TextDrawCreate(239.233353, 140.637146, "box");
	TextDrawLetterSize(fstd[15], 0.000000, 9.066658);
	TextDrawTextSize(fstd[15], 303.799988, 0.000000);
	TextDrawAlignment(fstd[15], 1);
	TextDrawColor(fstd[15], 0xFFFFFF07);
	TextDrawUseBox(fstd[15], 1);
	TextDrawBoxColor(fstd[15], 0x00000096);
	TextDrawSetShadow(fstd[15], 0);
	TextDrawSetOutline(fstd[15], 0);
	TextDrawBackgroundColor(fstd[15], 0x00000001);
	TextDrawFont(fstd[15], 1);
	TextDrawSetProportional(fstd[15], 1);
	TextDrawSetSelectable(fstd[15], 0);

	fstd[14] = TextDrawCreate(238.900009, 228.163086, "box");
	TextDrawLetterSize(fstd[14], 0.000000, 9.033329);
	TextDrawTextSize(fstd[14], 304.000000, 0.000000);
	TextDrawAlignment(fstd[14], 1);
	TextDrawColor(fstd[14], 0xFFFFFF07);
	TextDrawUseBox(fstd[14], 1);
	TextDrawBoxColor(fstd[14], 0xFFFF0096);
	TextDrawSetShadow(fstd[14], 0);
	TextDrawSetOutline(fstd[14], 0);
	TextDrawBackgroundColor(fstd[14], 0x00000001);
	TextDrawFont(fstd[14], 1);
	TextDrawSetProportional(fstd[14], 1);
	TextDrawSetSelectable(fstd[14], 0);

	fstd[13] = TextDrawCreate(307.899994, 140.637131, "box");
	TextDrawLetterSize(fstd[13], 0.000000, 9.033329);
	TextDrawTextSize(fstd[13], 374.000000, 0.000000);
	TextDrawAlignment(fstd[13], 1);
	TextDrawColor(fstd[13], 0xFFFFFF07);
	TextDrawUseBox(fstd[13], 1);
	TextDrawBoxColor(fstd[13], 0x00000096);
	TextDrawSetShadow(fstd[13], 0);
	TextDrawSetOutline(fstd[13], 0);
	TextDrawBackgroundColor(fstd[13], 0x00000001);
	TextDrawFont(fstd[13], 1);
	TextDrawSetProportional(fstd[13], 1);
	TextDrawSetSelectable(fstd[13], 0);

	fstd[12] = TextDrawCreate(308.033325, 228.048325, "box");
	TextDrawLetterSize(fstd[12], 0.000000, 9.033329);
	TextDrawTextSize(fstd[12], 373.799988, 0.000000);
	TextDrawAlignment(fstd[12], 1);
	TextDrawColor(fstd[12], 0xFFFFFF07);
	TextDrawUseBox(fstd[12], 1);
	TextDrawBoxColor(fstd[12], 0xFFFF0096);
	TextDrawSetShadow(fstd[12], 0);
	TextDrawSetOutline(fstd[12], 0);
	TextDrawBackgroundColor(fstd[12], 0x00000001);
	TextDrawFont(fstd[12], 1);
	TextDrawSetProportional(fstd[12], 1);
	TextDrawSetSelectable(fstd[12], 0);

	fstd[11] = TextDrawCreate(378.033295, 140.537155, "box");
	TextDrawLetterSize(fstd[11], 0.000000, 9.033329);
	TextDrawTextSize(fstd[11], 444.000000, 0.000000);
	TextDrawAlignment(fstd[11], 1);
	TextDrawColor(fstd[11], 0xFFFFFF07);
	TextDrawUseBox(fstd[11], 1);
	TextDrawBoxColor(fstd[11], 0x00000096);
	TextDrawSetShadow(fstd[11], 0);
	TextDrawSetOutline(fstd[11], 0);
	TextDrawBackgroundColor(fstd[11], 0x00000001);
	TextDrawFont(fstd[11], 1);
	TextDrawSetProportional(fstd[11], 1);
	TextDrawSetSelectable(fstd[11], 0);

	fstd[10] = TextDrawCreate(378.033295, 227.977890, "box");
	TextDrawLetterSize(fstd[10], 0.000000, 9.033329);
	TextDrawTextSize(fstd[10], 444.000000, 0.000000);
	TextDrawAlignment(fstd[10], 1);
	TextDrawColor(fstd[10], 0xFFFFFF07);
	TextDrawUseBox(fstd[10], 1);
	TextDrawBoxColor(fstd[10], 0xFFFF0096);
	TextDrawSetShadow(fstd[10], 0);
	TextDrawSetOutline(fstd[10], 0);
	TextDrawBackgroundColor(fstd[10], 0x00000001);
	TextDrawFont(fstd[10], 1);
	TextDrawSetProportional(fstd[10], 1);
	TextDrawSetSelectable(fstd[10], 0);

	fstd[9] = TextDrawCreate(447.899963, 140.666763, "box");
	TextDrawLetterSize(fstd[9], 0.000000, 9.033329);
	TextDrawTextSize(fstd[9], 514.199951, 0.000000);
	TextDrawAlignment(fstd[9], 1);
	TextDrawColor(fstd[9], 0xFFFFFF07);
	TextDrawUseBox(fstd[9], 1);
	TextDrawBoxColor(fstd[9], 0x00000096);
	TextDrawSetShadow(fstd[9], 0);
	TextDrawSetOutline(fstd[9], 0);
	TextDrawBackgroundColor(fstd[9], 0x00000001);
	TextDrawFont(fstd[9], 1);
	TextDrawSetProportional(fstd[9], 1);
	TextDrawSetSelectable(fstd[9], 0);

	fstd[8] = TextDrawCreate(447.899872, 227.963120, "box");
	TextDrawLetterSize(fstd[8], 0.000000, 9.033329);
	TextDrawTextSize(fstd[8], 514.380371, 0.000000);
	TextDrawAlignment(fstd[8], 1);
	TextDrawColor(fstd[8], 0xFFFFFF07);
	TextDrawUseBox(fstd[8], 1);
	TextDrawBoxColor(fstd[8], 0xFFFF0096);
	TextDrawSetShadow(fstd[8], 0);
	TextDrawSetOutline(fstd[8], 0);
	TextDrawBackgroundColor(fstd[8], 0x00000001);
	TextDrawFont(fstd[8], 1);
	TextDrawSetProportional(fstd[8], 1);
	TextDrawSetSelectable(fstd[8], 0);

	fstd[7] = TextDrawCreate(133.766724, 123.299957, "Missions");
	TextDrawLetterSize(fstd[7], 0.285665, 1.276443);
	TextDrawTextSize(fstd[7], 10.000000, 68.050011);
	TextDrawAlignment(fstd[7], 2);
	TextDrawColor(fstd[7], 0xFFFFFFFF);
	TextDrawUseBox(fstd[7], 1);
	TextDrawBoxColor(fstd[7], 0xFFA500FF);
	TextDrawSetShadow(fstd[7], 0);
	TextDrawSetOutline(fstd[7], 1);
	TextDrawBackgroundColor(fstd[7], 0x000000FF);
	TextDrawFont(fstd[7], 2);
	TextDrawSetProportional(fstd[7], 1);
	TextDrawSetSelectable(fstd[7], 1);

	fstd[6] = TextDrawCreate(134.333282, 202.826187, "NORMAL");
	TextDrawLetterSize(fstd[6], 0.400000, 1.600000);
	TextDrawTextSize(fstd[6], 1280.000000, 1280.000000);
	TextDrawAlignment(fstd[6], 2);
	TextDrawColor(fstd[6], 0xFFFFFFFF);
	TextDrawUseBox(fstd[6], 0);
	TextDrawBoxColor(fstd[6], 0x80808080);
	TextDrawSetShadow(fstd[6], 0);
	TextDrawSetOutline(fstd[6], 1);
	TextDrawBackgroundColor(fstd[6], 0x000000FF);
	TextDrawFont(fstd[6], 3);
	TextDrawSetProportional(fstd[6], 1);
	TextDrawSetSelectable(fstd[6], 0);

	fstd[5] = TextDrawCreate(134.266632, 290.815033, "PREMIUM");
	TextDrawLetterSize(fstd[5], 0.400000, 1.600000);
	TextDrawTextSize(fstd[5], 1280.000000, 1280.000000);
	TextDrawAlignment(fstd[5], 2);
	TextDrawColor(fstd[5], 0xFFFFFFFF);
	TextDrawUseBox(fstd[5], 0);
	TextDrawBoxColor(fstd[5], 0x80808080);
	TextDrawSetShadow(fstd[5], 0);
	TextDrawSetOutline(fstd[5], 1);
	TextDrawBackgroundColor(fstd[5], 0x000000FF);
	TextDrawFont(fstd[5], 3);
	TextDrawSetProportional(fstd[5], 1);
	TextDrawSetSelectable(fstd[5], 0);

	fstd[4] = TextDrawCreate(101.000008, 130.111023, "");
	TextDrawLetterSize(fstd[4], 0.000000, 0.000000);
	TextDrawTextSize(fstd[4], 64.000000, 83.000000);
	TextDrawAlignment(fstd[4], 1);
	TextDrawColor(fstd[4], 0xFFFFFFFF);
	TextDrawUseBox(fstd[4], 0);
	TextDrawBoxColor(fstd[4], 0x80808080);
	TextDrawSetShadow(fstd[4], 0);
	TextDrawSetOutline(fstd[4], 0);
	TextDrawBackgroundColor(fstd[4], 0x00000000);
	TextDrawFont(fstd[4], 5);
	TextDrawSetProportional(fstd[4], 0);
	TextDrawSetSelectable(fstd[4], 0);
	TextDrawSetPreviewModel(fstd[4], 954);
	TextDrawSetPreviewRot(fstd[4], 0.000000, 0.000000, 20.000000, 1.000000);

	fstd[3] = TextDrawCreate(517.666748, 314.029663, "The week end in: ~r~-16 days, 0 hours");
	TextDrawLetterSize(fstd[3], 0.201664, 1.069036);
	TextDrawTextSize(fstd[3], 1280.000000, 1280.000000);
	TextDrawAlignment(fstd[3], 3);
	TextDrawColor(fstd[3], 0xFFFFFFFF);
	TextDrawUseBox(fstd[3], 0);
	TextDrawBoxColor(fstd[3], 0x80808080);
	TextDrawSetShadow(fstd[3], 0);
	TextDrawSetOutline(fstd[3], 1);
	TextDrawBackgroundColor(fstd[3], 0x000000FF);
	TextDrawFont(fstd[3], 2);
	TextDrawSetProportional(fstd[3], 1);
	TextDrawSetSelectable(fstd[3], 0);

	fstd[2] = TextDrawCreate(77.999947, 216.277786, "LD_BEAT:left");
	TextDrawLetterSize(fstd[2], 0.000000, 0.000000);
	TextDrawTextSize(fstd[2], 16.000000, 17.000000);
	TextDrawAlignment(fstd[2], 1);
	TextDrawColor(fstd[2], 0xFFFFFFFF);
	TextDrawUseBox(fstd[2], 0);
	TextDrawBoxColor(fstd[2], 0x80808080);
	TextDrawSetShadow(fstd[2], 0);
	TextDrawSetOutline(fstd[2], 0);
	TextDrawBackgroundColor(fstd[2], 0x000000FF);
	TextDrawFont(fstd[2], 4);
	TextDrawSetProportional(fstd[2], 0);
	TextDrawSetSelectable(fstd[2], 1);

	fstd[1] = TextDrawCreate(521.866394, 217.107422, "LD_BEAT:right");
	TextDrawLetterSize(fstd[1], 0.000000, 0.000000);
	TextDrawTextSize(fstd[1], 16.000000, 17.000000);
	TextDrawAlignment(fstd[1], 1);
	TextDrawColor(fstd[1], 0xFFFFFFFF);
	TextDrawUseBox(fstd[1], 0);
	TextDrawBoxColor(fstd[1], 0x80808080);
	TextDrawSetShadow(fstd[1], 0);
	TextDrawSetOutline(fstd[1], 0);
	TextDrawBackgroundColor(fstd[1], 0x000000FF);
	TextDrawFont(fstd[1], 4);
	TextDrawSetProportional(fstd[1], 0);
	TextDrawSetSelectable(fstd[1], 1);

	fstd[0] = TextDrawCreate(102.666702, 217.222198, "");
	TextDrawLetterSize(fstd[0], 0.000000, 0.000000);
	TextDrawTextSize(fstd[0], 64.000000, 83.000000);
	TextDrawAlignment(fstd[0], 1);
	TextDrawColor(fstd[0], 0xFFFFFFFF);
	TextDrawUseBox(fstd[0], 0);
	TextDrawBoxColor(fstd[0], 0x80808080);
	TextDrawSetShadow(fstd[0], 0);
	TextDrawSetOutline(fstd[0], 0);
	TextDrawBackgroundColor(fstd[0], 0x00000000);
	TextDrawFont(fstd[0], 5);
	TextDrawSetProportional(fstd[0], 0);
	TextDrawSetSelectable(fstd[0], 0);
	TextDrawSetPreviewModel(fstd[0], 1247);
	TextDrawSetPreviewRot(fstd[0], 0.000000, 0.000000, 12.000000, 1.000000);

	fstd_p[playerid][21] = CreatePlayerTextDraw(playerid, 167.466736, 137.077759, "");
	PlayerTextDrawLetterSize(playerid, fstd_p[playerid][21], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, fstd_p[playerid][21], 70.000000, 68.000000);
	PlayerTextDrawAlignment(playerid, fstd_p[playerid][21], 1);
	PlayerTextDrawColor(playerid, fstd_p[playerid][21], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, fstd_p[playerid][21], 0);
	PlayerTextDrawBoxColor(playerid, fstd_p[playerid][21], 0x80808080);
	PlayerTextDrawSetShadow(playerid, fstd_p[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, fstd_p[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, fstd_p[playerid][21], 0x00000000);
	PlayerTextDrawFont(playerid, fstd_p[playerid][21], 5);
	PlayerTextDrawSetProportional(playerid, fstd_p[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, fstd_p[playerid][21], 0);
	PlayerTextDrawSetPreviewModel(playerid, fstd_p[playerid][21], 1274);
	PlayerTextDrawSetPreviewRot(playerid, fstd_p[playerid][21], 0.000000, 0.000000, 0.000000, 1.000000);

	fstd_p[playerid][20] = CreatePlayerTextDraw(playerid, 236.833313, 135.774170, "");
	PlayerTextDrawLetterSize(playerid, fstd_p[playerid][20], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, fstd_p[playerid][20], 67.000000, 70.000000);
	PlayerTextDrawAlignment(playerid, fstd_p[playerid][20], 1);
	PlayerTextDrawColor(playerid, fstd_p[playerid][20], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, fstd_p[playerid][20], 0);
	PlayerTextDrawBoxColor(playerid, fstd_p[playerid][20], 0x80808080);
	PlayerTextDrawSetShadow(playerid, fstd_p[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, fstd_p[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, fstd_p[playerid][20], 0x00000000);
	PlayerTextDrawFont(playerid, fstd_p[playerid][20], 5);
	PlayerTextDrawSetProportional(playerid, fstd_p[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, fstd_p[playerid][20], 0);
	PlayerTextDrawSetPreviewModel(playerid, fstd_p[playerid][20], 1210);
	PlayerTextDrawSetPreviewRot(playerid, fstd_p[playerid][20], 0.000000, 0.000000, 0.000000, 1.000000);

	fstd_p[playerid][19] = CreatePlayerTextDraw(playerid, 305.633484, 136.348129, "");
	PlayerTextDrawLetterSize(playerid, fstd_p[playerid][19], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, fstd_p[playerid][19], 68.000000, 70.000000);
	PlayerTextDrawAlignment(playerid, fstd_p[playerid][19], 1);
	PlayerTextDrawColor(playerid, fstd_p[playerid][19], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, fstd_p[playerid][19], 0);
	PlayerTextDrawBoxColor(playerid, fstd_p[playerid][19], 0x80808080);
	PlayerTextDrawSetShadow(playerid, fstd_p[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, fstd_p[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, fstd_p[playerid][19], 0x00000000);
	PlayerTextDrawFont(playerid, fstd_p[playerid][19], 5);
	PlayerTextDrawSetProportional(playerid, fstd_p[playerid][19], 0);
	PlayerTextDrawSetSelectable(playerid, fstd_p[playerid][19], 0);
	PlayerTextDrawSetPreviewModel(playerid, fstd_p[playerid][19], 19792);
	PlayerTextDrawSetPreviewRot(playerid, fstd_p[playerid][19], 0.000000, 0.000000, 0.000000, 1.000000);

	fstd_p[playerid][18] = CreatePlayerTextDraw(playerid, 374.633453, 135.933380, "");
	PlayerTextDrawLetterSize(playerid, fstd_p[playerid][18], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, fstd_p[playerid][18], 68.000000, 70.000000);
	PlayerTextDrawAlignment(playerid, fstd_p[playerid][18], 1);
	PlayerTextDrawColor(playerid, fstd_p[playerid][18], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, fstd_p[playerid][18], 0);
	PlayerTextDrawBoxColor(playerid, fstd_p[playerid][18], 0x80808080);
	PlayerTextDrawSetShadow(playerid, fstd_p[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, fstd_p[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, fstd_p[playerid][18], 0x00000000);
	PlayerTextDrawFont(playerid, fstd_p[playerid][18], 5);
	PlayerTextDrawSetProportional(playerid, fstd_p[playerid][18], 0);
	PlayerTextDrawSetSelectable(playerid, fstd_p[playerid][18], 0);
	PlayerTextDrawSetPreviewModel(playerid, fstd_p[playerid][18], 1277);
	PlayerTextDrawSetPreviewRot(playerid, fstd_p[playerid][18], 0.000000, 0.000000, 0.000000, 1.000000);

	fstd_p[playerid][17] = CreatePlayerTextDraw(playerid, 445.633514, 136.348160, "");
	PlayerTextDrawLetterSize(playerid, fstd_p[playerid][17], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, fstd_p[playerid][17], 68.000000, 70.000000);
	PlayerTextDrawAlignment(playerid, fstd_p[playerid][17], 1);
	PlayerTextDrawColor(playerid, fstd_p[playerid][17], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, fstd_p[playerid][17], 0);
	PlayerTextDrawBoxColor(playerid, fstd_p[playerid][17], 0x80808080);
	PlayerTextDrawSetShadow(playerid, fstd_p[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, fstd_p[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, fstd_p[playerid][17], 0x00000000);
	PlayerTextDrawFont(playerid, fstd_p[playerid][17], 5);
	PlayerTextDrawSetProportional(playerid, fstd_p[playerid][17], 0);
	PlayerTextDrawSetSelectable(playerid, fstd_p[playerid][17], 0);
	PlayerTextDrawSetPreviewModel(playerid, fstd_p[playerid][17], 1314);
	PlayerTextDrawSetPreviewRot(playerid, fstd_p[playerid][17], 0.000000, 0.000000, 0.000000, 1.000000);

	fstd_p[playerid][16] = CreatePlayerTextDraw(playerid, 168.966766, 223.459274, "");
	PlayerTextDrawLetterSize(playerid, fstd_p[playerid][16], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, fstd_p[playerid][16], 68.000000, 70.000000);
	PlayerTextDrawAlignment(playerid, fstd_p[playerid][16], 1);
	PlayerTextDrawColor(playerid, fstd_p[playerid][16], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, fstd_p[playerid][16], 0);
	PlayerTextDrawBoxColor(playerid, fstd_p[playerid][16], 0x80808080);
	PlayerTextDrawSetShadow(playerid, fstd_p[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, fstd_p[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, fstd_p[playerid][16], 0x00000000);
	PlayerTextDrawFont(playerid, fstd_p[playerid][16], 5);
	PlayerTextDrawSetProportional(playerid, fstd_p[playerid][16], 0);
	PlayerTextDrawSetSelectable(playerid, fstd_p[playerid][16], 0);
	PlayerTextDrawSetPreviewModel(playerid, fstd_p[playerid][16], 1277);
	PlayerTextDrawSetPreviewRot(playerid, fstd_p[playerid][16], 0.000000, 0.000000, 0.000000, 1.000000);

	fstd_p[playerid][15] = CreatePlayerTextDraw(playerid, 237.300095, 223.874069, "");
	PlayerTextDrawLetterSize(playerid, fstd_p[playerid][15], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, fstd_p[playerid][15], 68.000000, 70.000000);
	PlayerTextDrawAlignment(playerid, fstd_p[playerid][15], 1);
	PlayerTextDrawColor(playerid, fstd_p[playerid][15], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, fstd_p[playerid][15], 0);
	PlayerTextDrawBoxColor(playerid, fstd_p[playerid][15], 0x80808080);
	PlayerTextDrawSetShadow(playerid, fstd_p[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, fstd_p[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, fstd_p[playerid][15], 0x00000000);
	PlayerTextDrawFont(playerid, fstd_p[playerid][15], 5);
	PlayerTextDrawSetProportional(playerid, fstd_p[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, fstd_p[playerid][15], 0);
	PlayerTextDrawSetPreviewModel(playerid, fstd_p[playerid][15], 1275);
	PlayerTextDrawSetPreviewRot(playerid, fstd_p[playerid][15], 0.000000, 0.000000, 0.000000, 1.000000);

	fstd_p[playerid][14] = CreatePlayerTextDraw(playerid, 305.966827, 224.288895, "");
	PlayerTextDrawLetterSize(playerid, fstd_p[playerid][14], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, fstd_p[playerid][14], 68.000000, 70.000000);
	PlayerTextDrawAlignment(playerid, fstd_p[playerid][14], 1);
	PlayerTextDrawColor(playerid, fstd_p[playerid][14], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, fstd_p[playerid][14], 0);
	PlayerTextDrawBoxColor(playerid, fstd_p[playerid][14], 0x80808080);
	PlayerTextDrawSetShadow(playerid, fstd_p[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, fstd_p[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, fstd_p[playerid][14], 0x00000000);
	PlayerTextDrawFont(playerid, fstd_p[playerid][14], 5);
	PlayerTextDrawSetProportional(playerid, fstd_p[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, fstd_p[playerid][14], 0);
	PlayerTextDrawSetPreviewModel(playerid, fstd_p[playerid][14], 1210);
	PlayerTextDrawSetPreviewRot(playerid, fstd_p[playerid][14], 0.000000, 0.000000, 0.000000, 1.000000);

	fstd_p[playerid][13] = CreatePlayerTextDraw(playerid, 376.633575, 225.118515, "");
	PlayerTextDrawLetterSize(playerid, fstd_p[playerid][13], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, fstd_p[playerid][13], 68.000000, 70.000000);
	PlayerTextDrawAlignment(playerid, fstd_p[playerid][13], 1);
	PlayerTextDrawColor(playerid, fstd_p[playerid][13], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, fstd_p[playerid][13], 0);
	PlayerTextDrawBoxColor(playerid, fstd_p[playerid][13], 0x80808080);
	PlayerTextDrawSetShadow(playerid, fstd_p[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, fstd_p[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, fstd_p[playerid][13], 0x00000000);
	PlayerTextDrawFont(playerid, fstd_p[playerid][13], 5);
	PlayerTextDrawSetProportional(playerid, fstd_p[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, fstd_p[playerid][13], 0);
	PlayerTextDrawSetPreviewModel(playerid, fstd_p[playerid][13], 1277);
	PlayerTextDrawSetPreviewRot(playerid, fstd_p[playerid][13], 0.000000, 0.000000, 0.000000, 1.000000);

	fstd_p[playerid][12] = CreatePlayerTextDraw(playerid, 446.967072, 224.703705, "");
	PlayerTextDrawLetterSize(playerid, fstd_p[playerid][12], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, fstd_p[playerid][12], 68.000000, 70.000000);
	PlayerTextDrawAlignment(playerid, fstd_p[playerid][12], 1);
	PlayerTextDrawColor(playerid, fstd_p[playerid][12], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, fstd_p[playerid][12], 0);
	PlayerTextDrawBoxColor(playerid, fstd_p[playerid][12], 0x80808080);
	PlayerTextDrawSetShadow(playerid, fstd_p[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, fstd_p[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, fstd_p[playerid][12], 0x00000000);
	PlayerTextDrawFont(playerid, fstd_p[playerid][12], 5);
	PlayerTextDrawSetProportional(playerid, fstd_p[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, fstd_p[playerid][12], 0);
	PlayerTextDrawSetPreviewModel(playerid, fstd_p[playerid][12], 603);
	PlayerTextDrawSetPreviewRot(playerid, fstd_p[playerid][12], 0.000000, 0.000000, 0.000000, 1.000000);

	for(new i; i < 100; i++) {
		PlayerTextDrawShow(playerid, fstd_p[playerid][i]);
		TextDrawShowForPlayer(playerid, fstd[i]);
	}

	return true;
}

static const bpInfo[MAX_BP_DAYS][bp_ENUM_INFO] = {
	{"1", "~n~$20.000.000~n~money~n~~n~",    "~n~$75.000.000~n~money~n~~n~", 300},
	{"2", "~n~25x~n~PP~n~~n~",   "~n~100x~n~PP~n~~n~", 500},
    {"3", "~n~10x~n~Respect~n~~n~",     "~n~25x~n~Respect~n~~n~", 200},
    {"4", "~n~500x~n~Pet Points~n~~n~","~n~5000x~n~Pet Points~n~~n~", 200},
	{"5", "~n~$20.000.000~n~money~n~~n~",     "~n~$100.000.000~n~money~n~~n~", 300},
	{"6", "~n~600x gift~n~points~n~~n~",    "~n~1000x gift~n~points~n~~n~", 200},
	{"7", "~n~2x Hidden~n~Color~n~~n~", "~n~$50.000.000~n~50 PP~n~~n~", 200},
	{"8", "1x~n~Trans..~n~Crate~n~~n~",    "2x~n~Trans..~n~Crate~n~~n~", 300},
	{"9", "~n~10x Respect~n~Points~n~",   "~n~1x Skin~n~Trans..~n~~n~", 200},
	{"10", "~n~15x~n~PP~n~~n~",    "~n~50x~n~PP~n~~n~", 250},
	{"11", "~n~1x Skin~n~Legendary~n~~n~",  "~n~1x vehicle~n~slot~n~~n~", 400},
	{"12", "~n~5x~n~Epic crate~n~~n~",    "~n~1x vehicle~n~crate~n~~n~",150},
	{"13", "500x~n~Epic~n~points~n~~n~",  "2500x~n~Epic~n~points~n~~n~", 200},
	{"14", "~n~100x gift~n~points~n~~n~",  "~n~10x~n~Hidden~n~Colors", 150},
	{"15", "10x~n~respect~n~points~n~~n~",  "50x~n~Respect~n~points~n~~n~", 100},
	{"16", "~n~$20.000.000~n~money~n~~n~",  "~n~$100.000.000~n~money~n~~n~", 200},
	{"17", "~n~15x~n~PP~n~~n~",  "~n~50x~n~PP~n~~n~", 300},
	{"18", "~n~300x~n~E-Points",   "~n~2500x Epic~n~points~n~", 250},
	{"19", "~n~500x Pet~n~Points~n~~n~",  "~n~5000x Pet~n~Points~n~~n~", 200},
	{"20", "1x Frozen(c)~n~800x RP~n~25 PP~n~",    "2x premium(c)~n~5x emotes(c)", 4000}
};
static const bp_color[] = {-2139062102, -2139062146, -5963626, -5963676, 1155017471, 680924415, 0x33333370, 0x22222270, 0x73634070, 0x564A3170};

new bpPage[MAX_PLAYERS], bpChapter;
ShowBattlePass(playerid) {
	if(player_selected[playerid]) return true;
    if(bpTime < gettime()) return true;
	bpPage[playerid] = 0;
	LoadBattlePass(playerid);
	PlayerTextDrawBoxColor(playerid, bpPTD[playerid][15], -2139062172);
	PlayerTextDrawBoxColor(playerid, bpPTD[playerid][16], -2139062072);
	SelectTextDraw(playerid, COLOR_LGREEN);
	player_selected[playerid] = 30;
	return bool:true;
}
#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason) {
    if(!IsPlayerLogged(playerid)) return true;
    save_bp(playerid);
    return true;
}

//loadbp settings
hook OnGameModeInit() {
    bpTD[0] = TextDrawCreate(326.542816, 180.389984, "box");
    TextDrawLetterSize(bpTD[0], 0.000000, 11.733320);
    TextDrawTextSize(bpTD[0], 0.000000, 326.000000);
    TextDrawAlignment(bpTD[0], 2);
    TextDrawColor(bpTD[0], -1);
    TextDrawUseBox(bpTD[0], 1);
    TextDrawBoxColor(bpTD[0], 125);
    TextDrawSetShadow(bpTD[0], 0);
    TextDrawSetOutline(bpTD[0], 0);
    TextDrawBackgroundColor(bpTD[0], 255);
    TextDrawFont(bpTD[0], 1);
    TextDrawSetProportional(bpTD[0], 1);
    TextDrawSetShadow(bpTD[0], 0);

    bpTD[1] = TextDrawCreate(184.504989, 197.574981, "~n~Free~n~pass~n~~n~");
    TextDrawLetterSize(bpTD[1], 0.289000, 1.111873);
    TextDrawTextSize(bpTD[1], 0.000000, 37.000000);
    TextDrawAlignment(bpTD[1], 2);
    TextDrawColor(bpTD[1], -1);
    TextDrawUseBox(bpTD[1], 1);
    TextDrawBoxColor(bpTD[1], -2139062146);
    TextDrawSetShadow(bpTD[1], 0);
    TextDrawSetOutline(bpTD[1], 1);
    TextDrawBackgroundColor(bpTD[1], 96);
    TextDrawFont(bpTD[1], 2);
    TextDrawSetProportional(bpTD[1], 1);
    TextDrawSetShadow(bpTD[1], 0);
    TextDrawSetSelectable(bpTD[1], true);

    bpTD[2] = TextDrawCreate(184.452438, 242.959167, "~n~~y~gold~n~pass~n~");
    TextDrawLetterSize(bpTD[2], 0.292499, 1.107499);
    TextDrawTextSize(bpTD[2], 20.000000, 37.000000);
    TextDrawAlignment(bpTD[2], 2);
    TextDrawColor(bpTD[2], -1);
    TextDrawUseBox(bpTD[2], 1);
    TextDrawBoxColor(bpTD[2], -5963676);
    TextDrawSetShadow(bpTD[2], 0);
    TextDrawSetOutline(bpTD[2], 1);
    TextDrawBackgroundColor(bpTD[2], 76);
    TextDrawFont(bpTD[2], 2);
    TextDrawSetProportional(bpTD[2], 1);
    TextDrawSetShadow(bpTD[2], 0);
    TextDrawSetSelectable(bpTD[2], true);

    bpTD[3] = TextDrawCreate(331.404907, 127.644081, "Battle ~g~~h~Pass");
    TextDrawLetterSize(bpTD[3], 0.387616, 2.482156);
    TextDrawAlignment(bpTD[3], 2);
    TextDrawColor(bpTD[3], -1);
    TextDrawSetShadow(bpTD[3], 0);
    TextDrawSetOutline(bpTD[3], 1);
    TextDrawBackgroundColor(bpTD[3], 60);
    TextDrawFont(bpTD[3], 1);
    TextDrawSetProportional(bpTD[3], 1);
    TextDrawSetShadow(bpTD[3], 0);

    bpTD[4] = TextDrawCreate(249.366668, 173.639739, "particle:lamp_shad_64");
    TextDrawLetterSize(bpTD[4], 0.000000, 0.000000);
    TextDrawTextSize(bpTD[4], 168.000000, -23.000000);
    TextDrawAlignment(bpTD[4], 1);
    TextDrawColor(bpTD[4], 255);
    TextDrawSetShadow(bpTD[4], 0);
    TextDrawSetOutline(bpTD[4], 0);
    TextDrawBackgroundColor(bpTD[4], 255);
    TextDrawFont(bpTD[4], 4);
    TextDrawSetProportional(bpTD[4], 0);
    TextDrawSetShadow(bpTD[4], 0);

    bpTD[5] = TextDrawCreate(191.676361, 165.250045, "box");
    TextDrawLetterSize(bpTD[5], 0.000000, 1.280503);
    TextDrawTextSize(bpTD[5], 0.000000, 56.389934);
    TextDrawAlignment(bpTD[5], 2);
    TextDrawColor(bpTD[5], -1);
    TextDrawUseBox(bpTD[5], 1);
    TextDrawBoxColor(bpTD[5], 125);
    TextDrawSetShadow(bpTD[5], 0);
    TextDrawSetOutline(bpTD[5], 0);
    TextDrawBackgroundColor(bpTD[5], 255);
    TextDrawFont(bpTD[5], 1);
    TextDrawSetProportional(bpTD[5], 1);
    TextDrawSetShadow(bpTD[5], 0);

    bpTD[6] = TextDrawCreate(191.814178, 168.024230, "missions");
    TextDrawLetterSize(bpTD[6], 0.241283, 0.917415);
    TextDrawTextSize(bpTD[6], 10.000000, 52.000000);
    TextDrawAlignment(bpTD[6], 2);
    TextDrawColor(bpTD[6], -1);
    TextDrawUseBox(bpTD[6], 1);
    TextDrawBoxColor(bpTD[6], 8388863);
    TextDrawSetShadow(bpTD[6], 0);
    TextDrawSetOutline(bpTD[6], 1);
    TextDrawBackgroundColor(bpTD[6], 84);
    TextDrawFont(bpTD[6], 2);
    TextDrawSetProportional(bpTD[6], 1);
    TextDrawSetShadow(bpTD[6], 0);
    TextDrawSetSelectable(bpTD[6], true);

    return true;
}

redist::SQL_load_battlepass() {
    if(!cache_num_rows()) return true;
    cache_get_value_name_int(0, "chapter", bpChapter);
    cache_get_value_name_int(0, "bpTime", bpTime);
    print("[MySQL]\t\t\tbattlepass loaded");
    return true;
}

DEFINE_HOOK_REPLACEMENT__(OnPlayer    , OP_);
hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid) {
    if(player_selected[playerid]!=30) return true;
    new x , y;
    switch((x=PlayerTextID[playerid][playertextid])) {
        case 0..4: {
            y=(bpPage[playerid] * 5) + x;
            if(PlayerInfo[playerid][pTier] < y+1 || PlayerInfo[playerid][bpClaimed][y]) return true;
            switch((bpPage[playerid] * 5) + x) { 
                case 0: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit $20.000.000 din Free Battle Pass!");
                    GivePlayerCash(playerid, 20000000);
                } 
                case 1: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 25 premium points din Free Battle Pass!");
                    PlayerInfo[playerid][pPremiumPoints] += 25;
                    UpdateVar(playerid, "GoldPoints", PlayerInfo[playerid][pPremiumPoints]);
                } 
                case 2: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 10 respect points din Free Battle Pass!");
                    PlayerInfo[playerid][pExp] += 10;
                    UpdateVar(playerid, "Respect", PlayerInfo[playerid][pExp]);
                } 
                case 3: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 500 pet points din Free Battle Pass!");
                    givePetPoint(playerid, 500);
                } 
                case 4: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit $20.000.000 din Free Battle Pass!");
                    GivePlayerCash(playerid, 20000000);
                }
                case 5: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 600 gift points din Free Battle Pass!");
                    givePoints(playerid, 0, 600);
                } 
                case 6: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 2 hidden color din Free Battle Pass!");
                    PlayerInfo[playerid][pHidden] += 2;
                    UpdateVar(playerid, "Hidden", PlayerInfo[playerid][pHidden]);
                } 
                case 7: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 1x Transcendet Crate din Free Battle Pass!");
                    PlayerInfo[playerid][pCrates][4] ++;
                    save_crates(playerid);
                } 
                case 8: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 10 respect points din Free Battle Pass!");
                    PlayerInfo[playerid][pExp] += 10;
                    UpdateVar(playerid, "Respect", PlayerInfo[playerid][pExp]);
                }
                case 9: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 15 premium points din Free Battle Pass!");
                    PlayerInfo[playerid][pPremiumPoints] += 15;
                    UpdateVar(playerid, "GoldPoints", PlayerInfo[playerid][pPremiumPoints]);
                } 
                case 10: {
                    new am = loadSkins[e_SKIN_LEGENDARY][random(sizeof(loadSkins[e_SKIN_LEGENDARY]))];
                    SCMf(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit skin %d (Legendary) din Free Battle Pass!", am);
                    give_skin(playerid, am);
                } 
                case 11: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 5x Epic Crate din Free Battle Pass!");
                    PlayerInfo[playerid][pCrates][1] += 5;
                    save_crates(playerid);
                } 
                case 12: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 300 E-Points din Free Battle Pass!");
                    givePoints(playerid, 300);
                } 
                case 13: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 100 gift points din Free Battle Pass!");
                    givePoints(playerid, 0, 100);
                } 
                case 14: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 10 respect points din Free Battle Pass!");
                    PlayerInfo[playerid][pExp] += 10;
                    UpdateVar(playerid, "Respect", PlayerInfo[playerid][pExp]);
                } 
                case 15: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit $20.000.000 din Free Battle Pass!");
                    GivePlayerCash(playerid, 20000000);
                }
                case 16: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 15 premium points din Free Battle Pass!");
                    PlayerInfo[playerid][pPremiumPoints] += 15;
                    UpdateVar(playerid, "GoldPoints", PlayerInfo[playerid][pPremiumPoints]);
                } 
                case 17: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 300 E-Points din Free Battle Pass!");
                    givePoints(playerid, 300);
                } 
                case 18: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 500 pet points din Free Battle Pass!");
                    givePetPoint(playerid, 500);
                } 
                case 19: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 1x Frozen Crate, 800 E-Points, 25pp din Free Battle Pass!");
                    PlayerInfo[playerid][pCrates][7] ++;
                    save_crates(playerid);
                    givePoints(playerid, 800);
                    PlayerInfo[playerid][pPremiumPoints] += 25;
                    UpdateVar(playerid, "GoldPoints", PlayerInfo[playerid][pPremiumPoints]);
                }
            }
            PlayerTextDrawSetString(playerid, playertextid, "~n~~w~(claimed)~n~~n~");
            PlayerTextDrawBoxColor(playerid, playertextid, bp_color[6+(y%2)]);
            PlayerTextDrawShow(playerid, playertextid);

            PlayerInfo[playerid][bpClaimed][y] = true;
            save_claimed_bp(playerid);
        }
        case 5..9: {
            if(!PlayerInfo[playerid][pGoldPass]) return true;
            y=(bpPage[playerid] * 5) + x-5;
            if(PlayerInfo[playerid][pTier] < y+1 || PlayerInfo[playerid][bpClaimed][y+20]) return true;
            switch(y) { 
                case 0: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit $75.000.000 din Gold Battle Pass!");
                    GivePlayerCash(playerid, 75000000);
                }
                case 1: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 100 premium points din Gold Battle Pass!");
                    PlayerInfo[playerid][pPremiumPoints] += 100;
                    UpdateVar(playerid, "GoldPoints", PlayerInfo[playerid][pPremiumPoints]);
                }
                case 2: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 25 respect points din Gold Battle Pass!");
                    PlayerInfo[playerid][pExp] += 25;
                    UpdateVar(playerid, "Respect", PlayerInfo[playerid][pExp]);
                }
                case 3: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 5000 pet points din Gold Battle Pass!");
                    givePetPoint(playerid, 5000);
                }
                case 4: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit $100.000.000 din Gold Battle Pass!");
                    GivePlayerCash(playerid, 100000000);
                }
                case 5: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 1000 gift points din Gold Battle Pass!");
                    givePoints(playerid, 0, 1000);
                }
                case 6: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit $50.000.000 si 50 premium points din Gold Battle Pass!");
                    GivePlayerCash(playerid, 75000000);
                    PlayerInfo[playerid][pPremiumPoints] += 50;
                    UpdateVar(playerid, "GoldPoints", PlayerInfo[playerid][pPremiumPoints]);
                }
                case 7: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 2x Transcendet Crate din Gold Battle Pass!");
                    PlayerInfo[playerid][pCrates][4] += 2;
                    save_crates(playerid);
                } 
                case 8: {
                    new am = loadSkins[e_SKIN_TRANSCENDENT][random(sizeof(loadSkins[e_SKIN_TRANSCENDENT]))];
                    SCMf(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit skin %d (Transcendet) din Free Battle Pass!", am);
                    give_skin(playerid, am);
                } 
                case 9: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 50 premium points din Gold Battle Pass!");
                    PlayerInfo[playerid][pPremiumPoints] += 50;
                    UpdateVar(playerid, "GoldPoints", PlayerInfo[playerid][pPremiumPoints]);
                }
                case 10: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit un vehicle slot din Gold Battle Pass!");
                    PlayerInfo[playerid][pSlot] ++;
                    UpdateVar(playerid, "Slot", PlayerInfo[playerid][pSlot]);
                }
                case 11: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit un vehicle Crate din Gold Battle Pass!");
                    PlayerInfo[playerid][pCrates][5]  ++;
                    save_crates(playerid);
                } 
                case 12: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 2500 E-Points din Gold Battle Pass!");
                    givePoints(playerid, 2500);
                } 
                case 13: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 10 hidden colors din Gold Battle Pass!");
                    PlayerInfo[playerid][pHidden] += 10;
                    UpdateVar(playerid, "Hidden", PlayerInfo[playerid][pHidden]);
                }
                case 14: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 50 respect points din Gold Battle Pass!");
                    PlayerInfo[playerid][pExp] += 50;
                    UpdateVar(playerid, "Respect", PlayerInfo[playerid][pExp]);
                }
                case 15: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit $100.000.000 din Gold Battle Pass!");
                    GivePlayerCash(playerid, 100000000);
                }
                case 16: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 50 premium points din Gold Battle Pass!");
                    PlayerInfo[playerid][pPremiumPoints] += 50;
                    UpdateVar(playerid, "GoldPoints", PlayerInfo[playerid][pPremiumPoints]);
                }
                case 17: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 2500 E-Points din Gold Battle Pass!");
                    givePoints(playerid, 2500);
                } 
                case 18: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 5000 pet points din Gold Battle Pass!");
                    givePetPoint(playerid, 5000);
                }
                case 19: {
                    SendClientMessage(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit 2x premium crate si 5 emotes crates din Gold Battle Pass!");
                    PlayerInfo[playerid][pCrates][8] += 2;
                    PlayerInfo[playerid][pCrates][6] += 2;
                    save_crates(playerid);
                }
            }


            PlayerTextDrawSetString(playerid, playertextid, "~n~~w~(claimed)~n~~n~");
            PlayerTextDrawBoxColor(playerid, playertextid, bp_color[8+(y%2)]);
            PlayerTextDrawShow(playerid, playertextid);
            PlayerInfo[playerid][bpClaimed][y+20] = true;
            save_claimed_bp(playerid);
        }
        case 10: {
            if(!bpPage[playerid]) return true;
            bpPage[playerid] --;
            updateBP(playerid);
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][16], -2139062072);
            PlayerTextDrawShow(playerid, bpPTD[playerid][16]);
            if(!bpPage[playerid]) PlayerTextDrawBoxColor(playerid, bpPTD[playerid][15], -2139062172),PlayerTextDrawShow(playerid, bpPTD[playerid][15]);
        }
        case 11: {
            if((bpPage[playerid]*5)>=MAX_BP_DAYS-5) return true;
            bpPage[playerid]++;
            updateBP(playerid);
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][15], -2139062072);
            PlayerTextDrawShow(playerid, bpPTD[playerid][15]);
            if((bpPage[playerid]*5)>=MAX_BP_DAYS-5) PlayerTextDrawBoxColor(playerid, bpPTD[playerid][16], -2139062172), PlayerTextDrawShow(playerid, bpPTD[playerid][16]);
        }
    }
	return true;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if(player_selected[playerid]!=30) return true;
    if(clickedid == Text:INVALID_TEXT_DRAW) {
        for(new i=0;i<20;i++) PlayerTextDrawDestroy(playerid, bpPTD[playerid][i]);
        for(new i=0;i<7;i++) TextDrawHideForPlayer(playerid, bpTD[i]);
        player_selected[playerid] = 0;
        return true;
    }
    if(clickedid == bpTD[6]) {
        format(gString, sizeof gString, "Chapter\tStatus\nChapter 1\t%s\nChapter 2\t%s\nChapter 3\t%s\nChapter 4\t%s", bpChapter>0?("{00FF00}unlocked"):("{FF0000}locked"),bpChapter>1?("{00FF00}unlocked"):("{FF0000}locked"),bpChapter>2?("{00FF00}unlocked"):("{FF0000}locked"),bpChapter>3?("{00FF00}unlocked"):("{FF0000}locked"));
        Dialog_Show(playerid, battlepass, DIALOG_STYLE_TABLIST_HEADERS, "BattlePass Chapter", gString, "Select", "Cancel");
        return true;
    }
    if(clickedid == bpTD[2]) {
        if(PlayerInfo[playerid][pGoldPass]) return SendClientMessage(playerid, COLOR_GREY, "Ai deja gold battle pass!");
        Dialog_Show(playerid, buy_battlepass, DIALOG_STYLE_MSGBOX, "Buy {E8CE16}Gold Pass", "{FFFFFF}Esti sigur ca vrei sa cumperi {E8CE16}Gold Pass{FFFFFF} pentru suma de 500 premium points?\nVei avea access la premii in plus.", "Buy", "Close");
        return true;
    }
    return true;
}

Dialog:buy_battlepass(playerid, response, listitem, inputtext[]) {
    if(!response) return true;

    if(PlayerInfo[playerid][pPremiumPoints] < 500)
        return SendClientMessage(playerid, COLOR_GREY, "Nu ai suficiente puncte premium!");

    PlayerInfo[playerid][pGoldPass] = true;
    UpdateVar(playerid, "GoldPass", 1);
    SendClientMessage(playerid, COLOR_YELLOW, "Felicitari! Ti-ai achizitionat {E8CE16}Gold Pass{FFFF00} pentru suma de 500 puncte premium.");
    updateBP(playerid);
    return true;
}

Dialog:battlepass(playerid, response, listitem, inputtext[]) {
    if !response *then return true;
    if(bpChapter < listitem+1) return SendClientMessage(playerid, COLOR_GREY, "Chapter not unlocked!");

    new i=-1; gString = "Missions\tProgress\n";
    switch(listitem) {
        case 0: {
            while(++i<10) {
                new progress[35] = {"{00FF00}COMPLETED"};
                if(playerBPTask[playerid][i] < GetBPValue(i)) 
                    format(progress, sizeof progress, "(%d/%d)", playerBPTask[playerid][i], GetBPValue(i));

                switch i
                do {
                    case 0: format(gQuery, sizeof gQuery, "1. Completeaza 5 misiuni din [/quests].\t%s\n", progress);
                    case 1: format(gQuery, sizeof gQuery, "2. Prinde 30 de pesti la jobul Fisherman.\t%s\n", progress);
                    case 2: format(gQuery, sizeof gQuery, "3. Plaseaza 30 de contracte pentru factiunea Hitman Agency.\t%s\n", progress);
                    case 3: format(gQuery, sizeof gQuery, "4. Munceste de 30 ori la jobul Trucker.\t%s\n", progress);
                    case 4: format(gQuery, sizeof gQuery, "5. Avanseaza la nivel 5.\t%s\n", progress);
                    case 5: format(gQuery, sizeof gQuery, "6. Deschide 5 Rare Crate.\t%s\n", progress);
                    case 6: format(gQuery, sizeof gQuery, "7. Parcurge 30 km cu un Mountain Bike.\t%s\n", progress);
                    case 7: format(gQuery, sizeof gQuery, "8. Omoara 20 de playeri la arena de Paintball.\t%s\n", progress);
                    case 8: format(gQuery, sizeof gQuery, "9. Munceste de 30 de ori la jobul Forklift.\t%s\n", progress);
                    case 9: format(gQuery, sizeof gQuery, "10. Munceste de 30 de ori la jobul Lumberjack.\t%s\n", progress);
                }
                strcat(gString, gQuery);
            }
        }
        case 1: {
            while(++i<10) {
                new progress[35] = {"{00FF00}COMPLETED"};
                if(playerBPTask[playerid][i+10] < GetBPValue(i+10)) 
                    format(progress, sizeof progress, "(%d/%d)", playerBPTask[playerid][i+10], GetBPValue(i+10));

                switch i
                do {
                    case 0: {
                        if(IsACop(playerid)) format(gQuery, sizeof gQuery, "1. Omoara 15 jucatori cu wanted fara drept.\t%s\n", progress);
                        else format(gQuery, sizeof gQuery, "1. Omoara 15 politisti\t%s\n", progress);
                    }
                    case 1: format(gQuery, sizeof gQuery, "2. Alimenteaza de 20 de ori vechiulul la un Gas Station.\t%s\n", progress);
                    case 2: format(gQuery, sizeof gQuery, "3. Jefuieste de 10 ori o afacere.\t%s\n", progress);
                    case 3: format(gQuery, sizeof gQuery, "4. Parcurge 100km cu un vechiul de tip Infernus.\t%s\n", progress);
                    case 4: format(gQuery, sizeof gQuery, "5. Foloseste /collect de 5 ori.\t%s\n", progress);
                    case 5: format(gQuery, sizeof gQuery, "6. Evadeaza de 5 ori din inchisoare.\t%s\n", progress);
                    case 6: format(gQuery, sizeof gQuery, "7. Munceste $5.000.000 la [/jobgoal].\t%s\n", progress);
                    case 7: format(gQuery, sizeof gQuery, "8. Pune 50 de intrebari pe [/n].\t%s\n", progress);
                    case 8: format(gQuery, sizeof gQuery, "9. Repara masina de 30 de ori intr-un PNS.\t%s\n", progress);
                    case 9: format(gQuery, sizeof gQuery, "10. Castiga 20 de maini la barbut.\t%s\n", progress);
                }
                strcat(gString, gQuery);
            }
        }
        case 2: {
            while(++i<10) {
                new progress[35] = {"{00FF00}COMPLETED"};
                if(playerBPTask[playerid][i+20] < GetBPValue(i+20)) 
                    format(progress, sizeof progress, "(%d/%d)", playerBPTask[playerid][i+20], GetBPValue(i+20));

                switch i
                do {
                    case 0: format(gQuery, sizeof gQuery, "1. Joaca 100 de maini la Slots Machine.\t%s\n", progress);
                    case 1: format(gQuery, sizeof gQuery, "2. Participa la 5 evenimente organizate de admini.\t%s\n", progress);
                    case 2: format(gQuery, sizeof gQuery, "3. Parcurge 50km cu un vehicul de tip Maverick.\t%s\n", progress);
                    case 3: format(gQuery, sizeof gQuery, "4. Castiga 10 arene de paintball.\t%s\n", progress);
                    case 4: format(gQuery, sizeof gQuery, "5. Plaseaza 30 de anunturi.\t%s\n", progress);
                    case 5: format(gQuery, sizeof gQuery, "6. Vinde 20 de saci cu faina.\t%s\n", progress);
                    case 6: format(gQuery, sizeof gQuery, "7. Deschide 20 epic crate.\t%s\n", progress);
                    case 7: format(gQuery, sizeof gQuery, "8. Foloseste un ticket VIP pe masina ta personala.\t%s\n", progress);
                    case 8: format(gQuery, sizeof gQuery, "9. Munceste de 15 ori la jobul Glovo.\t%s\n", progress);
                    case 9: format(gQuery, sizeof gQuery, "10. Gaseste locatia ascunsa. \t%s\n", progress);
                }
                strcat(gString, gQuery);
            }
        }
        case 3: {
            while(++i<10) {
                new progress[35] = {"{00FF00}COMPLETED"};
                if(playerBPTask[playerid][i+30] < GetBPValue(i+30)) 
                    format(progress, sizeof progress, "(%d/%d)", playerBPTask[playerid][i+30], GetBPValue(i+30));

                switch i
                do {
                    case 0: format(gQuery, sizeof gQuery, "1. Utilizeaza 10 hidden-uri pe masina ta personala.\t%s\n", progress);
                    case 1: format(gQuery, sizeof gQuery, "2. Foloseste un ticket Rainbow pe masina ta personala.\t%s\n", progress);
                    case 2: format(gQuery, sizeof gQuery, "3. Foloseste comanda [/report - sunt blocat] de 20 de ori.\t%s\n", progress);
                    case 3: format(gQuery, sizeof gQuery, "4. Vinde 20 de arme unui jucator folosind comanda [/sellgun].\t%s\n", progress);
                    case 4: format(gQuery, sizeof gQuery, "5. Alimenteaza-ti viata de 15 ori cu ajutorul unui drog, [/usedrugs].\t%s\n", progress);
                    case 5: format(gQuery, sizeof gQuery, "6. Foloseste comanda [/trade] de 20 de ori cu un jucator.\t%s\n", progress);
                    case 6: format(gQuery, sizeof gQuery, "7. Joaca-te 30 de minute pe server. \t%s\n", progress);
                    case 7: format(gQuery, sizeof gQuery, "8. Parcurge 20km cu o barca de tip Speeder.\t%s\n", progress);
                    case 8: format(gQuery, sizeof gQuery, "9. Deschide de 10 ori giftbox-ul.\t%s\n", progress);
                    case 9: format(gQuery, sizeof gQuery, "10. Obtine skill 6 la orice job.\t%s\n", progress);
                }
                strcat(gString, gQuery);
            }
        }
    }
    format(gQuery, sizeof gQuery, "Your tier %d (%s XP)", PlayerInfo[playerid][pTier], FormatNumber(PlayerInfo[playerid][pBpExp]));
    ShowPlayerDialog(playerid, DIALOG_INVALID, DIALOG_STYLE_TABLIST_HEADERS, gQuery, gString, "Ok", "");
    return true;
}

cmd:resetmission(playerid) {
    if(!IsAdmin(playerid, 7)) return true;
    for(new i=0;i<40;++i) playerBPTask[playerid][i] = 0;
    return true;
}

cmd:bp(playerid) {
    ShowBattlePass(playerid);
    return 1;
}

stock updateBP(playerid, i=-1, id=-1, Float:start=204.0) {
    id=bpPage[playerid] * 5;
    while(++i<5) {
        id=(bpPage[playerid] * 5) + i;
        if(!PlayerInfo[playerid][bpClaimed][id]) {
            PlayerTextDrawSetString(playerid, bpPTD[playerid][i],bpInfo[id][bpFree]);
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i], bp_color[i%2]);
        } else {
            PlayerTextDrawSetString(playerid, bpPTD[playerid][i], "~n~~w~(claimed)~n~~n~");
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i], bp_color[6+(i%2)]);
        }
        if(!PlayerInfo[playerid][bpClaimed][id+20]) {
            PlayerTextDrawSetString(playerid, bpPTD[playerid][i+5],bpInfo[id][bpPro]);
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i+5], bp_color[2+(i%2)]);
        } else {
            PlayerTextDrawSetString(playerid, bpPTD[playerid][i+5], "~n~~w~(claimed)~n~~n~");
            PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i+5], bp_color[8+(i%2)]);
        }
        PlayerTextDrawShow(playerid, bpPTD[playerid][i]);
        PlayerTextDrawShow(playerid, bpPTD[playerid][i+5]);
        PlayerTextDrawSetString(playerid, bpPTD[playerid][i+10],bpInfo[id][bpDays]);
        if(PlayerInfo[playerid][pTier] == id) start += (i*56.66)+(procentage(PlayerInfo[playerid][pBpExp],bpInfo[id][bpNeed])*0.5666);
    }
    if(PlayerInfo[playerid][pTier]/5 > bpPage[playerid]) start = 487.0;
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][19], start, 0.000000);
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][18], PlayerInfo[playerid][pGoldPass]?start:204.0, 0.000000);
    PlayerTextDrawShow(playerid, bpPTD[playerid][18]);
    PlayerTextDrawShow(playerid, bpPTD[playerid][19]);
    return true;
}
stock LoadBattlePass(playerid, i=-1, id=-1, x=-1, Float:start=204.0) {
    id = bpPage[playerid] * 5;
    while(++i<5) {
        while(++x<3) {
            switch(x) {
                case 0: {
                    if(!PlayerInfo[playerid][bpClaimed][i]) {
                        bpPTD[playerid][i] = CreatePlayerTextDraw(playerid, 233.70 + (i * 56.90), 197.799987, bpInfo[i+id][bpFree]);
                        PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i], bp_color[i%2]);
                    } else {
                        bpPTD[playerid][i] = CreatePlayerTextDraw(playerid, 233.70 + (i * 56.90), 197.799987, "~n~~w~(claimed)~n~~n~");
                        PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i], bp_color[6+(i%2)]);
                    }
                    PlayerTextDrawSetSelectable(playerid, bpPTD[playerid][i], true);
                    PlayerTextID[playerid][PlayerText:bpPTD[playerid][i]] = i;
                }
                case 1: {
                    if(!PlayerInfo[playerid][bpClaimed][i+20]) {
                        bpPTD[playerid][i+5] = CreatePlayerTextDraw(playerid, 233.70 + (i * 56.90), 242.912445, bpInfo[i+id][bpPro]);
                        PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i+5], bp_color[2+(i%2)]);
                    } else {
                        bpPTD[playerid][i+5] = CreatePlayerTextDraw(playerid, 233.70 + (i * 56.90), 242.912445, "~n~~w~(claimed)~n~~n~");
                        PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i+5], bp_color[8+(i%2)]);
                    }
                    PlayerTextDrawSetSelectable(playerid, bpPTD[playerid][i+5], true);
                    PlayerTextID[playerid][PlayerText:bpPTD[playerid][i+5]] = i+5;
                }
                case 2: {
                    bpPTD[playerid][i+10] = CreatePlayerTextDraw(playerid, 233.70 + (i * 56.90), 183.437500, bpInfo[i+id][bpDays]),
                    PlayerTextDrawBoxColor(playerid, bpPTD[playerid][i+10], bp_color[4+(i%2)]);
                }
            }
            PlayerTextDrawLetterSize(playerid, bpPTD[playerid][i+(x*5)], 0.209995, 1.103124);
            PlayerTextDrawTextSize(playerid, bpPTD[playerid][i+(x*5)], 20.000000, 52.000000);
            PlayerTextDrawAlignment(playerid, bpPTD[playerid][i+(x*5)], 2);
            PlayerTextDrawColor(playerid, bpPTD[playerid][i+(x*5)], -1);
            PlayerTextDrawUseBox(playerid, bpPTD[playerid][i+(x*5)], 1);
            PlayerTextDrawSetShadow(playerid, bpPTD[playerid][i+(x*5)], 0);
            PlayerTextDrawSetOutline(playerid, bpPTD[playerid][i+(x*5)], 1);
            PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][i+(x*5)], 96);
            PlayerTextDrawFont(playerid, bpPTD[playerid][i+(x*5)], 2);
            PlayerTextDrawSetProportional(playerid, bpPTD[playerid][i+(x*5)], 1);
            PlayerTextDrawSetShadow(playerid, bpPTD[playerid][i+(x*5)], 0);
            PlayerTextDrawShow(playerid, bpPTD[playerid][i+(x*5)]);
        }
        if(PlayerInfo[playerid][pTier] == i+id) start += (i*56.66)+(procentage(PlayerInfo[playerid][pBpExp],bpInfo[i+id][bpNeed])*0.5666);
        x=-1;
    }
    if(PlayerInfo[playerid][pTier]/5 > bpPage[playerid]) start = 487.0;

    bpPTD[playerid][15] = CreatePlayerTextDraw(playerid, 173.871734, 183.276840, "<");
    PlayerTextDrawLetterSize(playerid, bpPTD[playerid][15], 0.263000, 0.938750);
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][15], 10.000000, 16.000000);
    PlayerTextDrawAlignment(playerid, bpPTD[playerid][15], 2);
    PlayerTextDrawColor(playerid, bpPTD[playerid][15], -1);
    PlayerTextDrawUseBox(playerid, bpPTD[playerid][15], 1);
    PlayerTextDrawBoxColor(playerid, bpPTD[playerid][15], -2139062184);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][15], 0);
    PlayerTextDrawSetOutline(playerid, bpPTD[playerid][15], 1);
    PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][15], 84);
    PlayerTextDrawFont(playerid, bpPTD[playerid][15], 2);
    PlayerTextDrawSetProportional(playerid, bpPTD[playerid][15], 1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][15], 0);
    PlayerTextDrawSetSelectable(playerid, bpPTD[playerid][15], true);
    PlayerTextDrawShow(playerid, bpPTD[playerid][15]);
    PlayerTextID[playerid][PlayerText:bpPTD[playerid][15]] = 10;

    bpPTD[playerid][16] = CreatePlayerTextDraw(playerid, 194.704803, 183.369873, ">");
    PlayerTextDrawLetterSize(playerid, bpPTD[playerid][16], 0.263000, 0.948750);
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][16], 10.0, 16.000000);
    PlayerTextDrawAlignment(playerid, bpPTD[playerid][16], 2);
    PlayerTextDrawColor(playerid, bpPTD[playerid][16], -1);
    PlayerTextDrawUseBox(playerid, bpPTD[playerid][16], 1);
    PlayerTextDrawBoxColor(playerid, bpPTD[playerid][16], -2139062072);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][16], 0);
    PlayerTextDrawSetOutline(playerid, bpPTD[playerid][16], 1);
    PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][16], 84);
    PlayerTextDrawFont(playerid, bpPTD[playerid][16], 2);
    PlayerTextDrawSetProportional(playerid, bpPTD[playerid][16], 1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][16], 0);
    PlayerTextDrawSetSelectable(playerid, bpPTD[playerid][16], true);
    PlayerTextDrawShow(playerid, bpPTD[playerid][16]);
    PlayerTextID[playerid][PlayerText:bpPTD[playerid][16]] = 11;

    format(gString, sizeof gString, "season ends in %d days and %d hours..~n~tier %d", (bpTime-gettime())/86400, ((bpTime-gettime())/3600) % 24, PlayerInfo[playerid][pTier]);
    bpPTD[playerid][17] = CreatePlayerTextDraw(playerid, 330.533508, 151.372985, gString);
    PlayerTextDrawLetterSize(playerid, bpPTD[playerid][17], 0.156188, 1.011198);
    PlayerTextDrawAlignment(playerid, bpPTD[playerid][17], 2);
    PlayerTextDrawColor(playerid, bpPTD[playerid][17], -1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][17], 0);
    PlayerTextDrawSetOutline(playerid, bpPTD[playerid][17], 1);
    PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][17], 0);
    PlayerTextDrawFont(playerid, bpPTD[playerid][17], 2);
    PlayerTextDrawSetProportional(playerid, bpPTD[playerid][17], 1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][17], 0);
    PlayerTextDrawShow(playerid, bpPTD[playerid][17]);

    bpPTD[playerid][18] = CreatePlayerTextDraw(playerid, 491.204315, 242.350143, "box");
    PlayerTextDrawLetterSize(playerid, bpPTD[playerid][18], 0.000000, 4.594678);
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][18], PlayerInfo[playerid][pGoldPass]?start:204.0, 0.000000);
    PlayerTextDrawAlignment(playerid, bpPTD[playerid][18], 1);
    PlayerTextDrawColor(playerid, bpPTD[playerid][18], -1);
    PlayerTextDrawUseBox(playerid, bpPTD[playerid][18], 1);
    PlayerTextDrawBoxColor(playerid, bpPTD[playerid][18], 185);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][18], 0);
    PlayerTextDrawSetOutline(playerid, bpPTD[playerid][18], 0);
    PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][18], 255);
    PlayerTextDrawFont(playerid, bpPTD[playerid][18], 1);
    PlayerTextDrawSetProportional(playerid, bpPTD[playerid][18], 1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][18], 0);
    PlayerTextDrawShow(playerid, bpPTD[playerid][18]);

    bpPTD[playerid][19] = CreatePlayerTextDraw(playerid, 490.442810, 197.270248, "box");
    PlayerTextDrawLetterSize(playerid, bpPTD[playerid][19], 0.000000, 4.509585);
    PlayerTextDrawTextSize(playerid, bpPTD[playerid][19], start, 0.000000);
    PlayerTextDrawAlignment(playerid, bpPTD[playerid][19], 1);
    PlayerTextDrawColor(playerid, bpPTD[playerid][19], -1);
    PlayerTextDrawUseBox(playerid, bpPTD[playerid][19], 1);
    PlayerTextDrawBoxColor(playerid, bpPTD[playerid][19], 185);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][19], 0);
    PlayerTextDrawSetOutline(playerid, bpPTD[playerid][19], 0);
    PlayerTextDrawBackgroundColor(playerid, bpPTD[playerid][19], 255);
    PlayerTextDrawFont(playerid, bpPTD[playerid][19], 1);
    PlayerTextDrawSetProportional(playerid, bpPTD[playerid][19], 1);
    PlayerTextDrawSetShadow(playerid, bpPTD[playerid][19], 0);
    PlayerTextDrawShow(playerid, bpPTD[playerid][19]);

    i=-1;
    while(++i<7) TextDrawShowForPlayer(playerid, bpTD[i]);
}

stock checkBP(playerid, index, exp, progress=1) {
    if(bpChapter<(index/10)+1) return true;
    if(bpTime<gettime()) return true;
    if(playerBPTask[playerid][index] >= GetBPValue(index)) return true;
    playerBPTask[playerid][index] += progress;
    if(playerBPTask[playerid][index] >= GetBPValue(index)) {
        PlayerInfo[playerid][pBpExp]+=exp;
        SCMf(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai primit +%d XP pentru BattlePass! (ID: %d)", exp, index);
        while(PlayerInfo[playerid][pBpExp]>=bpInfo[PlayerInfo[playerid][pTier]][bpNeed]) {
            PlayerInfo[playerid][pBpExp]-=bpInfo[PlayerInfo[playerid][pTier]][bpNeed];
            PlayerInfo[playerid][pTier]++;
            SCMf(playerid, COLOR_LGREEN, ">> {FFFFFF}Ai deblocat tier %d!", PlayerInfo[playerid][pTier]);
        }
        _query("UPDATE `users` SET `BPExp` = '%i', `Tier` = '%i' WHERE `id`='%i'", PlayerInfo[playerid][pBpExp], PlayerInfo[playerid][pTier], PlayerInfo[playerid][pSQLID]);
    }
    return true;
}

cmd:debugbattlepass(playerid, params[]) {
    new xp, tier;
    if(sscanf(params, "ii", xp, tier)) return true;
    PlayerInfo[playerid][pBpExp] = xp;
    PlayerInfo[playerid][pTier] = tier;
    updateBP(playerid);
    return true;
}

save_bp(playerid) {
    mysql_format(SQL, gString, sizeof gString, "UPDATE `users` SET `missions_bp` = '%i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i' WHERE `id`= '%i'",
        playerBPTask[playerid][0], playerBPTask[playerid][1], playerBPTask[playerid][2], playerBPTask[playerid][3], playerBPTask[playerid][4], playerBPTask[playerid][5], playerBPTask[playerid][6], playerBPTask[playerid][7], playerBPTask[playerid][8], playerBPTask[playerid][9],
        playerBPTask[playerid][10], playerBPTask[playerid][11], playerBPTask[playerid][12], playerBPTask[playerid][13], playerBPTask[playerid][14], playerBPTask[playerid][15], playerBPTask[playerid][16], playerBPTask[playerid][17], playerBPTask[playerid][18], playerBPTask[playerid][19],
        playerBPTask[playerid][20], playerBPTask[playerid][21], playerBPTask[playerid][22], playerBPTask[playerid][23], playerBPTask[playerid][24], playerBPTask[playerid][25], playerBPTask[playerid][26], playerBPTask[playerid][27], playerBPTask[playerid][28], playerBPTask[playerid][29],
        playerBPTask[playerid][30], playerBPTask[playerid][31], playerBPTask[playerid][32], playerBPTask[playerid][33], playerBPTask[playerid][34], playerBPTask[playerid][35], playerBPTask[playerid][36], playerBPTask[playerid][37], playerBPTask[playerid][38], playerBPTask[playerid][39],
        PlayerInfo[playerid][pSQLID]);
    mysql_tquery(SQL, gString);
}

save_claimed_bp(playerid) {
    mysql_format(SQL, gString, sizeof gString, "UPDATE `users` SET `bp_claimed` = '%i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i' WHERE `id`= '%i'",
        PlayerInfo[playerid][bpClaimed][0], PlayerInfo[playerid][bpClaimed][1], PlayerInfo[playerid][bpClaimed][2], PlayerInfo[playerid][bpClaimed][3], PlayerInfo[playerid][bpClaimed][4], PlayerInfo[playerid][bpClaimed][5], PlayerInfo[playerid][bpClaimed][6], PlayerInfo[playerid][bpClaimed][7], PlayerInfo[playerid][bpClaimed][8], PlayerInfo[playerid][bpClaimed][9],
        PlayerInfo[playerid][bpClaimed][10], PlayerInfo[playerid][bpClaimed][11], PlayerInfo[playerid][bpClaimed][12], PlayerInfo[playerid][bpClaimed][13], PlayerInfo[playerid][bpClaimed][14], PlayerInfo[playerid][bpClaimed][15], PlayerInfo[playerid][bpClaimed][16], PlayerInfo[playerid][bpClaimed][17], PlayerInfo[playerid][bpClaimed][18], PlayerInfo[playerid][bpClaimed][19],
        PlayerInfo[playerid][bpClaimed][20], PlayerInfo[playerid][bpClaimed][21], PlayerInfo[playerid][bpClaimed][22], PlayerInfo[playerid][bpClaimed][23], PlayerInfo[playerid][bpClaimed][24], PlayerInfo[playerid][bpClaimed][25], PlayerInfo[playerid][bpClaimed][26], PlayerInfo[playerid][bpClaimed][27], PlayerInfo[playerid][bpClaimed][28], PlayerInfo[playerid][bpClaimed][29],
        PlayerInfo[playerid][bpClaimed][30], PlayerInfo[playerid][bpClaimed][31], PlayerInfo[playerid][bpClaimed][32], PlayerInfo[playerid][bpClaimed][33], PlayerInfo[playerid][bpClaimed][34], PlayerInfo[playerid][bpClaimed][35], PlayerInfo[playerid][bpClaimed][36], PlayerInfo[playerid][bpClaimed][37], PlayerInfo[playerid][bpClaimed][38], PlayerInfo[playerid][bpClaimed][39],
        PlayerInfo[playerid][pSQLID]);
    mysql_tquery(SQL, gString);
}

stock GetBPValue(index) {
    switch(index/10) {
        case 0: {
            switch(index) {
                case 0: return 5;
                case 1: return 30;
                case 2: return 30;
                case 3: return 30;
                case 4: return 1;
                case 5: return 5;
                case 6: return 30;
                case 7: return 20;
                case 8: return 30;
                case 9: return 30;
            }
        }
        case 1: {
            switch(index%10) {
                case 0: return 15;
                case 1: return 20;
                case 2: return 10;
                case 3: return 100;
                case 4: return 5;
                case 5: return 5;
                case 6: return 5000000;
                case 7: return 50;
                case 8: return 30;
                case 9: return 20;
            }
        }
        case 2: {
            switch(index%10) {
                case 0: return 100;
                case 1: return 5;
                case 2: return 50;
                case 3: return 10;
                case 4: return 30;
                case 5: return 20;
                case 6: return 20;
                case 7: return 1;
                case 8: return 15;
                case 9: return 1;
            }
        }
        case 3: {
            switch(index%10) {
                case 0: return 10;
                case 1: return 1;
                case 2: return 20;
                case 3: return 20;
                case 4: return 15;
                case 5: return 20;
                case 6: return 30;
                case 7: return 20;
                case 8: return 10;
                case 9: return 1;
            }
        }
    }
    return 0;
}

cmd:setchapter(playerid, params[]) {
    if(!IsAdmin(playerid, 7))
        return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);

    if(sscanf(params, "i", params[0]))
        return SendClientMessage(playerid, COLOR_GREY, "Syntax: {FFFFFF}/setchapter [chapter]");

    if(params[0] < 1 || params[0] > 4) return true;

    bpChapter = params[0];
    SCMf(playerid, COLOR_WHITE, "Chapter %d loaded..", params[0]);
    _query("UPDATE `stuff` SET `chapter`='%i'", params[0]);
    return true;
}

cmd:startbp(playerid, params[]) {
    if(!IsAdmin(playerid, 7))
        return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);

    if(sscanf(params, "i", params[0]))
        return SendClientMessage(playerid, COLOR_GREY, "Syntax: {FFFFFF}/startbp [end in x days]");

    bpTime = gettime() + (params[0] * 86400);
    SCMf(playerid, COLOR_WHITE, "BattlePass end in %d days.", params[0]);
    _query("UPDATE `stuff` SET `bpTime`='%i'", bpTime);
    return true;
}

cmd:endbp(playerid, params[]) {
    if(!IsAdmin(playerid, 7))
        return SendClientMessage(playerid, COLOR_LGREEN, AdminOnly);

    bpTime=gettime();
    SendClientMessage(playerid, COLOR_WHITE, "BattlePass end");
    _query("UPDATE `stuff` SET `bpTime`='%i'", bpTime);
    return true;
}