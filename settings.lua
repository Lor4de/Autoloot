local Autoloot = select(2,...);

--//Definiere Blacklist Table
-------------------------------------------------------------------------------------------------------
Autoloot.Blacklist = {};

Autoloot.Blacklist.NumItems 			= 0
Autoloot.Blacklist.Items = {};

	
--//Definiere Blacklist Table
-------------------------------------------------------------------------------------------------------
Autoloot.Lootlog = {};

Autoloot.Lootlog.NumItems 				= 0
Autoloot.Lootlog.Items = {};
	
--//Interface & Interface Windows
-------------------------------------------------------------------------------------------------------
Autoloot.Interface = {};
Autoloot.Interface.Windows = {};
	
--//GLOBAL
-------------------------------------------------------------------------------------------------------
Autoloot.AddonName 						= "Autoloot"
Autoloot.Language 						= Autoloot.Locale.German;
Autoloot.ForceReset 					= false;

--//Einstellungen [Module]
-------------------------------------------------------------------------------------------------------
Autoloot.Preferences = {};

Autoloot.Preferences.FirstStart 		= true;
Autoloot.Preferences.Debug 				= false;
Autoloot.Preferences.ShowMinimapButton 	= false;
Autoloot.Preferences.DisableLoginMsg	= false;

Autoloot.Preferences.ForceLocale		= Autoloot.Locale.None

	--//Automatisches Looten
-------------------------------------------------------------------------------------------------------
Autoloot.Preferences.Loot = {};
Autoloot.Preferences.Loot.Enabled	 	= true;
Autoloot.Preferences.Loot.ShiftToDisable = true;
Autoloot.Preferences.Loot.Quality 		= Autoloot.Quality.Everything;
	
	--//Schwarze Liste (Blacklist)
-------------------------------------------------------------------------------------------------------
Autoloot.Preferences.Blacklist = {};
Autoloot.Preferences.Blacklist.Enabled 	= false;
Autoloot.Preferences.Blacklist.Inverted = false;
	
	--//Loot Verlauf (Lootlog)
-------------------------------------------------------------------------------------------------------
Autoloot.Preferences.Lootlog = {};
Autoloot.Preferences.Lootlog.Enabled 	= true;
	
	--//Automatisches Würfeln (Autoroll)
-------------------------------------------------------------------------------------------------------
Autoloot.Preferences.Autoroll = {};
Autoloot.Preferences.Autoroll.Enabled 	= false;
	
Autoloot.Preferences.Autoroll.Quality = {}
	
Autoloot.Preferences.Autoroll.Quality.Green = {}
Autoloot.Preferences.Autoroll.Quality.Green.AutoRollType = Autoloot.Rolltype.None;
	
Autoloot.Preferences.Autoroll.Quality.Blue = {}
Autoloot.Preferences.Autoroll.Quality.Blue.AutoRollType = Autoloot.Rolltype.None;
	
	--//Minimaler Item-Preis
-------------------------------------------------------------------------------------------------------
Autoloot.Preferences.Minprice = {}
Autoloot.Preferences.Minprice.Enabled 	= false;
Autoloot.Preferences.Minprice.Price = 0;
		
Autoloot.Preferences.Lootdisplay = {}
Autoloot.Preferences.Lootdisplay.Enabled = false;
		
	--//Deaktiviere unter besonderen Umständen (Autodisable)
-------------------------------------------------------------------------------------------------------
Autoloot.Preferences.Autodisable = {}
Autoloot.Preferences.Autodisable.InRaids = false;
Autoloot.Preferences.Autodisable.InGroups = false;

--//Console (Für Textsteuerung über den Chat)
-------------------------------------------------------------------------------------------------------
Autoloot.Console = {};

Autoloot.Console.Enabled = true
Autoloot.Console.Prefix = "/al";
Autoloot.Console.Keywords = {};

	
	
	