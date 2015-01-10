//ARMA3Alpha function LV_fnc_menGroup v1.3 - by SPUn / lostvar
//Spawn infantry group and returns leader
private ["_BLUmen3","_OPFarrays","_BLUarrays","_INDarrays","_INDmen2","_INDgrp","_INDhq","_INDmen","_OPFmen2","_BLUmen2","_pos","_side","_size","_BLUmen","_OPFmen","_men","_amount","_BLUhq","_BLUgrp","_OPFhq","_OPFgrp","_grp","_i","_man1","_man","_leader"];
_pos = _this select 0;
_side = _this select 1;
_size = _this select 2;
_grpId = if (count _this > 3) then { _this select 3;} else {nil};	

_BLUmen = ["B_mas_usn_Soldier_F_d","B_mas_usn_Soldierm_F_d","B_mas_usn_Soldier_02_f_d","B_mas_usn_Soldier_03_f_d","B_mas_usn_Soldier_GL_F_d","B_mas_usn_Soldier_JTAC_F_d","B_mas_usn_Soldier_UAV_F_d","B_mas_usn_soldier_AR_F_d","B_mas_usn_soldier_MG_F_d","B_mas_usn_Soldier_lite_F_d","B_mas_usn_Soldier_off_F_d","B_mas_usn_Soldier_SL_F_d","B_mas_usn_Soldier_TL_F_d","B_mas_usn_soldier_M_F_d","B_mas_usn_soldier_Mh_F_d","B_mas_usn_soldier_LAT_F_d","B_mas_usn_soldier_LAA_F_d","B_mas_usn_medic_F_d","B_mas_usn_soldier_repair_F_d","B_mas_usn_soldier_exb_F_d","B_mas_usn_soldier_exp_F_d"];
_BLUmen2 = ["B_mas_sfod_Soldier_F","B_mas_sfod_Soldierm_F","B_mas_sfod_Soldier_02_f","B_mas_sfod_Soldier_03_f","B_mas_sfod_Soldier_GL_F","B_mas_sfod_Soldier_JTAC_F","B_mas_sfod_Soldier_UAV_F","B_mas_sfod_soldier_AR_F","B_mas_sfod_soldier_MG_F","B_mas_sfod_Soldier_lite_F","B_mas_sfod_Soldier_off_F","B_mas_sfod_Soldier_SL_F","B_mas_sfod_Soldier_TL_F","B_mas_sfod_soldier_M_F","B_mas_sfod_soldier_Mh_F","B_mas_sfod_soldier_LAT_F","B_mas_sfod_soldier_LAA_F","B_mas_sfod_medic_F","B_mas_sfod_soldier_repair_F","B_mas_sfod_soldier_exp_F","B_mas_sfod_soldier_exb_F"];
_BLUmen3 = ["B_mas_usr_Soldier_F","B_mas_usr_Soldier_F_v","B_mas_usr_Soldierm_F_v","B_mas_usr_Soldier_02_f_v","B_mas_usr_Soldier_GL_F_v","B_mas_usr_Soldier_JTAC_F_v","B_mas_usr_Soldier_UAV_F_v","B_mas_usr_soldier_AR_F_v","B_mas_usr_soldier_MG_F_v","B_mas_usr_Soldier_lite_F_v","B_mas_usr_Soldier_off_F_v","B_mas_usr_Soldier_SL_F_v","B_mas_usr_Soldier_TL_F_v","B_mas_usr_soldier_M_F_v","B_mas_usr_soldier_Ml_F_v","B_mas_usr_soldier_Mh_F_v","B_mas_usr_soldier_LAT_F_v","B_mas_usr_soldier_AT_F_v","B_mas_usr_soldier_LAA_F_v","B_mas_usr_medic_F_v","B_mas_usr_soldier_repair_F_v","B_mas_usr_soldier_exp_F_v","B_mas_usr_soldier_exb_F_v"];
_BLUarrays = [_BLUmen,_BLUmen2,_BLUmen3];
_OPFmen = ["O_mas_rus_Soldier_F","O_mas_rus_Soldier_Fn","O_mas_rus_Soldier_R_F","O_mas_rus_Soldier_R_Fn","O_mas_rus_Soldier_GL_F","O_mas_rus_Soldier_GL_Fn","O_mas_rus_Soldier_JTAC_F","O_mas_rus_Soldier_JTAC_Fn","O_mas_rus_Soldier_UAV_F","O_mas_rus_soldier_AR_F","O_mas_rus_soldier_AR_Fn","O_mas_rus_soldier_MGh_F","O_mas_rus_soldier_MGh_Fn","O_mas_rus_Soldier_lite_F","O_mas_rus_Soldier_off_F","O_mas_rus_Soldier_SL_F","O_mas_rus_Soldier_SL_Fn","O_mas_rus_Soldier_TL_F","O_mas_rus_Soldier_TL_Fn","O_mas_rus_soldier_M_F","O_mas_rus_soldier_M2_F","O_mas_rus_soldier_M_Fn","O_mas_rus_soldier_M2_Fn","O_mas_rus_soldier_M_F_un","O_mas_rus_soldier_M_F_qn","O_mas_rus_soldier_Mh_F","O_mas_rus_soldier_Mh_Fn","O_mas_rus_soldier_Mh_F_un","O_mas_rus_soldier_LAT_F","O_mas_rus_soldier_AT2_F","O_mas_rus_soldier_AT_F","O_mas_rus_soldier_LAA_F","O_mas_rus_medic_F","O_mas_rus_medic_Fn","O_mas_rus_soldier_repair_F","O_mas_rus_soldier_exp_F","O_mas_rus_soldier_exp_Fn","O_mas_rus_soldier_exb_F"];
_OPFmen2 = ["O_mas_rus_Soldier_F_a","O_mas_rus_Soldier_R_F_a","O_mas_rus_Soldier_GL_F_a","O_mas_rus_Soldier_JTAC_F_a","O_mas_rus_Soldier_UAV_F_a","O_mas_rus_soldier_AR_F_a","O_mas_rus_soldier_MGh_F_a","O_mas_rus_Soldier_lite_F_a","O_mas_rus_Soldier_off_F_a","O_mas_rus_Soldier_SL_F_a","O_mas_rus_Soldier_TL_F","O_mas_rus_Soldier_TL_F_v","O_mas_rus_soldier_M_F","O_mas_rus_soldier_M_F_v","O_mas_rus_soldier_LAT_F_a","O_mas_rus_soldier_AT_F_a","O_mas_rus_soldier_LAA_F_a","O_mas_rus_medic_F_a","O_mas_rus_soldier_repair_F_a","O_mas_rus_soldier_exp_F_a","O_mas_rus_Helipilot_F_a","O_mas_rus_Helicrew_F_a","O_mas_rus_crew_F_a","O_mas_rus_support_MG_F_a","O_mas_rus_support_GMG_F_a","O_mas_rus_support_Mort_F_a","O_mas_rus_support_AMG_F_a","O_mas_rus_support_AMort_F_a"];
_OPFmen3 = ["O_mas_rus_Soldier_F_d","O_mas_rus_Soldier_R_F_d","O_mas_rus_Soldier_GL_F_d","O_mas_rus_Soldier_JTAC_F_d","O_mas_rus_Soldier_UAV_F_d","O_mas_rus_soldier_AR_F_d","O_mas_rus_soldier_MGh_F_d","O_mas_rus_Soldier_lite_F_d","O_mas_rus_Soldier_off_F_d","O_mas_rus_Soldier_SL_F_d","O_mas_rus_Soldier_TL_F_d","O_mas_rus_soldier_M_F_d","O_mas_rus_soldier_Mh_F_d","O_mas_rus_soldier_LAT_F_d","O_mas_rus_soldier_AT2_F_d","O_mas_rus_soldier_AT_F_d","O_mas_rus_soldier_LAA_F_d","O_mas_rus_medic_F_d","O_mas_rus_soldier_repair_F_d","O_mas_rus_soldier_exp_F_d","O_mas_rus_soldier_exb_F_d"];
_OPFarrays = [_OPFmen,_OPFmen2,_OPFmen3];
_INDmen = ["IRA_Soldier_Outfit_1","IRA_Soldier_Outfit_2","IRA_Soldier_Outfit_3","IRA_Soldier_Outfit_4","IRA_Soldier_Outfit_5","IRA_Soldier_Outfit_6","IRA_Soldier_Outfit_7","IRA_Soldier_Outfit_8","IRA_Soldier_Outfit_9","IRA_Soldier_Outfit_10","IRA_Soldier_Outfit_11"];
_INDmen2 = ["UVF_Soldier_Outfit_1","UVF_Soldier_Outfit_2","UVF_Soldier_Outfit_3","UVF_Soldier_Outfit_4","UVF_Soldier_Outfit_5","UVF_Soldier_Outfit_6","UVF_Soldier_Outfit_7","UVF_Soldier_Outfit_8","UVF_Soldier_Outfit_9"];
_INDarrays = [_INDmen,_INDmen2];

_men = [];
if(typeName _size == "ARRAY")then{
	_amount = ((random (_size select 0)) + (_size select 1));
}else{
	_amount = _size;
};

switch(_side)do{
	case 0:{
		_men = (_BLUarrays call BIS_fnc_selectRandom);
		_BLUhq = createCenter west;
		_BLUgrp = createGroup west;
		_grp = _BLUgrp;
	};
	case 1:{
		_men = (_OPFarrays call BIS_fnc_selectRandom);
		_OPFhq = createCenter east;
		_OPFgrp = createGroup east;
		_grp = _OPFgrp;
	};
	case 2:{
		_men = (_INDarrays call BIS_fnc_selectRandom);
		_INDhq = createCenter resistance;
		_INDgrp = createGroup resistance;
		_grp = _INDgrp;
	};
};

_i = 0; 
for "_i" from 0 to _amount do {
	_man1 = _men select (floor(random(count _men)));
	_man = _grp createUnit [_man1, _pos, [], 0, "NONE"];
};

if(!isNil("_grpId"))then{
	call compile format ["LVgroup%1 = _grp",_grpId];
};

_leader = leader _grp;
_leader