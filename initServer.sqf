// Apply daytime from multiplayer lobby setting
[paramsArray select 0] call BIS_fnc_paramDaytime;


// Initialize dynamic groups
["Initialize",[true]] call BIS_fnc_dynamicGroups;

// Randomly selcts player & Moves them
//[]spawn RC_fnc_spawnZone;

