// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refilltruck.sqf
//	@file Author: AgentRev
//	@file Created: 30/06/2013 15:28

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) (START + floor random ((END - START) + 1))

private ["_truck", "_truckItems", "_item", "_qty", "_mag"];
_truck = _this;

// Clear prexisting cargo first
clearMagazineCargoGlobal _truck;
clearWeaponCargoGlobal _truck;
clearItemCargoGlobal _truck;

// Item type, Item, # of items, # of magazines per weapon
_truckItems =
[
	["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(0,2)],
	["itm", "FirstAidKit", RANDOM_BETWEEN(3,6)],
	["itm", "Medikit", RANDOM_BETWEEN(1,3)],
	["itm", "Toolkit", RANDOM_BETWEEN(0,1)],
	["itm", ["CUP_muzzle_snds_M110", "CUP_muzzle_PB6P9", "CUP_muzzle_snds_SCAR_H", "CUP_muzzle_snds_G36_desert", "CUP_muzzle_snds_AWM"], RANDOM_BETWEEN(0,3)],
	["itm", ["CUP_optic_TrijiconRx01_black", "CUP_optic_ZDDot", "CUP_optic_LeupoldMk4_10x40_LRT_Desert", "CUP_optic_RCO_desert", "CUP_optic_CompM2_Black"], RANDOM_BETWEEN(2,4)],
	["wep", ["CUP_smg_bizon_snds", "CUP_hgun_MicroUzi_snds"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)],
	["wep", ["CUP_arifle_Mk16_STD_EGLM_ACOG_Laser", "CUP_arifle_XM8_Carbine_GL", "CUP_arifle_CZ805_GL", "CUP_arifle_L85A2_GL"], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(4,5)],
	["mag", "1Rnd_HE_Grenade_shell", RANDOM_BETWEEN(5,10)],
	["wep", ["CUP_srifle_M107_Base", "CUP_arifle_Mk20_LeupoldMk4MRT"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,6)],
	["wep", ["CUP_launch_RPG7V", "CUP_launch_RPG18"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,2)],
	["mag", "HandGrenade", RANDOM_BETWEEN(0,5)],
	["mag", ["APERSTripMine_Wire_Mag", "APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag"], RANDOM_BETWEEN(2,6)]
];

[_truck, _truckItems] call processItems;
