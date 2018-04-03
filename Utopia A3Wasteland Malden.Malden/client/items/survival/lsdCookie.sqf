/*
	[utopia] Amaury
	lsd cookie because requested -_-
	just a copy paste from https://community.bistudio.com/wiki/Post_process_effects
*/


hungerLevel = (hungerLevel + 50) min 100; //that command synthax is god like

_success = switch (floor random 2) do { //good old switch 
	case 0 : { 
		["There is definitely something wrong with this cookie ...", 5] call mf_notify_client;
	    0 = ["WetDistortion", 300, [ 
		 20,  
		 0, 1,  
		 4.10, 3.70, 2.50, 1.85,  
		 0.0054, 0.0041, 0.05, 0.0070,  
		 1, 1, 1, 1 
		]] spawn { 
		
		params ["_name", "_priority", "_effect", "_handle"]; 
		 
		while { 
		 _handle = ppEffectCreate [_name, _priority]; 
		 _handle < 0 
		} do { 
		 _priority = _priority + 1; 
		}; 

		_handle ppEffectEnable true; 
		_handle ppEffectAdjust _effect; 
		_handle ppEffectCommit 5; 
		waitUntil {ppEffectCommitted _handle}; 
		uiSleep 20;  
		_handle ppEffectEnable false; 
		ppEffectDestroy _handle; 
		};
		true
	}; 
	case 1 : { 
		["ZA WARUDO  !", 5] call mf_notify_client; // jojo reference , don't judge me ...
		playSound "ZA_WARUDO";
	    0 = ["ColorInversion", 2500, [0.5, 0.5, 0.5]] spawn {
		params ["_name", "_priority", "_effect", "_handle"];
		while {
			_handle = ppEffectCreate [_name, _priority];
			_handle < 0
		} do {
			_priority = _priority + 1;
		};
		_handle ppEffectEnable true;
		_handle ppEffectAdjust _effect;
		_handle ppEffectCommit 5;
		waitUntil {ppEffectCommitted _handle};
		uiSleep 9; 
		_handle ppEffectEnable false;
		ppEffectDestroy _handle;
		};
		true
	}; 
	default {  
		false
	}; 
};

_success
