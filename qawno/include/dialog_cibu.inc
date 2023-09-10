/*
  *** easy Dialog v0.0.3 ***
  *	  by HPQ123
  *   contact Discord: HPQ123#8114
  *   Tester: IonchyAdv
  ***	    ****		 ***
*/

#include <YSI_Coding\y_hooks>

#if defined easyDialog_v4
  #endinput
#endif
#define easyDialog_v4

#define MAX_DIALOG_CAPTION_LEN (64)
#define MAX_DIALOG_HEADER_LEN (512)
#define MAX_DIALOG_INFO_LEN (8192)
#define MAX_DIALOG_BUTTON_LEN (128)

#define DIALOG_SIMPLE 				5000
#define DIALOG_PAGES				5001

#define Dialog:%0(%1)				forward dialog_%0(%1); public dialog_%0(%1)
#define Dialog_Opened(%0)			dialogData[%0][DL_Status]

enum e_DIALOGS_ENUM {
	bool:IsDialogActivate,
	DL_dialogid,
	DL_dialogstyle,
	DL_caption[MAX_DIALOG_CAPTION_LEN],
	DL_info[MAX_DIALOG_INFO_LEN],
	DL_btn1[MAX_DIALOG_BUTTON_LEN],
	DL_btn2[MAX_DIALOG_BUTTON_LEN],
	DL_nextbtn[MAX_DIALOG_BUTTON_LEN],
	DL_lastbtn[MAX_DIALOG_BUTTON_LEN],

	DL_ItemCount,
	DL_CurrentPage,
	DL_MaxItems,
	DL_PagesList,
	DL_Header[MAX_DIALOG_HEADER_LEN],
	DL_TabList
}

new 
	dialogData[MAX_PLAYERS][e_DIALOG_ENUMa],DL_String[1094],DL_String2[1094],DL_Name[MAX_PLAYERS][40 char],
	DL_RVAR[e_DIALOG_ENUMa]={0,DIALOG_STYLE_INPUT,"","","","",0,0,0,""}
;


#define Dialog_ShowPages(%0,%1,%2,%3,%4,%5,%6) \
	((dialogData[%0][DL_Status]=DL_internPages(%0, %2, %3, %4, %5, %6)),strpack(DL_Name[%0], #dialog_##%1, 40 char))

#define Dialog_ShowEx(%0,%1,%2,%3,%4,%5,%6,%7) \
	format(DL_String2, sizeof DL_String2, %4, %7)&&Dialog_Show(%0,%1,%2,%3,DL_String2,%5,%6)

#define Dialog_ShowPagesEx(%0,%1,%2,%3,%4,%5,%6,%7) \
	format(DL_String2, sizeof DL_String2, %4, %7)&&Dialog_ShowPages(%0,%1,%2,%3,DL_String2,%5,%6)

#define Dialog_Close(%0) \
	ShowPlayerDialog(%0, (dialogData[%0][DL_Status]=0)-1, DIALOG_STYLE_MSGBOX, " ", " ", " ", " ");

stock show_cibu_dialog(playerid, dialogid, dialogstyle, const caption[], info[], const button1[], const button2[], maxitemslist = 15, const nextbutton[] = "Next page", const lastbutton[] = "Previous page") {
	dialogData[playerid][DL_dialogid] = dialogid;
	dialogData[playerid][DL_dialogstyle] = dialogstyle;
	format(dialogData[MAX_PLAYERS][DL_caption], MAX_DIALOG_CAPTION_LEN, caption);

	switch(dialogstyle) {
		case DIALOG_STYLE_TABLIST: {
				new header[MAX_DIALOG_HEADER_LEN], findbacknd = strfind(info, "\n", true, 0), tablist_pos = -1;
        strmid(header, info, 0, findbacknd + 1);
        for(;;)
        {
            tablist_pos = strfind(header, "\t", true, tablist_pos + 1);
            if(tablist_pos == -1) break;
            else dialogData[playerid][DL_TabList]++;
        }
		}
		case DIALOG_STYLE_TABLIST_HEADERS: {
				new findbacknd = strfind(info, "\n", true, 0), tablist_pos = -1;
        strmid(dialogData[playerid][DL_Header], info, 0, findbacknd + 1);
        for(;;)
        {
            tablist_pos = strfind(dialogData[playerid][DL_Header], "\t", true, tablist_pos + 1);
            if(tablist_pos == -1) break;
            else dialogData[playerid][DL_TabList]++;
        }
        strdel(info, 0, findbacknd + 1);
		}
	}

		new tmp_str[6];
    strmid(tmp_str, info, strlen(info) - 1, strlen(info));
    if(strcmp(tmp_str, "\n", true) != 0) strcat(info, "\n", MAX_DIALOG_INFO_LEN);
    strcat(dialogData[playerid][DL_info], info);

    format(dialogData[playerid][DL_btn1], MAX_DIALOG_BUTTON_LEN, button1);
    format(dialogData[playerid][DL_btn2], MAX_DIALOG_BUTTON_LEN, button2);
    format(dialogData[playerid][DL_nextbtn], MAX_DIALOG_BUTTON_LEN, nextbutton);
    format(dialogData[playerid][DL_lastbtn], MAX_DIALOG_BUTTON_LEN, lastbutton);
    dialogData[playerid][DL_MaxItems] = maxitemslist;

    new pos = -1;
    for(;;)
    {
        pos = strfind(info, "\n", true, pos + 1);
        if(pos == -1) break;
        else dialogData[playerid][ItemCount]++;
    }

    new Float:tmp_pages = floatdiv(dialogData[playerid][DL_ItemCount], maxitemslist);
    dialogData[playerid][DL_PagesList] = floatround(tmp_pages, floatround_round);
    if(floatfract(tmp_pages) > 0.0 && floatfract(tmp_pages) < 0.5) dialogData[playerid][DL_PagesList]++;
    if(dialogData[playerid][DL_PagesList] == 0) dialogData[playerid][DL_PagesList] = 1;
    dialogData[playerid][DL_CurrentPage] = 1;

    new tmp_info[MAX_DIALOG_INFO_LEN], index = 0, tmp_pos = -1, itemlist_end = -1;
    for(;;)
    {
        tmp_pos = strfind(info, "\n", true, tmp_pos + 1);
        if(tmp_pos == -1) break;
        else
        {
            if(index < maxitemslist)
            {
                itemlist_end = tmp_pos;
                index++;
            }
            else break;
        }
    }
    strmid(tmp_info, info, 0, itemlist_end);
    if(dialogData[playerid][DL_dialogstyle] == DIALOG_STYLE_TABLIST_HEADERS)
        strins(tmp_info, dialogData[playerid][DL_Header], 0);
    AddDialogPagesButtons(playerid, tmp_info);

    ShowPlayerDialog(playerid, dialogid, dialogstyle, StringFormatDialogPagesCaption(playerid, dialogData[playerid][DL_caption]), StringFormatDialogPagesInfo(playerid, tmp_info), button1, button2);
    dialogData[playerid][IsDialogActivate] = true;
	return true;
}

stock DL_internPages(playerid, style, const caption[], const info[], const button1[], const button2[], _default=10, lastpos=0) {
	dialogData[playerid] = DL_RVAR;
	strmid(dialogData[playerid][DL_Info], info, 0, 64 * 64);
	strmid(dialogData[playerid][DL_Caption], caption, 0, 32);
	strmid(dialogData[playerid][DL_Button1], button1, 0, 32);
	strmid(dialogData[playerid][DL_Button2], button2, 0, 32);
	dialogData[playerid][DL_Style] = style;
	dialogData[playerid][DL_DivPage] = _default;

	strmid(DL_String, info, 0, sizeof DL_String);
	dialogData[playerid][DL_Collumn] = style!=5?1:-1;
	for(;(lastpos=strfind(info, "\n", true, lastpos + 1))!=-1;) 
		if(++dialogData[playerid][DL_Collumn]%_default) continue;
		else dialogData[playerid][DL_Char][dialogData[playerid][DL_Collumn]/_default] = lastpos+1;

	dialogData[playerid][DL_Char][(dialogData[playerid][DL_Collumn]/_default)+1] = strlen(info);
	DL_String[dialogData[playerid][DL_Char][1]] = '\0';
	DL_AddButtons(playerid);
	return ShowPlayerDialog(playerid, DIALOG_PAGES, style, caption, DL_String, button1, button2),strmid(dialogData[playerid][DL_Headers], info, 0, strfind(info, "\n", true)+1);
}

stock DL_AddButtons(playerid, max=0) {
	max=(dialogData[playerid][DL_Collumn]-1)/dialogData[playerid][DL_DivPage];
	if(dialogData[playerid][DL_CurrentPage] != max && max) strcat(DL_String, "{ffca60}>> Next Page\n");
	if(dialogData[playerid][DL_CurrentPage] != 0) strcat(DL_String, "{ffca60}<< Back Page");
	return true;
}

stock DL_fresh(playerid, current) {
	if(dialogData[playerid][DL_Style]==DIALOG_STYLE_TABLIST_HEADERS) {
		strmid(DL_String, dialogData[playerid][DL_Headers], 0, 64);
		strmid(DL_String2, dialogData[playerid][DL_Info], dialogData[playerid][DL_Char][current], dialogData[playerid][DL_Char][current+1]);
		strcat(DL_String, DL_String2);
	} else strmid(DL_String, dialogData[playerid][DL_Info], dialogData[playerid][DL_Char][current], dialogData[playerid][DL_Char][current+1]);

	DL_AddButtons(playerid);
	return dialogData[playerid][DL_Status]=ShowPlayerDialog(playerid, DIALOG_PAGES, dialogData[playerid][DL_Style], dialogData[playerid][DL_Caption], DL_String, dialogData[playerid][DL_Button1], dialogData[playerid][DL_Button2]);
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	new x=-1;
	for(;inputtext[++x];) if inputtext[x] != '%' *then continue; else inputtext[x] = '#';
	if(dialogData[playerid][IsDialogActivate] == true) {
		if(dialogid == dialogData[playerid][DL_dialogid])
        {
            new button_next = INVALID_BUTTON_ID, button_previous = INVALID_BUTTON_ID;
            if(IsDialogPagesButtonUsed(playerid, BUTTON_NEXT_PAGE))
                button_next = (GetDialogPagesListItemCount(playerid) - 1) + 1;
            if(IsDialogPagesButtonUsed(playerid, BUTTON_PREVIOUS_PAGE))
            {
                if(IsDialogPagesButtonUsed(playerid, BUTTON_NEXT_PAGE))
                    button_previous = (GetDialogPagesListItemCount(playerid) - 1) + 2;
                else button_previous = (GetDialogPagesListItemCount(playerid) - 1) + 1;
            }

            if(listitem == button_next || listitem == button_previous)
            {
                if(listitem == button_next)
                {

                  new edited_listitem = 0;
                  if(PlayerDialogPagesCache[playerid][CurrentPage] == 1)
                  {
                      edited_listitem = listitem;
                      OnDialogPagesResponse(playerid, dialogid, response, edited_listitem, inputtext, button_next, button_previous);
                  }
                  else
                  {
                      new page_listitems = (PlayerDialogPagesCache[playerid][CurrentPage] - 1) * PlayerDialogPagesCache[playerid][MaxItemsSplit], tmp_btn_next = page_listitems + button_next, tmp_btn_prev = page_listitems + button_previous;
                      edited_listitem = page_listitems + listitem;
                      OnDialogPagesResponse(playerid, dialogid, response, edited_listitem, inputtext, tmp_btn_next, tmp_btn_prev);
                  }
                    
                }
                else if(listitem == button_previous)
                {
                    if(PlayerDialogPagesCache[playerid][IsDynamic] == false)
                        ShowPlayerDialogPreviousPage(playerid);
                    else
                    {
                        new edited_listitem = 0;
                        if(PlayerDialogPagesCache[playerid][CurrentPage] == 1)
                        {
                            edited_listitem = listitem;
                            OnDialogPagesResponse(playerid, dialogid, response, edited_listitem, inputtext, button_next, button_previous);
                        }
                        else
                        {
                            new page_listitems = (PlayerDialogPagesCache[playerid][CurrentPage] - 1) * PlayerDialogPagesCache[playerid][MaxItemsSplit], tmp_btn_next = page_listitems + button_next, tmp_btn_prev = page_listitems + button_previous;
                            edited_listitem = page_listitems + listitem;
                            OnDialogPagesResponse(playerid, dialogid, response, edited_listitem, inputtext, tmp_btn_next, tmp_btn_prev);
                        }
                    }
                }
            }
            else
            {
                new edited_listitem = 0;
                if(PlayerDialogPagesCache[playerid][CurrentPage] == 1)
                {
                    edited_listitem = listitem;
                    OnDialogPagesResponse(playerid, dialogid, response, edited_listitem, inputtext, button_next, button_previous);
                    ClearDialogPagesData(playerid);
                }
                else
                {
                    new page_listitems = (PlayerDialogPagesCache[playerid][CurrentPage] - 1) * PlayerDialogPagesCache[playerid][MaxItemsSplit], tmp_btn_next = page_listitems + button_next, tmp_btn_prev = page_listitems + button_previous;
                    edited_listitem = page_listitems + listitem;
                    OnDialogPagesResponse(playerid, dialogid, response, edited_listitem, inputtext, tmp_btn_next, tmp_btn_prev);
                    ClearDialogPagesData(playerid);
                }
            }
        }
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}
stock StringFormatDialogPagesInfo(playerid, const text[])
{
    new info[MAX_DIALOG_INFO_LEN];
    strcat(info, text);

    new info_pos = 0, info_lastfind = 0;
    for(;;)
    {
        info_pos = strfind(info, "#currentpage", true, info_lastfind);
        if(info_pos == -1) break;
        else
        {
            new string[64];
            format(string, sizeof string, "%i", dialogData[playerid][DL_CurrentPage]);

            strdel(info, info_pos, info_pos + 12);
            strins(info, string, info_pos, MAX_DIALOG_INFO_LEN);
            info_lastfind = info_pos + 12;
        }
    }

    info_pos = 0; info_lastfind = 0;
    for(;;)
    {
        info_pos = strfind(info, "#pagelist", true, info_lastfind);
        if(info_pos == -1) break;
        else
        {
            new string[64];
            format(string, sizeof string, "%i", dialogData[playerid][DL_PagesList]);

            strdel(info, info_pos, info_pos + 9);
            strins(info, string, info_pos, MAX_DIALOG_INFO_LEN);
            info_lastfind = info_pos + 8;
        }
    }
    return info;
}

stock StringFormatDialogPagesCaption(playerid, const text[])
{
    new caption[MAX_DIALOG_CAPTION_LEN];
    strcat(caption, text);

    new caption_pos = 0, caption_lastfind = 0;
    for(;;)
    {
        caption_pos = strfind(caption, "#currentpage", true, caption_lastfind);
        if(caption_pos == -1) break;
        else
        {
            new string[64];
            format(string, sizeof string, "%i", dialogData[playerid][DL_CurrentPage]);

            strdel(caption, caption_pos, caption_pos + 12);
            strins(caption, string, caption_pos, MAX_DIALOG_CAPTION_LEN);
            caption_lastfind = caption_pos + 12;
        }
    }

    caption_pos = 0; caption_lastfind = 0;
    for(;;)
    {
        caption_pos = strfind(caption, "#pagelist", true, caption_lastfind);
        if(caption_pos == -1) break;
        else
        {
            new string[64];
            format(string, sizeof string, "%i", dialogData[playerid][DL_PagesList]);

            strdel(caption, caption_pos, caption_pos + 9);
            strins(caption, string, caption_pos, MAX_DIALOG_CAPTION_LEN);
            caption_lastfind = caption_pos + 8;
        }
    }
    return caption;
}
