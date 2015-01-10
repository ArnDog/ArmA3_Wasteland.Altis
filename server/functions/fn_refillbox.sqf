// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) (START + floor random ((END - START) + 1))

private ["_box", "_boxType", "_boxItems", "_item", "_qty", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

_box allowDamage false; // No more fucking busted crates
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
//clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{
	case "mission_USLaunchers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["CUP_launch_Igla", "CUP_launch_Javelin", "CUP_launch_Metis"], RANDOM_BETWEEN(3,5), RANDOM_BETWEEN(1,2)],
			["wep", "CUP_launch_NLAW", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)],
			["mag", ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(3,8)]
		];
	};
	case "mission_USSpecial":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//["itm", "NVGoggles", 5],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(1,5)],
			["itm", "Medikit", RANDOM_BETWEEN(1,3)],
			["itm", "Toolkit", RANDOM_BETWEEN(0,1)],
			["itm", ["CUP_optic_AN_PVS_10", "CUP_optic_CompM2_Desert", "CUP_optic_Eotech533", "CUP_optic_SB_3_12x50_PMII"], RANDOM_BETWEEN(0,2)],
			["itm", ["CUP_muzzle_PBS4", "CUP_muzzle_snds_M14", "CUP_muzzle_snds_M16", "CUP_muzzle_snds_SCAR_L", "CUP_muzzle_snds_XM8"], RANDOM_BETWEEN(0,3)],
			["wep", ["CUP_hgun_TaurusTracker455", "CUP_hgun_Phantom_Flashlight", "CUP_hgun_MicroUzi_snds", "CUP_hgun_Colt1911"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
			["wep", ["CUP_arifle_Mk17_CQC_FG", "CUP_arifle_AK107_GL", "CUP_arifle_L85A2"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["CUP_lmg_Mk48_des", "CUP_lmg_Pecheneg"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["mag", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36", RANDOM_BETWEEN(4,8)],
			["mag", "CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249", RANDOM_BETWEEN(4,8)],
			["mag", "CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag", RANDOM_BETWEEN(4,8)],
			["mag", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", RANDOM_BETWEEN(1,5)]
		];
	};
	case "mission_Main_A3snipers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["CUP_srifle_AWM_wdl_SBPMII", "CUP_srifle_CZ550", "CUP_srifle_M107_ANPAS13c2", "CUP_srifle_SVD_NSPU"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["CUP_srifle_DMR", "CUP_srifle_ksvk"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(1,3)],
			["itm", "optic_DMS", RANDOM_BETWEEN(1,2)]
		];
	};
};

[_box, _boxItems] call processItems;
