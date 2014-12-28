// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 	BadVolt 	*
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: functions.sqf
//	@file Author: BadVolt
//	@file Description: functions.sqf

//Bool
//Returns true if all doors are locked
_target = _this select 0;
_doorsAmount = [_target] call fn_getDoorsAmount;
_allLocked = true;

if (_doorsAmount == 0) exitWith { false };

//0 - unlocked
//1 - locked
for "_i" from 1 to _doorsAmount do {
	if ((_target getVariable [format ["bis_disabled_Door_%1",_i],0]) == 0) then {
		_allLocked = false;
	};
};

_allLocked;