//Spawn Zone
//Selects and Spawns the crash site
//Selects Player to be used at the Downed Pilot


#define SELF {_this call (missionNamespace getVariable ["RC_fnc_spawnZone"]);}

locations = [];
_heli =  "I_Heli_light_03_unarmed_F" createVehicle getMarkerPos "veh_create";
removeFromRemainsCollector [_heli];

//remember to switch "switchableUnits"-SP to "playableUnits"-MP
pilot = playableUnits select floor (random (count playableUnits));
pilot setIdentity name player;


for [{_i=999},{_i<=4500},{_i=_i+50}] do 
{

	for [{_g =1096},{_g<=4500},{_g=_g+50}] do
	{
			if(((_i <= 4000.05) && (_i >= 999.527)) && ((_g <= 4096.23)&&(_g >= 1096.13))) then
			{
				/*_m = format["#marker_%1_%2",_i,_g];
				_markerstr = createMarker [_m,[_i,_g]];  
				_markerstr setMarkerShape "RECTANGLE";
				_markerstr setMarkerColor "ColorBlue";
				_markerstr setMarkerSize [150,150];*/
				_pos = [_i,_g];
				locations  pushBack _pos;
			};	
	};
};

//hint format["%1", count locations];

_spawner = "Intel_File1_F" createVehicle (locations select floor (random (count locations)));
_spawner allowDamage false;
_heli setDamage 1;
_heli setPos (_spawner modelToWorld[-3.00561523,-0.00012207,-1.86232]); 
pilot setPos (_spawner modelToWorld[6,8]);
[pilot] join grpNull;

//Adds Uniform and gear to the pilot.
pilot addUniform  "UNS_ARMY_BDU_173rdAB1stlt";
{pilot addItemToUniform _x} foreach ["AGM_Bandage","AGM_Morphine","AGM_Bandage",
   "AGM_Bandage","AGM_Morphine","AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Bandage","AGM_Bandage",
   "AGM_Morphine","AGM_Bandage","1911_Magazine","1911_Magazine","1911_Magazine","1911_Magazine"];

//Adds Vest and Gear to the pilot.   
pilot addVest "UNS_M1956_A1";
{pilot addItemToVest _x} foreach  ["AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Bandage","AGM_Bandage","AGM_Bandage","HandGrenade","1911_Magazine","1911_Magazine","1911_Magazine","1911_Magazine","1911_Magazine",
   "1911_Magazine","SmokeShell","SmokeShellPurple","SmokeShellPurple","20Rnd_556x45_Stanag","20Rnd_556x45_Stanag","20Rnd_556x45_Stanag"];

//Adds backpack and gear to the pilot.   
pilot addBackpack "UNS_Alice_2";
{pilot addItemToBackpack _x} foreach  ["AGM_Morphine","AGM_Morphine","AGM_Morphine","AGM_Morphine","AGM_Epipen","AGM_Epipen","AGM_Epipen",
   "AGM_Epipen","AGM_Epipen","AGM_Epipen","AGM_Bandage","AGM_Bandage","AGM_Bandage","AGM_Bandage",
   "AGM_Bandage","AGM_Bandage","AGM_Bandage","AGM_Bloodbag","AGM_Bloodbag","AGM_Bloodbag",
   "AGM_Bloodbag","AGM_DefusalKit","AGM_EarBuds","AGM_Clacker","UNS_Bandana_OD","SmokeShell","SmokeShell","SmokeShellPurple",
   "SmokeShellPurple","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokePurple_Grenade_shell"];

//Adds Weapons to the pilot.
{pilot addWeapon _x} foreach["Colt1911","Rangefinder","NAM_CAR15_20"];

pilot addHeadgear "UNS_TC_2";

deleteVehicle _spawner;
sleep 10;
if(name pilot == name player)then
{
	hint "You've just survived a crash, your crew is dead and the VC are coming. Stay alive until rescue comes! ";
}else
{
	hint format["Your objective is to find %1, they were shot down by the VC earlier today. Their survival is in your hands, coordinate with your teammates and find our downed Airmen!",name pilot];
};