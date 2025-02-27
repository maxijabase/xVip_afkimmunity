#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <xVip>
#include <afkmanager>

#define PLUGIN_VERSION "1.1"
#define UPDATE_URL "https://raw.githubusercontent.com/maxijabase/xVip_afkimmunity/master/updatefile.txt"

#undef REQUIRE_PLUGIN 
#include <updater>

// Track clients with pending VIP status
ArrayList g_PendingVipStatus;

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
  // Initialize the pending VIP status array
  g_PendingVipStatus = new ArrayList();
  
  if (LibraryExists("updater"))
  {
    Updater_AddPlugin(UPDATE_URL);
  }
}

public void OnClientDisconnect(int client)
{
  // Remove client from pending list if they disconnect
  int index = g_PendingVipStatus.FindValue(client);
  if (index != -1)
  {
    g_PendingVipStatus.Erase(index);
  }
}

public void OnLibraryAdded(const char[] name)
{
  if (StrEqual(name, "updater"))
  {
    Updater_AddPlugin(UPDATE_URL);
  }
}

public void xVip_OnVipStatusChanged(int client, VIPStatus status)
{
  if (!IsValidClient(client))
  {
    return;
  }
  
  switch (status)
  {
    case VIPStatus_VIP:
    {
      // Player is now a VIP - give them immunity
      AFKM_SetClientImmunity(client, AFKImmunity_Full);
    }
    
    case VIPStatus_NotVIP:
    {
      // Player is not a VIP - remove immunity
      AFKM_SetClientImmunity(client, AFKImmunity_None);
    }
  }
}