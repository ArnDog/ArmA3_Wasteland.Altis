// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04

private ["_unit", "_item", "_side", "_isSniper", "_isDiver", "_defaultVest", "_result"];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_isSniper = (["_sniper_", _unit] call fn_findString != -1);
_isDiver = (["_diver_", _unit] call fn_findString != -1);

_defaultVest = "";

_result = "";

switch (_side) do
{
	case BLUFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "backpack") then { _result = "B_AssaultPack_rgr" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "" };
				if (_item == "vest") then { _result = "V_RebreatherB" };
				if (_item == "goggles") then { _result = "" };
				if (_item == "backpack") then { _result = "B_AssaultPack_rgr" };
			};
			default
			{
				if (_item == "uniform") then { _result = "" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "backpack") then { _result = "B_AssaultPack_rgr" };
			};
		};

		if (_item == "headgear") then { _result = "" };
	};
	case OPFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "backpack") then { _result = "O_AssaultPack_rgr" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "" };
				if (_item == "vest") then { _result = "V_RebreatherIR" };
				if (_item == "goggles") then { _result = "" };
				if (_item == "backpack") then { _result = "O_AssaultPack_rgr" };
			};
			default
			{
				if (_item == "uniform") then { _result = "" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "backpack") then { _result = "O_AssaultPack_rgr" };
			};
		};

		if (_item == "headgear") then { _result = "" };
	};
	default
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "backpack") then { _result = "I_AssaultPack_rgr" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "" };
				if (_item == "vest") then { _result = "V_RebreatherIA" };
				if (_item == "goggles") then { _result = "" };
				if (_item == "backpack") then { _result = "I_AssaultPack_rgr" };
			};
			default
			{
				if (_item == "uniform") then { _result = "" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "backpack") then { _result = "I_AssaultPack_rgr" };
			};
		};

		if (_item == "headgear") then { _result = "" };
	};
};

_result
