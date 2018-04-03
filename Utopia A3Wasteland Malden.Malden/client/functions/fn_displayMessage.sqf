private _message = param [0,"",[""]];
private _mode = param [1,0,[0]];

switch (_mode) do { 
	case 0 : {  hintSilent _message }; 
	case 1 : {  [_message, 5] call mf_notify_client }; 
	default {  hint _message }; 
};