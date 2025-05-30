local L = LibStub("AceLocale-3.0"):NewLocale("Autoloot", "deDE")

	--//Global
	L["ITEM"]											= "Item"
	L["INDEX"] 										= "Index"
	L["NAME"] 											= "Name"
	L["QUALITY"] 										= "Qualität"
	L["QUANTITY"]										= "Anzahl"
	L["ICON"] 											= "Icon"
	L["KEY"] 											= "Schlüssel"
	L["VALUE"] 										= "Wert"
	
	--//Global - Qualitäten
	L["QUALITY_EVERYTHING"] 							= "Alles"
	L["QUALITY_GREY"] 									= "Gewöhnlich"
	L["QUALITY_WHITE"] 								= "Normal"
	L["QUALITY_GREEN"] 								= "Selten"
	L["QUALITY_BLUE"] 									= "Rar"
	L["QUALITY_EPIC"] 									= "Episch"
	
	--//Locales (Sprachen)
	L["LOCALE_GERMAN"] 								= "Deutsch"
	L["LOCALE_ENGLISH"] 								= "Englisch"
	
	--//Core
	L["CORE_AUTOLOOT_LOADED"] 							= "Autoloot wurde Gelanden"
	L["CORE_AUTOLOOT_DEBUGMODE_STATUS"] 				= "AutolootDebug - Status"
	L["CORE_AUTOLOOT_DEBUGMODE_STATUS_CHANGED_TO"] 	= "AutolootDebug - Status wurde geändert zu"
	L["CORE_DISABLE_LOGIN_MSG_STATUS"] 				= "Disable Login MSG - Status"
	L["CORE_DISABLE_LOGIN_MSG_STATUS_CHANGED_TO"] 		= "Disable Login MSG - Status wurde geändert zu"
	L["CORE_LANGUAGE_CHANGED_TO"] 						= "Die Sprache wurde gesetzt zu"
	L["CORE_CLIENT_USES_LANGUAGE"] 					= "Der Client benutzt die Sprachregion"
	L["CORE_FORCE_LANGUAGE"] 							= "Force Language"
	L["CORE_FORCE_LANGUAGE_CHANGED_TO"] 				= "Force Language wurde gesetzt zu"
	L["CORE_RESET_DO_RELOAD_ALERT"] 					= "Die Einstellungen von Autoloot werden nach dem nächsten [/reload] oder Spielneustart geladen"
	L["CORE_RESET_ALREADY_STARTED"] 					= "Das Zurücksetzen der Einstellungen von Autoloot wurde bereits eingeleitet"
	L["CORE_CANCEL_RESET_SUCCESSFUL"] 					= "Das Zurücksetzten der Einstellungen von Autoloot wurde erfolgreich abgebrochen"
	L["CORE_CANCEL_RESET_FAILED"] 						= "Das Zurücksetzen der Einstellungen von Autoloot konnte nicht abgebrochen werden, da der Resetvorgang nicht gestartet wurde"
	L["CORE_PROPERTIES_LOADED"] 						= "Einstellungen wurden geladen"
	L["CORE_PROPERTIES_DEFAULT_VALUES_LOADED"] 		= "Standardwerte der Einstellungen wurden geladen, da ein Reset angefordert wurde"
	
	--//Autoroll
	L["AUTOROLL_STATUS"] 								= "Autoroll Status"
	L["AUTOROLL_STATUS_CHANGED_TO"]					= "Autoroll - Status wurde geändert zu"
	L["AUTOROLL_ROLLTYPE_GREEN_CHANGED_TO"] 			= "Autoroll - RollType für [Grün] wurde geändert"
	L["AUTOROLL_ROLLTYPE_BLUE_CHANGED_TO"] 			= "Autoroll - RollType für [Blau] wurde geändert"
	L["AUTOROLL_ROLLTYPE_GREEN"] 						= "Autoroll - RollType für [Grün]"
	L["AUTOROLL_ROLLTYPE_BLUE"] 						= "Autoroll - RollType für [Blau]"
	L["AUTOROLL_ROLL_THE_DICE"] 						= "Würfele"
	L["AUTOROLL_ITEM_AT_ROLLID"] 						= "auf den Gegenstand mit der RollID"
	
	--//Autodisable
	L["AUTODISABLE_STATUS_IN_RAIDS"] 					= "Autodisable in Raids Status"
	L["AUTODISABLE_STATUS_IN_RAIDS_CHANGED_TO"] 		= "Autodisable in Raids - Status wurde geändert zu"
	L["AUTODISABLE_STATUS_IN_GROUPS"] 					= "Autodisable in Gruppen Status"
	L["AUTODISABLE_STATUS_IN_GROUPS_CHANGED_TO"] 		= "Autodisable in Gruppen - Status wurde geändert zu"
	
	--//Blacklist
	L["BLACKLIST_STATUS_CHANGED_TO"] 					= "Blacklist - Status wurde geändert zu"
	L["BLACKLIST_INVERT_CHANGED_TO"] 					= "Blacklist - Invertierung wurde geändert zu"
	L["BLACKLIST_STATUS"] 								= "Blacklist Status"
	L["BLACKLIST_INVERT_STATUS"] 						= "Blacklist Inverted Status"
	L["BLACKLIST_CLEARED"] 							= "Blacklist wurde geleert"
	L["BLACKLIST_ITEM_FOUND"] 							= "wurde auf der Blacklist gefunden"
	L["BLACKLIST_ITEM_NOT_FOUND"] 						= "wurde nicht auf der Blacklist gefunden"
	L["BLACKLIST_EMPTY_CAN_NOT_PRINT"] 				= "Die Blacklist ist Leer, es können keine Elemente ausgegeben werden"
	L["BLACKLIST_ITEM_ADDED"] 							= "wurde zur Blacklist hinzugefügt"
	L["BLACKLIST_ITEM_REMOVED"] 						= "wurde von der Blacklist Entfernt"
	
	--//Lootlog
	L["LOOTLOG_STATUS_CHANGED_TO"]				 		= "Lootlog - Status wurde geändert zu"
	L["LOOTLOG_STATUS"] 								= "Lootlog Status"
	L["LOOTLOG_CLEARED"] 								= "Lootlog wurde geleert"
	L["LOOTLOG_ITEM_ADDED"] 							= "wurde zu dem Lootlog hinzugefügt"
	L["LOOTLOG_ITEM_REMOVED"] 							= "wurde aus dem Lootlog Entfernt"
	L["LOOTLOG_ITEM_UPDATED"] 							= "wurde Aktualisiert"
	L["LOOTLOG_ITEM_FOUND"] 							= "wurde auf dem Lootlog gefunden"
	L["LOOTLOG_ITEM_NOT_FOUND"] 						= "wurde nicht auf dem Lootlog gefunden"
	L["LOOTLOG_EMPTY_CAN_NOT_PRINT"] 					= "Der Lootlog ist Leer, es können keine Elemente ausgegeben werden"
	
	--//Autoloot
	L["AUTOLOOT_STATUS"] 								= "Autoloot Status"
	L["AUTOLOOT_QUALITY"] 								= "Autoloot Qualität"
	L["AUTOLOOT_QUALITY_CHANGED_TO"] 					= "Qualität wurde geändert zu"
	L["AUTOLOOT_STATUS_CHANGED_TO"] 					= "Autoloot - Status wurde geändert zu"
	L["ACCEPT_LOOTING_BOP"] 							= "Bestätige Looten des BoP Items auf Lootslot"
	L["AUTOLOOT_SHIFT_TO_DISABLE_STATUS"] 				= "Shift to Disable Status"
	L["AUTOLOOT_SHIFT_TO_DISABLE_CHANGED_TO"] 			= "Autoloot - ShiftToDisable wurde geändert zu"
	L["ITEMS_FOUND_IN_LOOT"] 							= "Items im Loot gefunden"
	L["LOOTING_ITEM_AT_SLOT"] 							= "Loote Item auf Slot"
	L["ITEM_AT_INDEX"] 								= "Item auf Index"
	
	--//Minprice
	L["MINPRICE_STATUS"] 								= "Minprice Status"
	L["MINPRICE_STATUS_CHANGED_TO"] 					= "Minprice - Status wurde geändert zu"
	