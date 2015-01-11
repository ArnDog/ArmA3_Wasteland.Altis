_building = _this select 0;
_duration = _this select 1;
_doorsAmount = _this select 2;

[_building,_duration,_doorsAmount] spawn {

	_building = _this select 0;
	_duration = _this select 1;
	_doorsAmount = _this select 2;

	sleep _duration;

	for "_i" from 1 to _doorsAmount do {
		//Close all Doors
    [_building, format ['Door_%1A_move',_i], format ['Door_%1B_move',_i]] execVM "\A3\Structures_F\scripts\TwoWingSlideDoor_close.sqf";
		[_building, format ['Door_%1_rot',_i], format ['Door_Handle_%1_rot_1',_i] , format ['Door_Handle_%1_rot_2',_i]] execVM "\A3\Structures_F\scripts\Door_close.sqf";
		//Lock all Doors
		_building setVariable [format ["bis_disabled_Door_%1",_i],1,true];
	};
};
