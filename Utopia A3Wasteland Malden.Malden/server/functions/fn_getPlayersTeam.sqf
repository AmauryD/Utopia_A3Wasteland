_array = [];

{
	if(side _x in [BLUFOR,OPFOR]) then {
		_array pushBackUnique (side _x);
	};
}forEach allPlayers;