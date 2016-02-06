//Hides rocket pods and sets the Wildcat Texture


(_this select 0) setvehicleammo 0;
(_this select 0)animate ["RocketPods",1]; 
(_this select 0) setObjectTexture[0,"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_CO.paa"]; 