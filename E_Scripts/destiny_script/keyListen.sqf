#include "\a3\ui_f\hpp\definedikcodes.inc"
params['_d','_key','_shift_state','_control_state','_alt_state'];
private['_handled'];
_handled = false;
_n = player getVariable["DESTINY_N",-1];
switch (_key) do {
    case DIK_A:{
        if (DESTINY_Y == 0) then {
            DESTINY_Y = 360;
        };
         DESTINY_Y = DESTINY_Y - 1;
         _handled = true;
    };
    case DIK_D:{
        if (DESTINY_Y == 360) then {
            DESTINY_Y = 0;
        };
         DESTINY_Y = DESTINY_Y + 1;
          _handled = true;
    };
    case DIK_W:{
        if (DESTINY_P == 0) then {
            DESTINY_P = 360;
        };
         DESTINY_P = DESTINY_P - 1;
          _handled = true;
    };
    case DIK_S:{
        if (DESTINY_P == 360) then {
            DESTINY_P = 0;
        };
         DESTINY_P = DESTINY_P + 1;
          _handled = true;
    };
    case DIK_N:{
        _n = _n + 1;
        player setVariable["DESTINY_N",_n];
        if (_n == 8) then {
            player setVariable["DESTINY_N",-1];
        };
    };
    case DIK_F:{
        DESTINY_Radar = DESTINY_Radar + 1000;
        if (DESTINY_Radar == 11000) then {
            DESTINY_Radar = 4000;
        };
    };
    case DIK_R:{
        _Perspective = player getVariable ["DESTINY_Perspective",[false,-1]];
        _jc = _Perspective # 1;
        _jc = _jc + 1;
        if (_jc == 2) then {
            _jc = 0;
        };
        player setVariable ["DESTINY_Perspective",[true,_jc]];
    };
    
};
DESTINY_obj setVectorDirAndUp [
	[ sin DESTINY_Y * cos DESTINY_P,cos DESTINY_Y * cos DESTINY_P,sin DESTINY_P],
	[[ sin DESTINY_R,-sin DESTINY_P,cos DESTINY_R * cos DESTINY_P],-DESTINY_Y] call BIS_fnc_rotateVector2D
];
_handled;