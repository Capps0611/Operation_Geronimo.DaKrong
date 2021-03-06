//Spawn Zone
//Selects and Spawns the crash site
//Selects Player to be used at the Downed Pilot


#define SELF {_this call (missionNamespace getVariable ["RC_fnc_spawnZone"]);}

locations = [];
_heli =  "GR_UH1H_2" createVehicle getMarkerPos "veh_create";
removeFromRemainsCollector [_heli];

//remember to switch "switchableUnits"-SP to "playableUnits"-MP
pilot = playableUnits select floor (random (count playableUnits));
pilot setIdentity name pilot;
removeUniform pilot;
removeVest pilot;
removeBackpackGlobal pilot;
{pilot removeWeaponGlobal _x}foreach weapons pilot;
pilot removeweapon "itemmap";
pilot removeweapon "itemradio";

//Adds Uniform and gear to the pilot.
[]spawn 
{
	//Adds backpack and gear to the pilot.   
	pilot addBackpackGlobal "UNS_Alice_2";
	{pilot addItemToBackpack _x} foreach ["AGM_Morphine","AGM_Morphine","AGM_Morphine","AGM_Morphine","AGM_Epipen","AGM_Epipen","AGM_Epipen",
	   "AGM_Epipen","AGM_Epipen","AGM_Epipen","AGM_Bandage","AGM_Bandage","AGM_Bandage","AGM_Bandage",
	   "AGM_Bandage","AGM_Bandage","AGM_Bandage","AGM_DefusalKit","AGM_EarBuds","AGM_Clacker","UNS_Bandana_OD","SmokeShell","SmokeShell","SmokeShellPurple","SmokeShellPurple"];

	pilot addUniform  "UNS_ARMY_BDU_173rdAB1stlt";
	{pilot addItemToUniform _x} foreach ["AGM_Bandage","AGM_Morphine","AGM_Bandage",
	   "AGM_Bandage","AGM_Morphine","AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Bandage","AGM_Bandage",
	   "AGM_Morphine","AGM_Bandage","1911_Magazine","1911_Magazine","1911_Magazine","1911_Magazine"];

	//Adds Vest and Gear to the pilot.   
	pilot addVest "UNS_M1956_A1";
	{pilot addItemToVest _x} foreach ["AGM_Bandage","AGM_Bandage","AGM_Morphine","AGM_Bandage","AGM_Bandage","AGM_Bandage","HandGrenade","1911_Magazine","1911_Magazine","1911_Magazine","1911_Magazine","1911_Magazine",
	   "1911_Magazine","SmokeShell","SmokeShellPurple","SmokeShellPurple","20Rnd_556x45_Stanag","20Rnd_556x45_Stanag","20Rnd_556x45_Stanag"];

	//Adds Weapons to the pilot.
	{pilot addWeaponGlobal _x} foreach["Colt1911","Rangefinder","NAM_CAR15_20"];

	pilot addHeadgear "UNS_TC_2";
};

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


_spawner = "Intel_File1_F" createVehicle (locations select floor (random (count locations)));
_spawner allowDamage false;
_heli setDamage 1;
_heli setPos (_spawner modelToWorld[-3.00561523,-0.00012207,-1.86232]);
if((paramsArray select 2) == 0) then
{
	_OnFire = "test_EmptyObjectForFireBig" createVehicle (getPos _heli);
	_OnFire attachTo [_heli,[0,1,0]];

};
pilot setPos (_spawner modelToWorld[6,8]);
[pilot] join grpNull;

//Spawns Decoy Wrecks
[] spawn
{
	for [{_i=0},{_i<=5},{_i=_i+1}] do
	{
		_thisHeli =  "GR_UH1H_2" createVehicle (locations select floor (random (count locations)));
		_thisHeli setDamage 1;
		removeFromRemainsCollector [_thisHeli];
		_thisOnFire = "test_EmptyObjectForFireBig" createVehicle (getPos _thisHeli);
		_thisOnFire attachTo [_thisHeli,[0,1,0]];
	};
};

deleteVehicle _spawner;

if(name pilot == name player)then
{
	{hint "You've just survived a crash, your crew is dead and the VC are coming. Stay alive until rescue comes!";} spawn BIS_fnc_spawn;
}else
{
	[[[format["Your objective is to find %1, they were shot down by the VC earlier today. Their survival is in your hands, coordinate with your teammates and find our downed Airmen!",name pilot]], {hint (_this select 0);}], "BIS_fnc_spawn", true, false, false] call BIS_fnc_MP;
	//hint format["Your objective is to find %1, they were shot down by the VC earlier today. Their survival is in your hands, coordinate with your teammates and find our downed Airmen!",name pilot];
};