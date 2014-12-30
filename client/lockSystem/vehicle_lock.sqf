//@file Version: 1.2
//@file Name: vehiclesave.sqf
//@file Author: MercyfulFate edited by Gigatek && BadVolt
//@file Created: 06/09/2014
//@file Description: Lock vehicle
private ["_vehicle","_nearvehicle"];
_nearvehicle = nearestObjects [player, ["LandVehicle", "Ship", "Air"], 5];
_vehicle = _nearvehicle select 0;

if (isNil "_vehicle") exitWith {};

if (!isDedicated) then 
	{
	[[netId _vehicle, 2], "A3W_fnc_setLockState", _vehicle] call A3W_fnc_MP; // Lock
	_vehicle setVariable ["R3F_LOG_disabled",true,true];
	_vehicle setVariable ["R3F_Side", playerSide, true];
	_vehicle setVariable ["vehicleLocked", 2, true];
	_vehicle setVariable ["ownerUID", getPlayerUID player, true];
	
	player action ["engineOff", _vehicle];
	player action ["lightOff", _vehicle];
		
	_vehicle say3D "carlock";
	_vehicle engineOn false;
	sleep 0.5;
	
	["Vehicle locked!", 5] call mf_notify_client;
};