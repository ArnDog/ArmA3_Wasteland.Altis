// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse, [GoT] JoSchaap, MercyfulFate, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (!isServer) exitWith {};

diag_log "WASTELAND SERVER - Initializing Server Vars";

#include "setupServerPVars.sqf"

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"C_Quadbike_01_F",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_SUV_01_F",
	"C_Offroad_01_F",
	"I_G_Offroad_01_F",
	"C_Van_01_box_F",
	"C_Van_01_transport_F",
	
	// HILUX ARMED PICK-UP (FIA):	
	"B_mas_cars_Hilux_MG",
	"B_mas_cars_Hilux_AGS30",
	"B_mas_cars_Hilux_SPG9",
	"B_mas_cars_Hilux_RKTS",
	"B_mas_cars_Hilux_Unarmed",
	"B_mas_cars_Hilux_Med",
	"B_mas_cars_Hilux_M2"
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	// LAND ROVERS (IND/BLU):
	"B_mas_cars_LR_Unarmed",
	"B_mas_cars_LR_Med",
	"B_mas_cars_LR_M2",
	"B_mas_cars_LR_Mk19",
	"B_mas_cars_LR_TOW",
	"B_mas_cars_LR_SPG9",
	"I_mas_cars_LR_soft_Unarmed",
	"I_mas_cars_LR_soft_Med",
	"I_mas_cars_LR_soft_M2",
	"I_mas_cars_LR_soft_Mk19",
	"I_mas_cars_LR_soft_TOW",
	"I_mas_cars_LR_soft_SPG9",
	
	// HMMVW (BLU):
	"B_mas_HMMWV_M2",
	"B_mas_HMMWV_M134",
	"B_mas_HMMWV_SOV",
	"B_mas_HMMWV_SOV_M134",
	"B_mas_HMMWV_TOW",
	"B_mas_HMMWV_MK19",
	"B_mas_HMMWV_UNA",
	"B_mas_HMMWV_MEV",
	"B_mas_HMMWV_M2_des",
	"B_mas_HMMWV_M134_des",
	"B_mas_HMMWV_SOV_des",
	"B_mas_HMMWV_SOV_M134_des",
	"B_mas_HMMWV_TOW_des",
	"B_mas_HMMWV_MK19_des",
	"B_mas_HMMWV_UNA_des",
	"B_mas_HMMWV_MEV_des"
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
	"I_Truck_02_Fuel_F",
	"O_Truck_02_Fuel_F",
	"I_Truck_02_medical_F",
	"O_Truck_02_medical_F",
	"B_MRAP_01_F",
	"O_MRAP_02_F",
	"I_MRAP_03_F",
	
	// BMP1/BMP2 (IND/OPF):
	"I_mas_BMP1_AAF_01",
	"I_mas_BMP1P_AAF_01",
	"I_mas_BMP2_AAF_01",
	"I_mas_BMP2_HQ_AAF_01",
	"I_mas_BMP2_Ambul_01",
	"O_mas_BMP1_OPF_01",
	"O_mas_BMP1P_OPF_01",
	"O_mas_BMP2_OPF_01",
	"O_mas_BMP2_HQ_OPF_01",
	"O_mas_BMP2_Ambul_01",


	// BRDM2/BTR60 (IND/OPF):
	"I_mas_BRDM2",
	"I_mas_BTR60",
	"O_mas_BRDM2",
	"O_mas_BTR60",


	// UAZ (IND/OPF):
	"I_mas_cars_UAZ_MG",
	"I_mas_cars_UAZ_AGS30",
	"I_mas_cars_UAZ_SPG9",
	"I_mas_cars_UAZ_Unarmed",
	"I_mas_cars_UAZ_Med",
	"I_mas_cars_UAZ_M2",
	"O_mas_cars_UAZ_MG",
	"O_mas_cars_UAZ_AGS30",
	"O_mas_cars_UAZ_SPG9",
	"O_mas_cars_UAZ_Unarmed",
	"O_mas_cars_UAZ_Med",
	
	// TANKs (IND/OPF):
	"I_mas_T72_AAF_01",
	"I_mas_T72B_Early_AAF_01",
	"I_mas_T72B_AAF_01",
	"I_mas_T72BM_AAF_01",
	"I_mas_T55_AAF_01",
	"I_mas_T34_AAF_01",
	"I_mas_ZSU_AAF_01",
	"O_mas_T72_OPF_01",
	"O_mas_T72B_Early_OPF_01",
	"O_mas_T72B_OPF_01",
	"O_mas_T72BM_OPF_01",
	"O_mas_T55_OPF_01",
	"O_mas_ZSU_OPF_01"
];

//Water Vehicles - Random Spawns
waterVehicles =
[
	"B_Lifeboat",
	"O_Lifeboat",
	"C_Rubberboat",
	"B_SDV_01_F",
	"O_SDV_01_F",
	"I_SDV_01_F",
	"B_Boat_Transport_01_F",
	"O_Boat_Transport_01_F",
	"I_Boat_Transport_01_F",
	"I_G_Boat_Transport_01_F",
	"B_Boat_Armed_01_minigun_F",
	"O_Boat_Armed_01_hmg_F",
	"I_Boat_Armed_01_minigun_F",
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_police_F",
	"C_Boat_Civil_01_rescue_F"
];

//Object List - Random Spawns.
objectList =
[
	"B_supplyCrate_F",
	"B_supplyCrate_F",
	"CamoNet_INDP_open_F",
	"CamoNet_INDP_open_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Tower_F",
	"Land_BagBunker_Tower_F",
	"Land_BarGate_F",
	"Land_Canal_Wall_Stairs_F",
	"Land_Canal_WallSmall_10m_F",
	"Land_Canal_WallSmall_10m_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncShelter_F",
	"Land_CncWall4_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_HBarrier_5_F",
	"Land_HBarrier_5_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierTower_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall6_F",
	"Land_HBarrierWall6_F",
	"Land_MetalBarrel_F",
	"Land_Mil_ConcreteWall_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Pipes_large_F",
	"Land_RampConcrete_F",
	"Land_RampConcreteHigh_F",
	"Land_Sacks_goods_F",
	"Land_Shoot_House_Wall_F",
	"Land_BarrelWater_F"
];

//Object List - Random Spawns.
staticWeaponsList =
[
	"B_Mortar_01_F",
	"O_Mortar_01_F",
	"I_Mortar_01_F",
	"I_G_Mortar_01_F",
	
	// STATIC WEAPONS (IND/OPF/BLU): 
	"I_mas_ZU23_AAF",
	"I_mas_DSHKM_AAF",
	"I_mas_DSHkM_Mini_TriPod",
	"I_mas_KORD_AAF",
	"I_mas_KORD_high_AAF",
	"I_mas_AGS_AAF",
	"I_mas_GMG_AAF",
	"I_mas_M2StaticMG_AAF",
	"I_mas_M2StaticMG_MiniTripod_AAF",
	"I_mas_MK19_TriPod_AAF",
	"I_mas_Metis_AAF",
	"I_mas_SPG9_AAF",
	"I_mas_Igla_AA_pod_AAF",
	"I_mas_Stinger_AA_pod_AAF",
	"I_mas_TOW_TriPod_AAF",
	"I_mas_2b14_82mm_AAF",
	"I_mas_M252_AAF",
	"I_mas_D30_AAF",
	"I_mas_D30_AT_AAF",
	"I_mas_M119_AAF",
	"I_mas_M119_AT_AAF",
	"O_mas_ZU23_AAF",
	"O_mas_DSHKM_AAF",
	"O_mas_DSHkM_Mini_TriPod",
	"O_mas_KORD_AAF",
	"O_mas_KORD_high_AAF",
	"O_mas_AGS_AAF",
	"O_mas_Metis_AAF",
	"O_mas_SPG9_AAF",
	"O_mas_Igla_AA_pod_AAF",
	"O_mas_2b14_82mm_AAF",
	"O_mas_D30_AAF", 
	"O_mas_D30_AT_AAF",
	"B_mas_GMG_AAF",
	"B_mas_M2StaticMG_AAF",
	"B_mas_M2StaticMG_MiniTripod_AAF",
	"B_mas_MK19_TriPod_AAF",
	"B_mas_Stinger_AA_pod_AAF",
	"B_mas_TOW_TriPod_AAF",
	"B_mas_M252_AAF",
	"B_mas_M119_AAF",
	"B_mas_M119_AT_AAF",

	// STATIC WEAPONS (FIA): 
	"B_mas_ZU23_FIA",
	"B_mas_DSHKM_FIA",
	"B_mas_DSHkM_Mini_TriPod_FIA",
	"B_mas_AGS_FIA",
	"B_mas_M2StaticMG_FIA",
	"B_mas_M2StaticMG_MiniTripod_FIA",
	"B_mas_Metis_FIA", "B_mas_SPG9_FIA",
	"B_mas_Stinger_AA_pod_FIA",
	"B_mas_2b14_82mm_FIA",
	"B_mas_D30_FIA",
	"B_mas_D30_AT_FIA"
];

//Object List - Random Helis.
staticHeliList =
[
	"C_Heli_Light_01_civil_F",
	"B_Heli_Light_01_F",
	"O_Heli_Light_02_unarmed_F",
	"I_Heli_light_03_unarmed_F",
	// don't put cargo helicopters here, it doesn't make sense to find them in towns; they spawn in the CivHeli mission
	
	// CH47 (BLU):  
	"B_mas_CH_47F",

	// UH1Y (BLU):  
	"B_mas_UH1Y_F", 
	"B_mas_UH1Y_UNA_F", 
	"B_mas_UH1Y_MEV_F",

	// UH60M (BLU):  
	"B_mas_UH60M", 
	"B_mas_UH60M_SF", 
	"B_mas_UH60M_MEV",

	// Mi8 (IND/OPF):   
	"I_mas_MI8", 
	"I_mas_MI8MTV", 
	"O_mas_MI8", 
	"O_mas_MI8MTV",

	// Mi24 (IND/OPF):   
	"I_mas_MI24V", 
	"O_mas_MI24V"

];

//Object List - Random Planes.
staticPlaneList =
[
	"B_Plane_CAS_01_F",
	"O_Plane_CAS_02_F",
	"I_Plane_Fighter_03_CAS_F"
];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	"arifle_mas_hk416",
	"arifle_mas_hk417c",
	"arifle_mas_m4",
	"arifle_mas_l119",
	"arifle_mas_mk16",
	"arifle_mas_mk17",
	"arifle_mas_g3",
	"arifle_mas_fal",
	"srifle_mas_hk417",
	"srifle_mas_m24",
	"arifle_mas_mp5",
	"LMG_mas_Mk200_F",
	"LMG_mas_Mk48_F",
	"arifle_mas_ak_74m",
	"arifle_mas_ak_74m_sf",
	"arifle_mas_akms",
	"arifle_mas_m70",
	"srifle_mas_m91",
	"LMG_mas_m72_F",
	"srifle_mas_svd",
	"srifle_mas_ksvk",
	"arifle_mas_aks74u",
	"LMG_mas_rpk_F",
	"LMG_mas_pkm_F",
	"hgun_mas_uzi_F",
	"hgun_mas_sa61_F",
	"hgun_mas_m9_F",
	"hgun_mas_acp_F",
	"mas_launch_maaws_F",
	"mas_launch_RPG7_F",
	"mas_launch_Stinger_F",
	"mas_launch_Strela_F"
];

vehicleAddition =
[
	"muzzle_mas_snds_L",
	"muzzle_mas_snds_LM",
	"muzzle_mas_snds_C",
	"muzzle_mas_snds_M",
	"muzzle_mas_snds_Mc",
	"muzzle_mas_snds_AK",
	"muzzle_mas_snds_SM",
	"muzzle_mas_snds_SMc",
	"muzzle_mas_snds_SH", 
	"muzzle_mas_snds_SHc", 
	"muzzle_mas_snds_SV", 
	"muzzle_mas_snds_SVc",
	"muzzle_mas_snds_SVD",
	"muzzle_mas_snds_KSVK",
	"optic_mas_zeiss", 
	"optic_mas_zeiss_c",
	"optic_mas_zeiss_eo",
	"optic_mas_zeiss_eo_c",
	"optic_mas_acog",
	"optic_mas_acog_c",
	"optic_mas_acog_eo",
	"optic_mas_acog_eo_c",
	"optic_mas_acog_rd",
	"optic_mas_acog_rd_c",
	"optic_mas_handle",
	"optic_mas_aim",
	"optic_mas_aim_c",
	"optic_mas_pso",
	"optic_mas_pso_c",
	"optic_mas_pso_eo", 
	"optic_mas_pso_eo_c",
	"optic_mas_pso_nv",
	"optic_mas_pso_nv_c",
	"optic_mas_pso_nv_eo",
	"optic_mas_pso_nv_eo_c",
	"optic_mas_term",
	"acc_mas_pointer_IR",
	"optic_mas_DMS",
	"optic_mas_DMS_c",
	"optic_mas_Holosight_blk",
	"optic_mas_Holosight_camo",
	"optic_mas_Arco_blk",
	"optic_mas_Arco_camo",
	"optic_mas_Hamr_camo",
	"optic_mas_Aco_camo",
	"optic_mas_ACO_grn_camo",
	"optic_mas_MRCO_camo",
	"Medikit",
	"Medikit",
	"FirstAidKit",
	"ToolKit"
];

vehicleAddition2 =
[
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_yellow",
	"Chemlight_red"
];
