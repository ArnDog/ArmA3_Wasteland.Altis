// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: oLoad.sqf
//	@file Author: micovery
//	@file Description: object loading

if (!isServer) exitWith {};
diag_log "oLoad.sqf loading ...";

#include "macro.h"

call compile preProcessFileLineNumbers "persistence\lib\hash.sqf";
call compile preProcessFileLineNumbers "persistence\world\oFunctions.sqf";


init(_oScope, "Objects" call PDB_objectFileName);

[_oScope] call o_loadObjects;
[_oScope] call o_loadInfo;
[_oScope] spawn o_saveLoop;


diag_log "oLoad.sqf loading complete";
