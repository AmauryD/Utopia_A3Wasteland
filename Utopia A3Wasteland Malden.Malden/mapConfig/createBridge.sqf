/**
_arr = [];
{
	_arr pushBack [typeOf _x,getPosASL _x,getDir _x,[vectorDir _x,vectorUp _x]];
}foreach nearestObjects[player,["Land_Canal_Dutch_01_15m_F","Land_Canal_Dutch_01_Plate_F"],2000];
copyToClipboard _arr;
**/

if !(isServer) exitWith {};

{
	_obj = createSimpleObject [_x select 0,_x select 1];
	_obj setDir (_x select 2);
	_obj setVectorDirAndUp (_x select 3);
}foreach [["Land_Canal_Dutch_01_15m_F",[8523.38,3747.38,2.89918],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8523.38,3748.38,2.75],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_plate_F",[8534,3749,3.61073],179.513,[[0.008498,-0.999964,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8538.25,3748.5,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8538.25,3749.5,2.83228],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8553.38,3749.38,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8553.38,3750.38,2.83532],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8568.63,3750.25,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8568.63,3751.25,2.87685],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8583.88,3751.13,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8583.88,3752.13,2.92448],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8599.13,3752,2.875],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8599.13,3753,2.98652],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8614.38,3752.88,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8614.38,3753.88,3.01167],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8629.5,3753.75,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8629.5,3754.75,2.90197],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8644.75,3754.63,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8644.75,3755.63,2.90069],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8660,3755.5,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8660,3756.5,2.90521],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8675.13,3756.38,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8675.13,3757.38,2.90837],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8690.38,3758.25,2.89639],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8705.63,3758.13,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8705.63,3759.13,2.92122],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8720.88,3759,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8720.88,3760,2.91479],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8736.13,3759.88,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8736.13,3760.88,2.90761],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8751.38,3760.75,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8751.38,3761.75,2.94849],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8766.63,3761.63,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8766.63,3762.63,2.96379],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8781.75,3762.5,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8781.75,3763.5,2.9188],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8797,3763.38,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8797,3764.38,2.90369],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8812.25,3764.25,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8812.25,3765.25,2.88997],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8827.5,3765.13,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8827.5,3766.13,2.96681],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8842.75,3766,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8842.75,3767,2.9612],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8858,3766.88,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8858,3767.88,2.97521],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8873.13,3767.75,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8873.13,3768.75,3.01163],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8888.38,3768.63,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8888.38,3769.63,2.9692],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8903.63,3769.5,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8903.63,3770.5,2.94046],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8918.75,3770.38,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8918.75,3771.38,2.89721],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8934,3771.25,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8934,3772.25,2.8828],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8949.13,3772.13,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8949.13,3773.13,2.86919],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8964.25,3773,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8964.25,3774,2.85798],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8979.25,3773.75,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8979.25,3774.75,2.89401],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8994.25,3774.63,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[8994.25,3775.63,2.86012],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9009.13,3775.38,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9009.13,3776.38,2.75563],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9023.13,3776.25,3],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9023.13,3777.25,2.91799],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9038,3777,3.0108],356.706,[[-0.0574595,0.998348,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9038,3778,2.89841],175.76,[[0.0739349,-0.997263,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9050,3778,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9050,3779,2.80081],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9064,3779,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9064,3780,2.84323],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9078,3780,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9078,3781,2.87282],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9092,3781,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9092,3782,2.89123],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9105,3782,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9105,3783,2.91318],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9120,3783,3.01035],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9120,3784,3],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9135,3784,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9135,3785,2.67686],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9150,3785,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9150,3786,2.48234],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9164,3786,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9164,3787,2.55847],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9178,3787,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9178,3788,2.71246],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9193,3788,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9193,3789,2.79841],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9208,3789,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9208,3790,2.84003],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9222,3790,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9222,3791,2.84001],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9236,3791,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9236,3792,2.86153],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9251,3792,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9251,3793,2.87122],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9265,3793,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9265,3794,2.88082],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9280,3794,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9280,3795,2.89123],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9295,3795,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9295,3796,2.93601],175.76,[[0.0739266,-0.997264,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9310,3796,3],356.706,[[-0.0574671,0.998347,0],[0,0,1]]],["Land_Canal_Dutch_01_15m_F",[9310,3797,3],175.76,[[0.0739266,-0.997264,0],[0,0,1]]]];

diag_log "Malden Bridge created";