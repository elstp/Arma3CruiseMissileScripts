player addAction ["default 1", {
    call DESTINY_fnc_createMenu;
}];
player addAction ["Demo 1", {
    [0,nil] call DESTINY_fnc_Launch;
}];
player addAction ["Demo 2", {
    [1,nil] call DESTINY_fnc_Launch;
}];