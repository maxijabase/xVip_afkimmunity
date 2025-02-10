#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <xVip>
#include <afk_manager>

#define PLUGIN_VERSION "1.0"

public Plugin myinfo = 
{
  name = "xVip - AFK Immunity", 
  author = "ampere", 
  description = "Provides AFK immunity for VIP players", 
  version = PLUGIN_VERSION, 
  url = "https://github.com/maxijabase"
};

public Action AFKM_OnAFKEvent(const char[] name, int client)
{
  // Check if the client is valid and is a VIP
  if (IsValidClient(client))
  {
    return Plugin_Continue;
  }

  return xVip_IsVip(client) ? Plugin_Stop : Plugin_Continue;
} 