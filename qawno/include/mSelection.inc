forward OnPlayerModelSelection(playerid, response, listid, modelid);
forward OnPlayerModelSelectionEx(playerid, response, extraid, modelid);

#define mS_TOTAL_ITEMS         	1000
#define mS_TOTAL_LISTS			20 
#define mS_TOTAL_ROT_ZOOM		100 

#define mS_CUSTOM_MAX_ITEMS		20
new gCustomList[MAX_PLAYERS][mS_CUSTOM_MAX_ITEMS];

#define mS_INVALID_LISTID		mS_TOTAL_LISTS
#define mS_CUSTOM_LISTID		(mS_TOTAL_LISTS+1)

#define mS_NEXT_TEXT   "Next"
#define mS_PREV_TEXT   "Prev"
#define mS_CANCEL_TEXT   "Cancel"

#define mS_SELECTION_ITEMS 		21
#define mS_ITEMS_PER_LINE  		7
#define mS_DIALOG_BASE_X   	75.0
#define mS_DIALOG_BASE_Y   	130.0
#define mS_DIALOG_WIDTH    	550.0
#define mS_DIALOG_HEIGHT   	180.0
#define mS_SPRITE_DIM_X    	60.0
#define mS_SPRITE_DIM_Y    	70.0

static
	PlayerText:gCurrentPageTextDrawId[MAX_PLAYERS], PlayerText:gHeaderTextDrawId[MAX_PLAYERS], PlayerText:gBackgroundTextDrawId[MAX_PLAYERS],
	PlayerText:gNextButtonTextDrawId[MAX_PLAYERS], PlayerText:gPrevButtonTextDrawId[MAX_PLAYERS], PlayerText:gCancelButtonTextDrawId[MAX_PLAYERS],
	PlayerText:gSelectionItems[MAX_PLAYERS][mS_SELECTION_ITEMS], mS_String[128];

new gSelectionItemsTag[MAX_PLAYERS][mS_SELECTION_ITEMS];
new gItemAt[MAX_PLAYERS];
new mS_PlayerTextID[MAX_PLAYERS][MAX_PLAYER_TEXT_DRAWS]={{-1, ...},...};

#define mS_LIST_START			0
#define mS_LIST_END				1
new gLists[mS_TOTAL_LISTS][2]; // list information start/end index

#define mS_ITEM_MODEL			0
#define mS_ITEM_ROT_ZOOM_ID 	1
new gItemList[mS_TOTAL_ITEMS][2];

new Float:gRotZoom[mS_TOTAL_ROT_ZOOM][4]; // Array for saving rotation and zoom info
new gItemAmount = 0; // Amount of items used
new gListAmount = 0; // Amount of lists used
new gRotZoomAmount = 0; // Amount of Rotation/Zoom informations used

//------------------------------------------------

stock mS_GetNumberOfPages(ListID)
{
	new ItemAmount = mS_GetAmountOfListItems(ListID);
	if((ItemAmount >= mS_SELECTION_ITEMS) && (ItemAmount % mS_SELECTION_ITEMS) == 0)
	{
		return (ItemAmount / mS_SELECTION_ITEMS);
	}
	else return (ItemAmount / mS_SELECTION_ITEMS) + 1;
}

//------------------------------------------------

stock mS_GetNumberOfPagesEx(playerid)
{
	new ItemAmount = mS_GetAmountOfListItemsEx(playerid);
	if((ItemAmount >= mS_SELECTION_ITEMS) && (ItemAmount % mS_SELECTION_ITEMS) == 0)
	{
		return (ItemAmount / mS_SELECTION_ITEMS);
	}
	else return (ItemAmount / mS_SELECTION_ITEMS) + 1;
}

//------------------------------------------------

stock mS_GetAmountOfListItems(ListID)
{
	return (gLists[ListID][mS_LIST_END] - gLists[ListID][mS_LIST_START])+1;
}

//------------------------------------------------

stock mS_GetAmountOfListItemsEx(playerid)
{
	return GetPVarInt(playerid, "mS_custom_item_amount");
}

//------------------------------------------------

stock mS_GetPlayerCurrentListID(playerid)
{
	if(GetPVarInt(playerid, "mS_list_active") == 1) return GetPVarInt(playerid, "mS_list_id");
	else return mS_INVALID_LISTID;
}

//------------------------------------------------

stock PlayerText:mS_CreateCurrentPageTextDraw(playerid, Float:Xpos, Float:Ypos)
{
	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, "0/0");
   	PlayerTextDrawUseBox(playerid, txtInit, 0);
	PlayerTextDrawLetterSize(playerid, txtInit, 0.4, 1.1);
	PlayerTextDrawFont(playerid, txtInit, 1);
	PlayerTextDrawSetShadow(playerid, txtInit, 0);
    PlayerTextDrawSetOutline(playerid, txtInit, 1);
    PlayerTextDrawColor(playerid, txtInit, 0xACCBF1FF);
    PlayerTextDrawShow(playerid, txtInit);
    return txtInit;
}

//------------------------------------------------
// Creates a button textdraw and returns the textdraw ID.

stock PlayerText:mS_CreatePlayerDialogButton(playerid, Float:Xpos, Float:Ypos, Float:Width, Float:Height, const button_text[])
{
 	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, button_text);
   	PlayerTextDrawUseBox(playerid, txtInit, 1);
   	PlayerTextDrawBoxColor(playerid, txtInit, 0x000000FF);
   	PlayerTextDrawBackgroundColor(playerid, txtInit, 0x000000FF);
	PlayerTextDrawLetterSize(playerid, txtInit, 0.4, 1.1);
	PlayerTextDrawFont(playerid, txtInit, 1);
	PlayerTextDrawSetShadow(playerid, txtInit, 0); // no shadow
    PlayerTextDrawSetOutline(playerid, txtInit, 0);
    PlayerTextDrawColor(playerid, txtInit, 0x4A5A6BFF);
    PlayerTextDrawSetSelectable(playerid, txtInit, 1);
    PlayerTextDrawAlignment(playerid, txtInit, 2);
    PlayerTextDrawTextSize(playerid, txtInit, Height, Width); // The width and height are reversed for centering.. something the game does <g>
    PlayerTextDrawShow(playerid, txtInit);
    return txtInit;
}
 
//------------------------------------------------

stock PlayerText:mS_CreatePlayerHeaderTextDraw(playerid, Float:Xpos, Float:Ypos, const header_text[])
{
	new PlayerText:txtInit;
   	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, header_text);
   	PlayerTextDrawUseBox(playerid, txtInit, 0);
	PlayerTextDrawLetterSize(playerid, txtInit, 1.25, 3.0);
	PlayerTextDrawFont(playerid, txtInit, 2);
	PlayerTextDrawSetShadow(playerid, txtInit, 0);
    PlayerTextDrawSetOutline(playerid, txtInit, 1);
    PlayerTextDrawColor(playerid, txtInit, 0xACCBF1FF);
    PlayerTextDrawShow(playerid, txtInit);
    return txtInit;
}

//------------------------------------------------

stock PlayerText:mS_CreatePlayerBGTextDraw(playerid, Float:Xpos, Float:Ypos, Float:Width, Float:Height, bgcolor)
{
	new PlayerText:txtBackground = CreatePlayerTextDraw(playerid, Xpos, Ypos,"                                            ~n~"); // enough space for everyone
    PlayerTextDrawUseBox(playerid, txtBackground, 1);
    PlayerTextDrawBoxColor(playerid, txtBackground, bgcolor);
	PlayerTextDrawLetterSize(playerid, txtBackground, 5.0, 5.0);
	PlayerTextDrawFont(playerid, txtBackground, 0);
	PlayerTextDrawSetShadow(playerid, txtBackground, 0);
    PlayerTextDrawSetOutline(playerid, txtBackground, 0);
    PlayerTextDrawColor(playerid, txtBackground,0x000000FF);
    PlayerTextDrawTextSize(playerid, txtBackground, Width, Height);
   	PlayerTextDrawBackgroundColor(playerid, txtBackground, bgcolor);
    PlayerTextDrawShow(playerid, txtBackground);
    return txtBackground;
}

//------------------------------------------------
// Creates a model preview sprite

stock PlayerText:mS_CreateMPTextDraw(playerid, modelindex, Float:Xpos, Float:Ypos, Float:Xrot, Float:Yrot, Float:Zrot, Float:mZoom, Float:width, Float:height, bgcolor)
{
    new PlayerText:txtPlayerSprite = CreatePlayerTextDraw(playerid, Xpos, Ypos, ""); // it has to be set with SetText later
    PlayerTextDrawFont(playerid, txtPlayerSprite, TEXT_DRAW_FONT_MODEL_PREVIEW);
    PlayerTextDrawColor(playerid, txtPlayerSprite, 0xFFFFFFFF);
    PlayerTextDrawBackgroundColor(playerid, txtPlayerSprite, bgcolor);
    PlayerTextDrawTextSize(playerid, txtPlayerSprite, width, height); // Text size is the Width:Height
    PlayerTextDrawSetPreviewModel(playerid, txtPlayerSprite, modelindex);
    PlayerTextDrawSetPreviewRot(playerid,txtPlayerSprite, Xrot, Yrot, Zrot, mZoom);
    PlayerTextDrawSetSelectable(playerid, txtPlayerSprite, 1);
    PlayerTextDrawShow(playerid,txtPlayerSprite);
    return txtPlayerSprite;
}

//------------------------------------------------

stock mS_DestroyPlayerMPs(playerid)
{
	new x=0;
	while(x != mS_SELECTION_ITEMS) {
	    if(gSelectionItems[playerid][x] != PlayerText:INVALID_TEXT_DRAW) {
			PlayerTextDrawDestroy(playerid, gSelectionItems[playerid][x]);
			mS_PlayerTextID[playerid][PlayerText:gSelectionItems[playerid][x]] = -1;
			gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
		}
		x++;
	}
}

//------------------------------------------------

stock mS_ShowPlayerMPs(playerid)
{
	new bgcolor = GetPVarInt(playerid, "mS_previewBGcolor");
    new x=0;
	new Float:BaseX = mS_DIALOG_BASE_X;
	new Float:BaseY = mS_DIALOG_BASE_Y - (mS_SPRITE_DIM_Y * 0.33); // down a bit
	new linetracker = 0;
	
	new mS_listID = mS_GetPlayerCurrentListID(playerid);
	if(mS_listID == mS_CUSTOM_LISTID)
	{
		new itemat = (GetPVarInt(playerid, "mS_list_page") * mS_SELECTION_ITEMS);
		new Float:rotzoom[4];
		rotzoom[0] = GetPVarFloat(playerid, "mS_custom_Xrot");
		rotzoom[1] = GetPVarFloat(playerid, "mS_custom_Yrot");
		rotzoom[2] = GetPVarFloat(playerid, "mS_custom_Zrot");
		rotzoom[3] = GetPVarFloat(playerid, "mS_custom_Zoom");
		new itemamount = mS_GetAmountOfListItemsEx(playerid);
		// Destroy any previous ones created
		mS_DestroyPlayerMPs(playerid);

		while(x != mS_SELECTION_ITEMS && itemat < (itemamount)) {
			if(linetracker == 0) {
				BaseX = mS_DIALOG_BASE_X + 25.0; // in a bit from the box
				BaseY += mS_SPRITE_DIM_Y + 1.0; // move on the Y for the next line
			}
			gSelectionItems[playerid][x] = mS_CreateMPTextDraw(playerid, gCustomList[playerid][itemat], BaseX, BaseY, rotzoom[0], rotzoom[1], rotzoom[2], rotzoom[3], mS_SPRITE_DIM_X, mS_SPRITE_DIM_Y, bgcolor);
			mS_PlayerTextID[playerid][PlayerText:gSelectionItems[playerid][x]] = x;
			gSelectionItemsTag[playerid][x] = gCustomList[playerid][itemat];
			BaseX += mS_SPRITE_DIM_X + 1.0; // move on the X for the next sprite
			linetracker++;
			if(linetracker == mS_ITEMS_PER_LINE) linetracker = 0;
			itemat++;
			x++;
		}
	}
	else
	{
		new itemat = (gLists[mS_listID][mS_LIST_START] + (GetPVarInt(playerid, "mS_list_page") * mS_SELECTION_ITEMS));
		
		// Destroy any previous ones created
		mS_DestroyPlayerMPs(playerid);

		while(x != mS_SELECTION_ITEMS && itemat < (gLists[mS_listID][mS_LIST_END]+1)) {
			if(linetracker == 0) {
				BaseX = mS_DIALOG_BASE_X + 25.0; // in a bit from the box
				BaseY += mS_SPRITE_DIM_Y + 1.0; // move on the Y for the next line
			}
			new rzID = gItemList[itemat][mS_ITEM_ROT_ZOOM_ID]; // avoid long line
			if(rzID > -1) gSelectionItems[playerid][x] = mS_CreateMPTextDraw(playerid, gItemList[itemat][mS_ITEM_MODEL], BaseX, BaseY, gRotZoom[rzID][0], gRotZoom[rzID][1], gRotZoom[rzID][2], gRotZoom[rzID][3], mS_SPRITE_DIM_X, mS_SPRITE_DIM_Y, bgcolor);
			else gSelectionItems[playerid][x] = mS_CreateMPTextDraw(playerid, gItemList[itemat][mS_ITEM_MODEL], BaseX, BaseY, 0.0, 0.0, 0.0, 1.0, mS_SPRITE_DIM_X, mS_SPRITE_DIM_Y, bgcolor);
			mS_PlayerTextID[playerid][PlayerText:gSelectionItems[playerid][x]] = x;
			gSelectionItemsTag[playerid][x] = gItemList[itemat][mS_ITEM_MODEL];
			BaseX += mS_SPRITE_DIM_X + 1.0; // move on the X for the next sprite
			linetracker++;
			if(linetracker == mS_ITEMS_PER_LINE) linetracker = 0;
			itemat++;
			x++;
		}
	}
}

//------------------------------------------------

stock mS_UpdatePageTextDraw(playerid)
{
	new PageText[64+1];
	new listID = mS_GetPlayerCurrentListID(playerid);
	if(listID == mS_CUSTOM_LISTID)
	{
		format(PageText, 64, "%d/%d", GetPVarInt(playerid,"mS_list_page") + 1, mS_GetNumberOfPagesEx(playerid));
		PlayerTextDrawSetString(playerid, gCurrentPageTextDrawId[playerid], PageText);
	}
	else
	{
		format(PageText, 64, "%d/%d", GetPVarInt(playerid,"mS_list_page") + 1, mS_GetNumberOfPages(listID));
		PlayerTextDrawSetString(playerid, gCurrentPageTextDrawId[playerid], PageText);
	}
}

//------------------------------------------------

stock ShowModelSelectionMenu(playerid, ListID, const header_text[], dialogBGcolor = 0x4A5A6BBB, previewBGcolor = 0x88888899 , tdSelectionColor = 0xFFFF00AA)
{
	if(!(0 <= ListID < mS_TOTAL_LISTS && gLists[ListID][mS_LIST_START] != gLists[ListID][mS_LIST_END])) return 0;
	mS_DestroySelectionMenu(playerid);
	SetPVarInt(playerid, "mS_list_page", 0);
	SetPVarInt(playerid, "mS_list_id", ListID);
	SetPVarInt(playerid, "mS_list_active", 1);
	SetPVarInt(playerid, "mS_list_time", GetTickCount());

    gBackgroundTextDrawId[playerid] = mS_CreatePlayerBGTextDraw(playerid, mS_DIALOG_BASE_X, mS_DIALOG_BASE_Y + 20.0, mS_DIALOG_WIDTH, mS_DIALOG_HEIGHT, dialogBGcolor);
    gHeaderTextDrawId[playerid] = mS_CreatePlayerHeaderTextDraw(playerid, mS_DIALOG_BASE_X, mS_DIALOG_BASE_Y, header_text);
    gCurrentPageTextDrawId[playerid] = mS_CreateCurrentPageTextDraw(playerid, mS_DIALOG_WIDTH - 30.0, mS_DIALOG_BASE_Y + 15.0);
    gNextButtonTextDrawId[playerid] = mS_CreatePlayerDialogButton(playerid, mS_DIALOG_WIDTH - 30.0, mS_DIALOG_BASE_Y+mS_DIALOG_HEIGHT+100.0, 50.0, 16.0, mS_NEXT_TEXT);
   	mS_PlayerTextID[playerid][PlayerText:gNextButtonTextDrawId[playerid]] = 70;
    gPrevButtonTextDrawId[playerid] = mS_CreatePlayerDialogButton(playerid, mS_DIALOG_WIDTH - 90.0, mS_DIALOG_BASE_Y+mS_DIALOG_HEIGHT+100.0, 50.0, 16.0, mS_PREV_TEXT);
    mS_PlayerTextID[playerid][PlayerText:gPrevButtonTextDrawId[playerid]] = 71;
    gCancelButtonTextDrawId[playerid] = mS_CreatePlayerDialogButton(playerid, mS_DIALOG_WIDTH - 150.0, mS_DIALOG_BASE_Y+mS_DIALOG_HEIGHT+100.0, 50.0, 16.0, mS_CANCEL_TEXT);
   	mS_PlayerTextID[playerid][PlayerText:gCancelButtonTextDrawId[playerid]] = 69;
	SetPVarInt(playerid, "mS_previewBGcolor", previewBGcolor);
    mS_ShowPlayerMPs(playerid);
    mS_UpdatePageTextDraw(playerid);
	
	SelectTextDraw(playerid, tdSelectionColor);
	return 1;
}

//------------------------------------------------------------

stock ShowModelSelectionMenuEx(playerid, const items_array[], item_amount, const header_text[], extraid, Float:Xrot = 0.0, Float:Yrot = 0.0, Float:Zrot = 0.0, Float:mZoom = 1.0, dialogBGcolor = 0x4A5A6BBB, previewBGcolor = 0x88888899 , tdSelectionColor = 0xFFFF00AA)
{
	mS_DestroySelectionMenu(playerid);
	if(item_amount > mS_CUSTOM_MAX_ITEMS)
	{
		item_amount = mS_CUSTOM_MAX_ITEMS;
		print("-mSelection- WARNING: Too many items given to \"ShowModelSelectionMenuEx\", increase \"mS_CUSTOM_MAX_ITEMS\" to fix this");
	}
	if(item_amount > 0)
	{
		for(new i=0;i<item_amount;i++)
		{
			gCustomList[playerid][i] = items_array[i];
		}
		SetPVarInt(playerid, "mS_list_page", 0);
		SetPVarInt(playerid, "mS_list_id", mS_CUSTOM_LISTID);
		SetPVarInt(playerid, "mS_list_active", 1);
		SetPVarInt(playerid, "mS_list_time", GetTickCount());
	
		SetPVarInt(playerid, "mS_custom_item_amount", item_amount);
		SetPVarFloat(playerid, "mS_custom_Xrot", Xrot);
		SetPVarFloat(playerid, "mS_custom_Yrot", Yrot);
		SetPVarFloat(playerid, "mS_custom_Zrot", Zrot);
		SetPVarFloat(playerid, "mS_custom_Zoom", mZoom);
		SetPVarInt(playerid, "mS_custom_extraid", extraid);
		

		gBackgroundTextDrawId[playerid] = mS_CreatePlayerBGTextDraw(playerid, mS_DIALOG_BASE_X, mS_DIALOG_BASE_Y + 20.0, mS_DIALOG_WIDTH, mS_DIALOG_HEIGHT, dialogBGcolor);
		gHeaderTextDrawId[playerid] = mS_CreatePlayerHeaderTextDraw(playerid, mS_DIALOG_BASE_X, mS_DIALOG_BASE_Y, header_text);
		gCurrentPageTextDrawId[playerid] = mS_CreateCurrentPageTextDraw(playerid, mS_DIALOG_WIDTH - 30.0, mS_DIALOG_BASE_Y + 15.0);
		gNextButtonTextDrawId[playerid] = mS_CreatePlayerDialogButton(playerid, mS_DIALOG_WIDTH - 30.0, mS_DIALOG_BASE_Y+mS_DIALOG_HEIGHT+100.0, 50.0, 16.0, mS_NEXT_TEXT);
		mS_PlayerTextID[playerid][PlayerText:gNextButtonTextDrawId[playerid]] = 70;
		PrevButtonTextDrawId[playerid] = mS_CreatePlayerDialogButton(playerid, mS_DIALOG_WIDTH - 90.0, mS_DIALOG_BASE_Y+mS_DIALOG_HEIGHT+100.0, 50.0, 16.0, mS_PREV_TEXT);
		mS_PlayerTextID[playerid][PlayerText:gPrevButtonTextDrawId[playerid]] = 71;
		gCancelButtonTextDrawId[playerid] = mS_CreatePlayerDialogButton(playerid, mS_DIALOG_WIDTH - 150.0, mS_DIALOG_BASE_Y+mS_DIALOG_HEIGHT+100.0, 50.0, 16.0, mS_CANCEL_TEXT);
		mS_PlayerTextID[playerid][PlayerText:gCancelButtonTextDrawId[playerid]] = 69;
		SetPVarInt(playerid, "mS_previewBGcolor", previewBGcolor);
		mS_ShowPlayerMPs(playerid);
		mS_UpdatePageTextDraw(playerid);
		
		SelectTextDraw(playerid, tdSelectionColor);
		return 1;
	}
	return 0;
}

//------------------------------------------------

stock HideModelSelectionMenu(playerid)
{
	mS_DestroySelectionMenu(playerid);
	SetPVarInt(playerid, "mS_ignore_next_esc", 1);
	CancelSelectTextDraw(playerid);
	return 1;
}

//------------------------------------------------

stock mS_DestroySelectionMenu(playerid)
{
	if(GetPVarInt(playerid, "mS_list_active") == 1)
	{
		if(mS_GetPlayerCurrentListID(playerid) == mS_CUSTOM_LISTID)
		{		
			DeletePVar(playerid, "mS_custom_Xrot");
			DeletePVar(playerid, "mS_custom_Yrot");
			DeletePVar(playerid, "mS_custom_Zrot");
			DeletePVar(playerid, "mS_custom_Zoom");
			DeletePVar(playerid, "mS_custom_extraid");
			DeletePVar(playerid, "mS_custom_item_amount");
		}
		DeletePVar(playerid, "mS_list_time");
		SetPVarInt(playerid, "mS_list_active", 0);
		mS_DestroyPlayerMPs(playerid);

		PlayerTextDrawDestroy(playerid, gHeaderTextDrawId[playerid]);
		PlayerTextDrawDestroy(playerid, gBackgroundTextDrawId[playerid]);
		PlayerTextDrawDestroy(playerid, gCurrentPageTextDrawId[playerid]);
		PlayerTextDrawDestroy(playerid, gNextButtonTextDrawId[playerid]);
		PlayerTextDrawDestroy(playerid, gPrevButtonTextDrawId[playerid]);
		PlayerTextDrawDestroy(playerid, gCancelButtonTextDrawId[playerid]);

		mS_PlayerTextID[playerid][PlayerText:gNextButtonTextDrawId[playerid]] =
		mS_PlayerTextID[playerid][PlayerText:gPrevButtonTextDrawId[playerid]] =
		mS_PlayerTextID[playerid][PlayerText:gCancelButtonTextDrawId[playerid]] = -1;

		gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
		gBackgroundTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
		gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
		gNextButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
		gPrevButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;	
		gCancelButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;	
	}
}

//------------------------------------------------

public OnPlayerConnect(playerid)
{
	// Init all of the textdraw related globals
	if(gBackgroundTextDrawId[playerid]!=PlayerText:INVALID_TEXT_DRAW) {
		mS_PlayerTextID[playerid][PlayerText:gPrevButtonTextDrawId[playerid]] = -1;
		mS_PlayerTextID[playerid][PlayerText:gNextButtonTextDrawId[playerid]] = -1;
		mS_PlayerTextID[playerid][PlayerText:gCancelButtonTextDrawId[playerid]] = -1;
	    gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	    gBackgroundTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	    gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	    gNextButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	    gPrevButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	    gCancelButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    
	    for(new x=0; x < mS_SELECTION_ITEMS; x++) {
	    	mS_PlayerTextID[playerid][PlayerText:gSelectionItems[playerid][x]] = -1;
	        gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
		}
		
		gItemAt[playerid] = 0;
	}
	
	return CallLocalFunction("MP_OPC", "i", playerid);
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect MP_OPC

forward MP_OPC(playerid);

//-------------------------------------------
// Even though only Player* textdraws are used in this script,
// OnPlayerClickTextDraw is still required to handle ESC

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
   	if(GetPVarInt(playerid, "mS_ignore_next_esc") == 1) {
		SetPVarInt(playerid, "mS_ignore_next_esc", 0);
		return CallLocalFunction("MP_OPCTD", "ii", playerid, _:clickedid);
	}
   	if(GetPVarInt(playerid, "mS_list_active") == 0) return CallLocalFunction("MP_OPCTD", "ii", playerid, _:clickedid);

	// Handle: They cancelled (with ESC)
	if(clickedid == Text:INVALID_TEXT_DRAW) {
		new listid = mS_GetPlayerCurrentListID(playerid);
		if(listid == mS_CUSTOM_LISTID)
		{
			new extraid = GetPVarInt(playerid, "mS_custom_extraid");
			mS_DestroySelectionMenu(playerid);
			CallLocalFunction("OnPlayerModelSelectionEx", "dddd", playerid, 0, extraid, -1);
			PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		}
		else
		{
			mS_DestroySelectionMenu(playerid);
			CallLocalFunction("OnPlayerModelSelection", "dddd", playerid, 0, listid, -1);
			PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		}
        return 1;
	}
	
	return CallLocalFunction("MP_OPCTD", "ii", playerid, _:clickedid);
}

#if defined _ALS_OnPlayerClickTextDraw
	#undef OnPlayerClickTextDraw
#else
	#define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw MP_OPCTD

forward MP_OPCTD(playerid, Text:clickedid);

//------------------------------------------------

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(GetPVarInt(playerid, "mS_list_active") == 0 || (GetTickCount()-GetPVarInt(playerid, "mS_list_time")) < 200 /* Disable instant selection */) return CallLocalFunction("MP_OPCPTD", "ii", playerid, _:playertextid);

	new curpage = GetPVarInt(playerid, "mS_list_page");
	
	switch mS_PlayerTextID[playerid][PlayerText:playertextid] do {
		case -1: return true;
		case 69: {
			new listID = mS_GetPlayerCurrentListID(playerid);
			if(listID == mS_CUSTOM_LISTID)
			{
				new extraid = GetPVarInt(playerid, "mS_custom_extraid");
				HideModelSelectionMenu(playerid);
				CallLocalFunction("OnPlayerModelSelectionEx", "dddd", playerid, 0, extraid, -1);
				PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
			}
			else
			{
				HideModelSelectionMenu(playerid);
				CallLocalFunction("OnPlayerModelSelection", "dddd", playerid, 0, listID, -1);
				PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
			}
			return 1;
		}	// Handle: next button
		case 70: {
			new listID = mS_GetPlayerCurrentListID(playerid);
			if(listID == mS_CUSTOM_LISTID)
			{			
				if(curpage < (mS_GetNumberOfPagesEx(playerid) - 1)) {
					SetPVarInt(playerid, "mS_list_page", curpage + 1);
					mS_ShowPlayerMPs(playerid);
					mS_UpdatePageTextDraw(playerid);
					PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				} else {
					PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
				}
			}
			else
			{
				if(curpage < (mS_GetNumberOfPages(listID) - 1)) {
					SetPVarInt(playerid, "mS_list_page", curpage + 1);
					mS_ShowPlayerMPs(playerid);
					mS_UpdatePageTextDraw(playerid);
					PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				} else {
					PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
				}
			}
			return 1;
		} // Handle: previous button
		case 71: {
		    if(curpage > 0) {
		    	SetPVarInt(playerid, "mS_list_page", curpage - 1);
		    	mS_ShowPlayerMPs(playerid);
		    	mS_UpdatePageTextDraw(playerid);
		    	PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
			} else {
			    PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
			}
			return 1;
		}
		default: {
			new x=mS_PlayerTextID[playerid][PlayerText:playertextid];
			new listID = mS_GetPlayerCurrentListID(playerid);
			if(listID == mS_CUSTOM_LISTID)
			{
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				new item_id = gSelectionItemsTag[playerid][x];
				new extraid = GetPVarInt(playerid, "mS_custom_extraid");
				HideModelSelectionMenu(playerid);
				CallLocalFunction("OnPlayerModelSelectionEx", "dddd", playerid, 1, extraid, item_id);
				return 1;
			}
			else
			{
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
				new item_id = gSelectionItemsTag[playerid][x];
				HideModelSelectionMenu(playerid);
				CallLocalFunction("OnPlayerModelSelection", "dddd", playerid, 1, listID, item_id);
				return 1;
			}
		}
	}
	
	return CallLocalFunction("MP_OPCPTD", "ii", playerid, _:playertextid);
}

#if defined _ALS_OnPlayerClickPlayerTD
	#undef OnPlayerClickPlayerTextDraw
#else
	#define _ALS_OnPlayerClickPlayerTD
#endif
#define OnPlayerClickPlayerTextDraw MP_OPCPTD

forward MP_OPCPTD(playerid, PlayerText:playertextid);

//------------------------------------------------------------------


stock LoadModelSelectionMenu(const f_name[], File:f=File:0,tmp_ItemAmount=-1,idxx=0,mID=0,_x=-1) {
	if(!(f=fopen(f_name, io_read)))
		return printf("[mSelection] warning: Failed to load list: \"%s\"", f_name),mS_INVALID_LISTID;
	
	if gListAmount >= mS_TOTAL_LISTS *then
		return printf("[mSelection] warning: reached maximum amount of lists, increase \"mS_TOTAL_LISTS\"", f_name),mS_INVALID_LISTID;

	tmp_ItemAmount = gItemAmount;
	while(fread(f,mS_String,sizeof(mS_String),false)) {
		if tmp_ItemAmount >= mS_TOTAL_ITEMS *then 
			return printf("[mSelection] warning: reached maximum amount of items, increase \"mS_TOTAL_ITEMS\"", f_name);

		if !mS_String[(idxx=0)] *then 
			continue;

		if 0 > (mID=strval(mS_strtok(mS_String,idxx))) > 20000 *then 
			continue;

		gItemList[tmp_ItemAmount][mS_ITEM_MODEL] = mID;
		new tmp_mS_strtok[20], Float:mRotation[4] = {0.0, 0.0, 0.0, 1.0}, bool:useRotation = false;
		
		while(++_x<4) {
			tmp_mS_strtok = mS_strtok(mS_String,idxx);
			if !tmp_mS_strtok[0] *then continue;
			useRotation = true;
			mRotation[_x] = floatstr(tmp_mS_strtok);
		}
		if useRotation *then {
			new bool:foundRotZoom = false;
			_x=-1;
			while(++_x<gRotZoomAmount) {
				if gRotZoom[_x][0] == mRotation[0] && gRotZoom[_x][1] == mRotation[1] && gRotZoom[_x][2] == mRotation[2] && gRotZoom[_x][3] == gRotZoom[_x][3] *then {
					foundRotZoom = true;
					gItemList[tmp_ItemAmount][mS_ITEM_ROT_ZOOM_ID] = _x;
					break;
				}
			}
			if gRotZoomAmount < mS_TOTAL_ROT_ZOOM *then {
				if !foundRotZoom *then {
					gRotZoom[gRotZoomAmount][0] = mRotation[0];
					gRotZoom[gRotZoomAmount][1] = mRotation[1];
					gRotZoom[gRotZoomAmount][2] = mRotation[2];
					gRotZoom[gRotZoomAmount][3] = mRotation[3];
					gItemList[tmp_ItemAmount][mS_ITEM_ROT_ZOOM_ID] = (gRotZoomAmount++);
				}
			}
			else print("[mSelection] warning: Not able to save rotation/zoom information. Reached maximum rotation/zoom information count. Increase '#define mS_TOTAL_ROT_ZOOM' to fix the issue"); 
		}
		else gItemList[tmp_ItemAmount][mS_ITEM_ROT_ZOOM_ID] = -1;
		tmp_ItemAmount++;
	}
	if(tmp_ItemAmount > gItemAmount) {
		gLists[gListAmount][mS_LIST_START] = gItemAmount;
		gItemAmount = tmp_ItemAmount;
		gLists[gListAmount][mS_LIST_END] = (gItemAmount-1);
		
		gListAmount++;
		return (gListAmount-1);
	}
	printf("[mSelection] warning: No Items found in file: %s", f_name);
	return mS_INVALID_LISTID;
}

#define ASCII_IN_RANGE(%0,%1,%2) (((%0)-((%1)+cellmin))<((%2)-((%1)+cellmin)))
stock mS_strtok(const string[], &index,offset=-1) {
	while (ASCII_IN_RANGE(string[index++], 1, ' '+1)) {}
	new result[20]; offset=index=index-1;
	while(string[index] > ' ' && index-offset < sizeof result - 1) result[index-offset] = string[index++];
	return result[index-offset]=0,result;
}