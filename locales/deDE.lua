local Locales = select(2,...);

	Locales.German = {}
	
	--//Global
	Locales.German["ITEM"]											= "Item"
	Locales.German["INDEX"] 										= "Index"
	Locales.German["NAME"] 											= "Name"
	Locales.German["QUALITY"] 										= "Qualität"
	Locales.German["QUANTITY"]										= "Anzahl"
	Locales.German["ICON"] 											= "Icon"
	Locales.German["KEY"] 											= "Schlüssel"
	Locales.German["VALUE"] 										= "Wert"
	
	--//Global - Qualitäten
	Locales.German["QUALITY_EVERYTHING"] 							= "Alles"
	Locales.German["QUALITY_GREY"] 									= "Gewöhnlich"
	Locales.German["QUALITY_WHITE"] 								= "Normal"
	Locales.German["QUALITY_GREEN"] 								= "Selten"
	Locales.German["QUALITY_BLUE"] 									= "Rar"
	Locales.German["QUALITY_EPIC"] 									= "Episch"
	
	--//Locales (Sprachen)
	Locales.German["LOCALE_GERMAN"] 								= "Deutsch"
	Locales.German["LOCALE_ENGLISH"] 								= "Englisch"
	
	--//Core
	Locales.German["CORE_AUTOLOOT_LOADED"] 							= "Autoloot wurde Gelanden"
	Locales.German["CORE_AUTOLOOT_DEBUGMODE_STATUS"] 				= "AutolootDebug - Status"
	Locales.German["CORE_AUTOLOOT_DEBUGMODE_STATUS_CHANGED_TO"] 	= "AutolootDebug - Status wurde geändert zu"
	Locales.German["CORE_DISABLE_LOGIN_MSG_STATUS"] 				= "Disable Login MSG - Status"
	Locales.German["CORE_DISABLE_LOGIN_MSG_STATUS_CHANGED_TO"] 		= "Disable Login MSG - Status wurde geändert zu"
	Locales.German["CORE_LANGUAGE_CHANGED_TO"] 						= "Die Sprache wurde gesetzt zu"
	Locales.German["CORE_CLIENT_USES_LANGUAGE"] 					= "Der Client benutzt die Sprachregion"
	Locales.German["CORE_FORCE_LANGUAGE"] 							= "Force Language"
	Locales.German["CORE_FORCE_LANGUAGE_CHANGED_TO"] 				= "Force Language wurde gesetzt zu"
	Locales.German["CORE_RESET_DO_RELOAD_ALERT"] 					= "Die Einstellungen von Autoloot werden nach dem nächsten [/reload] oder Spielneustart geladen"
	Locales.German["CORE_RESET_ALREADY_STARTED"] 					= "Das Zurücksetzen der Einstellungen von Autoloot wurde bereits eingeleitet"
	Locales.German["CORE_CANCEL_RESET_SUCCESSFUL"] 					= "Das Zurücksetzten der Einstellungen von Autoloot wurde erfolgreich abgebrochen"
	Locales.German["CORE_CANCEL_RESET_FAILED"] 						= "Das Zurücksetzen der Einstellungen von Autoloot konnte nicht abgebrochen werden, da der Resetvorgang nicht gestartet wurde"
	Locales.German["CORE_PROPERTIES_LOADED"] 						= "Einstellungen wurden geladen"
	Locales.German["CORE_PROPERTIES_DEFAULT_VALUES_LOADED"] 		= "Standardwerte der Einstellungen wurden geladen, da ein Reset angefordert wurde"
	
	--//Autoroll
	Locales.German["AUTOROLL_STATUS"] 								= "Autoroll Status"
	Locales.German["AUTOROLL_STATUS_CHANGED_TO"]					= "Autoroll - Status wurde geändert zu"
	Locales.German["AUTOROLL_ROLLTYPE_GREEN_CHANGED_TO"] 			= "Autoroll - RollType für [Grün] wurde geändert"
	Locales.German["AUTOROLL_ROLLTYPE_BLUE_CHANGED_TO"] 			= "Autoroll - RollType für [Blau] wurde geändert"
	Locales.German["AUTOROLL_ROLLTYPE_GREEN"] 						= "Autoroll - RollType für [Grün]"
	Locales.German["AUTOROLL_ROLLTYPE_BLUE"] 						= "Autoroll - RollType für [Blau]"
	Locales.German["AUTOROLL_ROLL_THE_DICE"] 						= "Würfele"
	Locales.German["AUTOROLL_ITEM_AT_ROLLID"] 						= "auf den Gegenstand mit der RollID"
	
	--//Autodisable
	Locales.German["AUTODISABLE_STATUS_IN_RAIDS"] 					= "Autodisable in Raids Status"
	Locales.German["AUTODISABLE_STATUS_IN_RAIDS_CHANGED_TO"] 		= "Autodisable in Raids - Status wurde geändert zu"
	Locales.German["AUTODISABLE_STATUS_IN_GROUPS"] 					= "Autodisable in Gruppen Status"
	Locales.German["AUTODISABLE_STATUS_IN_GROUPS_CHANGED_TO"] 		= "Autodisable in Gruppen - Status wurde geändert zu"
	
	--//Blacklist
	Locales.German["BLACKLIST_STATUS_CHANGED_TO"] 					= "Blacklist - Status wurde geändert zu"
	Locales.German["BLACKLIST_INVERT_CHANGED_TO"] 					= "Blacklist - Invertierung wurde geändert zu"
	Locales.German["BLACKLIST_STATUS"] 								= "Blacklist Status"
	Locales.German["BLACKLIST_INVERT_STATUS"] 						= "Blacklist Inverted Status"
	Locales.German["BLACKLIST_CLEARED"] 							= "Blacklist wurde geleert"
	Locales.German["BLACKLIST_ITEM_FOUND"] 							= "wurde auf der Blacklist gefunden"
	Locales.German["BLACKLIST_ITEM_NOT_FOUND"] 						= "wurde nicht auf der Blacklist gefunden"
	Locales.German["BLACKLIST_EMPTY_CAN_NOT_PRINT"] 				= "Die Blacklist ist Leer, es können keine Elemente ausgegeben werden"
	Locales.German["BLACKLIST_ITEM_ADDED"] 							= "wurde zur Blacklist hinzugefügt"
	Locales.German["BLACKLIST_ITEM_REMOVED"] 						= "wurde von der Blacklist Entfernt"
	
	--//Lootlog
	Locales.German["LOOTLOG_STATUS_CHANGED_TO"]				 		= "Lootlog - Status wurde geändert zu"
	Locales.German["LOOTLOG_STATUS"] 								= "Lootlog Status"
	Locales.German["LOOTLOG_CLEARED"] 								= "Lootlog wurde geleert"
	Locales.German["LOOTLOG_ITEM_ADDED"] 							= "wurde zu dem Lootlog hinzugefügt"
	Locales.German["LOOTLOG_ITEM_REMOVED"] 							= "wurde aus dem Lootlog Entfernt"
	Locales.German["LOOTLOG_ITEM_UPDATED"] 							= "wurde Aktualisiert"
	Locales.German["LOOTLOG_ITEM_FOUND"] 							= "wurde auf dem Lootlog gefunden"
	Locales.German["LOOTLOG_ITEM_NOT_FOUND"] 						= "wurde nicht auf dem Lootlog gefunden"
	Locales.German["LOOTLOG_EMPTY_CAN_NOT_PRINT"] 					= "Der Lootlog ist Leer, es können keine Elemente ausgegeben werden"
	
	--//Autoloot
	Locales.German["AUTOLOOT_STATUS"] 								= "Autoloot Status"
	Locales.German["AUTOLOOT_QUALITY"] 								= "Autoloot Qualität"
	Locales.German["AUTOLOOT_QUALITY_CHANGED_TO"] 					= "Qualität wurde geändert zu"
	Locales.German["AUTOLOOT_STATUS_CHANGED_TO"] 					= "Autoloot - Status wurde geändert zu"
	Locales.German["ACCEPT_LOOTING_BOP"] 							= "Bestätige Looten des BoP Items auf Lootslot"
	Locales.German["AUTOLOOT_SHIFT_TO_DISABLE_STATUS"] 				= "Shift to Disable Status"
	Locales.German["AUTOLOOT_SHIFT_TO_DISABLE_CHANGED_TO"] 			= "Autoloot - ShiftToDisable wurde geändert zu"
	Locales.German["ITEMS_FOUND_IN_LOOT"] 							= "Items im Loot gefunden"
	Locales.German["LOOTING_ITEM_AT_SLOT"] 							= "Loote Item auf Slot"
	Locales.German["ITEM_AT_INDEX"] 								= "Item auf Index"
	
	--//Minprice
	Locales.German["MINPRICE_STATUS"] 								= "Minprice Status"
	Locales.German["MINPRICE_STATUS_CHANGED_TO"] 					= "Minprice - Status wurde geändert zu"
	