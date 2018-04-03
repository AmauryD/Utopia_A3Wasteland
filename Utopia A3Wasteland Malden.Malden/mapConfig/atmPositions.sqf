// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: atmPositions.sqf
//	@file Author: AgentRev

// ATM positions for Stratis map (none...)
[[8167.75,3108.84,1.45945],[8172.41,3190.88,1.49654],[5872.12,3491.66,1.44992],[7132.96,6054.35,1.28059],[7202.25,7872.92,1.47414],[7287.38,7966.41,1.49013],[7260.18,7973.42,1.28059],[7258.75,8059.97,1.45419],[7125.24,8979.8,1.39342],[6052.45,8600.21,1.41983],[8079.39,9720.02,1.28089],[8224.61,9948.95,1.41813],[3179.48,6338.54,1.28062],[938.523,11867,1.402]]
// The above array was built using the following code snippet called from the mission editor debug console:
/*
_atms = [];
{
	if ((str _x) find ": atm_" != -1) then
	{
		_pos = _x modelToWorld [0,0,0];
		if (surfaceIsWater _pos) then
		{
			_pos = _pos vectorAdd ((getPosASL _x) vectorDiff (getPosASLW _x));
		};
		_atms pushBack _pos;
	};
} forEach nearestObjects [player, [], 99999];

copyToClipboard str _atms;
*/



