// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 	BadVolt 	*
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: password_change.sqf
//	@file Author: BadVolt
//	@file Description: Changes password for building and locks all doors.

_building = cursorTarget;
_doorsAmount = [_building] call fn_getDoorsAmount;
OutputText = nil;

createDialog "AF_Keypad";

waitUntil {!(isNil "OutputText")};

_building setVariable ["password",OutputText,true];

if (OutputText=="")then {
	for "_i" from 1 to _doorsAmount do {
		_building setVariable [format ["bis_disabled_Door_%1",_i],0,true];
	};	
	["Password lock disabled.", 5] call mf_notify_client;	
}else{
	for "_i" from 1 to _doorsAmount do {
		//Close & Lock Doors
    [_building, format ['Door_%1A_move',_i], format ['Door_%1B_move',_i]] execVM "\A3\Structures_F\scripts\TwoWingSlideDoor_close.sqf";
		[_building, format ['Door_%1_rot',_i], format ['Door_Handle_%1_rot_1',_i] , format ['Door_Handle_%1_rot_2',_i]] execVM "\A3\Structures_F\scripts\Door_close.sqf";
		_building setVariable [format ["bis_disabled_Door_%1",_i],1,true];
	};	
};

OutputText = nil;