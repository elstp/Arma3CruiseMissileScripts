# Arma3CruiseMissileScripts-
Arma3 Cruise missile script
##### 使用例子:
*在创建一个文件 例如demo.Altis.将全部文件放到文件夹，然后在编辑器中打开使用*

MOD使用方法:
How to use MOD:

```cpp
/*
创建一个巡航导弹
Create a cruise missile
*/
call DESTINY_fnc_createMenu;
/*
直接从固定翼中创建一个巡航导弹
Create a cruise missile directly from the fixed wing
*/
[0,nil] call DESTINY_fnc_Launch;
/*
直接创建一个巡航导弹
Create a cruise missile directly
*/
  [1,nil] call DESTINY_fnc_Launch;
/*
绑定VLS发射井 从发射井中发射
Bind VLS silo Launch from silo
*/
Object addEventHandler ["Fired", {
    [2,_this # 6] call DESTINY_fnc_Launch;
}];
//从导弹发射井发射Fired from a missile silo
call DESTINY_fnc_createMenu;

//从A164发射Launched from A164
[0,nil] call DESTINY_fnc_Launch;
}];

//直接发射Direct launch
 [1,nil] call DESTINY_fnc_Launch;
}];
```
创意工坊:
https://steamcommunity.com/sharedfiles/filedetails/?id=1994956566
