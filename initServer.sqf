// Apply daytime from multiplayer lobby setting
[paramsArray select 0] call BIS_fnc_paramDaytime;


// Initialize dynamic groups
["Initialize",[true]] call BIS_fnc_dynamicGroups;

// Remove onPlayerDisconnected orphaned groups
[]spawn RC_fnc_spawnZone;

