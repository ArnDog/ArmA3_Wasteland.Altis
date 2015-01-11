// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 	BadVolt 	*
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: functions.sqf
//	@file Author: BadVolt
//	@file Description: functions.sqf

//Bool
//Returns true if all doors are closed
_target = _this select 0;
_doorsAmount = [_target] call fn_getDoorsAmount;
_allClosed = true;

if (_doorsAmount == 0) exitWith { false };

//<0.5 - opened
//>=0.5- closed
for "_i" from 1 to _doorsAmount do {
	if ( ((_target animationPhase (format["Door_%1A_move",_i])) >= 0.5) || ((_target animationPhase (format["Door_%1B_move",_i])) >= 0.5) ) then {
		_allClosed = false;
	};
  if ((_target animationPhase (format["Door_%1_rot",_i])) >= 0.5) then {
		_allClosed = false;
	};
};

_allClosed;