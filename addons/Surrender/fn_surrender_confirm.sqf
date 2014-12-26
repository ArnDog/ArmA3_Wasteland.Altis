//@file Version: 0.9
//@file Name: surrender.sqf
//@file Author: BadVolt
//@file Created: 20/12/2014
//@file Description: Surrender for X seconds

//Surrender longs for
#define DURATION 60

_timeout=serverTime+DURATION;
[] spawn {
	player setUnitPos "up";
	
	//Set flag to true
	player setVariable ["sur_isSurrendering", true, true];
	
	//Reset the rest
	player setVariable ["sur_gotSuggestion",false,true];
	player setVariable ["sur_suggestorName",nil,true];
	
	while {player getVariable ["sur_isSurrendering", false]} do {
		player action ["Surrender", player];
		sleep 0.5;
		if (!alive player) then {
			player setVariable ["sur_isSurrendering", false, true];
		};
	};
};

[_timeout] spawn {
	_timeout=_this select 0;
	waitUntil {sleep 0.5; serverTime>_timeout};
		
	player setVariable ["sur_isSurrendering",false,true];
	player setVariable ["sur_gotSuggestion",false,true];
	player setVariable ["sur_suggestorName",nil,true];
	player setVariable ["sur_suggestorTimeout",0,true];
	[player, ""] call switchMoveGlobal;
};