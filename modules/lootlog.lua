local Autoloot = select(2,...);


-------------------------------------------------------------------------------------------------------

--//Überprüft ob [Item] vom Typ Geld ist. Diese Prüfung ist notwendig, um zwischen Gold und Items im Lootfenster unterscheiden zu können
--//Korrektheit der Funktion nicht bestätigt

function Autoloot:IsItemMoney(Item, Quantity) -- Testing

	if Quantity == 0 then
		return true;
	end
	
	return false;
	
end

-------------------------------------------------------------------------------------------------------

--//Schalter zum Aktivieren / Deaktivieren des Lootlog-Modules
--//Der Vorhandene Wert wird immer Invertiert

function Autoloot:ToggleLootlog()
	if Autoloot.Preferences.Lootlog.Enabled == true then
		Autoloot.Preferences.Lootlog.Enabled = false;
	else
		Autoloot.Preferences.Lootlog.Enabled = true;
	end
	
	Autoloot.Console:Print(Autoloot.Locale.Strings["LOOTLOG_STATUS_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.Lootlog.Enabled).."]");
end

-------------------------------------------------------------------------------------------------------

--//Gibt im Chatfenster aus, ob der Lootlog aktiviert ist

function Autoloot:PrintLootlogEnabled()
	Autoloot.Console:Print(Autoloot.Locale.Strings["LOOTLOG_STATUS"].." -> ["..tostring(Autoloot.Preferences.Lootlog.Enabled).."]")
end

-------------------------------------------------------------------------------------------------------

--//Fügt [Item] zum Lootlog hinzu, falls noch nicht vorhanden

function Autoloot:AddItemToLootlog(Item, Quantity)

	if Autoloot:DoItemExist(Item) == true then
		if Autoloot.Lootlog.Items[Item] == nil then
			Autoloot.Lootlog.Items[Item] = Quantity;
			Autoloot.Lootlog.NumItems = Autoloot.Lootlog.NumItems + 1;
			Autoloot:Printf(Autoloot.Locale.Strings["ITEM"].." ["..Item.."] "..Autoloot.Locale.Strings["LOOTLOG_ITEM_ADDED"]);
		end
	end
end

-------------------------------------------------------------------------------------------------------

--//Aktualisiert die Anzahl von [Item], wie oft das Item bereits gelootet wurde

function Autoloot:UpdateItemAtLootlog(Item, Quantity)
	
	if Autoloot:DoItemExist(Item) == true then
		if Autoloot.Lootlog.Items[Item] ~= nil then
			Autoloot.Lootlog.Items[Item] = Autoloot.Lootlog.Items[Item] + Quantity;
			Autoloot:Printf(Autoloot.Locale.Strings["ITEM"].." ["..Item.."] "..Autoloot.Locale.Strings["LOOTLOG_ITEM_UPDATED"].." ["..Autoloot.Lootlog.Items[Item] - Quantity.."->"..Autoloot.Lootlog.Items[Item].."]");
		end
	end
end

-------------------------------------------------------------------------------------------------------

--//Entfernt [Item] falls vorhanden von dem Lootlog

function Autoloot:RemoveItemFromLootlog(Item)

	if Autoloot:DoItemExist(Item) == true then
		if Autoloot.Lootlog.Items[Item] ~= nil then
			Autoloot.Lootlog.Items[Item] = nil;
			Autoloot.Lootlog.NumItems = Autoloot.Lootlog.NumItems - 1
			Autoloot.Console:Print(Autoloot.Locale.Strings["ITEM"].." ["..Item.."] "..Autoloot.Locale.Strings["LOOTLOG_ITEM_REMOVED"]);
		end
	end
end

-------------------------------------------------------------------------------------------------------

--//Gibt Zurück, ob der Lootlog leer ist
--//Rückgaben:
--//Leer 		-> True
--//Nicht Leer  -> False

function Autoloot:LootlogIsEmpty()
	if Autoloot.Lootlog.NumItems < 1 then
		return true;
	end
	
	return false;
end

-------------------------------------------------------------------------------------------------------

--//Leert den kompletten Lootlog

function Autoloot:ClearLootlog()
	Autoloot.Lootlog.Items = {nil};
	Autoloot.Lootlog.NumItems = 0;
	Autoloot.Console:Print(Autoloot.Locale.Strings["LOOTLOG_CLEARED"]);
end

-------------------------------------------------------------------------------------------------------

--//Überprüft ob [Item] in dem Lootlog vorhanden ist
--//Rückgaben:
--//Vorhanden 			-> True
--//Nicht Vorhanden 	-> False

function Autoloot:LootlogContainsItem(Item)
	if Autoloot.Lootlog.Items[Item] ~= nil then
	
		Autoloot:Printf(Autoloot.Locale.Strings["ITEM"].." ["..Item.."] "..Autoloot.Locale.Strings["LOOTLOG_ITEM_FOUND"]);
		return true;
	end
	
	Autoloot:Printf(Autoloot.Locale.Strings["ITEM"].." ["..Item.."] "..Autoloot.Locale.Strings["LOOTLOG_ITEM_NOT_FOUND"]);
	return false;
end

-------------------------------------------------------------------------------------------------------

--//Gibt alle Elemente des Lootlogs im Chatfenster aus

function Autoloot:PrintLootlog()

	Autoloot.Console:Print("--- Autoloot Lootlog ---");

	if Autoloot:LootlogIsEmpty() == false then
		for _Key,_Value in pairs(Autoloot.Lootlog.Items) do 
			Autoloot.Console:Print(Autoloot.Locale.Strings["ITEM"].." [".._Key.."], "..Autoloot.Locale.Strings["QUANTITY"].." ["..tostring(_Value).."]");
		end
	else
		Autoloot.Console:Print(Autoloot.Locale.Strings["LOOTLOG_EMPTY_CAN_NOT_PRINT"]);
	end
end