//@file Version: 1.2
//@file Name: vehiclesave.sqf
//@file Author: MercyfulFate edited by Gigatek && BadVolt
//@file Created: 06/09/2014
//@file Description: Unlock vehicle
private ["_vehicle","_nearvehicle"];
_nearvehicle = nearestObjects [player, ["LandVehicle", "Ship", "Air"], 5];
_vehicle = _nearvehicle select 0;

if (isNil "_vehicle") exitWith {};

if (!isDedicated) then 
	{
	[[netId _vehicle, 0], "A3W_fnc_setLockState", _vehicle] call A3W_fnc_MP; // Unlock
	_vehicle setVariable ["R3F_LOG_disabled",false,true];
	_vehicle setVariable ["R3F_Side", nil, true];
	_vehicle setVariable ["vehicleLocked", 0, true];
	_vehicle setVariable ["ownerUID", nil, true];
	
	player action ["lightOn", _vehicle];
	sleep 1;
	player action ["lightOff", _vehicle];
	
	_vehicle say3D "carlock";
	sleep 0.5;
	
	["Vehicle unlocked!", 5] call mf_notify_client;
};