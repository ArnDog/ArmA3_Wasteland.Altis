// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright � 2014 	BadVolt 	*
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: canEnterPassword.sqf
//	@file Author: BadVolt
//	@file Description: Checks if user can enter password.
#include "allowedBuildings.sqf"

_target = _this select 0;
_class = typeOf _target;

_result = false;
switch (true) do {
	case (([_target] call fn_getDoorsAmount)<1): {};
	case (player distance _target > (sizeOf typeOf _target / 2) max 15): {};
	case (!(_target isKindOf 'Building')): {}; 	//Not building
	case (!(_class in _allowedList)): {}; 		//Not in allowed list
	case (((_target getVariable ["password",""])!="") && ([_target] call fn_allDoorsLocked)): { _result = true }; // All doors are locked && Building has a password
};

(_result);