// remote-only

_groupOwner = param [0,objNull,[objNull]];

[format["You have been invited by %1 to join %2",name _groupOwner,(group _groupOwner) getVariable ["ug_group_name","(bad group type)"]],5] call mf_notify_client; 

ug_group_invite = group _groupOwner;