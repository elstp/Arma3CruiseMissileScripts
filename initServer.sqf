DESTINY_FASHE_VLS allowdamage false;
DESTINY_FASHE_VLS setVariable ["DESTINY_ISDELECT",false,true];
createVehicleCrew DESTINY_FASHE_VLS;
VLS_HEAD = DESTINY_FASHE_VLS addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	_AMMO_VLS = DESTINY_FASHE_VLS ammo "weapon_VLS_01";
	if (_AMMO_VLS <= 2) then {
		DESTINY_FASHE_VLS setVehicleAmmo 1; 
	};
	_player = missionNamespace getVariable ['DESTINY_IS_Plyaer',nil];
	[2,_projectile] remoteExecCall ["DESTINY_fnc_Launch",_player];
	[format ["<t color='#ff0000' size = '.8'>玩家 %1 发射了一枚巡航导弹!!!<br />",name _player],0,0,4,1,0,789] remoteExec ["BIS_fnc_dynamicText",-2];
	missionNamespace setVariable ['DESTINY_IS_ready',true,true];
}];