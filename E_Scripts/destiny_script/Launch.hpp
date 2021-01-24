class DESTINY_HUD_MISS
	{
		idd = 98100;
		duration = 4;
		fadeIn = 0;
		fadeOut = 0;
		name = "DESTINY_HUD_MISS";
		onLoad = "uiNamespace setVariable ['DESTINY_HUD_MISS',_this select 0]";
		
		class ControlsBackground
		{
			class Control618624017
			{
				type = 0;
				idc = 0;
				x = 0.00000016;
				y = -0.0749998;
				w = 1.00000025;
				h = 1.15000022;
				style = 48;
				text = "2.paa";
				colorBackground[] = {1,1,1,0};
				colorText[] = {0.2784,0.6745,0.7451,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
				
			};
			class ControlSpeed
			{
				type = 0;
				idc = 98101;
				x = 0.30000012;
				y = 0.82500011;
				w = 1;
				h = 0.05000004;
				style = 0;
				text = "速度:";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
				
			};
			class ControlPerspective
			{
				type = 0;
				idc = 98102;
				x = 0.30000012;
				y = 0.97500012;
				w = 1;
				h = 0.05000004;
				style = 0;
				text = "视角:";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
				
			};
			class ControlMode
			{
				type = 0;
				idc = 98103;
				x = 0.30000012;
				y = 0.90000011;
				w = 1;
				h = 0.05000004;
				style = 0;
				text = "模式:";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
				
			};
			class ControlRadar
			{
				type = 0;
				idc = 98105;
				x = 0.30000012;
				y = 1.11424053;
				w = 1;
				h = 0.05000004;
				style = 0;
				text = "范围:";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
				
			};
			class ControlDistance
			{
				type = 0;
				idc = 98104;
				x = 0.30000012;
				y = 1.05000012;
				w = 1;
				h = 0.05000004;
				style = 0;
				text = "高度:";
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				font = "PuristaMedium";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
				
			};
			
		};
		
	};