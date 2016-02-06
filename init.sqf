if(!isDedicated)then 
{
	waitUntil{ isDedicated};
};
//EOS SYSTEM
[]execVM "eos\OpenMe.sqf";

// Randomly selcts player & Moves them
[]spawn RC_fnc_spawnZone;
