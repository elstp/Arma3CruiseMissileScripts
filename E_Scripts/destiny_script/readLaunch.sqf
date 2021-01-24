DESTINY_FASHE_VLS = missionNamespace getVariable ["DESTINY_FASHE_VLS",nil];
_ready = missionNamespace getVariable ['DESTINY_IS_ready',true];
if (_ready) then {
	missionNamespace setVariable ['DESTINY_IS_ready',false,true];
	missionNamespace setVariable ['DESTINY_IS_Plyaer',player,true];
	[DESTINY_FASHE_VLS, "weapon_VLS_01"] call BIS_fnc_fire;
} else {
	hint "巡航导弹还没有准备好!等待其他玩家发射完毕!";
};