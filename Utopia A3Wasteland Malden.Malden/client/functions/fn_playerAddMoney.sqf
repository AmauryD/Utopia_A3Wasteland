private _amount = param [0,0,[0]];
private _player = param [1,player,[objNull]];

if(isNil {_player getVariable "cmoney"}) then {
	_player setVariable ["cmoney",0,true];
};
if(_player getVariable "cmoney" < 0) then {
	_player setVariable ["cmoney",0,true];
};

private _money = _player getVariable "cmoney";

if(_money + _amount < 0) then {
	_player setVariable ["cmoney",0,true];
}else{
	_player setVariable ["cmoney",_money + _amount,true];
};
