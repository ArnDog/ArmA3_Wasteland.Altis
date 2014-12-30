private["_left", "_right"];
_left = _this select 0;
_right = _this select 1;
if (isNil "_left" || {typeName _left != typeName objNull || {isNull _left}}) exitWith {};
if (isNil "_right" || {typeName _right != typeName []}) exitWith {};

_left setVectorDirAndUp _right;