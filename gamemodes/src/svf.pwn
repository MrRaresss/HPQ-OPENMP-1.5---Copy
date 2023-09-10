#define MAX_SVF_CARS (10)
enum f_ENUM {
	svf_ID,
	svf_Model,
	svf_Rank,
	svf_Stock,
	svf_Color1,
	svf_Color2,
	svf_Stage
}
new svfInfo[MAX_FACTIONS][MAX_SVF_CARS][f_ENUM], svfCount[MAX_FACTIONS], svfCar[MAX_PLAYERS], VehicleOBJ[MAX_VEHICLES][2] = {{INVALID_OBJECT_ID,...}, ...}, VehicleSVF[MAX_VEHICLES] = {-1,...};

redist::SQL_Load_Svf() {
	printf("[MySQL]\t\t\tfactions svf\t\t%d", cache_num_rows());
	new f,s;
	for(new i=0,j=cache_num_rows();i<j;i++) {
		cache_get_value_name_int(i, "Faction", f);
		s=svfCount[f];

		cache_get_value_name_int(i, "ID", svfInfo[f][s][svf_ID]);
		cache_get_value_name_int(i, "Model", svfInfo[f][s][svf_Model]);	
		cache_get_value_name_int(i, "Rank", svfInfo[f][s][svf_Rank]);
		cache_get_value_name_int(i, "Stock", svfInfo[f][s][svf_Stock]);
		cache_get_value_name_int(i, "Color1", svfInfo[f][s][svf_Color1]);
		cache_get_value_name_int(i, "Color2", svfInfo[f][s][svf_Color2]);
		cache_get_value_name_int(i, "Stage", svfInfo[f][s][svf_Stage]);
		svfCount[f]++;
	}
	return true;
}

cmd:addvehiclesvf(playerid, params[]) {
	if(!IsAdmin(playerid, 7))
		return SendClientMessage(playerid, COLOR_GREY, AdminOnly);

	if(svfCar[playerid])
		return true;

	if(sscanf(params, "iiiiii", params[0], params[1], params[2], params[3], params[4], params[5]))
		return SendClientMessage(playerid, COLOR_GREY, "USAGE: {FFFFFF}/addvehiclesvf <faction id> <vehicle:model> <rank> <color1> <color2> <stock>");

	if(params[0]<0||params[0]>MAX_FACTIONS)
		return true;

	if(params[1]<400||params[1]>611)
		return SendClientMessage(playerid, COLOR_GREY, "Invalid model! (400-611)");

	//if(params[2]<1||params[2]>6)
		//return SendClientMessage(playerid, COLOR_GREY, "Invalid Rank.");

	if(svfCount[params[0]]>MAX_SVF_CARS)
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Aceasta factiune are deja numarul maxim de vehicule!");

	for(new s=0;s<svfCount[params[0]];s++) if(svfInfo[params[0]][s][svf_Model]==params[1]&&svfInfo[params[0]][s][svf_Rank]==params[2])
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Nu poti adauga acest vehicul deoarece deja este unul cu acelasi rank.`");


	new i = svfCount[params[0]]; svfCount[params[0]]++;
	svfInfo[params[0]][i][svf_Model] = params[1];
	svfInfo[params[0]][i][svf_Rank] = params[2];
	svfInfo[params[0]][i][svf_Stock] = params[5];
	svfInfo[params[0]][i][svf_Color1] = params[3];
	svfInfo[params[0]][i][svf_Color2] = params[4];

	gString[0] = (EOS);
	mysql_format(SQL, gString, 256, "INSERT INTO `svf` (`Faction`, `Model`, `Rank`, `Color1`, `Color2`, `Stock`) VALUES ('%i', '%i', '%i', '%i', '%i', '%i')",
		params[0], params[1], params[2], params[3], params[4], params[5]);
	mysql_tquery(SQL, gString, "SQL_INSERT_SVF", "ii", params[0], i);

	ABroadcast(-1, 6, "{00820d}(/addsvf){FFFFFF} Admin %s created vehicle %s (%d) for faction %s.", GetName(playerid), GetVehicleName(params[1]), params[1], DynamicFactions[params[0]][fName]);
	ABroadcast(-1, 6, "{00820d}Vehicle Info:{FFFFFF} model [%s(%d)] | rank [%d] | color1 [%d] | color2 [%d] stock [%d] factionid [%d(%s)]", GetVehicleName(params[1]), params[1], params[2], params[3], params[4], params[5], DynamicFactions[params[0]][fID], DynamicFactions[params[0]][fName]);
	return true;
}

cmd:deletesvf(playerid, params[]) {
	if(!IsAdmin(playerid, 7))
		return SendClientMessage(playerid, COLOR_GREY, AdminOnly);

	if(sscanf(params, "ii", params[0], params[1]))
		return SendClientMessage(playerid, COLOR_GREY, "USAGE: {FFFFFF}/deletesvf <faction id> <slot vehicle>");

	if(params[0]<0||params[0]>MAX_FACTIONS)
		return true;

	if(params[1]<1||params[1]>svfCount[params[0]])
		return SendClientMessage(playerid, COLOR_GREY, "Invalid slot.");

	params[1]--;
	ABroadcast(-1, 6, "{00820d}(/deltesvf):{FFFFFF} Admin %s deleted vehicle %s (slot: #%d) for faction %s.", GetName(playerid), GetVehicleName(svfInfo[params[0]][params[1]][svf_Model]), params[1]+1, DynamicFactions[params[0]][fName]);

	gString[0] = (EOS);
	mysql_format(SQL, gString, 128, "DELETE FROM `svf` WHERE `ID` = '%i'", svfInfo[params[0]][params[1]][svf_ID]);
	mysql_tquery(SQL, gString);

	svfCount[params[0]] = 0;
	mysql_format(SQL, gString, 256, "SELECT * FROM `svf` WHERE `Faction` = '%i' ORDER BY `svf`.`Rank` ASC", params[0]);
	mysql_tquery(SQL, gString, "SQL_SVF", "i", params[0]);
	return true;
}

redist::SQL_SVF(f) {
	for(new i=0,j=cache_num_rows();i<j;i++) {
		cache_get_value_name_int(i, "ID", svfInfo[f][i][svf_ID]);
		cache_get_value_name_int(i, "Model", svfInfo[f][i][svf_Model]);
		cache_get_value_name_int(i, "Rank", svfInfo[f][i][svf_Rank]);
		cache_get_value_name_int(i, "Stock", svfInfo[f][i][svf_Stock]);
		cache_get_value_name_int(i, "Color1", svfInfo[f][i][svf_Color1]);
		cache_get_value_name_int(i, "Color2", svfInfo[f][i][svf_Color2]);
		svfCount[f]++;
	}
	return true;
}

cmd:svf(playerid, params[]) {
	if(!PlayerInfo[playerid][pMember])
		return true;

	if(IsMafie(playerid))
		return true;


	new f = PlayerInfo[playerid][pMember];
	switch(f) { 
		case 1,2,3,14,19: {
			new p=-1,ff[]={1,2,3,14,19};
			while(++p<sizeof ff) {
				f=ff[p];
				if(!PlayerToPoint(5, playerid, DynamicFactions[f][svfX], DynamicFactions[f][svfY], DynamicFactions[f][svfZ]))
					continue;
				break;
			}

			if(p==sizeof ff) return true;
		}
		case 7,16,21: {
			new p=-1,ff[]={7,16,21};
			while(++p<sizeof ff) {
				f=ff[p];
				if(!PlayerToPoint(5, playerid, DynamicFactions[f][svfX], DynamicFactions[f][svfY], DynamicFactions[f][svfZ]))
					continue;
				break;
			}

			if(p==sizeof ff) return true;
		}
		case 13,20: {
			new p=-1,ff[]={13,20};
			while(++p<sizeof ff) {
				f=ff[p];
				if(!PlayerToPoint(5, playerid, DynamicFactions[f][svfX], DynamicFactions[f][svfY], DynamicFactions[f][svfZ]))
					continue;
				break;
			}

			if(p==sizeof ff) return true;
		}
		case 12,15,23: {
			new p=-1,ff[]={12,15,23};
			while(++p<sizeof ff) {
				f=ff[p];
				if(!PlayerToPoint(5, playerid, DynamicFactions[f][svfX], DynamicFactions[f][svfY], DynamicFactions[f][svfZ]))
					continue;
				break;
			}

			if(p==sizeof ff) return true;
		}
		case 8,22: {
			new p=-1,ff[]={8,22};
			while(++p<sizeof ff) {
				f=ff[p];
				if(!PlayerToPoint(5, playerid, DynamicFactions[f][svfX], DynamicFactions[f][svfY], DynamicFactions[f][svfZ]))
					continue;
				break;
			}

			if(p==sizeof ff) return true;
		}
		default: 
			if(!PlayerToPoint(5, playerid, DynamicFactions[f][svfX], DynamicFactions[f][svfY], DynamicFactions[f][svfZ]))
				return true;
	}

	listitemm[playerid] = f;
	
	if(!OnDuty[playerid]&&IsACop(playerid))
		return SendClientMessage(playerid, COLOR_LGREEN, "Eroare: Nu esti ON-DUTY!");

	gString[0] = gQuery[0] = (EOS);
	strcat(gString, "#.\tModel\tRank\tStock\n");
	for(new i=0;i<svfCount[f];i++) {
		format(gQuery, 128, "%d.\t%s\t%s%d+\t%d in stock\n", i+1, GetVehicleName(svfInfo[f][i][svf_Model]), 
		PlayerInfo[playerid][pRank]<svfInfo[f][i][svf_Rank]?("{EE5252}"):("{66FA66}"), svfInfo[f][i][svf_Rank],
		svfInfo[f][i][svf_Stock]);
		strcat(gString, gQuery);
	}
	ShowPlayerDialog(playerid, DIALOG_SVF, DIALOG_STYLE_TABLIST_HEADERS, "{F4AD42}[SVF]: {FFFFFF}Vehicles", gString, "Select", "Close");
	return true;
}

cmd:dvf(playerid, params[]) {
	if(!PlayerInfo[playerid][pMember])
		return true;

	if(!svfCar[playerid])
		return true;

	destroySVF(playerid);
	return true;
}

cmd:lvf(playerid, params[]) {
	if(!PlayerInfo[playerid][pMember])
		return true;

	if(!svfCar[playerid])
		return true;

	new Float:x,Float:y,Float:z;
	GetVehiclePos(svfCar[playerid], x, y, z);
	SetPlayerCheckpoint(playerid, x, y, z, 5.0);
	CP[playerid] = 53;
	SCMf(playerid, COLOR_LGREEN, "Your vehicle has been located in %s.", Get3DZone(x, y, z));
	return true;
}

redist::SQL_INSERT_SVF(f, i) return svfInfo[f][i][svf_ID] = cache_insert_id();

stock destroySVF(playerid) {
	if(!svfCar[playerid]) return true;
	new v=svfCar[playerid];
	svfInfo[ServerVehicles[v][vFaction]][VehicleSVF[v]][svf_Stock]++;
	VehicleSVF[v] = -1; 
	if(VehicleOBJ[v][0]!=INVALID_OBJECT_ID) DestroyDynamicObject(VehicleOBJ[svfCar[playerid]][0]), VehicleOBJ[v][0] = INVALID_OBJECT_ID;
	if(VehicleOBJ[v][1]!=INVALID_OBJECT_ID) DestroyDynamicObject(VehicleOBJ[svfCar[playerid]][1]), VehicleOBJ[v][1] = INVALID_OBJECT_ID;
	DestroyVehicleEx(v, "svfcar"); svfCar[playerid]=ServerVehicles[v][vFaction]=ServerVehicles[v][vRank] = 0;
	SendClientMessage(playerid, COLOR_LGREEN, "[INFO]: Vehiculul factiunii a fost despawnat!");
	return true;
}

stock createSvfCar(playerid, modelid, factionid, rank, color1 = -1, color2 = -1) {
	new vehicleid; gString[0]=(EOS);
	if(!IsAPlane(modelid)) vehicleid = svfCar[playerid] = CreateVehicleEx(modelid, DynamicFactions[factionid][svf_v_X],DynamicFactions[factionid][svf_v_Y],DynamicFactions[factionid][svf_v_Z], DynamicFactions[factionid][svf_v_Rot], color1, color2, -1);
	else vehicleid = svfCar[playerid] = CreateVehicleEx(modelid, DynamicFactions[factionid][svf_e_X],DynamicFactions[factionid][svf_e_Y],DynamicFactions[factionid][svf_e_Z], DynamicFactions[factionid][svf_e_Rot], color1, color2, -1);
	format(gString, 60,"F%02d %d", factionid, vehicleid);
	SetVehicleNumberPlate(vehicleid, gString);
	Gas[vehicleid] = 100; ServerVehicles[vehicleid][vFaction]=factionid; ServerVehicles[vehicleid][vRank]=rank;
	switch(modelid) {
		case 409: {
			VehicleOBJ[vehicleid][0] = CreateDynamicObject(19309, 1534.2373, -1643.2886, 5.9373, -87.6999, 90.4001, -87.1805);
			SetDynamicObjectMaterialText(VehicleOBJ[vehicleid][0], 0, "Uber", 50, "Arial", 27, 1, COLOR_WHITE, 0xFF000000, 1);
			AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.000000, -0.429999, 0.924999, 0.000000, 0.000000, 0.000000); 
		}
		case 411: {
			switch(factionid) {
				case 1,2,3,14,19: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(19327, 1534.2373, -1643.2886, 5.9373, -87.6999, 90.4001, -87.1805);
					SetDynamicObjectMaterialText(VehicleOBJ[vehicleid][0], 0, "POLICE", 50, "Arial", 25, 1, -16777216, 0, 1);
					VehicleOBJ[vehicleid][1] = CreateDynamicObject(19419,0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.0, -1.9, 0.3, 270.0, 0.0, 0.0);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][1], vehicleid, 0.0646, 0.1661, 0.6957, 0.0000, 0.0000, 0.0000);					
				}
				case 4: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(19309,0,0,0,0,0,0,0);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, -0.009999, -2.380007, 0.319999, 0.000000, 0.000000, 0.000000);
				}
				case 15: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(19309,0,0,0,0,0,0,0);
					SetDynamicObjectMaterialText(VehicleOBJ[vehicleid][0], 0, "Uber", 50, "Arial", 27, 1, COLOR_WHITE, 0xFF000000, 1);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.000000, -0.174999, 0.784999, 0.000000, 0.000000, 0.000000);					
				}
				case 23: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(19309,0,0,0,0,0,0,0);
					SetDynamicObjectMaterialText(VehicleOBJ[vehicleid][0], 0, "Yango", 50, "Arial", 27, 1, COLOR_WHITE, 0xFF000000, 1);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.000000, -0.174999, 0.784999, 0.000000, 0.000000, 0.000000);					
				}
			}
		}
		case 415: {
			VehicleOBJ[vehicleid][0] = CreateDynamicObject(19309, 1534.2373, -1643.2886, 5.9373, -87.6999, 90.4001, -87.1805);
			SetDynamicObjectMaterialText(VehicleOBJ[vehicleid][0], 0, "Uber", 50, "Arial", 27, 1, COLOR_WHITE, 0xFF000000, 1);
			AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.000000, -0.464999, 0.689999, 0.000000, 0.000000, 0.000000);
		}
		case 560: {
			switch(factionid) {
				case 12,13: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(19308, 0.00000, 0.00000, 0.00000,0.00000, 0.00000, 0.00000);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, -0.00930, -0.23880, 0.92300,0.00000, 0.00000, 0.00000);								
				}
				case 4: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(1014, 0.00000, 0.00000, 0.00000,0.00000, 0.00000, 0.00000);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.000000, -2.225003, 0.354999, 11.055000, 0.000000, 0.000000);					
				}
				case 15: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(19309,0,0,0,0,0,0,0);
					SetDynamicObjectMaterialText(VehicleOBJ[vehicleid][0], 0, "Uber", 50, "Arial", 27, 1, COLOR_WHITE, 0xFF000000, 1);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.000000, -0.199999, 0.919999, 0.000000, 0.000000, 0.000000);					
				}
			}
		}
		case 541: {
			switch(factionid) {
				case 2: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(18646, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.375000,0.524999,0.375000,0.000000,0.000000,0.000000);
				}
				case 4: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(1146, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.000000, -2.105000, 0.324999, 0.000000, 0.000000, 0.000000);					
				}
				case 15: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(19309,0,0,0,0,0,0,0);
					SetDynamicObjectMaterialText(VehicleOBJ[vehicleid][0], 0, "Uber", 50, "Arial", 27, 1, COLOR_WHITE, 0xFF000000, 1);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.000000, -0.229999, 0.709999, 2.009999, 0.000000, 0.000000);					
				}
				case 23: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(19309,0,0,0,0,0,0,0);
					SetDynamicObjectMaterialText(VehicleOBJ[vehicleid][0], 0, "Yango", 50, "Arial", 27, 1, COLOR_WHITE, 0xFF000000, 1);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.000000, -0.229999, 0.709999, 2.009999, 0.000000, 0.000000);					
				}
			}
		}
		case 522: {
			switch(factionid) {
				case 2,19: {	
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(18646, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.000000, 0.514999, 0.454999, 0.000000, 0.000000, 0.000000);
				}
			}
		}
		case 525: {
			VehicleOBJ[vehicleid][0] = CreateDynamicObject(19294, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			VehicleOBJ[vehicleid][1]= CreateDynamicObject(19294, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, -0.600000,-0.485000,1.450000,0.000000,0.000000,0.000000);
			AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][1], vehicleid, 0.600000,-0.485000,1.450000,0.000000,0.000000,0.000000);
		}
		case 579: {
			switch(factionid) {
				case 15: {
					VehicleOBJ[vehicleid][0] = CreateDynamicObject(19309, 1534.2373, -1643.2886, 5.9373, -87.6999, 90.4001, -87.1805);
					SetDynamicObjectMaterialText(VehicleOBJ[vehicleid][0], 0, "Uber", 50, "Arial", 27, 1, COLOR_WHITE, 0xFF000000, 1);
					AttachDynamicObjectToVehicle(VehicleOBJ[vehicleid][0], vehicleid, 0.000000, -0.989999, 1.319998, 0.000000, 0.000000, 0.000000); 
				}
			}
		}
	}
	PutPlayerInVehicleEx(playerid, svfCar[playerid], 0);
	return vehicleid;
}