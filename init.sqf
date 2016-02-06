if(!isDedicated)then 
{
	waitUntil{ isDedicated};
};
//EOS SYSTEM
[]execVM "eos\OpenMe.sqf";
[[["Mission Start in Two Minutes"], {hint (_this select 0);}], "BIS_fnc_spawn", true, false, false] call BIS_fnc_MP;
//hint "Mission Start in Two Minutes";
sleep 120;
// Randomly selcts player & Moves them
[]spawn RC_fnc_spawnZone;
