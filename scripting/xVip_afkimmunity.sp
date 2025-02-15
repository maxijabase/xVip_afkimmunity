#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <xVip>
#include <afkmanager>

#define PLUGIN_VERSION "1.0"
#define UPDATE_URL "https://raw.githubusercontent.com/maxijabase/xVip_afkimmunity/master/updatefile.txt"

#undef REQUIRE_PLUGIN 
#include <updater>

public Plugin myinfo = 
{
  name = "xVip - AFK Immunity", 
  author = "ampere", 
  description = "Provides AFK immunity for VIP players", 
  version = PLUGIN_VERSION, 
  url = "https://github.com/maxijabase"
};

public void OnPluginStart()
{
  if (LibraryExists("updater"))
  {
    Updater_AddPlugin(UPDATE_URL);
  }
}

public void OnLibraryAdded(const char[] name)
{
  if (StrEqual(name, "updater"))
  {
    Updater_AddPlugin(UPDATE_URL);
  }
}

public Action AFKM_OnInitializePlayer(int client)
{
  return xVip_IsVip(client) ? Plugin_Stop : Plugin_Continue;
} 