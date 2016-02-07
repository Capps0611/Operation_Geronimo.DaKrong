if(!isDedicated)then 
{
	waitUntil{ isDedicated};
};
//EOS SYSTEM
[]execVM "eos\OpenMe.sqf";
[[[format["Mission Start in %1 Minutes",paramsArray select 3]], {hint (_this select 0);}], "BIS_fnc_spawn", true, false, false] call BIS_fnc_MP;
//hint "Mission Start in Two Minutes";
sleep ((paramsArray select 3) * 60);
// Randomly selcts player & Moves them
[]spawn RC_fnc_spawnZone;
