#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <xVip>
#include <afkmanager>

#define PLUGIN_VERSION "1.0"

public Plugin myinfo = 
{
  name = "xVip - AFK Immunity", 
  author = "ampere", 
  description = "Provides AFK immunity for VIP players", 
  version = PLUGIN_VERSION, 
  url = "https://github.com/maxijabase"
};

public Action AFKM_OnInitializePlayer(int client)
{
  return xVip_IsVip(client) ? Plugin_Stop : Plugin_Continue;
} 