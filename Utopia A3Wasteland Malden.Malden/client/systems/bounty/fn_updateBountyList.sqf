_players_bounties_list = (["bounty_menu"] call ED_fnc_find) getVariable "players_bounties_list";

lbClear _players_bounties_list;

{
	_bounty = _x getVariable ["Bounty",0];
	if(_bounty > 0) then {
		_idx = _players_bounties_list lbAdd format ["%1 (%2$)",name _x,_bounty];
		_players_bounties_list lbSetValue [_idx,_bounty];
	};
}foreach allPlayers;

lbSortByValue _players_bounties_list;