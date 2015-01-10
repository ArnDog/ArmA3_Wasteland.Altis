
While{true} do {
waituntil
{


//======ADD OR REMOVE CLASSNAMES HERE TO DECIDE WHICH HELIPADS WILL REFUEL/REPAIR/REARM============
//===========5]>0 MEANS YOU NEED TO BE LESS THAN 5M AWAY FOR IT TO ACTIVATE==========================

count nearestObjects [player, ["Land_HelipadCivil_F","Land_HelipadCircle_F","Land_HelipadRescue_F","Land_HelipadSquare_F","Land_HelipadEmpty_F"], 5] > 0;

//=================================================================================================
};
	if (vehicle player == player) then {
	}
	else
		{
		_Helicopter_fuel = fuel vehicle player;
		sleep 2;
		vehicle player setFuel 0;
		sleep 0.3;	
		vehicle player execVM "scripts\helipad.sqf";
		vehicle player setFuel _Helicopter_fuel;	
		sleep 120;
		heliPadOn = 0;
		};
};
