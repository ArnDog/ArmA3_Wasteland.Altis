//Run infinite loop checking for locked doors being closed
/*

Другйо способ - проводить проверку раз в 30 минут по всем объектам и добавлять их в базу отслеживаемых объектов.
После этого проводить проверку для каждого объекта.

*/

if (!isServer) exitWith {};

#define CHECK_INTERVAL (30) // Interval to run the check

//WaitFor Server init
uiSleep 60;
while {true} do {
  uiSleep CHECK_INTERVAL;
  diag_log format ["DoorsChecker::: Checking for opened doors"];
  {
    _doorsAmount = [_x] call fn_getDoorsAmount;
    if ((_x getVariable ["password",""]!="") && {[_x] call fn_allDoorsLocked && {!([_x] call fn_allDoorsClosed)}}) then {
      for "_i" from 1 to _doorsAmount do {
        diag_log format ["DoorsChecker::: Found opened locked door: %1",typeOf _x];
        [_x, format ['Door_%1_rot',_i], format ['Door_Handle_%1_rot_1',_i] , format ['Door_Handle_%1_rot_2',_i]] execVM "\A3\Structures_F\scripts\Door_close.sqf";
      };
    };
  } forEach allMissionObjects "Building";
};