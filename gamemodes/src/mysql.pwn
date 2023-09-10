#define _query(%0,%1) mysql_format(SQL,gQuery,sizeof gQuery, %0, %1) && mysql_tquery(SQL, gQuery)

stock UpdateVar(playerid, const varname[], amount) 
	return _query("UPDATE `users` SET `%s`='%i' WHERE `id`='%i'", varname, amount, PlayerInfo[playerid][pSQLID]);

stock UpdateVarStr(playerid, const varname[], const amount[]) 
	return _query("UPDATE `users` SET `%s`='%e' WHERE `id`='%i'", varname, amount, PlayerInfo[playerid][pSQLID]);

#define ABroadcast(%0,%1,%2,%3) \
	format(gString, 256, %2, %3) && SendAdminMessage(%0,gString,%1)