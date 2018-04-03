/**
@Author : [utopia] Amaury
@Creation : 2#/11/16
@Modification : ??/11/16
@Description : 
**/


disableSerialization;

private _allTickets = param[0,[],[[]]];

private _display = findDisplay 666;
private _entriesText = _display displayCtrl 1100;
private _tList = _display displayCtrl 1500;

private _myTickets = 0;
private _myTicketsResolved = 0;
private _myTicketsRefused = 0;
private _myWaitingTickets = 0;

lbClear _tList;

{
	_id = _x param[0,-1,[0]];
	_title = _x param[1,"ERROR",[""]];
	_text = _x param[2,"ERROR FROM DATABASE",[""]];
	_status = _x param[3,0,[0]];
	_uid = _x param[4,"__SERVER__",[""]];
	_pname = _x param[5,"",[""]];

	if(_uid == getPlayerUID player) then {
		_myTickets = _myTickets + 1;
		switch (_status) do { 
			case 0 : {_myWaitingTickets = _myWaitingTickets + 1}; 
			case 1 : {_myTicketsResolved = _myTicketsResolved + 1}; 
			case 2 : {_myTicketsRefused = _myTicketsRefused + 1}; 
		};
	};
 
	_index = _tList lbAdd format["[%4] #%1 %2 by %3",_id,_title,_pname,switch (_status) do { 
		case 0 : {"PENDING"}; 
		case 1 : {"SOLVED"}; 
		case 2 : {"REFUSED"}; 
		case 3 : {"IMPOSSIBLE"}; 
		case 4 : {"IN PROGRESS"};
	}];
	_tList lbSetTooltip [_index,_text];
	_tList lbSetValue [_index,-_id];
}foreach _allTickets;

lbSortByValue _tList;

_entriesText ctrlSetStructuredText parseText format ["My tickets : %1 | Fixed : %2 | Waiting : %3 | Refused : %4",_myTickets,_myTicketsResolved,_myWaitingTickets,_myTicketsRefused]