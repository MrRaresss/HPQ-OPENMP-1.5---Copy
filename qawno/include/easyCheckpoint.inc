

		 ///////////////////////////////////////////////////////////////////
		////		 new version easy checkpoint by HPQ123 (c) 2021	  /////
	   /////				 Discord: HPQ123#8114		    	      ////
	  ///////////////////////////////////////////////////////////////////


static __dNameEx[MAX_PLAYERS][40 char];

#define CP::%0(%1) 								forward CP_%0(%1); public CP_%0(%1)
#define SetPlayerCheckpoint_(%0,%1, 			__CP__(%0, #CP_%1,


stock __CP__(playerid, function[], Float:x, Float:y, Float:z, Float:size)
	return (function[6]=95,strpack(__dNameEx[playerid], function, 40 char))&(SetPlayerCheckpoint(playerid, x, y, z, size));

public OnPlayerEnterCheckpoint(playerid) {
	if __dNameEx[playerid][0] != 'l' *then CallLocalFunction(__dNameEx[playerid], "i", playerid);
	#if defined DR_OnPlayerEnterCheckpoint
	    return DR_OnPlayerEnterCheckpoint(playerid);
	#else
	    return false;
	#endif
}

#if defined _ALS_OnPlayerEnterCheckpoint
	#undef OnPlayerEnterCheckpoint
#else
	#define _ALS_OnPlayerEnterCheckpoint
#endif

#define OnPlayerEnterCheckpoint DR_OnPlayerEnterCheckpoint

#if defined DR_OnPlayerEnterCheckpoint
	forward DR_OnPlayerEnterCheckpoint(playerid);
#endif