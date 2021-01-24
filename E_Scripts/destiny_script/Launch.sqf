#define DESTINY_HUD_speed ((uiNamespace getVariable "DESTINY_HUD_MISS") displayCtrl 98101)
#define DESTINY_HUD_HUD ((uiNamespace getVariable "DESTINY_HUD_MISS") displayCtrl 98102)
#define DESTINY_HUD_Mode ((uiNamespace getVariable "DESTINY_HUD_MISS") displayCtrl 98103)
#define DESTINY_HUD_Distance ((uiNamespace getVariable "DESTINY_HUD_MISS") displayCtrl 98104)
#define DESTINY_HUD_Radar ((uiNamespace getVariable "DESTINY_HUD_MISS") displayCtrl 98105)
closeDialog 669988;
DESTINY_Y = 0;
DESTINY_P = 0;
DESTINY_R = 0;
DESTINY_fnc_setKeyDown = {
    _HE = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call DESTINY_fnc_keyListen;"];
    player setVariable["DESTINY_HE",_HE];
};
DESTINY_fnc_createCAM = {
    Destiny_cam = "camera" camCreate getPosASL (_this # 0);
    Destiny_cam cameraEffect ["External", "BACK"];
    Destiny_cam camSetTarget (_this # 1);
    Destiny_cam camSetRelPos (_this # 2);
    showCinemaBorder false;
    false setCamUseTI 0;
    Destiny_cam camCommit 0.1;
    cameraEffectEnableHUD true;
    if (_this # 3) then {
        call DESTINY_fnc_setKeyDown;
    };
};
[_this # 0,_this # 1] spawn {
    _type = _this # 0;
    DESTINY_VLS_DAODAN = _this # 1;
    EXIT_SCRIPT = false;
    _pos = getPos player;

    cutText ["","BLACK OUT",0.5];
    _TypePos = [_pos # 0,_pos # 1,1000];
    if (_type == 2) then {
        _TypePos = [0,0,1000];
    };
    DESTINY_obj = "ammo_Missile_Cruise_01" createVehicle _TypePos;
    DESTINY_obj enableSimulation false;
    sleep 0.5;
	cutText ["","PLAIN"];

    switch _type do {
        case 0: { 
        CASobj = createVehicle ["B_Plane_CAS_01_dynamicLoadout_F", [_pos # 0,_pos # 1,1100], [], 100, "FLY"];
        DESTINY_pilot = [
            CASobj,
            [
                ["B_Fighter_Pilot_F","driver"]
            ]
        ] call BIS_fnc_initVehicleCrew;
        CASobj allowDamage false;
        _Pylon = ["pylons1","pylons2","pylons3","pylons8","pylons9","pylons10"];
        {
            CASobj setPylonLoadout [_x, "PylonRack_3Rnd_Missile_AGM_02_F",true]; 
        } forEach _Pylon;
        _CASpos = getPos CASobj;
        CASobj setPos [_CASpos # 0,_CASpos # 1,(_CASpos #2) + 2000];
        _vel = velocity CASobj;  
        _dir = direction CASobj;  
        _speed = 100; 
        CASobj setVelocity [  
        (_vel select 0) + (sin _dir * _speed),   
        (_vel select 1) + (cos _dir * _speed),   
        (_vel select 2) ];
            _XX = 60;
            _Y = 100;
            _Z = 10;
            DESTINY_obj attachTo [CASobj,[0,0,-1]];
            [DESTINY_obj,CASobj,[10,50,10],false] call DESTINY_fnc_createCAM;
            while {true} do {
                CASobj setVectorDirAndUp [
                    [ sin 0 * cos 0,cos 0 * cos 0,sin 0],
                    [[ sin 0,-sin 0,cos 0 * cos 0],-0] call BIS_fnc_rotateVector2D
                ];
                _lastTime = time;
                sleep 0.1;
                if (_XX != 30) then {
                    _XX = _XX - 1;
                };
                if (-2 < _Y) then {
                    _Y = _Y - 1;
                };
                if (_Z != 0) then {
                    _Z = _Z - 1;
                };
                if (-2 >= _Y) exitWith {
                    [Destiny_cam] spawn {
                        _j = -1;
                        while {true} do {
                            _j = _j - 0.1;
                            DESTINY_obj attachTo [CASobj,[0,0,_j]];
                            if (_j < -5) exitWith {
                                detach DESTINY_obj;
                                DESTINY_obj enableSimulation true;
                                call DESTINY_fnc_setKeyDown;
                            };
                        };
                    };
                };
                Destiny_cam camSetTarget CASobj;
                Destiny_cam camSetRelPos [_XX,_Y,_Z]; 
                Destiny_cam camcommit 5 * (time - _lastTime);
            };
        };
        case 1: { 
            DESTINY_obj enableSimulation true;
            [DESTINY_obj,DESTINY_obj,[0,-10,0],true] call DESTINY_fnc_createCAM;
        };
        case 2: { 
            _objUpVector = vectorUp DESTINY_VLS_DAODAN;
            _dirVector = vectorDir DESTINY_VLS_DAODAN;
            _oldPOS = getPosASL DESTINY_VLS_DAODAN;
            deleteVehicle DESTINY_VLS_DAODAN;
            DESTINY_obj setVectorDirAndUp [_dirVector,_objUpVector];
            DESTINY_obj setPosASL _oldPOS;
            DESTINY_obj enableSimulation true;
            [DESTINY_obj,DESTINY_obj,[10,50,10],false] call DESTINY_fnc_createCAM;
            sleep 3;
        };
        default {EXIT_SCRIPT=true;};
    };
    if (EXIT_SCRIPT) exitWith {};
    _lastpos = getPosASL DESTINY_obj;
    _dir = getDir DESTINY_obj;
    DESTINY_Radar = 4000;
    _handlerID = addMissionEventHandler ["Draw3D", {
        {
            if ((alive _x) and (DESTINY_obj distance _x) <= DESTINY_Radar and (side group player) != (side group _x)) then {

                _M = format["%1米 ",round (DESTINY_obj distance _x)];
                if ((vehicle _x) != _x) then {
                    drawIcon3D ["a3\ui_f\data\gui\Cfg\Hints\icon_text\n_unknown_ca.paa", [1,1,1,1], ASLToAGL getPosASL _x, 1, 1, 45, _M + "[载具]",0, 0.03, "PuristaMedium","center",true];
                }else{
                    drawIcon3D ["a3\ui_f\data\gui\Cfg\Cursors\scroll_gs.paa", [1,1,1,1], ASLToAGL getPosASL _x, 1, 1, 45,_M + "[步兵]", 1, 0.03, "PuristaMedium","center",true];
                };
                
            };
        } forEach allUnits;
    }];
    [_type]spawn {
        _type = _this # 0;
        sleep 3;
        player setVariable["DESTINY_Perspective",[true,0]];
        switch _type do {
            case 0: {
                deleteVehicle CASobj;
            };
            case 2: {
                call DESTINY_fnc_setKeyDown;
            };
        };
        player setVariable["DESTINY_N",0];
    };
    while {!(isNull DESTINY_obj)} do {
        _Perspective = player getVariable ["DESTINY_Perspective",[false,-1]];
        if (_Perspective # 0) then {
            cutText ["","BLACK OUT"];
            _hide = switch (_Perspective # 1) do {
                case 0: {true};
                case 1: {false};
            };
            sleep 1;
            DESTINY_obj hideObject _hide;
            cutText ["","BLACK IN"];
            player setVariable["DESTINY_Perspective",[false,(_Perspective # 1)]];
        };
        _n = player getVariable ["DESTINY_N",8];
        _lastTime = time;
        _lastpos = getPosASL DESTINY_obj;
        _dir = getDir DESTINY_obj;
        sleep 0.01;
        Destiny_cam camSetTarget DESTINY_obj;
        Destiny_cam camSetRelPos (player getVariable ["DESTINY_POS",[0,-5,0]]);
        if(_n >= 0 && _n < 8) then{
		    true setCamUseTI _n;
        }else{
            false setCamUseTI 0;
        };
		_vel = velocity DESTINY_obj;
		_spd = (_vel distance [0,0,0]) max 1;
		_perspectiveText= switch (_Perspective # 1) do {
                case 0: {"第一人称"};
                case 1: {"第三人称"};
				default {"关闭"};
        };
		_modeText = switch _n do {
                case 0: {"白热"};
                case 1: {"黑热"};
				case 2: {"绿色"};
				case 3: {"深绿"};
				case 4: {"浅红"};
				case 5: {"深红"};
				case 6: {"暗红"};
				case 7: {"散热"};
				default {"关闭"};
        };
		_distancePOS = getPosASL DESTINY_obj;
		_meters = _distancePOS distance [_distancePOS # 0,_distancePOS # 1,0];
		cutRsc ["DESTINY_HUD_MISS","PLAIN"];
		DESTINY_HUD_speed ctrlSetText format["速度:                     %1 km/h",round _spd];
		DESTINY_HUD_HUD ctrlSetText format["视角:                     %1 (R)",_perspectiveText];
		DESTINY_HUD_Mode ctrlSetText format["模式:                     %1 (N)",_modeText];
		DESTINY_HUD_Distance ctrlSetText format["高度:                     %1 米",round _meters];
        DESTINY_HUD_Radar ctrlSetText format["雷达:                     %1 米 (F)",DESTINY_Radar];
        Destiny_cam camcommit 5 * (time - _lastTime);
    };
    player setVariable["DESTINY_N",8];
	Destiny_cam camSetPos [(_lastpos select 0) - 200*sin(_dir), (_lastpos select 1)-200*cos(_dir), (_lastpos select 2) + sin(45)*200];
	Destiny_cam camCommit 5;
	Destiny_cam camSetTarget _lastpos;
	_endTime = time + 5;
	while {time<_endtime} do {
        sleep 1
    };
    Destiny_cam cameraeffect ["terminate", "back"];
	camDestroy Destiny_cam;
    cutText ["","BLACK IN"];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown",player getVariable["DESTINY_HE",0]];
    removeMissionEventHandler ["Draw3D",_handlerID];
};