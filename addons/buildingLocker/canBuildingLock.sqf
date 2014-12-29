// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 	BadVolt 	*
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: canLock.sqf
//	@file Author: BadVolt
//	@file Description: Checks if target can be locked.
#include "allowedBuildings.sqf"

_target = _this select 0;
_class = typeOf _target;

_result = false;
switch (true) do {
	case (([_target] call fn_getDoorsAmount)<1): {};
	case (player distance _target > (sizeOf typeOf _target / 2) max 15): {};
	case (!(_target isKindOf 'Building')): {}; 	//Not building
	case (!(_class in _allowedList)): {}; 		//Not in allowed list
	case ((_target getVariable ["ownerUID",""]) != (getPlayerUID player)) : {}; //Not owned by player
	case (!([_target] call fn_allDoorsLocked)): { _result = true }; //Not all doors are locked
};

(_result);