// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright � 2014 	BadVolt 	*
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: BadVolt
//	@file Description: The main init.

/*********************************
***************TODO***************

*********************************/

//Moved to playerActions
//player addAction ["<img image='client\icons\r3f_lock.paa'/> Lock Building","addons\buildingLocker\building_lock.sqf",[],0,false,false,"","((cursorTarget getVariable ['ownerUID','']) == (getPlayerUID player)) && {[cursorTarget] call canBuildingLock}"];
//player addAction ["<img image='client\icons\r3f_unlock.paa'/> Unlock Building","addons\buildingLocker\building_unlock.sqf",[],0,false,false,"","((cursorTarget getVariable ['ownerUID','']) == (getPlayerUID player)) && {[cursorTarget] call canBuildingUnlock}"];

_path="addons\buildingLocker";
fn_getDoorsAmount = [_path, "fn_getDoorsAmount.sqf"] call mf_compile;
fn_allDoorsLocked = [_path, "fn_allDoorsLocked.sqf"] call mf_compile;