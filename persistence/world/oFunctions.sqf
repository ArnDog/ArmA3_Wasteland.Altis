//  @file Version: 0.1
//  @file Name: oFunctions.sqf
//  @file Author: micovery
//  @file Description: Object loading

diag_log "oFunctions.sqf loading ...";


call compile preProcessFileLineNumbers "persistence\lib\shFunctions.sqf";

#include "macro.h";



o_hasInventory = {
  ARGVX2(0,_arg);
  
  def(_class);
  if (isOBJECT(_arg)) then {
    _class = typeOf _arg;
  };
  
  if (isSTRING(_arg)) then {
    _class = _obj;
  };
  
  if (!isSTRING(_class) || {_class == ""}) exitWith {false};
  
  def(_config);
  _config = (configFile >> "CfgVehicles" >> _class);

  (isClass _config && {
   getNumber (_config >> "transportMaxWeapons") > 0 ||
   getNumber (_config >> "transportMaxMagazines") > 0 ||
   getNumber (_config >> "transportMaxBackpacks") > 0})
};
         
o_isSaveable = {
  //diag_log format["%1 call o_isSaveable", _this];
  ARGVX4(0,_obj,objNull,false);

  init(_class, typeOf _obj);

  if (!(alive _obj)) exitWith {false};
  if ([_obj] call sh_isSaveableVehicle) exitWith {false}; //already being saved as a vehicle, don't save it
  if ([_obj] call o_isInSaveList) exitWith {true}; //not sure what this "saveList" thing is ...


  if ([_obj] call sh_isBeacon) exitWith {
    (cfg_spawnBeaconSaving_on)
  };
  
  if ([_obj] call sh_isWarchest) exitWith {
    (cfg_warchestSaving_on)
  };
  
  if ([_obj] call sh_isStaticWeapon) exitWith {
    (cfg_staticWeaponSaving_on)
  };

  if (([_obj] call sh_isMine)&&([_obj] call sh_isSaveableMine)) exitWith {
    (cfg_MineSaving_on)
  };

  if ([_obj] call sh_isCamera) exitWith {
    (cfg_cctvCameraSaving_on)
  };


  def(_locked);
  _locked = _obj getVariable ["objectLocked", false];

  if ([_obj] call sh_isBox) exitWith {
    (cfg_boxSaving_on && {_locked})
  };

  (cfg_boxSaving_on && {_locked})
};

o_isLockableObject = {
  ARGVX4(0,_obj,objNull, false);

  not(([_obj] call sh_isWarchest) || {[_obj] call sh_isBeacon})
};



o_getMaxLifeTime = {
  ARGV3(0,_class,"");

  if (isNil "_class") exitWith {A3W_objectLifeTime};
  if ([_class] call sh_isMine) exitWith {A3W_mineLifeTime};

  A3W_objectLifeTime
};

o_restoreDirection = {
  ARGVX3(0,_obj,objNull);
  ARGVX3(1,_vectors,[]);

  if ([_obj] call sh_isMine) exitWith {
    //special handling for mines, because setVectorUpAndDir has local effects only ... on mines
    [[_obj,_vectors], "A3W_fnc_setVectorUpAndDir",true, true] call BIS_fnc_MP;
  };

  _obj setVectorDirAndUp _vectors;
};


o_restoreHoursAlive_withVars = {
  ARGVX3(0,_obj,objNull);
  ARGVX2(1,_hours_alive,0);

  _obj setVariable ["baseSaving_spawningTime", diag_tickTime];
  if (!isNil "_hours_alive") then {
    _obj setVariable ["baseSaving_hoursAlive", _hours_alive];
  };
};

o_restoreHoursAlive_withGlobals = {
  ARGVX3(0,_obj,objNull);
  ARGVX2(1,_hours_alive,0);

  def(_netId);
  _netId = netId _obj;
  //diag_log format["_netId = %1", _netId];

  missionNamespace setVariable [format["%1_spawningTime",_netId], diag_tickTime];
  if (!isNil "_hours_alive") then {
    missionNamespace setVariable [format["%1_hoursAlive",_netId], _hours_alive];
  };
};

o_restoreHoursAlive = {
  ARGVX3(0,_obj,objNull);
  ARGVX3(1,_hours_alive,0);

  if ([_obj] call sh_isMine) exitWith {
    [_obj, OR(_hours_alive,nil)] call o_restoreHoursAlive_withGlobals;
  };

  [_obj, OR(_hours_alive,nil)] call o_restoreHoursAlive_withVars;

};

o_restoreObject = {_this spawn {
  //diag_log format["%1 call o_restoreObject", _this];
  ARGVX3(0,_data_pair,[]);
  
  _this = _data_pair;
  ARGVX3(0,_object_key,"");
  ARGVX2(1,_object_hash);
  
  if (!isCODE(_object_hash)) exitWith {};
  
  def(_object_data);
  _object_data =  call _object_hash;
  //diag_log _object_data;
  
  def(_hours_alive);
  def(_pos);
  def(_class);
  def(_dir);
  def(_damage);
  def(_allowDamage);
  def(_texture);
  def(_variables);
  def(_cargo_weapons);
  def(_cargo_magazines);
  def(_cargo_backpacks);
  def(_cargo_items);
  def(_cargo_ammo);
  def(_cargo_fuel);
  def(_cargo_repair);
  def(_turret0);
  def(_turret1);
  def(_turret2);

  def(_key);
  def(_value);
  
  {
    _key = _x select 0;
    _value = _x select 1;
    switch (_key) do {
      case "Class": { _class = OR(_value,nil);};
      case "Position": { _pos = OR(_value,nil);};
      case "Direction": { _dir = OR(_value,nil);};
      case "Damage": { _damage = OR(_value,nil);};
      case "AllowDamage": { _allowDamage = OR(_value,nil);};
      case "Texture": { _texture = OR(_value,nil);};
      case "Weapons": { _cargo_weapons = OR(_value,nil);};
      case "Items": { _cargo_items = OR(_value,nil);};
      case "Magazines": { _cargo_magazines = OR(_value,nil);};
      case "Backpacks": { _cargo_backpacks = OR(_value,nil);};
      case "AmmoCargo": { _cargo_ammo = OR(_value,nil);};
      case "FuelCargo": { _cargo_fuel = OR(_value,nil);};
      case "RepairCargo": { _cargo_repair = OR(_value,nil);};
      case "HoursAlive": { _hours_alive = OR(_value,nil);};
      case "Variables": { _variables = OR(_value,nil);};
      case "TurretMagazines": { _turret0 = OR_ARRAY(_value,nil);};
      case "TurretMagazines2": { _turret1 = OR_ARRAY(_value,nil);};
      case "TurretMagazines3": { _turret2 = OR_ARRAY(_value,nil);};
    };
  } forEach _object_data;

  //if there is no class and position, there is no point to recreating the object
  if (not(isSTRING(_class)) || {not(isARRAY(_pos))}) exitWith {
    diag_log format["No class or position available for object: %1", _object_key];
  };


  //AgentRev changed how position is saved, put this fail-safe to handle position with values as strings
  { if (isSTRING(_x)) then { _pos set [_forEachIndex, parseNumber _x] } } forEach _pos;
  
  diag_log format["%1(%2) is being restored.", _object_key, _class];

  def(_max_life_time);
  _max_life_time = [_class] call o_getMaxLifeTime;

  if (isSCALAR(_hours_alive) && {_max_life_time > 0 && {_hours_alive > _max_life_time}}) exitWith {
    diag_log format["object %1(%2) has been alive for %3 (max=%4), skipping it", _object_key, _class, _hours_alive, _max_life_time];
  };
  
  def(_obj);
  if ([_class] call sh_isMine) then {
    _obj = createMine[_class, _pos, [], 0];
  }
  else {
    _obj = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
    _obj allowDamage false; //set damage to false immediately to avoid taking fall damage
  };

  if (!isOBJECT(_obj)) exitWith {
    diag_log format["object %1(%2) could not be created.", _object_key, _class];
  };
  
  _obj setVariable ["object_key", _object_key, true];

  [_obj, _variables] call sh_restoreVariables;

  //for backwards compatibility, if the object does not have the "objectLocked" variable, then lock it
  def(_objectLocked);
  _objectLocked = _obj getVariable "objectLocked";
  if (!isBOOLEAN(_objectLocked) && {[_obj] call o_isLockableObject}) then {
    _obj setVariable ["objectLocked", true, true];
  };
  
  //Mine is revealed for all players in a side. Should do sth with independent side when it's possible.
  def(_mineVisibility);
  _mineVisibility = _obj getVariable "mineVisibility";
  if (isARRAY(_mineVisibility)) then {
    {
      _side = _x call sh_strToSide;
      _side revealMine _obj;
  
    } forEach _mineVisibility;
  };


  if (not([_obj] call o_isSaveable)) exitWith {
    diag_log format["%1(%2) has been deleted, it is not saveable", _object_key, _class];
    deleteVehicle _obj;
  };

  _obj setPosWorld ATLtoASL _pos;
  [_obj, OR(_dir,nil)] call o_restoreDirection;
  [_obj, OR(_hours_alive,nil)] call o_restoreHoursAlive;


  if (isSCALAR(_damage)) then {
    _obj setDamage _damage;
  };
  
  _allowDamage = if(isSCALAR(_allowDamage) && {_allowDamage <= 0}) then { false } else { true };
  [_obj, _allowDamage] spawn {
    ARGVX3(0,_obj,objNull);
    ARGVX3(1,_allowDamage,false);
    //delay the allow damage to allow the box to settle
    sleep 5;
  _obj setVariable ["allowDamage", _allowDamage];
  _obj allowDamage _allowDamage;
  };

  //broadcast the spawn beacon
  if ([_obj] call sh_isBeacon) then {
    pvar_spawn_beacons pushBack _obj;
    publicVariable "pvar_spawn_beacons";
  };

  cctv_cameras = OR(cctv_cameras,[]);
  if ([_obj] call sh_isCamera) then {
    cctv_cameras pushBack _obj;
    publicVariable "cctv_cameras";
  };
  
  //restore the stuff inside the object  
  clearWeaponCargoGlobal _obj;
  clearMagazineCargoGlobal _obj;
  clearItemCargoGlobal _obj;
  clearBackpackCargoGlobal _obj;
  _obj setVehicleAmmo 0;
          
  if (isARRAY(_cargo_weapons)) then {
    { _obj addWeaponCargoGlobal _x } forEach _cargo_weapons;
  };
  
  if (isARRAY(_cargo_backpacks)) then {
    { 
      if (isARRAY(_x) && {not((_x select 0) isKindOf "Weapon_Bag_Base")}) then {
        _obj addBackpackCargoGlobal _x 
      };
    } forEach _cargo_backpacks;
  };
  
  if (isARRAY(_cargo_items)) then {
    { _obj addItemCargoGlobal _x } forEach _cargo_items;
  };
  
  if (isARRAY(_cargo_magazines)) then {
    { _obj addMagazineCargoGlobal _x } forEach _cargo_magazines;
  };
  
  [_obj, OR(_turret0,nil), OR(_turret1,nil), OR(_turret2,nil)] call sh_restoreVehicleTurrets;

  if (isSCALAR(_cargo_ammo)) then {
    _obj setAmmoCargo _cargo_ammo;
  };
  
  if (isSCALAR(_cargo_fuel)) then {
    _obj setFuelCargo _cargo_fuel;
  };
  
  if (isSCALAR(_cargo_repair)) then {
    _obj setRepairCargo _cargo_repair;
  };

  //AddAi to vehicle
  if ([_obj] call sh_isUAV) then {
    createVehicleCrew _obj;
  };

  if (not([_obj] call sh_isMine)) exitWith { //don't put mines in the tracked objects list (we use allMines)
    //objects, warchests, and beacons
    tracked_objects_list pushBack _obj;
  };


};};



//pre-define a list of objects that can be saved
o_saveList = [];
{if (true) then {

  if (not(cfg_baseSaving_on)) exitWith {};
  def(_obj);
  _obj = _x select 1;
  
  if (!isOBJECT(_obj)) exitWith {};
  if (_obj isKindOf "ReammoBox_F") exitWith {};
  if ((o_saveList find _obj) >= 0) exitWith {};
  
  o_saveList pushBack _obj;
};} forEach [objectList, call genObjectsArray];


o_isInSaveList = {
  ARGVX4(0,_obj,objNull,false);
  ((o_saveList find _obj) >= 0)
};

o_fillVariables = {
  ARGVX3(0,_obj,objNull);
  ARGVX3(1,_variables,[]);
  
  if (_obj isKindOf "Land_Sacks_goods_F") then {
    _variables pushBack ["food", _obj getVariable ["food", 20]];
  };
  
  if (_obj isKindOf "Land_BarrelWater_F") then {
    _variables pushBack ["water", _obj getVariable ["water", 20]];
  };
  
  def(_ownerUID);
  _ownerUID = _obj getVariable "ownerUID";
  if (isSTRING(_ownerUID)) then {
    _variables pushBack ["ownerUID", _ownerUID];
  };

  def(_ownerN);
  _ownerN = _obj getVariable "ownerN";
  if (isSTRING(_ownerN)) then {
    _variables pushBack ["ownerN", _ownerN];
  };
  
  if ([_obj] call sh_isBox) then {
    _variables pushBack ["cmoney", _obj getVariable ["cmoney", 0]];
  };
  
  if ([_obj] call sh_isWarchest) then {
    _variables pushBack ["a3w_warchest", true];
    _variables pushBack ["R3F_LOG_disabled", true];
    _variables pushBack ["side", str (_obj getVariable ["side", sideUnknown])];
  };
  
  if ([_obj] call sh_isBeacon) then {
    _variables pushBack ["a3w_spawnBeacon", true];
    _variables pushBack ["R3F_LOG_disabled", true];
    _variables pushBack ["side", str(_obj getVariable ["side", sideUnknown])];
    _variables pushBack ["packing", false];
    _variables pushBack ["groupOnly", _obj getVariable ["groupOnly", false]];
    _variables pushBack ["ownerName", _obj getVariable ["ownerName", "[Beacon]"]];
  };

  if ([_obj] call sh_isCamera) then {
    _variables pushBack ["a3w_cctv_camera", (_obj getVariable ["a3w_cctv_camera", nil])];
    _variables pushBack ["camera_name", (_obj getVariable ["camera_name", nil])];
    _variables pushBack ["camera_owner_type", (_obj getVariable ["camera_owner_type", nil])];
    _variables pushBack ["camera_owner_value", (_obj getVariable ["camera_owner_value", nil])];
    _variables pushBack ["mf_item_id", (_obj getVariable ["mf_item_id", nil])];
  };

  if ([_obj] call sh_isMine) then {
    init(_mineVisibility,[]);
    {
      if (_obj mineDetectedBy _x) then {
        _mineVisibility pushBack str(_x);
      }
    } forEach [EAST,WEST,INDEPENDENT];
    
    _variables pushBack ["mineVisibility", _mineVisibility];
  };

  def(_r3fSide);
  _r3fSide = _obj getVariable "R3F_Side";
  if (!isNil "_r3fSide" && {typeName _r3fSide == typeName sideUnknown}) then {
    _variables pushBack ["R3F_Side", str _r3fSide];
  };
  
  def(_password);
  if (_obj isKindOf "Building") then {
	_password = _obj getVariable ["password",""];
	if (!(isNil "_password")) then {
		_variables pushBack ["password", _password];
	};
  };

  _variables pushBack ["objectLocked", _obj getVariable "objectLocked"];
};

o_getVehClass = {
  ARGVX3(0,_obj,objNull);

  def(_class);
  _class = typeOf _obj;

  if ([_class] call sh_isMine) exitWith {
    ([_class] call sh_mineAmmo2Vehicle)
  };

  _class
};

o_getHoursAlive_withVars = {
  ARGVX4(0,_obj,objNull,0);

  def(_spawnTime);
  def(_hoursAlive);
  _spawnTime = _obj getVariable "baseSaving_spawningTime";
  _hoursAlive = _obj getVariable "baseSaving_hoursAlive";

  if (!isSCALAR(_spawnTime)) then {
    _spawnTime = diag_tickTime;
    _obj setVariable ["baseSaving_spawningTime", _spawnTime, true];
  };

  if (!isSCALAR(_hoursAlive)) then {
    _hoursAlive = 0;
    _obj setVariable ["baseSaving_hoursAlive", _hoursAlive, true];
  };

  def(_totalHours);
  _totalHours = _hoursAlive + (diag_tickTime - _spawnTime) / 3600;

  //diag_log format["_obj = %1, _totalHours = %2, _spawnTime = %3, _hoursAlive = %4",_obj, _totalHours, _spawnTime, _hoursAlive];

  (_totalHours)
};

o_getHoursAlive_withGlobals = {
  ARGVX4(0,_obj,objNull,0);

  def(_spawnTime);
  def(_hoursAlive);
  def(_netId);

  _netId = netId _obj;
  //diag_log format["_netId = %1", _netId];

  _spawnTime = missionNamespace getVariable format["%1_spawningTime", _netId];
  _hoursAlive = missionNamespace getVariable format["%1_hoursAlive", _netId];

  if (!isSCALAR(_spawnTime)) then {
    _spawnTime = diag_tickTime;
    missionNamespace setVariable [format["%1_spawningTime", _netId], _spawnTime];
  };

  if (!isSCALAR(_hoursAlive)) then {
    _hoursAlive = 0;
    missionNamespace setVariable [format["%1_hoursAlive", _netId], _hoursAlive];
  };

  def(_totalHours);
  _totalHours = _hoursAlive + (diag_tickTime - _spawnTime) / 3600;

  //diag_log format["_obj = %1, _totalHours = %2, _spawnTime = %3, _hoursAlive = %4",_obj, _totalHours, _spawnTime, _hoursAlive];

  (_totalHours)
};

o_getHoursAlive = {
  ARGVX4(0,_obj,objNull,0);

  if ([_obj] call sh_isMine) exitWith {
   ([_obj] call o_getHoursAlive_withGlobals)
  };

  ([_obj] call o_getHoursAlive_withVars)
};

o_addSaveObject = {
  ARGVX3(0,_list,[]);
  ARGVX3(1,_obj,objNull);
  

  if (not([_obj] call o_isSaveable)) exitWith {};

  //diag_log format["will save %1", _obj];
  def(_class);
  def(_netId);
  def(_pos);
  def(_dir);
  def(_damage);
  def(_allowDamage);
  def(_totalHours);

  _class = [_obj] call o_getVehClass;
   _netId = netId _obj;
  _pos = ASLtoATL getPosWorld _obj;
  _dir = [vectorDir _obj, vectorUp _obj];
  _damage = damage _obj;
  _allowDamage = if (_obj getVariable ["allowDamage", false]) then { 1 } else { 0 };
  _totalHours = [_obj] call o_getHoursAlive;

  init(_variables,[]);
  [_obj,_variables] call o_fillVariables;
 
 
  init(_weapons,[]);
  init(_magazines,[]);
  init(_items,[]);
  init(_backpacks,[]);
  
  if ([_obj] call o_hasInventory) then {
    // Save weapons & ammo
    _weapons = (getWeaponCargo _obj) call cargoToPairs;
    _magazines = (getMagazineCargo _obj) call cargoToPairs;
    _items = (getItemCargo _obj) call cargoToPairs;
    _backpacks = (getBackpackCargo _obj) call cargoToPairs;
  };

  def(_all_turrets);
  _all_turrets = [nil,nil,nil];
  if ((cfg_staticWeaponSaving_on) && {[_obj] call sh_isStaticWeapon}) then {
    _all_turrets = [_obj] call sh_getVehicleTurrets;
  };
  init(_turret0,_all_turrets select 0);
  init(_turret1,_all_turrets select 1);
  init(_turret2,_all_turrets select 2);


  init(_ammoCargo,getAmmoCargo _obj);
  init(_fuelCargo,getFuelCargo _obj);
  init(_repairCargo,getRepairCargo _obj);
  
  
  def(_objName);
  _objName = _obj getVariable "object_key";

  if (!isSTRING(_objName) || {_objName == ""}) then {
    _objName = format["obj_%1_%2",ceil(time), ceil(random 10000)];
    _obj setVariable ["object_key", _objName, true];
  };

  _list pushBack [_objName, ([
    ["Class", _class],
    ["Position", _pos],
    ["Direction", _dir],
    ["HoursAlive", _totalHours],
    ["Damage", _damage],
    ["AllowDamage", _allowDamage],
    ["Variables", _variables],
    ["Texture", _texture],
    ["Weapons", _weapons],
    ["Magazines", _magazines],
    ["Items", _items],
    ["Backpacks", _backpacks],
    ["TurretMagazines", OR(_turret0,nil)],
    ["TurretMagazines2", OR(_turret1,nil)],
    ["TurretMagazines3", OR(_turret2,nil)],
    ["AmmoCargo", _ammoCargo],
    ["FuelCargo", _fuelCargo],
    ["RepairCargo", _repairCargo]
  ] call sock_hash)];

  true
};


o_saveInfo = {
  ARGVX3(0,_scope,"");
  
  init(_fundsWest,0);
  init(_fundsEast,0);
  
  init(_request,[_scope]);
  
  if (cfg_warchestMoneySaving_on) then {
    _fundsWest = ["pvar_warchest_funds_west", 0] call getPublicVar;
    _fundsEast = ["pvar_warchest_funds_east", 0] call getPublicVar;
  };
  
  init(_objName, "Info");
  _request pushBack [ _objName + "." + "WarchestMoneyBLUFOR", _fundsWest];
  _request pushBack [ _objName + "." + "WarchestMoneyOPFOR", _fundsEast];
  
  _request call stats_set;  
};  


o_saveAllObjects = {
  ARGVX3(0,_scope,"");
  init(_count,0);
  init(_request,[_scope]);

  if (count(tracked_objects_list) == 0) exitWith {};

  [_scope] call stats_wipe;
  init(_bulk_size,100);
  init(_start_time, diag_tickTime);
  init(_last_save, diag_tickTime);

  private["_all_objects"];
  _all_objects = tracked_objects_list + allMines;

  {
    if (!isNil{[_request, _x] call o_addSaveObject}) then {
      _count = _count + 1;
    };
    
    //save objects in bulks
    if ((_count % _bulk_size) == 0 && {count(_request) > 1}) then {
      init(_save_start, diag_tickTime);
      _request call stats_set;
      init(_save_end, diag_tickTime);
      _request = [_scope];
      diag_log format["o_saveLoop: %1 objects saved in %2 ticks, save call took %3 ticks", (_bulk_size), (diag_tickTime - _start_time), (_save_end - _save_start)];
      _last_save = _save_end;
    };
  } forEach (_all_objects);
  
  if (count(_request) > 1) then {
    init(_save_start, diag_tickTime);
    _request call stats_set;
    init(_save_end, diag_tickTime);
    diag_log format["o_saveLoop: %1 objects saved in %2 ticks, save call took %3 ticks", (count(_request) -1), (_save_end - _last_save), (_save_end - _save_start)];
  };

  diag_log format["o_saveLoop: total of %1 objects saved in %2 ticks", (_count), (diag_tickTime - _start_time)];

  call o_trackedObjectsListCleanup;
};

o_trackedObjectsListCleanup = {
  //post cleanup the array
  init(_cleanup_start, diag_tickTime);
  init(_nulls,[]);
  init(_index,-1);
  init(_start_size,count(tracked_objects_list));
  while {true} do {
    _index = tracked_objects_list find objNull;
    if (_index < 0) exitWith {};
    tracked_objects_list deleteAt _index;
  };
  init(_end_size,count(tracked_objects_list));
  init(_cleanup_end, diag_tickTime);
  diag_log format["o_saveLoop: count(tracked_objects_list) = %1, %2 nulls deleted in %3 ticks", count(tracked_objects_list), (_start_size - _end_size), (_cleanup_end - _cleanup_start)];
};


tracked_objects_list = [];

o_getTrackedObjectIndex = {
  ARGVX4(0,_obj,objNull,-1);
  if (isNull _obj) exitWith {-1};

  (tracked_objects_list find _obj)
};

//event handlers for object tracking, and untracking
"trackObject" addPublicVariableEventHandler {
  private["_index","_object"];
  _object = _this select 1;
  _index = [OR(_object,nil)] call o_getTrackedObjectIndex;
  if (_index >= 0) exitWith {};

  //diag_log format["%1 is being added to the tracked list", _object];
  tracked_objects_list pushBack _object;
};


"untrackObject" addPublicVariableEventHandler {
  private["_index","_object"];
  _object = _this select 1;
  _index = [OR(_object,nil)] call o_getTrackedObjectIndex;
  if (_index < 0) exitWith {};

  //diag_log format["%1 is being removed from the tracked list", _object];
  tracked_objects_list deleteAt _index;
};

o_saveLoop = {
  ARGVX3(0,_scope,"");
  while {true} do {
    sleep A3W_object_saveInterval;
    if (not(isBOOLEAN(o_saveLoopActive) && {!o_saveLoopActive})) then {
      diag_log format["saving all objects"];
      [_scope] call o_saveAllObjects;
      [_scope] call o_saveInfo;
    };
  };
};

o_loadInfoPair = {
  ARGVX3(0,_name,"");
  ARGV2(1,_value);

  if (cfg_warchestMoneySaving_on && _name == "WarchestMoneyBLUFOR" && {isSCALAR(_value)}) exitWith {
    pvar_warchest_funds_west = _value;
    publicVariable "pvar_warchest_funds_west";
  };
  
  if (cfg_warchestMoneySaving_on && _name == "WarchestMoneyOPFOR" && {isSCALAR(_value)}) exitWith {
    pvar_warchest_funds_east = _value;
    publicVariable "pvar_warchest_funds_east";
  };
};

o_loadInfo = {
  ARGVX3(0,_scope,"");
  
  def(_info);
  _info = [_scope, "Info"] call stats_get;
  
  def(_info_pairs);
  _info_pairs = [OR(_info,nil)] call stats_hash_pairs;
  
  diag_log "_info_pairs";
  diag_log _info_pairs;
  
  def(_name);
  def(_value);
  {
    _name = _x select 0;
    _value = _x select 1;
    [_name,OR(_value,nil)] call o_loadInfoPair;
 
  } forEach _info_pairs;
};

o_loadObjects = {
  ARGVX3(0,_scope,"");
  
  def(_objects);
  _objects = [_scope] call stats_get;
  
  //nothing to load
  if (!isARRAY(_objects)) exitWith {};

  diag_log format["A3Wasteland - will restore %1 objects", count(_objects)];
  { 
    [_x] call o_restoreObject;
  } forEach _objects;
};

diag_log "oFunctions.sqf loading complete";