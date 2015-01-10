// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 	BadVolt 	*
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDoorsAmount.sqf
//	@file Author: BadVolt
//	@file Description: getDoorsAmount

//Int
//Returns amount of doors in building

_target = _this select 0;
_doors=getNumber(configfile >> "CfgVehicles" >> typeOf _target >> "numberOfDoors");

switch (typeOf _target) do {
  case {"Land_Dome_Big_F"}: {
    _doors = _doors + 2;
  };
};

(_doors);