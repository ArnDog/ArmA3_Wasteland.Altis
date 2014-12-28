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
getNumber(configfile >> "CfgVehicles" >> typeOf _target >> "numberOfDoors");