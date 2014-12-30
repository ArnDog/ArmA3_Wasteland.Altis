// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright � 2014 	BadVolt 	*
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: password_enter.sqf
//	@file Author: BadVolt
//	@file Description: Entering password and open the doors for duration. Then closes them.

#define DURATION 10

_building = cursorTarget;
_doorsAmount = [_building] call fn_getDoorsAmount;
OutputText = nil;

createDialog "AF_Keypad";

waitUntil {!(isNil "OutputText")};

if (OutputText == _building getVariable ["password",""]) then {
	for "_i" from 1 to _doorsAmount do {
		//Unlock Doors
		[_building, format ['Door_%1_rot',_i], format ['Door_Handle_%1_rot_1',_i] , format ['Door_Handle_%1_rot_2',_i]] execVM "\A3\Structures_F\scripts\Door_open.sqf";
		_building setVariable [format ["bis_disabled_Door_%1",_i],0,true];

	};	
	//Call closing doors after some time
	[[_building,DURATION,_doorsAmount], "A3W_fnc_closeBuildingDoors", false, false, true] call BIS_fnc_MP;
	[format ["Doors opened for %1 seconds ",DURATION], 5] call mf_notify_client;	
}else{
	["Wrong password!", 5] call mf_notify_client;	
};

OutputText = nil;