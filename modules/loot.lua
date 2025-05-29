local Autoloot = select(2,...);

-------------------------------------------------------------------------------------------------------

--//Bestätigt das Looten auf [Slot] im Lootfenster (Bricht den Dialog zur Abfrage ob BoP Item aufgehoben werden soll ab)

function Autoloot:ConfirmLootBoPSlot(Slot)

	ConfirmLootSlot(Slot);
	Autoloot:Printf(Autoloot.Locale.Strings["ACCEPT_LOOTING_BOP"].." ["..Slot.."]");
end

-------------------------------------------------------------------------------------------------------

--//Ermittelt die Anzahl an Taschen (Inventar) und gibt diese Zurück

function Autoloot:GetNumBags()
	for i = 0, 5, 1 do
		if GetContainerNumSlots(i) == 0 then
			return i
		end
	end
end

-------------------------------------------------------------------------------------------------------

--//Ermittelt anhand der Anzahl an Taschen im Inventar die gesamte Anzahl an Taschenplätzen im Inventar (Belegt & Unbelegt) und gibt diese Zurück

function Autoloot:GetNumBagSlots()

	local Slots = 0

	for i = 0, Autoloot:GetNumBags(), 1 do
		Slots = Slots + GetContainerNumSlots(i);
	end
	
	return Slots
end

-------------------------------------------------------------------------------------------------------

--//Ermittelt die Anzahl an Freien Taschenplätzen im Inventar und gibt diese Zurück

function Autoloot:GetNumFreeBagSlots()

	local Slots = 0

	for i = 0, Autoloot:GetNumBags(), 1 do
		Slots = Slots + GetContainerNumFreeSlots(i);
	end
	
	return Slots
end

-------------------------------------------------------------------------------------------------------

--//Ermittelt den Prozentualen Anteil an Freien Plätzen im Inventar und gibt diesen Zurück
--//Format: [X] % von 100 % sind Freie Plätze

function Autoloot:GetNumFreeBagSlotsPercent()
	return (100 / Autoloot:GetNumBagSlots()) * Autoloot:GetNumFreeBagSlots();
end

-------------------------------------------------------------------------------------------------------

--//Schalter zum Aktivieren / Deaktivieren des Autoloot-Modules
--//Der Vorhandene Wert wird immer Invertiert

function Autoloot:ToggleAutoloot()
	if Autoloot.Preferences.Loot.Enabled == true then
		Autoloot.Preferences.Loot.Enabled = false;
	else
		Autoloot.Preferences.Loot.Enabled = true;
	end
	
	Autoloot:Printf(Autoloot.Locale.Strings["AUTOLOOT_STATUS_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.Loot.Enabled).."]");
end

-------------------------------------------------------------------------------------------------------

--//Gibt im Chatfenster aus, ob Autoloot aktiviert ist

function Autoloot:PrintAutolootEnabled()
	Autoloot.Console:Print(Autoloot.Locale.Strings["AUTOLOOT_STATUS"].." -> ["..tostring(Autoloot.Preferences.Loot.Enabled).."]")
end

-------------------------------------------------------------------------------------------------------

--//Gibt im Chatfenster aus, ob Autoloot über das Halten der Shift-Taste deaktiviert werden kann

function Autoloot:PrintAutolootShiftToDisable()
	Autoloot.Console:Print(Autoloot.Locale.Strings["AUTOLOOT_SHIFT_TO_DISABLE_STATUS"].." -> ["..tostring(Autoloot.Preferences.Loot.ShiftToDisable).."]")
end

-------------------------------------------------------------------------------------------------------

--//Gibt die Qualität ab welcher Autoloot die Items Lootet im Chatfenster aus

function Autoloot:PrintAutolootQuality()
	Autoloot.Console:Print(Autoloot.Locale.Strings["AUTOLOOT_QUALITY"].." -> ["..Autoloot:QualityToString(Autoloot.Preferences.Loot.Quality).."]")
end

-------------------------------------------------------------------------------------------------------

--//Setzt die Qualität des Autoloot-Modules auf [Qualität]

function Autoloot:SetAutolootQuality(Quality)
	Autoloot.Preferences.Loot.Quality = Quality;
	
	Autoloot:Printf(Autoloot.Locale.Strings["AUTOLOOT_QUALITY_CHANGED_TO"].." -> ["..Autoloot:QualityToString(Quality).."]");
end

-------------------------------------------------------------------------------------------------------

--//Aktiviert oder Deaktiviert, dass beim Drücken der Shifttaste das Automatische Looten Aktiviert / Deaktiviert ist

function Autoloot:ToggleShiftToDisable()
	if Autoloot.Preferences.Loot.ShiftToDisable == true then
		Autoloot.Preferences.Loot.ShiftToDisable = false;
	else
		Autoloot.Preferences.Loot.ShiftToDisable = true;
	end
	
	Autoloot:Printf(Autoloot.Locale.Strings["AUTOLOOT_SHIFT_TO_DISABLE_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.Loot.ShiftToDisable).."]");
end

-------------------------------------------------------------------------------------------------------

--//Gibt die Anzahl der Items im Lootfenster zurück

function Autoloot:GetNumLootItems()

	local _NumItems = GetNumLootItems();
	
	Autoloot:Printf("[".._NumItems.."] "..Autoloot.Locale.Strings["ITEMS_FOUND_IN_LOOT"]);
	
	return GetNumLootItems();
end

-------------------------------------------------------------------------------------------------------

--//Ermittelt das Item auf [Index] und gibt dessen Eigenschaften zurück
--// 1. Icon
--// 2. Name
--// 3. Anzahl
--// 4. Seltenheit
--// 5. Gesperrt für Spieler ?

function Autoloot:GetLootSlotItemInfo(Index)

	local _Icon, _Name, _Rarity, _Quality = GetLootSlotInfo(Index);
	
	Autoloot:Printf("--------"..Autoloot.Locale.Strings["ITEM_AT_INDEX"].."["..Index.."]--------");
	Autoloot:Printf(Autoloot.Locale.Strings["NAME"].." [".._Name.."]");
	Autoloot:Printf(Autoloot.Locale.Strings["ICON"].." [".._Icon.."]");
	Autoloot:Printf(Autoloot.Locale.Strings["QUANTITY"].." [".._Rarity.."x]");
	Autoloot:Printf(Autoloot.Locale.Strings["QUALITY"].." [".._Quality.."]");
	Autoloot:Printf("------------------------------------");
	
	return GetLootSlotInfo(Index);
end

-------------------------------------------------------------------------------------------------------

--//Lootet das Item auf [Index] im Lootfenster

function Autoloot:LootSlot(Index)
	Autoloot:Printf(Autoloot.Locale.Strings["LOOTING_ITEM_AT_SLOT"].." ["..Index.."]");
	LootSlot(Index);
end

-------------------------------------------------------------------------------------------------------

--//Überprüft ob die Shift-Taste gedrückt ist, sowie die Einstellung "Autoloot.Preferences.Loot.ShiftToDisable" aktiviert ist
--//Rückgaben:
--//ShiftToDisable + Shift-Taste gedrückt -> True
--//ShiftToDisable - Shift-Taste gedrückt -> False
--//ShiftToDisable = false 		  		  -> False

function Autoloot:IsShiftKeyDown()
	if Autoloot.Preferences.Loot.ShiftToDisable == true then
		if IsShiftKeyDown() == true then
			return true;
		end
	else
		return false;
	end	
	
	return false;
end

-------------------------------------------------------------------------------------------------------
	
	