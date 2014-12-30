// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: init.sqf
//@file Author: micovery
//@file Argument: the path to the directory holding this file.

private ["_path"];
_path = _this;


MF_ITEMS_CCTV_CAMERA = "cctv_camera";
MF_ITEMS_CCTV_CAMERA_TYPE = "Land_HandyCam_F";
MF_ITEMS_CCTV_CAMERA_ICON = "addons\cctv\icons\camcorder.paa";
[MF_ITEMS_CCTV_CAMERA, "CCTV Camera",{_this call cctv_camera_use},MF_ITEMS_CCTV_CAMERA_TYPE, MF_ITEMS_CCTV_CAMERA_ICON, 5] call mf_inventory_create;

MF_ITEMS_CCTV_BASE = "cctv_base";
MF_ITEMS_CCTV_BASE_TYPE = "Land_Laptop_unfolded_F";
MF_ITEMS_CCTV_BASE_ICON = "addons\cctv\icons\laptop.paa";
[MF_ITEMS_CCTV_BASE, "CCTV Station", {_this call cctv_base_use}, MF_ITEMS_CCTV_BASE_TYPE, MF_ITEMS_CCTV_BASE_ICON, 1] call mf_inventory_create;