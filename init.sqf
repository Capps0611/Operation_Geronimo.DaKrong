if(!isDedicated)then 
{
	waitUntil{ isDedicated};
};
//EOS SYSTEM
[]execVM "eos\OpenMe.sqf";
hint "Mission Start in Two Minutes";
sleep 120;
// Randomly selcts player & Moves them
[]spawn RC_fnc_spawnZone;
