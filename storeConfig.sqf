// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright Â© 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: storeConfig.sqf
# @@Author: His_Shadow, AgentRev
# @@Create Date: 2013-09-16 20:40:58
#*********************************************************/

// This tracks which store owner the client is interacting with
currentOwnerName = "";

// Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost

pistolArray = compileFinal str
[
	//9MM
	["Beretta M9", "hgun_mas_m9_F", 250],
	["Browning HP", "hgun_mas_bhp_F", 250],
	["Glock17", "hgun_mas_glock_F", 250],
	
	//45ACP
	["M1911 ACP,", "hgun_mas_acp_F", 250],
	["USP", "hgun_mas_usp_F", 250],
	["Glock21SF", "hgun_mas_glocksf_F", 250],
	
	["MP-443 Grach", "hgun_mas_grach_F", 250],
	
	["MAKAROV", "hgun_mas_mak_F", 250]
	
];

smgArray = compileFinal str
[
	//SMGs
	["UZI", "hgun_mas_uzi_F", 100],
	
	["MP5", "arifle_mas_mp5", 100],
	["MP5 (WDL)", "arifle_mas_mp5_v", 100],
	["MP5 (DES)", "arifle_mas_mp5_d", 100],
	["MP5SD6", "arifle_mas_mp5SD", 100],
	
	["Bizon", "arifle_mas_bizon", 100],
	
	["SA-61 Skorpion", "hgun_mas_sa61_F", 100]	
];

rifleArray = compileFinal str
[
	// M4s/M16s
	["M4 (Black)", "arifle_mas_m4", 100],
	["M4 (Black,GL)", "arifle_mas_m4_gl", 100],
	["M4 (Black, M203)", "arifle_mas_m4_m203", 100],
	["M4 (WDL)", "arifle_mas_m4_v", 100],
	["M4 (WDL, AG36)", "arifle_mas_m4_gl_v", 100],
	["M4 (WDL, M203)", "arifle_mas_m4_m203_v", 100],
	["M4 (DES)", "arifle_mas_m4_d", 100],
	["M4 (DES, AG36)", "arifle_mas_m4_gl_d", 100],
	["M4 (DES, M203)", "arifle_mas_m4_m203_d", 100],
	["M4 (Comp)", "arifle_mas_m4c", 100],
	["M4 (WDL, Comp)", "arifle_mas_m4c_v", 100],
	["M4 (DES, Comp)", "arifle_mas_m4c_d", 100],
	["M4 (Comp, M203)", "arifle_mas_m4_m203c", 100],
	
	["M16", "arifle_mas_m16", 100],
	["M16 (M203)", "arifle_mas_m16_gl", 100],
	
	//HK416s
	["HK416 (Black)", "arifle_mas_hk416", 100],
	["HK416 (Black,GL)", "arifle_mas_hk416_gl", 100],
	["HK416 (Black, M203)", "arifle_mas_hk416_m203", 100],
	["HK416 (WDL)", "arifle_mas_hk416_v", 100],
	["HK416 (WDL, AG36)", "arifle_mas_hk416_gl_v", 100],
	["HK416 (WDL, M203)", "arifle_mas_hk416_m203_v", 100],
	["HK416 (DES)", "arifle_mas_hk416_d", 100],
	["HK416 (DES, AG36)", "arifle_mas_hk416_gl_d", 100],
	["HK416 (DES, M203)", "arifle_mas_hk416_m203_d", 100],
	["HK416 (Comp)", "arifle_mas_hk416c", 100],
	["HK416 (WDL, Comp)", "arifle_mas_hk416c_v", 100],
	["HK416 (DES, Comp)", "arifle_mas_hk416c_d", 100],
	["HK416 (Comp, M203)", "arifle_mas_hk416_m203c", 100],
	
	//L119A1s
	["L119A1 (Black)", "arifle_mas_l119", 100],
	["L119A1 (Black,GL)", "arifle_mas_l119_gl", 100],
	["L119A1 (Black, M203)", "arifle_mas_l119_m203", 100],
	["L119A1 (WDL)", "arifle_mas_l119_v", 100],
	["L119A1 (WDL, AG36)", "arifle_mas_l119_gl_v", 100],
	["L119A1 (WDL, M203)", "arifle_mas_l119_m203_v", 100],
	["L119A1 (DES)", "arifle_mas_l119_d", 100],
	["L119A1 (DES, AG36)", "arifle_mas_l119_gl_d", 100],
	["L119A1 (DES, M203)", "arifle_mas_l119_m203_d", 100],
	
	//HK417s
	["HK417 (Black)", "arifle_mas_hk417c", 100],
	["HK417 (Black, M203)", "arifle_mas_hk417_m203c", 100],
	["HK417 (WDL)", "arifle_mas_hk417c_v", 100],
	["HK417 (WDL, M203)", "arifle_mas_hk417_m203c_v", 100],
	["HK417 (DES)", "arifle_mas_hk417c_d", 100],
	["HK417 (DES, M203)", "arifle_mas_hk417_m203c_d", 100],
	
	//SCARs
	["SCAR-LS", "arifle_mas_mk16", 100],
	["SCAR-LS (EGLM)", "arifle_mas_mk16_gl", 100],
	["SCAR-L", "arifle_mas_mk16_l", 100],
	["SCAR-L (EGLM)", "arifle_mas_mk16_l_gl", 100],
	
	["SCAR-H", "arifle_mas_mk17", 100],
	["SCAR-H (EGLM)", "arifle_mas_mk17_gl", 100],
	
	//G3s
	["G3", "arifle_mas_g3", 100],
	["G3 (M203)", "arifle_mas_g3_m203", 100],
	["G3S", "arifle_mas_g3s", 100],
	["G3S (M203)", "arifle_mas_g3s_m203", 100],
	
	//FALs
	["FAL", "arifle_mas_fal", 100],
	["FAL (M203)", "arifle_mas_fal_m203", 100],
	
	//HK417s
	["HK417", "srifle_mas_hk417", 100],
	["HK417 (WDL)", "srifle_mas_hk417_v", 100],
	["HK417 (DES)", "srifle_mas_hk417_d", 100],
	
	["AK74M", "arifle_mas_ak_74m", 100],
	["AK74M GP30", "arifle_mas_ak_74m_gl", 100],
	["AK74M (Camo)", "arifle_mas_ak_74m_c", 100],
	["AK74M (Camo, GP30)", "arifle_mas_ak_74m_c_gl", 100],
	
	["AKS74,", "arifle_mas_aks74", 100],
	["AKS74 (GP30)", "arifle_mas_aks74_gl", 100],
	
	["AK74M SF", "arifle_mas_ak_74m_sf", 100],
	["AK74M SF GP30", "arifle_mas_ak_74m_sf_gl", 100],
	["AK74M SF (Camo)", "arifle_mas_ak_74m_sf_c", 100],
	["AK74M SF (Camo, GP30)", "arifle_mas_ak_74m_sf_c_gl", 100],
	
	["AKMS", "arifle_mas_akms", 100],
	["AKMS GP30", "arifle_mas_akms_gl", 100],
	["AKMS (Camo)", "arifle_mas_akms_c", 100],
	["AKMS (Camo, GP30)", "arifle_mas_akms_c_gl", 100],
	
	["AKM,", "arifle_mas_akm", 100],
	["AKM (GP30)", "arifle_mas_akm_gl", 100],
	
	["AKS74U", "arifle_mas_aks74u", 100],
	["AKS74U (Camo)", "arifle_mas_aks74u_c", 100],
	
	["ZASTAVA M70,", "arifle_mas_m70", 100],
	["ZASTAVA M70 (GP30)", "arifle_mas_m70_gl", 100],
	
	["ZASTAVA M70AB,", "arifle_mas_m70ab", 100],
	["ZASTAVA M70AB (GP30)", "arifle_mas_m70ab_gl", 100]	
];

lmgArray = compileFinal str
[
	//LMGs
	["Mk200", "LMG_mas_Mk200_F", 100],
	
	["M249", "LMG_mas_M249_F", 100],
	["M249 (WDL)", "LMG_mas_M249_F_v", 100],
	["M249 (DES)", "LMG_mas_M249_F_d", 100],
	["M249A", "LMG_mas_M249a_F", 100],
	
	["M240", "LMG_mas_M240_F", 100],
	
	["MG", "LMG_mas_mg3_F", 100],
	
	["Mk48", "LMG_mas_Mk48_F", 100],
	["Mk48 (WDL)", "LMG_mas_Mk48_F_v", 100],
	["Mk48 (DES)", "LMG_mas_Mk48_F_d", 100],
	
	["RPK", "LMG_mas_rpk_F", 100],
	
	["PKM", "LMG_mas_pkm_F", 100],
	
	["ZASTAVA M72", "LMG_mas_m72_F", 100]
];

shotgunArray = compileFinal str
[
	//Sniper Rifles
	["SR25", "srifle_mas_sr25", 100],
	["SR25 (WDL)", "srifle_mas_sr25_v", 100],
	["SR25 (DES)", "srifle_mas_sr25_d", 100],
	
	["M110", "srifle_mas_m110", 100],
	
	["EBR", "srifle_mas_ebr", 100],
	
	["M24", "srifle_mas_m24", 100],
	["M24 (WDL)", "srifle_mas_m24_v", 100],
	["M24 (DES)", "srifle_mas_m24_d", 100],
	
	["M107", "srifle_mas_m107", 100],
	["M107 (WDL)", "srifle_mas_m107_v", 100],
	["M107 (DES)", "srifle_mas_m107_d", 100],
	
	["SVD", "srifle_mas_svd", 100],
	
	["KSVK", "srifle_mas_ksvk", 100],
	["KSVK (Camo)", "srifle_mas_ksvk_c", 100],
	
	["ZASTAVA M91", "srifle_mas_m91", 100]
];

launcherArray = compileFinal str
[
	//Anti-Tank/Air
	["MAAWS", "mas_launch_maaws_F", 3000],
	["M136", "mas_launch_M136_F", 3000],
	["RPG7", "mas_launch_RPG7_F", 3000],
	["RPG18", "mas_launch_RPG18_F", 3000],
	
	["STINGER", "mas_launch_Stinger_F", 3000],
	["STRELA", "mas_launch_Strela_F", 3000]
];

allGunStoreFirearms = compileFinal str (call pistolArray + call smgArray + call rifleArray + call lmgArray + call shotgunArray + call launcherArray);

staticGunsArray = compileFinal str
[
	// ["Vehicle Ammo Crate", "Box_NATO_AmmoVeh_F", 2500],
	["Static Titan AT 4Rnd (NATO)", "B_static_AT_F", 2500], // Static launchers only have 4 ammo, hence the low price
	["Static Titan AT 4Rnd (CSAT)", "O_static_AT_F", 2500],
	["Static Titan AT 4Rnd (AAF)", "I_static_AT_F", 2500],
	["Static Titan AA 4Rnd (NATO)", "B_static_AA_F", 3000],
	["Static Titan AA 4Rnd (CSAT)", "O_static_AA_F", 3000],
	["Static Titan AA 4Rnd (AAF)", "I_static_AA_F", 3000],
	["Mk30 HMG .50 Low tripod (NATO)", "B_HMG_01_F", 2500],
	["Mk30 HMG .50 Low tripod (CSAT)", "O_HMG_01_F", 2500],
	["Mk30 HMG .50 Low tripod (AAF)", "I_HMG_01_F", 2500],
	["Mk30A HMG .50 Sentry (NATO)", "B_HMG_01_A_F", 5000], // "A" = Autonomous = Overpowered
	["Mk30A HMG .50 Sentry (CSAT)", "O_HMG_01_A_F", 5000],
	["Mk30A HMG .50 Sentry (AAF)", "I_HMG_01_A_F", 5000],
	["Mk30 HMG .50 High tripod (NATO)", "B_HMG_01_high_F", 3000],
	["Mk30 HMG .50 High tripod (CSAT)", "O_HMG_01_high_F", 3000],
	["Mk30 HMG .50 High tripod (AAF)", "I_HMG_01_high_F", 3000],
	["Mk32 GMG 20mm Low tripod (NATO)", "B_GMG_01_F", 5500],
	["Mk32 GMG 20mm Low tripod (CSAT)", "O_GMG_01_F", 5500],
	["Mk32 GMG 20mm Low tripod (AAF)", "I_GMG_01_F", 5500],
	["Mk32A GMG 20mm Sentry (NATO)", "B_GMG_01_A_F", 10000],
	["Mk32A GMG 20mm Sentry (CSAT)", "O_GMG_01_A_F", 10000],
	["Mk32A GMG 20mm Sentry (AAF)", "I_GMG_01_A_F", 10000],
	["Mk32 GMG 20mm High tripod (NATO)", "B_GMG_01_high_F", 6000],
	["Mk32 GMG 20mm High tripod (CSAT)", "O_GMG_01_high_F", 6000],
	["Mk32 GMG 20mm High tripod (AAF)", "I_GMG_01_high_F", 6000],
	["Mk6 Mortar (NATO)", "B_Mortar_01_F", 12500],
	["Mk6 Mortar (CSAT)", "O_Mortar_01_F", 12500],
	["Mk6 Mortar (AAF)", "I_Mortar_01_F", 12500]
];

throwputArray = compileFinal str
[
	["Mini Grenade", "MiniGrenade", 50],
	["Frag Grenade", "HandGrenade", 100],
	["APERS Tripwire Mine", "APERSTripMine_Wire_Mag", 200],
	["APERS Bounding Mine", "APERSBoundingMine_Range_Mag", 250],
	["APERS Mine", "APERSMine_Range_Mag", 300],
	["Claymore Charge", "ClaymoreDirectionalMine_Remote_Mag", 350],
	["M6 SLAM Mine", "SLAMDirectionalMine_Wire_Mag", 350],
	["AT Mine", "ATMine_Range_Mag", 400],
	["Explosive Charge", "DemoCharge_Remote_Mag", 450],
	["Explosive Satchel", "SatchelCharge_Remote_Mag", 500],
	["Smoke Grenade (White)", "SmokeShell", 50],
	["Smoke Grenade (Purple)", "SmokeShellPurple", 50],
	["Smoke Grenade (Blue)", "SmokeShellBlue", 50],
	["Smoke Grenade (Green)", "SmokeShellGreen", 50],
	["Smoke Grenade (Yellow)", "SmokeShellYellow", 50],
	["Smoke Grenade (Orange)", "SmokeShellOrange", 50],
	["Smoke Grenade (Red)", "SmokeShellRed", 50]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = compileFinal str
[
	//Ammo
	["PG7V Rocket", "mas_PG7V", 10],
	["OG7 Rocket", "mas_OG7", 10],
	["PG18 Rocket", "mas_PG18", 10],
	["M136 Rocket", "mas_M136", 10],
	["MAAWS Rocket", "mas_MAAWS", 10],
	["Stinger Rocket", "mas_Stinger", 10],
	["Strela Rocket", "mas_Strela", 10],
	["30Rnd 556x45 Stanag", "30Rnd_mas_556x45_Stanag", 10], 
	["30Rnd 556x45 T-Stanag", "30Rnd_mas_556x45_T_Stanag", 10],
	["200Rnd 556x45 Stanag", "200Rnd_mas_556x45_Stanag", 10],
	["200Rnd 556x45 T-Stanag", "200Rnd_mas_556x45_T_Stanag", 10],
	["100Rnd 762x51 Stanag", "100Rnd_mas_762x51_Stanag", 10],
	["100Rnd 762x51 T-Stanag", "100Rnd_mas_762x51_T_Stanag", 10],
	["100Rnd 762x54 mag", "100Rnd_mas_762x54_mag", 10],
	["100Rnd 762x54 T-mag", "100Rnd_mas_762x54_T_mag", 10],
	["100Rnd 762x39 mag", "100Rnd_mas_762x39_mag", 10],
	["100Rnd 762x39 T-mag", "100Rnd_mas_762x39_T_mag", 10],
	["30Rnd 545x39 mag", "30Rnd_mas_545x39_mag", 10],
	["30Rnd 545x39 T-mag", "30Rnd_mas_545x39_T_mag", 10],
	["100Rnd 545x39 mag", "100Rnd_mas_545x39_mag", 10],
	["100Rnd 545x39 T-mag", "100Rnd_mas_545x39_T_mag", 10],
	["20Rnd 762x51 Stanag", "20Rnd_mas_762x51_Stanag", 10],
	["20Rnd 762x51 T-Stanag", "20Rnd_mas_762x51_T_Stanag", 10],
	["5Rnd 762x51 Stanag", "5Rnd_mas_762x51_Stanag", 10],
	["5Rnd 762x51 T-Stanag", "5Rnd_mas_762x51_T_Stanag", 10],
	["30Rnd 762x39 mag", "30Rnd_mas_762x39_mag", 10],
	["30Rnd 762x39 T-mag", "30Rnd_mas_762x39_T_mag", 10],
	["10Rnd 762x54 mag", "10Rnd_mas_762x54_mag", 10],
	["10Rnd 762x54 T-mag", "10Rnd_mas_762x54_T_mag", 10],
	["5Rnd 127x99_Stanag", "5Rnd_mas_127x99_Stanag", 10],
	["5Rnd 127x99 T-Stanag", "5Rnd_mas_127x99_T_Stanag", 10],
	["5Rnd 127x108 mag", "5Rnd_mas_127x108_mag", 10],
	["5Rnd 127x108 T-mag", "5Rnd_mas_127x108_T_mag", 10],
	["30Rnd 9x21 Stanag", "30Rnd_mas_9x21_Stanag", 10],
	["30Rnd 9x21d Stanag", "30Rnd_mas_9x21d_Stanag", 10],
	["12Rnd 45acp Mag", "12Rnd_mas_45acp_Mag", 10],
	["10Rnd 45acp Mag", "10Rnd_mas_45acp_Mag", 10],
	["8Rnd_mas_45acp Mag", "8Rnd_mas_45acp_Mag", 10],
	["15Rnd_mas_9x21 Mag", "15Rnd_mas_9x21_Mag", 10],
	["17Rnd_mas_9x21 Mag", "17Rnd_mas_9x21_Mag", 10],
	["13Rnd_mas_9x21 Mag", "13Rnd_mas_9x21_Mag", 10],
	["8Rnd_mas_9x18 mag", "8Rnd_mas_9x18_mag", 10],
	["7Rnd_mas_12Gauge_Slug", "7Rnd_mas_12Gauge_Slug", 10],
	["7Rnd_mas_12Gauge_Pellets", "7Rnd_mas_12Gauge_Pellets", 10],
	["10Rnd_mas_12Gauge_Slug", "10Rnd_mas_12Gauge_Slug", 10],
	["10Rnd_mas_12Gauge_Pellets", "10Rnd_mas_12Gauge_Pellets", 10],
	["64Rnd 9x18 Mag", "64Rnd_mas_9x18_mag", 10]
];

//Gun Store item List
//Text name, classname, buy cost, item class
accessoriesArray = compileFinal str
[
	["Pistol Suppressor", "muzzle_mas_snds_L", 150, "item"],
	["Makarov Suppressor", "muzzle_mas_snds_LM", 150, "item"],
	["MP5 Suppressor", "muzzle_mas_snds_C", 150, "item"],
	["M4\HK416\M16 Suppressor", "muzzle_mas_snds_M", 150, "item"],
	["M4\HK416\M16 Suppressor (C)", "muzzle_mas_snds_Mc", 150, "item"],
	["AK Suppressor", "muzzle_mas_snds_AK", 150, "item"],
	["SR25\HK417\EBR Suppressor", "muzzle_mas_snds_SM", 150, "item"],
	["SR25\HK417\EBR Suppressor (C)", "muzzle_mas_snds_SMc", 150, "item"],
	["M24 Suppressor", "muzzle_mas_snds_SH", 150, "item"],
	["M24 Suppressor (C)", "muzzle_mas_snds_SHc", 150, "item"],
	["M107Suppressor", "muzzle_mas_snds_SV", 150, "item"],
	["M107 Suppressor(C)", "muzzle_mas_snds_SVc", 150, "item"],
	["SVD Suppressor", "muzzle_mas_snds_SVD", 150, "item"],
	["KSVK Suppressor", "muzzle_mas_snds_KSVK", 150, "item"],
 
	["Zeiss", "optic_mas_zeiss", 150, "item"],
	["Zeiss (C)", "optic_mas_zeiss_c", 150, "item"],
	["Zeiss (EO)", "optic_mas_zeiss_eo", 150, "item"],
	["Zeiss (EO, C)", "optic_mas_zeiss_eo_c", 150, "item"],
	["Acog", "optic_mas_acog", 150, "item"],
	["Acog (C)", "optic_mas_acog_c", 150, "item"],
	["Acog (EO)", "optic_mas_acog_eo", 150, "item"],
	["Acog (EO, C)", "optic_mas_acog_eo_c", 150, "item"],
	["Acog (RD)", "optic_mas_acog_rd", 150, "item"],
	["Acog (RD, C)", "optic_mas_acog_rd_c", 150, "item"],
	["Handle", "optic_mas_handle", 150, "item"],
	["AIM", "optic_mas_aim", 150, "item"],
	["AIM (C)", "optic_mas_aim_c", 150, "item"],
	["PSO", "optic_mas_pso", 150, "item"],
	["PSO (C)", "optic_mas_pso_c", 150, "item"],
	["PSO (EO)", "optic_mas_pso_eo", 150, "item"],
	["PSO (EO, C)", "optic_mas_pso_eo_c", 150, "item"],
	["PSO NV", "optic_mas_pso_nv", 150, "item"],
	["PSO NV (C)", "optic_mas_pso_nv_c", 150, "item"],
	["PSO NV (EO)", "optic_mas_pso_nv_eo", 150, "item"],
	["PSO NV (EO, C)", "optic_mas_pso_nv_eo_c", 150, "item"],
	["PSO TM", "optic_mas_term", 150, "item"],
	["DMS", "optic_mas_DMS", 150, "item"],
	["DMS (C)", "optic_mas_DMS_c", 150, "item"],
	["Holosight", "optic_mas_Holosight_blk", 150, "item"],
	["Holosight (C)", "optic_mas_Holosight_camo", 150, "item"],
	["Arco", "optic_mas_Arco_blk", 150, "item"],
	["Arco (C)", "optic_mas_Arco_camo", 150, "item"],
	["HAMR (C)", "optic_mas_Hamr_camo", 150, "item"],
	["ACO", "optic_mas_Aco_camo", 150, "item"],
	["ACO (C)", "optic_mas_ACO_grn_camo", 150, "item"],
	["MRCO (C)", "optic_mas_MRCO_camo", 150, "item"],
	["IR Pointer", "acc_mas_pointer_IR", "item"]
];

// If commented, means the color/camo isn't implemented or is a duplicate of another hat
headArray = compileFinal str
[
	["ECH", "H_HelmetB", 50, "hat"],
	["ECH (Ghillie)", "H_HelmetB_camo", 50, "hat"],
	["ECH (Light)", "H_HelmetB_light", 50, "hat"],
	["ECH (Spraypaint)", "H_HelmetB_paint", 50, "hat"],
	["SF Helmet", "H_HelmetSpecB", 50, "hat"],
	["SF Helmet (Black)", "H_HelmetSpecB_blk", 50, "hat"],
	["SF Helmet (Light Paint)", "H_HelmetSpecB_paint1", 50, "hat"],
	["SF Helmet (Dark Paint)", "H_HelmetSpecB_paint2", 50, "hat"],
	["Combat Helmet (Black)", "H_HelmetB_plain_blk", 50, "hat"],
	["Protector Helmet (Hex)", "H_HelmetO_ocamo", 50, "hat"],
	["Protector Helmet (Urban)", "H_HelmetO_oucamo", 50, "hat"],
	["Defender Helmet (Hex)", "H_HelmetLeaderO_ocamo", 50, "hat"],
	["Defender Helmet (Urban)", "H_HelmetLeaderO_oucamo", 50, "hat"],
	// ["Assassin Helmet (Hex)", "H_HelmetSpecO_ocamo", 50, "hat"],
	["Assassin Helmet (Black)", "H_HelmetSpecO_blk", 50, "hat"],
	["MICH", "H_HelmetIA", 50, "hat"],
	// ["MICH (Camo)", "H_HelmetIA_net", 50, "hat"],
	// ["MICH 2 (Camo)", "H_HelmetIA_camo", 50, "hat"],
	["Heli Crew Helmet (NATO)", "H_CrewHelmetHeli_B", 50, "hat"],
	["Heli Crew Helmet (CSAT)", "H_CrewHelmetHeli_O", 50, "hat"],
	["Heli Crew Helmet (AAF)", "H_CrewHelmetHeli_I", 50, "hat"],
	["Heli Pilot Helmet (NATO)", "H_PilotHelmetHeli_B", 50, "hat"],
	["Heli Pilot Helmet (CSAT)", "H_PilotHelmetHeli_O", 50, "hat"],
	["Heli Pilot Helmet (AAF)", "H_PilotHelmetHeli_I", 50, "hat"],
	["Crew Helmet (NATO)", "H_HelmetCrew_B", 50, "hat"],
	["Crew Helmet (CSAT)", "H_HelmetCrew_O", 50, "hat"],
	["Crew Helmet (AAF)", "H_HelmetCrew_I", 50, "hat"],
	["Pilot Helmet (NATO)", "H_PilotHelmetFighter_B", 50, "hat"],
	["Pilot Helmet (CSAT)", "H_PilotHelmetFighter_O", 50, "hat"],
	["Pilot Helmet (AAF)", "H_PilotHelmetFighter_I", 50, "hat"],
	["Military Cap (Blue)", "H_MilCap_blue", 25, "hat"],
	["Military Cap (Gray)", "H_MilCap_gry", 25, "hat"],
	["Military Cap (Urban)", "H_MilCap_oucamo", 25, "hat"],
	["Military Cap (Russia)", "H_MilCap_rucamo", 25, "hat"],
	["Military Cap (MTP)", "H_MilCap_mcamo", 25, "hat"],
	["Military Cap (Hex)", "H_MilCap_ocamo", 25, "hat"],
	["Military Cap (AAF)", "H_MilCap_dgtl", 25, "hat"],
	["Rangemaster Cap", "H_Cap_headphones", 25, "hat"],
	["Bandanna (Coyote)", "H_Bandanna_cbr", 10, "hat"],
	["Bandanna (Camo)", "H_Bandanna_camo", 10, "hat"],
	["Bandanna (Gray)", "H_Bandanna_gry", 10, "hat"],
	["Bandanna (Khaki)", "H_Bandanna_khk", 10, "hat"],
	["Bandanna (MTP)", "H_Bandanna_mcamo", 10, "hat"],
	["Bandanna (Sage)", "H_Bandanna_sgg", 10, "hat"],
	["Bandanna (Surfer)", "H_Bandanna_surfer", 10, "hat"],
	// ["Bandanna Mask (Black)", "H_BandMask_blk", 10, "hat"],
	// ["Bandanna Mask (Demon)", "H_BandMask_demon", 10, "hat"],
	// ["Bandanna Mask (Khaki)", "H_BandMask_khk", 10, "hat"],
	// ["Bandanna Mask (Reaper)", "H_BandMask_reaper", 10, "hat"],
	["Beanie (Black)", "H_Watchcap_blk", 10, "hat"],
	["Beanie (Dark blue)", "H_Watchcap_sgg", 10, "hat"],
	["Beanie (Dark brown)", "H_Watchcap_cbr", 10, "hat"],
	["Beanie (Dark khaki)", "H_Watchcap_khk", 10, "hat"],
	["Beanie (Dark green)", "H_Watchcap_camo", 10, "hat"],
	["Beret (Black)", "H_Beret_blk", 10, "hat"],
	["Beret (Colonel)", "H_Beret_Colonel", 10, "hat"],
	["Beret (NATO)", "H_Beret_02", 10, "hat"],
	// ["Beret (Green)", "H_Beret_grn", 10, "hat"],
	// ["Beret (Police)", "H_Beret_blk_POLICE", 10, "hat"],
	// ["Beret (Red)", "H_Beret_red", 10, "hat"],
	// ["Beret (SAS)", "H_Beret_brn_SF", 10, "hat"],
	// ["Beret (SF)", "H_Beret_grn_SF", 10, "hat"],
	// ["Beret (RED)", "H_Beret_ocamo", 10, "hat"],
	// ["Black Turban", "H_TurbanO_blk", 50, "hat"],
	// ["Booniehat (Dirty)", "H_Booniehat_dirty", 10, "hat"],
	// ["Booniehat (Green)", "H_Booniehat_grn", 10, "hat"],
	// ["Booniehat (Khaki)", "H_Booniehat_indp", 10, "hat"],
	["Booniehat (Khaki)", "H_Booniehat_khk", 10, "hat"],
	["Booniehat (Tan)", "H_Booniehat_tan", 10, "hat"],
	["Booniehat (MTP)", "H_Booniehat_mcamo", 10, "hat"],
	["Booniehat (Digi)", "H_Booniehat_dgtl", 10, "hat"],
	["Fedora (Blue)", "H_Hat_blue", 10, "hat"],
	["Fedora (Brown)", "H_Hat_brown", 10, "hat"],
	["Fedora (Camo)", "H_Hat_camo", 10, "hat"],
	["Fedora (Checker)", "H_Hat_checker", 10, "hat"],
	["Fedora (Gray)", "H_Hat_grey", 10, "hat"],
	["Fedora (Tan)", "H_Hat_tan", 10, "hat"],
	["Cap (Black)", "H_Cap_blk", 10, "hat"],
	["Cap (Blue)", "H_Cap_blu", 10, "hat"],
	["Cap (Green)", "H_Cap_grn", 10, "hat"],
	["Cap (Olive)", "H_Cap_oli", 10, "hat"],
	["Cap (Red)", "H_Cap_red", 10, "hat"],
	["Cap (Tan)", "H_Cap_tan", 10, "hat"],
	["Cap (BI)", "H_Cap_grn_BI", 10, "hat"],
	["Cap (CMMG)", "H_Cap_blk_CMMG", 10, "hat"],
	["Cap (ION)", "H_Cap_blk_ION", 10, "hat"],
	["Cap (Raven Security)", "H_Cap_blk_Raven", 10, "hat"],
	["Cap (SAS)", "H_Cap_khaki_specops_UK", 10, "hat"],
	["Cap (SF)", "H_Cap_tan_specops_US", 10, "hat"],
	["Cap (SPECOPS)", "H_Cap_brn_SPECOPS", 10, "hat"],
	["Shemag (White)", "H_ShemagOpen_khk", 25, "hat"],
	["Shemag (Brown)", "H_ShemagOpen_tan", 25, "hat"],
	["Shemag mask (Khaki)", "H_Shemag_khk", 25, "hat"],
	["Shemag mask (Olive)", "H_Shemag_olive", 25, "hat"],
	// ["Shemag mask (Tan)", "H_Shemag_tan", 25, "hat"],
	["Racing Helmet (Black)", "H_RacingHelmet_1_black_F", 25, "hat"],
	["Racing Helmet (Blue)", "H_RacingHelmet_1_blue_F", 25, "hat"],
	["Racing Helmet (Green)", "H_RacingHelmet_1_green_F", 25, "hat"],
	["Racing Helmet (Yellow)", "H_RacingHelmet_1_yellow_F", 25, "hat"],
	["Racing Helmet (Orange)", "H_RacingHelmet_1_orange_F", 25, "hat"],
	["Racing Helmet (Red)", "H_RacingHelmet_1_red_F", 25, "hat"],
	["Racing Helmet (White)", "H_RacingHelmet_1_white_F", 25, "hat"],
	["Racing Helmet (Fuel)", "H_RacingHelmet_1_F", 25, "hat"],
	["Racing Helmet (Bluking)", "H_RacingHelmet_2_F", 25, "hat"],
	["Racing Helmet (Redstone)", "H_RacingHelmet_3_F", 25, "hat"],
	["Racing Helmet (Vrana)", "H_RacingHelmet_4_F", 25, "hat"]
];

uniformArray = compileFinal str
[
	["Ghillie Suit (NATO)", "U_B_GhillieSuit", 300, "uni"],
	["Ghillie Suit (CSAT)", "U_O_GhillieSuit", 300, "uni"],
	["Ghillie Suit (AAF)", "U_I_GhillieSuit", 300, "uni"],
	["Wetsuit (NATO)", "U_B_Wetsuit", 200, "uni"],
	["Wetsuit (CSAT)", "U_O_Wetsuit", 200, "uni"],
	["Wetsuit (AAF)", "U_I_Wetsuit", 200, "uni"],
	["Default Uniform (NATO)", "U_B_CombatUniform_mcam", 50, "uni"],
	["Default Uniform (CSAT)", "U_O_CombatUniform_ocamo", 50, "uni"],
	["Default Uniform (AAF)", "U_I_CombatUniform", 50, "uni"],
	["Combat Fatigues (MTP) (Tee)", "U_B_CombatUniform_mcam_tshirt", 50, "uni"],
	["Recon Fatigues (MTP)", "U_B_CombatUniform_mcam_vest", 50, "uni"],
	["Recon Fatigues (Sage)", "U_B_SpecopsUniform_sgg", 50, "uni"],
	["CTRG Combat Uniform (UBACS)", "U_B_CTRG_1", 50, "uni"],
	["CTRG Combat Uniform (UBACS2)", "U_B_CTRG_2", 50, "uni"],
	["CTRG Combat Uniform (Tee)", "U_B_CTRG_3", 50, "uni"],
	["Recon Fatigues (Hex)", "U_O_SpecopsUniform_ocamo", 50, "uni"],
	["Fatigues (Urban)", "U_O_CombatUniform_oucamo", 50, "uni"],
	["Combat Fatigues Short (Digi)", "U_I_CombatUniform_shortsleeve", 50, "uni"],
	["Combat Fatigues Shirt (Digi)", "U_I_CombatUniform_tshirt", 50, "uni"],
	["Officer Fatigues (Hex)", "U_O_OfficerUniform_ocamo", 50, "uni"],
	["Officer Fatigues (Digi)", "U_I_OfficerUniform", 50, "uni"],
	["Pilot Coveralls (NATO)", "U_B_PilotCoveralls", 50, "uni"],
	["Pilot Coveralls (CSAT)", "U_O_PilotCoveralls", 50, "uni"],
	["Pilot Coveralls (AAF)", "U_I_pilotCoveralls", 50, "uni"],
	["Heli Pilot Coveralls (NATO)", "U_B_HeliPilotCoveralls", 50, "uni"],
	["Heli Pilot Coveralls (AAF)", "U_I_HeliPilotCoveralls", 50, "uni"],
	["Guerilla Smocks 1", "U_BG_Guerilla1_1", 25, "uni"], // BLUFOR
	["Guerilla Smocks 2", "U_BG_Guerilla2_1", 25, "uni"],
	["Guerilla Smocks 3", "U_BG_Guerilla2_2", 25, "uni"],
	["Guerilla Smocks 4", "U_BG_Guerilla2_3", 25, "uni"],
	["Guerilla Smocks 5", "U_BG_Guerilla3_1", 25, "uni"],
	["Guerilla Smocks 6", "U_BG_Guerilla3_2", 25, "uni"],
	["Guerilla Smocks 7", "U_BG_leader", 25, "uni"],
	["Guerilla Smocks 1", "U_OG_Guerilla1_1", 25, "uni"], // OPFOR
	["Guerilla Smocks 2", "U_OG_Guerilla2_1", 25, "uni"],
	["Guerilla Smocks 3", "U_OG_Guerilla2_2", 25, "uni"],
	["Guerilla Smocks 4", "U_OG_Guerilla2_3", 25, "uni"],
	["Guerilla Smocks 5", "U_OG_Guerilla3_1", 25, "uni"],
	["Guerilla Smocks 6", "U_OG_Guerilla3_2", 25, "uni"],
	["Guerilla Smocks 7", "U_OG_leader", 25, "uni"],
	["Guerilla Smocks 1", "U_IG_Guerilla1_1", 25, "uni"], // Independent
	["Guerilla Smocks 2", "U_IG_Guerilla2_1", 25, "uni"],
	["Guerilla Smocks 3", "U_IG_Guerilla2_2", 25, "uni"],
	["Guerilla Smocks 4", "U_IG_Guerilla2_3", 25, "uni"],
	["Guerilla Smocks 5", "U_IG_Guerilla3_1", 25, "uni"],
	["Guerilla Smocks 6", "U_IG_Guerilla3_2", 25, "uni"],
	["Guerilla Smocks 7", "U_IG_leader", 25, "uni"],
	/*["Worker Coveralls", "U_C_WorkerCoveralls", 25, "uni"], // can only be worn by civilian units
	["T-Shirt (Blue)", "U_C_Poor_1", 25, "uni"],
	["Polo (Red/white)", "U_C_Poloshirt_redwhite", 25, "uni"],
	["Polo (Salmon)", "U_C_Poloshirt_salmon", 25, "uni"],
	["Polo (Tri-color)", "U_C_Poloshirt_tricolour", 25, "uni"],
	["Polo (Navy)", "U_C_Poloshirt_blue", 25, "uni"],
	["Polo (Burgundy)", "U_C_Poloshirt_burgundy", 25, "uni"],
	["Polo (Blue/green)", "U_C_Poloshirt_stripped", 25, "uni"],*/
	["Polo (Competitor)", "U_Competitor", 25, "uni"],
	["Polo (Rangemaster)", "U_Rangemaster", 25, "uni"]/*,
	["Racing Suit (Black)", "U_C_Driver_1_black", 25, "uni"], // can only be worn by civilian units
	["Racing Suit (Blue)", "U_C_Driver_1_blue", 25, "uni"],
	["Racing Suit (Green)", "U_C_Driver_1_green", 25, "uni"],
	["Racing Suit (Yellow)", "U_C_Driver_1_yellow", 25, "uni"],
	["Racing Suit (Orange)", "U_C_Driver_1_orange", 25, "uni"],
	["Racing Suit (Red)", "U_C_Driver_1_red", 25, "uni"],
	["Racing Suit (White)", "U_C_Driver_1_white", 25, "uni"],
	["Racing Suit (Fuel)", "U_C_Driver_1", 25, "uni"],
	["Racing Suit (Bluking)", "U_C_Driver_2", 25, "uni"],
	["Racing Suit (Redstone)", "U_C_Driver_3", 25, "uni"],
	["Racing Suit (Vrana)", "U_C_Driver_4", 25, "uni"]*/
];

vestArray = compileFinal str
[
	["Rebreather (NATO)", "V_RebreatherB", 200, "vest"],
	["Rebreather (CSAT)", "V_RebreatherIR", 200, "vest"],
	["Rebreather (AAF)", "V_RebreatherIA", 200, "vest"],
	["Carrier Lite (Green)", "V_PlateCarrier1_rgr", -1, "vest"],
	["Carrier Lite (Black)", "V_PlateCarrier1_blk", -1, "vest"],
	["Carrier Rig (Green)", "V_PlateCarrier3_rgr", -1, "vest"],
	["Carrier GL Rig (Green)", "V_PlateCarrierGL_rgr", -1, "vest"],
	["GA Carrier Lite (Digi)", "V_PlateCarrierIA1_dgtl", -1, "vest"],
	["GA Carrier Rig (Digi)", "V_PlateCarrierIA2_dgtl", -1, "vest"],
	["GA Carrier GL Rig (Digi)", "V_PlateCarrierIAGL_dgtl", -1, "vest"],
	["LBV Harness", "V_HarnessO_brn", -1, "vest"],
	["LBV Harness (Gray)", "V_HarnessO_gry", -1, "vest"],
	["LBV Grenadier Harness", "V_HarnessOGL_brn", -1, "vest"],
	["LBV Grenadier Harness (Gray)", "V_HarnessOGL_gry", -1, "vest"],
	["ELBV Harness", "V_HarnessOSpec_brn", -1, "vest"],
	["ELBV Harness (Gray)", "V_HarnessOSpec_gry", -1, "vest"],
	["Slash Bandolier (Black)", "V_BandollierB_blk", -1, "vest"],
	["Slash Bandolier (Coyote)", "V_BandollierB_cbr", -1, "vest"],
	["Slash Bandolier (Green)", "V_BandollierB_rgr", -1, "vest"],
	["Slash Bandolier (Khaki)", "V_BandollierB_khk", -1, "vest"],
	["Slash Bandolier (Olive)", "V_BandollierB_oli", -1, "vest"],
	["Chest Rig (Khaki)", "V_Chestrig_khk", -1, "vest"],
	["Chest Rig (Green)", "V_Chestrig_rgr", -1, "vest"],
	["Fighter Chestrig (Black)", "V_Chestrig_blk", -1, "vest"],
	["Fighter Chestrig (Olive)", "V_Chestrig_oli", -1, "vest"],
	["Tactical Vest (Black)", "V_TacVest_blk", -1, "vest"],
	["Tactical Vest (Brown)", "V_TacVest_brn", -1, "vest"],
	["Tactical Vest (Camo)", "V_TacVest_camo", -1, "vest"],
	["Tactical Vest (Khaki)", "V_TacVest_khk", -1, "vest"],
	["Tactical Vest (Olive)", "V_TacVest_oli", -1, "vest"],
	["Raven Night Vest", "V_TacVestIR_blk", -1, "vest"]
];

backpackArray = compileFinal str
[
	//["Parachute", "B_Parachute", 200, "backpack"],

	["Assault Pack (Black)", "B_AssaultPack_blk", 150, "backpack"],
	["Assault Pack (Green)", "B_AssaultPack_rgr", 150, "backpack"],
	["Assault Pack (MTP)", "B_AssaultPack_mcamo", 150, "backpack"],
	["Assault Pack (Hex)", "B_AssaultPack_ocamo", 150, "backpack"],

	["Field Pack (Black)", "B_FieldPack_blk", 200, "backpack"],
	["Field Pack (Coyote)", "B_FieldPack_cbr", 200, "backpack"],
	["Field Pack (Khaki)", "B_FieldPack_khk", 200, "backpack"],
	["Field Pack (Urban)", "B_FieldPack_oucamo", 200, "backpack"],

	["Kitbag (Coyote)", "B_Kitbag_cbr", 350, "backpack"],
	["Kitbag (Green)", "B_Kitbag_rgr", 350, "backpack"],
	["Kitbag (MTP)", "B_Kitbag_mcamo", 350, "backpack"],
	["Kitbag (Sage)", "B_Kitbag_sgg", 350, "backpack"],

	["Bergen (Black)", "B_Bergen_blk", 350, "backpack"],
	["Bergen (Green)", "B_Bergen_rgr", 350, "backpack"],
	["Bergen (MTP)", "B_Bergen_mcamo", 350, "backpack"],
	["Bergen (Sage)", "B_Bergen_sgg", 350, "backpack"],

	["Carryall (Khaki)", "B_Carryall_khk", 500, "backpack"],
	["Carryall (MTP)", "B_Carryall_mcamo", 500, "backpack"],
	["Carryall (Olive)", "B_Carryall_oli", 500, "backpack"],
	["Carryall (Urban)", "B_Carryall_oucamo", 500, "backpack"]
];

genItemArray = compileFinal str
[
	["Quadrotor UAV (NATO)", "B_UAV_01_backpack_F", 500, "backpack"],
	["Quadrotor UAV (CSAT)", "O_UAV_01_backpack_F", 500, "backpack"],
	["Quadrotor UAV (AAF)", "I_UAV_01_backpack_F", 500, "backpack"],
	["UAV Terminal (NATO)", "B_UavTerminal", 150, "gps"],
	["UAV Terminal (CSAT)", "O_UavTerminal", 150, "gps"],
	["UAV Terminal (AAF)", "I_UavTerminal", 150, "gps"],
	["GPS", "ItemGPS", 100, "gps"],
	["First Aid Kit", "FirstAidKit", 25, "item"],
	["Medikit", "Medikit", 150, "item"],
	["Toolkit", "ToolKit", 150, "item"],
	["Mine Detector", "MineDetector", 100, "item"],
	["NV Goggles", "NVGoggles", 100, "nvg"],
	["Diving Goggles", "G_Diving", 100, "gogg"],
	["Binoculars", "Binocular", 50, "binoc"],
	["Rangefinder", "Rangefinder", 150, "binoc"],
	["Laser Designator", "Laserdesignator", 975, "binoc"],
	["Laser Batteries", "Laserbatteries", 25, "mag"],
	["Chemlight (Blue)", "Chemlight_blue", 25, "mag"],
	["Chemlight (Green)", "Chemlight_green", 25, "mag"],
	["Chemlight (Yellow)", "Chemlight_yellow", 25, "mag"],
	["Chemlight (Red)", "Chemlight_red", 25, "mag"]
];

allStoreMagazines = compileFinal str (call ammoArray + call throwputArray + call genItemArray);
allRegularStoreItems = compileFinal str (call allGunStoreFirearms + call allStoreMagazines + call accessoriesArray);
allStoreGear = compileFinal str (call headArray + call uniformArray + call vestArray + call backpackArray);

genObjectsArray = compileFinal str
[
	["Empty Ammo Crate", "Box_NATO_Ammo_F", 200, "ammocrate"],
	//["Metal Barrel", "Land_MetalBarrel_F", 25, "object"],
	//["Toilet Box", "Land_ToiletBox_F", 25, "object"],
	["Lamp Post (Harbour)", "Land_LampHarbour_F", 100, "object"],
	["Lamp Post (Shabby)", "Land_LampShabby_F", 100, "object"],
	["Boom Gate", "Land_BarGate_F", 150, "object"],
	["Pipes", "Land_Pipes_Large_F", 200, "object"],
	["Concrete Frame", "Land_CncShelter_F", 200, "object"],
	["Highway Guardrail", "Land_Crash_barrier_F", 200, "object"],
	["Concrete Barrier", "Land_CncBarrier_F", 200, "object"],
	["Concrete Barrier (Medium)", "Land_CncBarrierMedium_F", 350, "object"],
	["Concrete Barrier (Long)", "Land_CncBarrierMedium4_F", 500, "object"],
	["HBarrier (1 block)", "Land_HBarrier_1_F", 150, "object"],
	["HBarrier (3 blocks)", "Land_HBarrier_3_F", 200, "object"],
	["HBarrier (5 blocks)", "Land_HBarrier_5_F", 250, "object"],
	["HBarrier Big", "Land_HBarrierBig_F", 500, "object"],
	["HBarrier Wall (4 blocks)", "Land_HBarrierWall4_F", 400, "object"],
	["HBarrier Wall (6 blocks)", "Land_HBarrierWall6_F", 500, "object"],
	["HBarrier Watchtower", "Land_HBarrierTower_F", 600, "object"],
	["Concrete Wall", "Land_CncWall1_F", 400, "object"],
	["Concrete Military Wall", "Land_Mil_ConcreteWall_F", 400, "object"],
	["Concrete Wall (Long)", "Land_CncWall4_F", 600, "object"],
	["Military Wall (Big)", "Land_Mil_WallBig_4m_F", 600, "object"],
	//["Shoot House Wall", "Land_Shoot_House_Wall_F", 180, "object"],
	["Canal Wall (Small)", "Land_Canal_WallSmall_10m_F", 400, "object"],
	["Canal Stairs", "Land_Canal_Wall_Stairs_F", 500, "object"],
	["Bag Fence (Corner)", "Land_BagFence_Corner_F", 150, "object"],
	["Bag Fence (End)", "Land_BagFence_End_F", 150, "object"],
	["Bag Fence (Long)", "Land_BagFence_Long_F", 200, "object"],
	["Bag Fence (Round)", "Land_BagFence_Round_F", 150, "object"],
	["Bag Fence (Short)", "Land_BagFence_Short_F", 150, "object"],
	["Bag Bunker (Small)", "Land_BagBunker_Small_F", 250, "object"],
	["Bag Bunker (Large)", "Land_BagBunker_Large_F", 500, "object"],
	["Bag Bunker Tower", "Land_BagBunker_Tower_F", 1000, "object"],
	["Military Cargo Post", "Land_Cargo_Patrol_V1_F", 800, "object"],
	["Military Cargo Tower", "Land_Cargo_Tower_V1_F", 10000, "object"],
	["Concrete Ramp", "Land_RampConcrete_F", 350, "object"],
	["Concrete Ramp (High)", "Land_RampConcreteHigh_F", 500, "object"],
	["Scaffolding", "Land_Scaffolding_F", 250, "object"]
];

allGenStoreVanillaItems = compileFinal str (call genItemArray + call genObjectsArray + call allStoreGear);

//Text name, classname, buy cost, spawn type, sell price (selling not implemented) or spawning color
landArray = compileFinal str
[
	["Kart", "C_Kart_01_F", 500, "vehicle"],

	["Quadbike (Civilian)", "C_Quadbike_01_F", 600, "vehicle"],
	["Quadbike (NATO)", "B_Quadbike_01_F", 650, "vehicle"],
	["Quadbike (CSAT)", "O_Quadbike_01_F", 650, "vehicle"],
	["Quadbike (AAF)", "I_Quadbike_01_F", 650, "vehicle"],
	["Quadbike (FIA)", "B_G_Quadbike_01_F", 650, "vehicle"],

	["Hatchback", "C_Hatchback_01_F", 800, "vehicle"],
	["Hatchback Sport", "C_Hatchback_01_sport_F", 1000, "vehicle"],
	["SUV", "C_SUV_01_F", 1100, "vehicle"],
	["Offroad", "C_Offroad_01_F", 1100, "vehicle"],
	["Offroad Camo", "B_G_Offroad_01_F", 1250, "vehicle"],
	["Offroad Repair", "C_Offroad_01_repair_F", 1500, "vehicle"],
	["Offroad HMG", "B_G_Offroad_01_armed_F", 2500, "vehicle"],

	["Truck", "C_Van_01_transport_F", 700, "vehicle"],
	["Truck (Camo)", "B_G_Van_01_transport_F", 800, "vehicle"],
	["Truck Box", "C_Van_01_box_F", 900, "vehicle"],
	["Fuel Truck", "C_Van_01_fuel_F", 2000, "vehicle"],
	["Fuel Truck (Camo)", "B_G_Van_01_fuel_F", 2100, "vehicle"],

	["HEMTT Tractor", "B_Truck_01_mover_F", 4000, "vehicle"],
	["HEMTT Box", "B_Truck_01_box_F", 5000, "vehicle"],
	["HEMTT Transport", "B_Truck_01_transport_F", 6000, "vehicle"],
	["HEMTT Covered", "B_Truck_01_covered_F", 7500, "vehicle"],
	["HEMTT Fuel", "B_Truck_01_fuel_F", 9000, "vehicle"],
	["HEMTT Medical", "B_Truck_01_medical_F", 10000, "vehicle"],
	["HEMTT Repair", "B_Truck_01_Repair_F", 12500, "vehicle"],
	["HEMTT Ammo", "B_Truck_01_ammo_F", 27500, "vehicle"],

	["Tempest Device", "O_Truck_03_device_F", 4000, "vehicle"],
	["Tempest Transport", "O_Truck_03_transport_F", 6000, "vehicle"],
	["Tempest Covered", "O_Truck_03_covered_F", 7500, "vehicle"],
	["Tempest Fuel", "O_Truck_03_fuel_F", 9000, "vehicle"],
	["Tempest Medical", "O_Truck_03_medical_F", 10000, "vehicle"],
	["Tempest Repair", "O_Truck_03_repair_F", 12500, "vehicle"],
	["Tempest Ammo", "O_Truck_03_ammo_F", 27500, "vehicle"],

	["Zamak Transport", "I_Truck_02_transport_F", 4000, "vehicle"],
	["Zamak Covered", "I_Truck_02_covered_F", 5000, "vehicle"],
	["Zamak Fuel", "I_Truck_02_fuel_F", 7500, "vehicle"],
	["Zamak Medical", "I_Truck_02_medical_F", 9000, "vehicle"],
	["Zamak Repair", "I_Truck_02_box_F", 10000, "vehicle"],
	["Zamak Ammo", "I_Truck_02_ammo_F", 25000, "vehicle"],
	
	["UGV Stomper (NATO)", "B_UGV_01_F", 2500, "vehicle"],
	["UGV Stomper RCWS (NATO)", "B_UGV_01_rcws_F", 15000, "vehicle"],
	["UGV Stomper (AAF)", "I_UGV_01_F", 2500, "vehicle"],
	["UGV Stomper RCWS (AAF)", "I_UGV_01_rcws_F", 15000, "vehicle"],
	["UGV Saif (CSAT)", "O_UGV_01_F", 2500, "vehicle"],
	["UGV Saif RCWS (CSAT)", "O_UGV_01_rcws_F", 15000, "vehicle"],
	
	["HMMWV M2", "B_mas_HMMWV_M2", 2500, "vehicle"],
	["HMMWV M134", "B_mas_HMMWV_M134", 2500, "vehicle"],
	["HMMWV SOV", "B_mas_HMMWV_SOV", 2500, "vehicle"],
	["HMMWV SOV M134", "B_mas_HMMWV_SOV_M134", 2500, "vehicle"],
	["HMMWV TOW", "B_mas_HMMWV_TOW", 2500, "vehicle"],
	["HMMWV MK19", "B_mas_HMMWV_MK19", 2500, "vehicle"],
	["HMMWV UNA", "B_mas_HMMWV_UNA", 2500, "vehicle"],
	["HMMWV MEV", "B_mas_HMMWV_MEV", 2500, "vehicle"],

	["HMMWV M2 DES", "B_mas_HMMWV_M2_des", 2500, "vehicle"],
	["HMMWV M134 DES", "B_mas_HMMWV_M134_des", 2500, "vehicle"],
	["HMMWV SOV DES", "B_mas_HMMWV_SOV_des", 2500, "vehicle"],
	["HMMWV SOV M134 DES", "B_mas_HMMWV_SOV_M134_des", 2500, "vehicle"],
	["HMMWV TOW DES", "B_mas_HMMWV_TOW_des", 2500, "vehicle"],
	["HMMWV MK19 DES", "B_mas_HMMWV_MK19_des", 2500, "vehicle"],
	["HMMWV UNA DES", "B_mas_HMMWV_UNA_des", 2500, "vehicle"],
	["HMMWV MEV DES", "B_mas_HMMWV_MEV_des", 2500, "vehicle"],
	
	["LR (B)", "B_mas_cars_LR_Unarmed", 2500, "vehicle"],
	["LR MED (B)", "B_mas_cars_LR_Med", 2500, "vehicle"],
	["LR M2 (B)", "B_mas_cars_LR_M2", 2500, "vehicle"],
	["LR MK19 (B)", "B_mas_cars_LR_Mk19", 2500, "vehicle"],
	["LR TOW (B)", "B_mas_cars_LR_TOW", 2500, "vehicle"],
	["LR SPG9 (B)", "B_mas_cars_LR_SPG9", 2500, "vehicle"],
	
	["LR (I)", "I_mas_cars_LR_soft_Unarmed", 2500, "vehicle"],
	["LR MED (I)", "I_mas_cars_LR_soft_Med", 2500, "vehicle"],
	["LR M2 (I)", "I_mas_cars_LR_soft_M2", 2500, "vehicle"],
	["LR MK19 (I)", "I_mas_cars_LR_soft_Mk19", 2500, "vehicle"],
	["LR TOW (I)", "I_mas_cars_LR_soft_TOW", 2500, "vehicle"],
	["LR SPG9 (I)", "I_mas_cars_LR_soft_SPG9", 2500, "vehicle"],
	
	["Hilux MG", "B_mas_cars_Hilux_MG", 2500, "vehicle"],
	["Hilux AGS30", "B_mas_cars_Hilux_AGS30", 2500, "vehicle"],
	["Hilux SPG9", "B_mas_cars_Hilux_SPG9", 2500, "vehicle"],
	["Hilux RKTS", "B_mas_cars_Hilux_RKTS", 2500, "vehicle"],
	["Hilux Unarmed", "B_mas_cars_Hilux_Unarmed", 2500, "vehicle"],
	["Hilux Med", "B_mas_cars_Hilux_Med", 2500, "vehicle"],
	["Hilux M2", "B_mas_cars_Hilux_M2", 2500, "vehicle"],

	["UAZ (I)", "I_mas_cars_UAZ_Unarmed", 2500, "vehicle"],
	["UAZ MG (I)", "I_mas_cars_UAZ_MG", 2500, "vehicle"],
	["UAZ AGS30 (I)", "I_mas_cars_UAZ_AGS30", 2500, "vehicle"],
	["UAZ SPG9 (I)", "I_mas_cars_UAZ_SPG9", 2500, "vehicle"],
	["UAZ MED (I)", "I_mas_cars_UAZ_Med", 2500, "vehicle"],
	["UAZ M2 (I)", "I_mas_cars_UAZ_M2"],
	
	["UAZ (O)", "O_mas_cars_UAZ_Unarmed", 2500, "vehicle"],
	["UAZ MG (O)", "O_mas_cars_UAZ_MG", 2500, "vehicle"],
	["UAZ AGS30 (O)", "O_mas_cars_UAZ_AGS30", 2500, "vehicle"],
	["UAZ SPG9 (O)", "O_mas_cars_UAZ_SPG9", 2500, "vehicle"],
	["UAZ MED (O)", "O_mas_cars_UAZ_Med", 2500, "vehicle"]
];

armoredArray = compileFinal str
[
	["Hunter", "B_MRAP_01_F", 4000, "vehicle"],
	["Hunter HMG", "B_MRAP_01_hmg_F", 15000, "vehicle"],
	["Hunter GMG", "B_MRAP_01_gmg_F", 17500, "vehicle"],
	["Ifrit", "O_MRAP_02_F", 4000, "vehicle"],
	["Ifrit HMG", "O_MRAP_02_hmg_F", 15000, "vehicle"],
	["Ifrit GMG", "O_MRAP_02_gmg_F", 17500, "vehicle"],
	["Strider", "I_MRAP_03_F", 4000, "vehicle"],
	["Strider HMG", "I_MRAP_03_hmg_F", 15000, "vehicle"],
	["Strider GMG", "I_MRAP_03_gmg_F", 17500, "vehicle"],
	["MSE-3 Marid", "O_APC_Wheeled_02_rcws_F", 22500, "vehicle"],
	["AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F", 27500, "vehicle"],
	["AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F", 30000, "vehicle"],
	
	["BMP1 (I)", "I_mas_BMP1_AAF_01", 30000, "vehicle"],
	["BMP1-P (I)", "I_mas_BMP1P_AAF_01", 30000, "vehicle"],
	["BMP2 (I)", "I_mas_BMP2_AAF_01", 30000, "vehicle"],
	["BMP2 HQ (I)", "I_mas_BMP2_HQ_AAF_01", 30000, "vehicle"],
	["BMP2 MED (I)", "I_mas_BMP2_Ambul_01", 30000, "vehicle"],

	["BMP1 (O)", "O_mas_BMP1_OPF_01", 30000, "vehicle"],
	["BMP1-P (O)", "O_mas_BMP1P_OPF_01", 30000, "vehicle"],
	["BMP2 (O)", "O_mas_BMP2_OPF_01", 30000, "vehicle"],
	["BMP2 HQ (O)", "O_mas_BMP2_HQ_OPF_01", 30000, "vehicle"],
	["BMP2 MED (O)", "O_mas_BMP2_Ambul_01", 30000, "vehicle"],

	["BRDM2 (I)", "I_mas_BRDM2", 30000, "vehicle"],
	["BTR60 (I)", "I_mas_BTR60", 30000, "vehicle"],
	
	["BRDM2 (O)", "O_mas_BRDM2", 30000, "vehicle"],
	["BTR60 (O)", "O_mas_BTR60", 30000, "vehicle"]
];

tanksArray = compileFinal str
[
	["CRV-6e Bobcat", "B_APC_Tracked_01_CRV_F", 32500, "vehicle"],
	["IFV-6c Panther", "B_APC_Tracked_01_rcws_F", 35000, "vehicle"],
	["FV-720 Mora", "I_APC_tracked_03_cannon_F", 37500, "vehicle"],
	["BTR-K Kamysh", "O_APC_Tracked_02_cannon_F", 40000, "vehicle"],
	["IFV-6a Cheetah AA", "B_APC_Tracked_01_AA_F", 40000, "vehicle"],
	["ZSU-39 Tigris AA", "O_APC_Tracked_02_AA_F", 40000, "vehicle"],
	["M2A1 Slammer", "B_MBT_01_cannon_F", 50000, "vehicle"],
	["M2A4 Slammer HMG", "B_MBT_01_TUSK_F", 50000, "vehicle"], // Commander gun variant
	["T-100 Varsuk", "O_MBT_02_cannon_F", 50000, "vehicle"],
	["MBT-52 Kuma", "I_MBT_03_cannon_F", 50000, "vehicle"],
	
	["2S9 Sochor", "O_MBT_02_arty_F", 500000, "vehicle"],
	["M5 Sandstorm MLRS", "B_MBT_01_mlrs_F", 500000, "vehicle"],
	["M4 Scorcher", "B_MBT_01_arty_F", 500000, "vehicle"],
	
	["T72 (I)", "I_mas_T72_AAF_01", 30000, "vehicle"],
	["T72B (Early) (I)", "I_mas_T72B_Early_AAF_01", 30000, "vehicle"],
	["T72B (I)", "I_mas_T72B_AAF_01", 30000, "vehicle"],
	["T72BM (I)", "I_mas_T72BM_AAF_01", 30000, "vehicle"],
	["T55 (I)", "I_mas_T55_AAF_01", 30000, "vehicle"],
	["T34 (I)", "I_mas_T34_AAF_01", 30000, "vehicle"],
	["ZSU (I)", "I_mas_ZSU_AAF_01", 30000, "vehicle"],
	
	["T72 (O)", "O_mas_T72_OPF_01", 30000, "vehicle"],
	["T72B (Early) (O)", "O_mas_T72B_Early_OPF_01", 30000, "vehicle"],
	["T72B (O)", "O_mas_T72B_OPF_01", 30000, "vehicle"],
	["T72BM (O)", "O_mas_T72BM_OPF_01", 30000, "vehicle"],
	["T55 (O)", "O_mas_T55_OPF_01", 30000, "vehicle"],
	["ZSU (O)", "O_mas_ZSU_OPF_01", 30000, "vehicle"]
];


helicoptersArray = compileFinal str
[	
	["M-900 Civilian", "C_Heli_Light_01_civil_F", 4000, "vehicle"], // MH-6, no flares
	["MH-9 Hummingbird", "B_Heli_Light_01_F", 5000, "vehicle"], // MH-6
	["PO-30 Orca (Black)", "O_Heli_Light_02_unarmed_F", 7000, "vehicle"], // Ka-60
	["WY-55 Hellcat (Green)", "I_Heli_light_03_unarmed_F", 7000, "vehicle"], // AW159

	["Mi-290 Taru (Crane) [DLC]", "O_Heli_Transport_04_F", 7500, "vehicle"], // CH-54
	["Mi-290 Taru (Box) [DLC]", "O_Heli_Transport_04_box_F", 8000, "vehicle"],
	["Mi-290 Taru (Fuel) [DLC]", "O_Heli_Transport_04_fuel_F", 8500, "vehicle"],
	["Mi-290 Taru (Bench) [DLC]", "O_Heli_Transport_04_bench_F", 9000, "vehicle"],
	["Mi-290 Taru (Transport) [DLC]", "O_Heli_Transport_04_covered_F", 9500, "vehicle"],
	["CH-67 Huron (Black) [DLC]", "B_Heli_Transport_03_unarmed_F", 10000, "vehicle"], // CH-47
	["CH-49 Mohawk", "I_Heli_Transport_02_F", 10000, "vehicle"], // AW101

	["Mi-290 Taru (Medical) [DLC]", "O_Heli_Transport_04_medevac_F",12500, "vehicle"],
	["Mi-290 Taru (Repair) [DLC]", "O_Heli_Transport_04_repair_F", 15000, "vehicle"],
	["Mi-290 Taru (Ammo) [DLC]", "O_Heli_Transport_04_ammo_F", 25000, "vehicle"],

	["UH-80 Ghost Hawk (Black)", "B_Heli_Transport_01_F", 25000, "vehicle"], // UH-60 Stealth with 2 side miniguns
	["UH-80 Ghost Hawk (Green)", "B_Heli_Transport_01_camo_F", 25000, "vehicle"], // UH-60 Stealth with 2 side miniguns (green camo)
	["CH-67 Huron (Armed) [DLC]", "B_Heli_Transport_03_F", 30000, "vehicle"], // CH-47 with 2 side miniguns
	["AH-9 Pawnee", "B_Heli_Light_01_armed_F", 30000, "vehicle"], // Armed AH-6
	["PO-30 Orca (Armed, Black)", "O_Heli_Light_02_v2_F", 30000, "vehicle"], // Armed Ka-60 with orca paintjob
	["PO-30 Orca (Armed, Hex)", "O_Heli_Light_02_F", 35000, "vehicle"], // Armed Ka-60
	["WY-55 Hellcat (Armed)", "I_Heli_light_03_F", 40000, "vehicle"], // Armed AW159
	["AH-99 Blackfoot", "B_Heli_Attack_01_F", 50000, "vehicle"], // RAH-66 with gunner
	["Mi-48 Kajman (Hex)", "O_Heli_Attack_02_F", 60000, "vehicle"], // Mi-28 with gunner
	["Mi-48 Kajman (Black)", "O_Heli_Attack_02_black_F", 60000, "vehicle"], // Mi-28 with gunner (black camo)
	
	["CH47", "B_mas_CH_47F", 60000, "vehicle"],
	
	["UH1Y", "B_mas_UH1Y_F", 60000, "vehicle"],
	["UH1Y UNA", "B_mas_UH1Y_UNA_F", 60000, "vehicle"],
	["UH1Y MED", "B_mas_UH1Y_MEV_F", 60000, "vehicle"],
	
	["UH60M", "B_mas_UH60M", 60000, "vehicle"],
	["UH60M SF", "B_mas_UH60M_SF", 60000, "vehicle"],
	["UH60M MED", "B_mas_UH60M_MEV", 60000, "vehicle"],
	
	["Mi8 (I)", "I_mas_MI8", 60000, "vehicle"],
	["Mi8 MTV (I)", "I_mas_MI8MTV", 60000, "vehicle"],
	["Mi8 (O)", "O_mas_MI8", 60000, "vehicle"],
	["Mi8MTV (O)", "O_mas_MI8MTV", 60000, "vehicle"],
	
	["Mi24 (I)", "I_mas_MI24V", 60000, "vehicle"],
	["Mi24 (O)", "O_mas_MI24V", 60000, "vehicle"]	
];

planesArray = compileFinal str
[
	["A-143 Buzzard AA", "I_Plane_Fighter_03_AA_F", 40000, "vehicle"],
	["A-143 Buzzard CAS", "I_Plane_Fighter_03_CAS_F", 45000, "vehicle"],
	["A-164 Wipeout CAS", "B_Plane_CAS_01_F", 60000, "vehicle"],
	["To-199 Neophron CAS", "O_Plane_CAS_02_F", 60000, "vehicle"],
	["MQ4A Greyhawk ATGM UAV", "B_UAV_02_F", 20000, "vehicle"],
	["MQ4A Greyhawk Bomber UAV", "B_UAV_02_CAS_F", 10000, "vehicle"], // Bomber UAVs are a lot harder to use, hence why they are cheaper than ATGMs
	["K40 Ababil-3 ATGM UAV (CSAT)", "O_UAV_02_F", 20000, "vehicle"],
	["K40 Ababil-3 Bomber UAV (CSAT)", "O_UAV_02_CAS_F", 10000, "vehicle"],
	["K40 Ababil-3 ATGM UAV (AAF)", "I_UAV_02_F", 20000, "vehicle"],
	["K40 Ababil-3 Bomber UAV (AAF)", "I_UAV_02_CAS_F", 10000, "vehicle"]
];

boatsArray = compileFinal str
[
	["Rescue Boat", "C_Rubberboat", 500, "boat"],
	["Rescue Boat (NATO)", "B_Lifeboat", 500, "boat"],
	["Rescue Boat (CSAT)", "O_Lifeboat", 500, "boat"],
	["Assault Boat (NATO)", "B_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (CSAT)", "O_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (AAF)", "I_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (FIA)", "B_G_Boat_Transport_01_F", 600, "boat"],
	["Motorboat", "C_Boat_Civil_01_F", 1000, "boat"],
	["Motorboat Rescue", "C_Boat_Civil_rescue_01_F", 900, "boat"],
	["Motorboat Police", "C_Boat_Civil_police_01_F", 1250, "boat"],
	["Speedboat HMG (CSAT)", "O_Boat_Armed_01_hmg_F", 4000, "boat"],
	["Speedboat Minigun (NATO)", "B_Boat_Armed_01_minigun_F", 4000, "boat"],
	["Speedboat Minigun (AAF)", "I_Boat_Armed_01_minigun_F", 4000, "boat"],
	["SDV Submarine (NATO)", "B_SDV_01_F", 1000, "submarine"],
	["SDV Submarine (CSAT)", "O_SDV_01_F", 1000, "submarine"],
	["SDV Submarine (AAF)", "I_SDV_01_F", 1000, "submarine"]
];

allVehStoreVehicles = compileFinal str (call landArray + call armoredArray + call tanksArray + call helicoptersArray + call planesArray + call boatsArray);

uavArray = compileFinal str
[
	"UAV_02_base_F",
	"UGV_01_base_F"
];

noColorVehicles = compileFinal str
[
	// Deprecated
];

rgbOnlyVehicles = compileFinal str
[
	// Deprecated
];

colorsArray = compileFinal str
[
	[ // Main colors
		"All",
		[
			["Black", "#(rgb,1,1,1)color(0.01,0.01,0.01,1)"], // #(argb,8,8,3)color(0.1,0.1,0.1,0.1)
			["Grey", "#(rgb,1,1,1)color(0.15,0.151,0.152,1)"], // #(argb,8,8,3)color(0.5,0.51,0.512,0.3)
			["White", "#(rgb,1,1,1)color(0.75,0.75,0.75,1)"], // #(argb,8,8,3)color(1,1,1,0.5)
			["Dark Blue", "#(rgb,1,1,1)color(0,0.05,0.15,1)"], // #(argb,8,8,3)color(0,0.3,0.6,0.05)
			["Blue", "#(rgb,1,1,1)color(0,0.03,0.5,1)"], // #(argb,8,8,3)color(0,0.2,1,0.75)
			["Teal", "#(rgb,1,1,1)color(0,0.3,0.3,1)"], // #(argb,8,8,3)color(0,1,1,0.15)
			["Green", "#(rgb,1,1,1)color(0,0.5,0,1)"], // #(argb,8,8,3)color(0,1,0,0.15)
			["Yellow", "#(rgb,1,1,1)color(0.5,0.4,0,1)"], // #(argb,8,8,3)color(1,0.8,0,0.4)
			["Orange", "#(rgb,1,1,1)color(0.4,0.09,0,1)"], // #(argb,8,8,3)color(1,0.5,0,0.4)
			["Red", "#(rgb,1,1,1)color(0.45,0.005,0,1)"], // #(argb,8,8,3)color(1,0.1,0,0.3)
			["Pink", "#(rgb,1,1,1)color(0.5,0.03,0.3,1)"], // #(argb,8,8,3)color(1,0.06,0.6,0.5)
			["Purple", "#(rgb,1,1,1)color(0.1,0,0.3,1)"], // #(argb,8,8,3)color(0.8,0,1,0.1)
			["NATO Tan", "client\images\vehicleTextures\nato.jpg"], // #(argb,8,8,3)color(0.584,0.565,0.515,0.3)
			["CSAT Brown", "client\images\vehicleTextures\csat.jpg"], // #(argb,8,8,3)color(0.624,0.512,0.368,0.3)
			["AAF Green", "client\images\vehicleTextures\aaf.jpg"], // #(argb,8,8,3)color(0.546,0.59,0.363,0.2)
			["Trippy", "client\images\vehicleTextures\rainbow.jpg"],
			["Carbon", "client\images\vehicleTextures\carbon.jpg"],
			["Rusty", "client\images\vehicleTextures\rusty.jpg"],
			["Denim", "client\images\vehicleTextures\denim.jpg"],
			["Psych", "client\images\vehicleTextures\psych.jpg"],
			["Leopard", "client\images\vehicleTextures\leopard.jpg"],
			["'Murica", "client\images\vehicleTextures\murica.jpg"],
			["Confederate", "client\images\vehicleTextures\confederate.jpg"],
			["Yellow Camo", "client\images\vehicleTextures\camo_fuel.jpg"],
			["Orange Camo", "client\images\vehicleTextures\camo_fack.jpg"],
			["Red Camo", "client\images\vehicleTextures\camo_deser.jpg"],
			["Pink Camo", "client\images\vehicleTextures\camo_pank.jpg"]
		]
	],
	[ // Kart colors
		"Kart_01_Base_F",
		[
			["Black", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_black_CO.paa"],
			["White", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_white_CO.paa"],
			["Blue", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_blue_CO.paa"],
			["Green", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_green_CO.paa"],
			["Yellow", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_yellow_CO.paa"],
			["Orange", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_orange_CO.paa"],
			["Red", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_red_CO.paa"]
		]
	]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
// ["Medical Kit", "medkits", localize "STR_WL_ShopDescriptions_MedKit", "client\icons\medkit.paa", 400, 200], // not needed since there are First Ait Kits
customPlayerItems = compileFinal str
[
	["Water Bottle", "water", localize "STR_WL_ShopDescriptions_Water", "client\icons\water.paa", 30, 15],
	["Canned Food", "cannedfood", localize "STR_WL_ShopDescriptions_CanFood", "client\icons\cannedfood.paa", 30, 15],
	["Repair Kit", "repairkit", localize "STR_WL_ShopDescriptions_RepairKit", "client\icons\briefcase.paa", 500, 250],
	["Jerry Can (Full)", "jerrycanfull", localize "STR_WL_ShopDescriptions_fuelFull", "client\icons\jerrycan.paa", 150, 75],
	["Jerry Can (Empty)", "jerrycanempty", localize "STR_WL_ShopDescriptions_fuelEmpty", "client\icons\jerrycan.paa", 50, 25],
	["Spawn Beacon", "spawnbeacon", localize "STR_WL_ShopDescriptions_spawnBeacon", "client\icons\briefcase.paa", 1500, 750],
	["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "client\icons\briefcase.paa", 200, 100],
	["Syphon Hose", "syphonhose", localize "STR_WL_ShopDescriptions_SyphonHose", "client\icons\jerrycan.paa", 200, 100],
	["Energy Drink", "energydrink", localize "STR_WL_ShopDescriptions_Energy_Drink", "client\icons\water.paa", 100, 50],
	["Warchest", "warchest", localize "STR_WL_ShopDescriptions_Warchest", "client\icons\briefcase.paa", 1000, 500]
];

call compile preprocessFileLineNumbers "mapConfig\storeOwners.sqf";

storeConfigDone = compileFinal "true";