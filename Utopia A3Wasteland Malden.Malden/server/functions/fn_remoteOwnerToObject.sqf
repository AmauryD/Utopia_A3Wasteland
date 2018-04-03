private _ownerID = param [0,remoteExecutedOwner,[0]];
private _allPlayers = +allPlayers;

{
	_id = owner _x;
	if(_ownerID == _id || _id == 2) exitWith {
		_x
	};
	objNull
}foreach _allPlayers;

