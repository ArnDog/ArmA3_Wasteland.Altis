/*
	Script by : Soolie & ScoobySnax
	Date : 5/12/2014
	Tutorial : http://www.youtube.com/user/MikeSulo
	
	All helicopters will refuel/repair/rearm after landing on any vanilla Arma 3 helipad
	To add/remove helipads, go to scripts\helipadInit.sqf
	While the repair is going on the player receives a few messages about the status of the vehicle
	One of these is the model name of the vehicle
	If you are using helis from a mod and want the helipad to return a model name you must insert some new code
	This is for the little bird 
	
				if (typeOf _heli == "B_Heli_Light_01_F") then {
			_heli vehicleChat format ["Model: MH-9, Little Bird"];
			};
			;
			
	Copy the code below and paste it under the others (about 125 lines down)
	Change className and the message
	Also you can customize the ones I did below

				if (typeOf _heli == "className") then {
			_heli vehicleChat format ["Message"];
			};
			;



*/

serialno = serialno + 1;
serial = serialno;



if (heliPadOn > 0) then {
	if (true) exitWith {};
	}
	else
		{
		heliPadOn = 1;
		
		_heli = vehicle player;
		_Ucount = ({_x in _heli} count units _heli);
		_Pcount = _Ucount - 1;
		_mass = getMass _heli;
		_masskg = _mass * 2.2;
		
		_heli setVehicleAmmo 1;
		_heli_fuel = fuel _heli;
		_heli setFuel 0;
		
		
		sleep 0.2;	
		heli_cam = _heli;
			heliCam = [heli_cam,false] call addCamera;  
			_nil = [] spawn {   
				[heliCam,true] call startCinematic;		
				[heliCam,heli_cam,false,11] call panAround;   
			};
			_helitype = typeOf _heli;
			sleep 3.5;
			
			
			
			_heli say "DING";
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			_heli vehicleChat format ["Hello %1", name player];
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			sleep 2;
			_heli vehicleChat format ["Welcome to HelipadBot v1.5"];
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			sleep 2;
			_heli vehicleChat format ["Retrieving Vehicle Information"];
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			sleep 1.5;
			
			
			_heli vehicleChat format ["Loading......"];
			sleep 0.2;
			_heli vehicleChat format ["Loading........"];
			sleep 0.2;
			_heli vehicleChat format ["Loading.........."];
			sleep 0.2;
			_heli vehicleChat format ["Loading............"];
			sleep 0.2;
			_heli vehicleChat format ["Loading.............."];
			sleep 0.2;
			_heli vehicleChat format ["Loading................"];
			sleep 0.2;
			_heli vehicleChat format ["Loading.................."];
			sleep 0.2;
			_heli vehicleChat format ["Loading...................."];
			sleep 0.2;
			_heli vehicleChat format ["Loading......................"];
			sleep 1;
			
			_heli say "DING";
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];	
			if (typeOf _heli == "B_Heli_Light_01_F") then {
			_heli vehicleChat format ["Model: MH-9, Little Bird"];
			};
			;
			
			if (typeOf _heli == "B_Heli_Light_01_armed_F") then {
			_heli vehicleChat format ["Model: AH-9, Armed Little Bird"];
			};
			;
			
			if (typeOf _heli == "I_Heli_Transport_02_F") then {
			_heli vehicleChat format ["Model: AH-99, Blackfoot"];
			};
			;
			if (typeOf _heli == "I_Heli_Transport_02_F") then {
			_heli vehicleChat format ["Model: CH-49, Mohawk"];
			};
			;
			if (typeOf _heli == "O_Heli_Attack_02_F") then {
			_heli vehicleChat format ["Model: Mi-48, Kajman"];
			};
			;
			if (typeOf _heli == "O_Heli_Attack_02_black_F") then {
			_heli vehicleChat format ["Model: Mi-48, Kajman Black"];
			};
			;
			if (typeOf _heli == "O_Heli_Light_02_F") then {
			_heli vehicleChat format ["Model: PO-30, Orca"];
			};
			;
			if (typeOf _heli == "O_Heli_Light_02_unarmed_F") then {
			_heli vehicleChat format ["Model: PO-30, Orca Black"];
			};
			;
			if (typeOf _heli == "B_Heli_Transport_01_F") then {
			_heli vehicleChat format ["Model: UH-80, Ghosthawk"];
			};
			;
			if (typeOf _heli == "B_Heli_Transport_01_camo_F") then {
			_heli vehicleChat format ["Model: UH-80, Ghosthawk Camo"];
			};
			;
			if (typeOf _heli == "I_Heli_light_03_F") then {
			_heli vehicleChat format ["Model: WY-55, Hellcat"];
			};
			;
			if (typeOf _heli == "I_Heli_light_03_unarmed_F") then {
			_heli vehicleChat format ["Model: WY-55, Hellcat Green"];
			};
			;
			
			
			
			
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			sleep 2;
			_heli say "DING";
			_heli vehicleChat format ["Serial No: #H%1", serial];
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			sleep 2;
			_heli say "DING";
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			_heli vehicleChat format ["Weight: %1 lb", round _mass];
			_heli vehicleChat format ["        %1 kg", round _masskg];
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			sleep 2;
			_heli say "DING";
			_heli vehicleChat format ["Passengers: %1", _Pcount];
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			sleep 2;
			_heli vehicleChat format ["Checking Vehicle Damage"];
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			sleep 1.5;
			_heli vehicleChat format ["Loading......"];
			sleep 0.2;
			_heli vehicleChat format ["Loading........"];
			sleep 0.2;
			_heli vehicleChat format ["Loading.........."];
			sleep 0.2;
			_heli vehicleChat format ["Loading............"];
			sleep 0.2;
			_heli vehicleChat format ["Loading.............."];
			sleep 0.2;
			_heli vehicleChat format ["Loading................"];
			sleep 0.2;
			_heli vehicleChat format ["Loading.................."];
			sleep 0.2;
			_heli vehicleChat format ["Loading...................."];
			sleep 0.2;
			_heli vehicleChat format ["Loading......................"];
			sleep 1;
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			if ((getDammage _heli) < 0.00001) then {
				_heli say "DING";
				_heli vehicleChat format ["Vehicle Not Damaged"];
				_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~"];
				sleep 1;
				}
				else
					{	
					_heli setDamage 0;
					_heli say "DING";
					_heli vehicleChat format ["Repairing Vehicle"];
					_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~"];
					sleep 0.2;	
					_heli vehicleChat format ["Please Wait..............."];
					
					sleep 0.5;
					_heli say "REPAIR";
					sleep 1.5;
			};
			
			//
			_mags = getArray(configFile >> "CfgVehicles" >> _helitype >> "magazines");
			if (count _mags > 0) then {
				_magnone = [];
				{
					if (!(_x in _magnone)) then {
						_heli removeMagazines _x;
						_magnone = _magnone + [_x];
					};
				} forEach _mags;
				{
					_heli say "CLUNK";
					sleep 0.2;
					_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
					_heli say "DING";
					_heli vehicleChat format ["Resupplying Ammo %1", _x];
					_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
					sleep 0.5;	
					_heli vehicleChat format ["Please Wait.............."];
					_heli say "CLUNK";
					_heli addMagazine _x;
					sleep 0.3;
				} forEach _mags;
			};
			_heli say "DING";
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			_heli vehicleChat format ["Checking Fuel Tank"];
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			sleep 1.5;
			_heli vehicleChat format ["Loading......"];
			sleep 0.2;
			_heli vehicleChat format ["Loading........"];
			sleep 0.2;
			_heli vehicleChat format ["Loading.........."];
			sleep 0.2;
			_heli vehicleChat format ["Loading............"];
			sleep 0.2;
			_heli vehicleChat format ["Loading.............."];
			sleep 0.2;
			_heli vehicleChat format ["Loading................"];
			sleep 0.2;
			_heli vehicleChat format ["Loading.................."];
			sleep 0.2;
			_heli vehicleChat format ["Loading...................."];
			sleep 0.2;
			_heli vehicleChat format ["Loading......................"];
			_heli setVehicleAmmo 1;	
			_heli setFuel _heli_fuel;	
			sleep 0.2;
			
			if (_heli_fuel > 0.95) then {
				_heli say "DING";
				_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~"];
				_heli vehicleChat format ["Fuel Tank Full"];
				_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~"];
				sleep 2.8;
				}
				else
					{
					while {fuel _heli < 0.33} do {
						_heli setFuel 0.34;
						_heli say "CLUNK";
						_heli vehicleChat format ["Refuelng..........."];
						sleep 0.8;						
					};
					while {fuel _heli < 0.66} do {
						_heli setFuel 0.67;
						_heli say "CLUNK";
						_heli vehicleChat format ["Refuelng..........."];
						sleep 0.8;
					};
					while {fuel _heli < 0.99} do {
						_heli setFuel 1;
						_heli say "DING";
						_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~"];
						_heli vehicleChat format ["Fuel Tank Full"];
						_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~"];								
					};	
			};
			
			_heli engineOn true;
			sleep 2;
			_heli say "DING";
			sleep 0.4;			
			_heli say "DING";	
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			_heli vehicleChat format ["YOU'RE CLEAR FOR TAKEOFF"];
			_heli vehicleChat format ["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"];
			sleep 45;
			if (true) exitWith {};
};

