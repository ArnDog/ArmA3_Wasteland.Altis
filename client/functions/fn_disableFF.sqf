
_target = _this select 0;

_target addEventHandler["HandleDamage",{
	_unit = _this select 0;
	_selection = _this select 1;
	_damage = _this select 2;
	_source = _this select 3;
	if ((isPlayer _source) && {side _source == side _unit}) then {
		false
	};
}];