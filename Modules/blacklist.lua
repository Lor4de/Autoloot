local Autoloot = LibStub("AceAddon-3.0"):GetAddon("Autoloot")

--//Schalter zum Aktivieren / Deaktivieren des Blacklist-Modules
--//Der Vorhandene Wert wird immer Invertiert

function Autoloot:ToggleBlacklist()
	if Autoloot.Preferences.Blacklist.Enabled == true then
		Autoloot.Preferences.Blacklist.Enabled = false;
	else
		Autoloot.Preferences.Blacklist.Enabled = true;
	end
	
	Autoloot.Console:Print(Autoloot.Locale.Strings["BLACKLIST_STATUS_CHANGED_TO"].." ->["..tostring(Autoloot.Preferences.Blacklist.Enabled).."]");
end

-------------------------------------------------------------------------------------------------------

function Autoloot:ToggleBlacklistInverted()
	if Autoloot.Preferences.Blacklist.Inverted == true then
		Autoloot.Preferences.Blacklist.Inverted = false;
	else
		Autoloot.Preferences.Blacklist.Inverted = true;
	end
	
	Autoloot.Console:Print(Autoloot.Locale.Strings["BLACKLIST_INVERT_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.Blacklist.Inverted).."]");
end

-------------------------------------------------------------------------------------------------------

--//Gibt den Status der Blacklist im Chatfenster aus

function Autoloot:PrintBlacklistEnabled()
	Autoloot.Console:Print(Autoloot.Locale.Strings["BLACKLIST_STATUS"].." -> ["..tostring(Autoloot.Preferences.Blacklist.Enabled).."]")
end

-------------------------------------------------------------------------------------------------------

--//Gibt im Chatfenster aus ob die Blacklist invertiert ist

function Autoloot:PrintBlacklistInverted()
	Autoloot.Console:Print(Autoloot.Locale.Strings["BLACKLIST_INVERT_STATUS"].." -> ["..tostring(Autoloot.Preferences.Blacklist.Inverted).."]")
end

-------------------------------------------------------------------------------------------------------

--//Fügt [Item] zu der Blacklist hinzu, falls noch nicht vorhanden

function Autoloot:AddItemToBlacklist(Item)

	if Autoloot:DoItemExist(Item) == true then
		if Autoloot.Blacklist.Items[Item] == nil then
			Autoloot.Blacklist.Items[Item] = Autoloot.Blacklist.NumItems;
			Autoloot.Blacklist.NumItems = tonumber(Autoloot.Blacklist.NumItems) + 1;
			Autoloot.Console:Print(Autoloot.Locale.Strings["ITEM"]..": ["..Item.."] "..Autoloot.Locale.Strings["BLACKLIST_ITEM_ADDED"]);
		end
	end
end

-------------------------------------------------------------------------------------------------------

--//Entfernt das Element [Item] aus der Blacklist falls vorhanden

function Autoloot:RemoveItemFromBlacklist(Item)

	if Autoloot:DoItemExist(Item) == true then
		if Autoloot.Blacklist.Items[Item] ~= nil then
			Autoloot.Blacklist.Items[Item] = nil;
			Autoloot.Blacklist.NumItems = Autoloot.Blacklist.NumItems - 1;
			Autoloot.Console:Print(Autoloot.Locale.Strings["ITEM"]..": ["..Item.."] "..Autoloot.Locale.Strings["BLACKLIST_ITEM_ADDED"]);
		end
	end
end

-------------------------------------------------------------------------------------------------------

--//Leert die komplette Blacklist

function Autoloot:ClearBlacklist()
	Autoloot.Blacklist.Items = nil;
	Autoloot.Blacklist.NumItems = 0;
	Autoloot.Console:Print(Autoloot.Locale.Strings["BLACKLIST_CLEARED"]);
end

-------------------------------------------------------------------------------------------------------

--//Überprüft ob [Item] in der Blacklist vorhanden ist
--//Rückgaben:
--//Vorhanden 			-> True
--//Nicht Vorhanden 	-> False

function Autoloot:BlacklistContainsItem(Item)
	if Autoloot.Blacklist.Items[Item] ~= nil then
	
		Autoloot:Printf(Autoloot.Locale.Strings["ITEM"]..": ["..Item.."] "..Autoloot.Locale.Strings["BLACKLIST_ITEM_FOUND"]);
		return true;
	end
	
	Autoloot:Printf(Autoloot.Locale.Strings["ITEM"]..": ["..Item.."] "..Autoloot.Locale.Strings["BLACKLIST_ITEM_NOT_FOUND"]);
	return false;
end

-------------------------------------------------------------------------------------------------------

--//Gibt Zurück, ob die Blacklist leer ist
--//Rückgaben:
--//Leer 		-> True
--//Nicht Leer  -> False

function Autoloot:BlacklistIsEmpty()
	if Autoloot.Blacklist.NumItems < 1 then
		return true;
	end
	
	return false;
end

-------------------------------------------------------------------------------------------------------

--//Gibt alle Elemente in der Blacklist im Chatfenster aus

function Autoloot:PrintBlacklist()

	Autoloot.Console:Print("--- Autoloot Blacklist ---");
	
	if Autoloot:BlacklistIsEmpty() == false then
		for _Key,_Value in pairs(Autoloot.Blacklist.Items) do 
			Autoloot.Console:Print(Autoloot.Locale.Strings["ITEM"].." [".._Key.."], "..Autoloot.Locale.Strings["INDEX"].." ["..tostring(_Value).."]");
		end
	else
		Autoloot.Console:Print(Autoloot.Locale.Strings["BLACKLIST_EMPTY_CAN_NOT_PRINT"]);
	end
end

-------------------------------------------------------------------------------------------------------
	