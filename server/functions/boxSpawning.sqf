// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: boxSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (!isServer) exitWith {};

private ["_counter","_pos","_markerName","_marker","_hint","_safePos","_boxes", "_boxList", "_boxClass", "_box", "_boxItems", "_magName"];

_counter = 0;

_boxList =
[
	"Box_NATO_Wps_F",
	"Box_NATO_WpsSpecial_F",
	"Box_East_Wps_F",
	"Box_East_WpsSpecial_F",
	"Box_IND_Wps_F",
	"Box_IND_WpsSpecial_F"
];

{
	if (random 1 < 0.50) then // 50% chance of box spawning at each town
	{
		_pos = getMarkerPos (_x select 0);
		_boxClass = _boxList call BIS_fnc_selectRandom;
		_safePos = [_pos, 10, (_x select 1) / 2, 1, 0, 60 * (pi / 180), 0] call findSafePos; // spawns somewhere within half the town radius
		_box = createVehicle [_boxClass, _safePos, [], 0, "NONE"];
		_box allowDamage false;

		// Clear prexisting cargo first
		clearMagazineCargoGlobal _box;
		clearWeaponCargoGlobal _box;
		clearItemCargoGlobal _box;

		switch (true) do
		{
			// Basic Weapons box contents
			case (["_Wps_F", _boxClass] call fn_findString != -1):
			{
				switch (true) do
				{
					case (_box isKindOf "Box_NATO_Wps_F"):
					{
						_boxItems =
						[
							["wep", "LMG_mas_Mk48_F_t", 5, 4],
							["wep", "arifle_mas_fal_m203", 2, 4],
							["wep", "arifle_mas_hk417c_e", 1, 5] // Vermin
						]
					};
					case (_box isKindOf "Box_East_Wps_F"):
					{
						_boxItems =
						[
							["wep", "hgun_mas_acp_F", 5, 4],
							["wep", "arifle_mas_bizon_sd", 2, 4],
							["wep", "mas_launch_M136_F", 1, 5] // Sting
						]
					};
					case (_box isKindOf "Box_IND_Wps_F"):
					{
						_boxItems =
						[
							["wep", "srifle_mas_hk417_d_h", 5, 4],
							["wep", "LMG_mas_M249_F_v_sd", 2, 4],
							["wep", "arifle_mas_ak_74m_sf_h", 1, 5]
						]
					};
					default { _boxItems = [] };
				};

				[_box, _boxItems] call processItems;

				// Extra loadout
				_boxItems =
				[
					["wep", "arifle_mas_aks74u_c_a", 1, 5],
					["mag", "LMG_mas_rpk_F_a", 5]
				];

				[_box, _boxItems] call processItems;
			};

			// Special Weapons box contents
			case (["_WpsSpecial_F", _boxClass] call fn_findString != -1):
			{
				// Specific loadouts
				switch (true) do
				{
					case (_box isKindOf "Box_NATO_WpsSpecial_F"):
					{
						_boxItems =
						[
							["wep", "LMG_mas_m72_F", 1, 8],
							["wep", "arifle_mas_ak_74m_sf_gl_a", 1, 8]
						];
					};
					case (_box isKindOf "Box_East_WpsSpecial_F"):
					{
						_boxItems =
						[
							["wep", "srifle_mas_m107_v", 1, 8],
							["wep", "srifle_mas_sr25_d_h", 1, 8]
						];
					};
					case (_box isKindOf "Box_IND_WpsSpecial_F"):
					{
						_boxItems =
						[
							["wep", "arifle_mas_m16_gl_e", 1, 8],
							["wep", "arifle_mas_mk17_sd", 1, 8]
						];
					};
					default { _boxItems = [] };
				};

				[_box, _boxItems] call processItems;

				// Extra loadout
				_boxItems =
				[
					["wep", "arifle_mas_m4_gl_d_t", 1, 4], // SDAR + 4 underwater mags
					["mag", "arifle_mas_m70_gl", 4] // 4 normal mags
				];

				[_box, _boxItems] call processItems;
			};
		};

		_counter = _counter + 1;
	};
} forEach (call cityList);

diag_log format ["WASTELAND SERVER - %1 Ammo Caches Spawned",_counter];
