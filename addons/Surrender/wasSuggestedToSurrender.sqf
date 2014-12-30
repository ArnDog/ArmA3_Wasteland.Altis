//@file Version: 0.9
//@file Name: surrender.sqf
//@file Author: BadVolt
//@file Created: 20/12/2014
//@file Description: Checks if this player was suggested to surrender

//Surrender suggest longs for...

_result=false;
_name = player getVariable ["sur_suggestorName",""];
_timeout = player getVariable ["sur_suggestorTimeout",0];

switch (true) do {
	case (!isPlayer player): {}; // Not a player
	case (!alive player): {}; // Is dead
	case (!(vehicle player == player)): {}; //Is in vehicle
	case (side player in [CIVILIAN]): {}; //Is injured
	case (_timeout<=0): {}; //Timeout
	case (player getVariable ["sur_isSurrendering",false]): {}; //Had already surrendered
	case (player getVariable ["sur_gotSuggestion",false]): {_result=true};
};

if (_result) then {
	//Time is out
	if (serverTime>_timeout) then {
		waitUntil {sleep 0.5; serverTime>_timeout};
		player setVariable ["sur_isSurrendering",false,true];
		player setVariable ["sur_gotSuggestion",false,true];
		player setVariable ["sur_suggestorName",nil,true];
		player setVariable ["sur_suggestorTimeout",0,true];
		player groupChat format["You ignored %1's surrender request.",_name];
	}else{
		player groupChat format["You have been suggested to surrender by %1. You have %2 seconds to decide.", _name,ceil(_timeout-serverTime)];
	};
};
(_result);