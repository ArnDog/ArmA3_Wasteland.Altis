// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: functions.sqf
//	@file Author: AgentRev

_baseSavingOn = ["A3W_baseSaving"] call isConfigOn;
_boxSavingOn = ["A3W_boxSaving"] call isConfigOn;
_staticWeaponSavingOn = ["A3W_staticWeaponSaving"] call isConfigOn;
_warchestSavingOn = ["A3W_warchestSaving"] call isConfigOn;
_warchestMoneySavingOn = ["A3W_warchestMoneySaving"] call isConfigOn;
_beaconSavingOn = ["A3W_spawnBeaconSaving"] call isConfigOn;
_mineSavingOn  = ["A3W_mineSaving"] call isConfigOn;

_isBox = { _this isKindOf "ReammoBox_F" };
_isStaticWeapon = { _this isKindOf "StaticWeapon" };
_isWarchest = { _this getVariable ["a3w_warchest", false] && {(_this getVariable ["side", sideUnknown]) in [WEST,EAST]} };
_isBeacon = { _this getVariable ["a3w_spawnBeacon", false] };
_isMine  = {
	_class = nil;

    if (typeName _this == typeName objNull) then {
        _class = typeOf _this;
    }else{
        _class = _this;
    };
    
    if (isNil "_class") exitWith {false};
    if (_class in minesList) then {
        (true)
    }else{
        (false)
    };
};

_hasInventory =
{
	private ["_vehClass", "_vehCfg"];
	_vehClass = if (typeName _this == "OBJECT") then { typeOf _this } else { _this };
	_vehCfg = configFile >> "CfgVehicles" >> _vehClass;

	(isClass _vehCfg &&
	{getNumber (_vehCfg >> "transportMaxWeapons") > 0 ||
	 getNumber (_vehCfg >> "transportMaxMagazines") > 0 ||
	 getNumber (_vehCfg >> "transportMaxBackpacks") > 0})
};

_mineAmmo2Vehicle = {

    _class = _this;
    
    _class = (([_class, "_"] call BIS_fnc_splitString) select 0);

    //hopefully after splitting, and taking the first part, we have the actual vehicle class name
    (_class)
};

_fileName = "Objects" call PDB_objectFileName;
_fileName2 = "Vehicles" call PDB_objectFileName;
