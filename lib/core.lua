local Autoloot = select(2,...);
local Locales = select(2,...);

-------------------------------------------------------------------------------------------------------

function Autoloot:PrintWelcomeMessage()

	if Autoloot.Preferences.DisableLoginMsg == false then
		Autoloot.Console:Print("Autoloot loaded, use ["..Autoloot.Console.Prefix.."] for the Console") --//Englischer Text, der Einfachheit halber
	end
end

-------------------------------------------------------------------------------------------------------

function Autoloot:ToggleDisableLoginMsg()
	if Autoloot.Preferences.DisableLoginMsg == true then
		Autoloot.Preferences.DisableLoginMsg = false;
	else
		Autoloot.Preferences.DisableLoginMsg = true;
	end
	
	Autoloot:Printf(Autoloot.Locale.Strings["CORE_DISABLE_LOGIN_MSG_STATUS_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.DisableLoginMsg).."]");
end

-------------------------------------------------------------------------------------------------------

function Autoloot:PrintDisableLoginMsg()
	Autoloot:Printf(Autoloot.Locale.Strings["CORE_DISABLE_LOGIN_MSG_STATUS"].." -> ["..tostring(Autoloot.Preferences.DisableLoginMsg).."]");
end

-------------------------------------------------------------------------------------------------------

function Autoloot:ToggleDebugMode()
	if Autoloot.Preferences.Debug == true then
		Autoloot.Preferences.Debug = false;
	else
		Autoloot.Preferences.Debug = true;
	end
	
	Autoloot:Printf(Autoloot.Locale.Strings["CORE_AUTOLOOT_DEBUGMODE_STATUS_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.Debug).."]");
end

-------------------------------------------------------------------------------------------------------

function Autoloot:PrintDebugMode()
	Autoloot:Printf(Autoloot.Locale.Strings["CORE_AUTOLOOT_DEBUGMODE_STATUS"].." -> ["..tostring(Autoloot.Preferences.Debug).."]");
end

-------------------------------------------------------------------------------------------------------
--//Überprüft welche Sprache der Client benutzt, um anhand dieser Informationen die korrekten Sprachfiles laden zu können

function Autoloot:GetLocale()

	local _Locale = GetLocale();
	
	if _Locale == Autoloot.Locale.German then
		Autoloot.Language = Autoloot.Locale.German
	elseif _Locale == Autoloot.Locale.English then
		Autoloot.Language = Autoloot.Locale.English;
	end
	
	Autoloot:Printf("STATIC TEXT :: The Client uses the Language [".._Locale.."]");
end

-------------------------------------------------------------------------------------------------------

function Autoloot:SetForceLanguage(Language)
	Autoloot.Preferences.ForceLocale = Language;
	Autoloot:Printf(Autoloot.Locale.Strings["CORE_FORCE_LANGUAGE_CHANGED_TO"].." ["..Autoloot.Preferences.ForceLocale.."]");
end

-------------------------------------------------------------------------------------------------------

function Autoloot:GetForceLanguage()
	Autoloot:Printf(Autoloot.Locale.Strings["CORE_FORCE_LANGUAGE"].." -> ["..Autoloot.Preferences.ForceLocale.."]");
end

-------------------------------------------------------------------------------------------------------

--//Setzt die Addonsprache auf die des Clients insofern eine Übersetzung vorhanden ist. Falls nicht wird Englisch verwendet
--//Die Sprache muss vorher mit Autoloot:GetLocale() eingelesen werden !
--//Texte sind in Englisch, da zu dieser Zeit noch keine Sprachen geladen wurden

function Autoloot:SetAddonLanguage()

	if Autoloot.Preferences.ForceLocale ~= Autoloot.Locale.None then
		Autoloot:Printf("STATIC TEXT :: The Client uses locale ["..Autoloot.Language.."], but ["..Autoloot.Preferences.ForceLocale.."] is forced by Autoloot Options");
		Autoloot.Language = Autoloot.Preferences.ForceLocale;
	end

	if Autoloot.Language == Autoloot.Locale.German then
		Autoloot.Locale.Strings = Locales.German
		Autoloot:Printf("STATIC TEXT :: Language set to [Deutsch]");
	elseif Autoloot.Language == Autoloot.Locale.English then
		Autoloot.Locale.Strings = Locales.English
		Autoloot:Printf("STATIC TEXT :: Language set to [Englisch]");
	else
		Autoloot.Locale.Strings = Locales.English
		Autoloot:Printf("STATIC TEXT :: Language set to [Englisch], but the Client uses a 'Unknown' Language (No Translation)");
	end
end

-------------------------------------------------------------------------------------------------------

--//Gibt die Autoloot Version zurück

function Autoloot:GetVersion()
	return GetAddOnMetadata(Autoloot.AddonName, "Version") 
end

-------------------------------------------------------------------------------------------------------

function Autoloot:GetAuthor()
	return GetAddOnMetadata(Autoloot.AddonName, "Author") 
end

-------------------------------------------------------------------------------------------------------

--//Speichert die momentanen Variabelwerte aus defines.lua in einer Datei im WTF - Ordner ab
--//Speichervariablen müssen in der TOC Definiert werden

function Autoloot:SaveVariablesToWTF()
	Preferences = Autoloot.Preferences;
	Blacklist = Autoloot.Blacklist;
	Lootlog = Autoloot.Lootlog;
	ForceReset = Autoloot.ForceReset;
end

-------------------------------------------------------------------------------------------------------

--//Gibt die Werte der SavedVariables in dem Chatfenster aus

function Autoloot:PrintSavedVariables()
	for _Key,_Value in pairs(Preferences) do 
		Autoloot:Printf(Autoloot.Locale.Strings["KEY"].." [".._Key.."], "..Autoloot.Locale.Strings["VALUE"].." ["..tostring(_Value).."]");
	end
end

-------------------------------------------------------------------------------------------------------

--//Durchläuft [Source] und überprüft, ob die [Value] des Keys eine Table ist. Falls ja wird die Funktion Rekursiv aufgerufen, um eine ebene Tiefer auf der TABLE
--//zu Springen. Überprüft außerdem, ob der Wert "nil" ist, falls ja wird der Standardwert aus [Default] geladen. In [Destination] werden diese Werte dann kopiert.

function Autoloot:CopyTableValues(Source, Destination, Default)

	if Source ~= nil then

		for _Key,_Value in pairs(Source) do 
		
			if _Key == nil then
				if type(_Value) == "table" then
					--Autoloot:Printf("RECURSIVE CALL :: TABLE [".._Key.."], Value ["..tostring(_Value).."], loading from default");
					Autoloot:CopyTableValues(_Value, Default[_Key])
				else
					--Autoloot:Printf("VALUE :: KEY [".._Key.."], Value [nil], loading default");
					Destination[_Key] = Default[_Key];
				end
			else
				if type(_Value) == "table" then
					--Autoloot:Printf("RECURSIVE CALL :: TABLE [".._Key.."], Value ["..tostring(_Value).."]");
					Autoloot:CopyTableValues(_Value, Destination[_Key])
				else
					--Autoloot:Printf("VALUE :: KEY [".._Key.."], Value ["..tostring(_Value).."]");
					Destination[_Key] = _Value;
				end
			end
		end
	end
end

-------------------------------------------------------------------------------------------------------

--//Läd die in der im WTF - Ordner befindenden Speicherdateien, welche die Werte der Variable aus der letzten Sitzug enthalten
--//Speichervariablen müssen in der TOC Definiert werden

function Autoloot:LoadVariablesFromWTF()
	Autoloot:CopyTableValues(Preferences, Autoloot.Preferences, Autoloot.Preferences)
	Autoloot:CopyTableValues(Blacklist, Autoloot.Blacklist, Autoloot.Blacklist)
	Autoloot:CopyTableValues(Lootlog, Autoloot.Lootlog, Autoloot.Lootlog)
	
	Autoloot.ForceReset = ForceReset
	Autoloot:Printf("STATIC TEXT :: Properties Loaded, but no Language Module");
end

-------------------------------------------------------------------------------------------------------

function Autoloot:CallResetPreferences()

	if Autoloot.ForceReset == false then
		Autoloot.ForceReset = true;
		Autoloot:Printf(Autoloot.Locale.Strings["CORE_RESET_DO_RELOAD_ALERT"]);
	else
		Autoloot:Printf(Autoloot.Locale.Strings["CORE_RESET_ALREADY_STARTED"]);
	end
	
	Autoloot:Printf("Type ["..Autoloot.Console.Prefix.." Dev Cancel Reset] to Cancel the Reset"); --//Englischer Text, der Einfachheit halber
	
end

-------------------------------------------------------------------------------------------------------

function Autoloot:CancelCallResetPreferences()
	
	if Autoloot.ForceReset == true then
		Autoloot.ForceReset = false;
		Autoloot:Printf(Autoloot.Locale.Strings["CORE_CANCEL_RESET_SUCCESSFUL"]);
	else
		Autoloot:Printf(Autoloot.Locale.Strings["CORE_CANCEL_RESET_FAILED"]);
	end
	
end

-------------------------------------------------------------------------------------------------------

function Autoloot:LoadVariablesFromDefault()
	Autoloot:CopyTableValues(Autoloot.Preferences, Autoloot.Preferences, Autoloot.Preferences)
	Autoloot:CopyTableValues(Autoloot.Blacklist, Autoloot.Blacklist, Autoloot.Blacklist)
	Autoloot:CopyTableValues(Autoloot.Lootlog, Autoloot.Lootlog, Autoloot.Lootlog)
	Autoloot.ForceReset = false
	Autoloot:Printf(Autoloot.Locale.Strings["CORE_PROPERTIES_DEFAULT_VALUES_LOADED"]);
end

-------------------------------------------------------------------------------------------------------

--//Wandelt den übergeben Qualitäts-Integer zu der Tatsächlichen Qualität als Farbstring
--//Rückgaben:
--//Everything -> Loote alles
--//Grey 	   -> Loote größer gleich Grau
--//White	   -> Loote größer gleich Weiß
--//Green	   -> Loote größer gleich Grün
--//Blue	   -> Loote größer gleich Blau
--//Epic	   -> Nicht Funktionsfähig

function Autoloot:QualityToString(Quality)

	if Quality == Autoloot.Quality.Everything then 
		return Autoloot.Locale.Strings["QUALITY_EVERYTHING"]
	elseif Quality == Autoloot.Quality.Grey then 
		return Autoloot.Locale.Strings["QUALITY_GREY"]
	elseif Quality == Autoloot.Quality.White then 
		return Autoloot.Locale.Strings["QUALITY_WHITE"]
	elseif Quality == Autoloot.Quality.Green then 
		return Autoloot.Locale.Strings["QUALITY_GREEN"]
	elseif Quality == Autoloot.Quality.Blue then 
		return Autoloot.Locale.Strings["QUALITY_BLUE"]
	elseif Quality == Epic then 
		return Autoloot.Locale.Strings["QUALITY_EPIC"]
	end
	
end

-------------------------------------------------------------------------------------------------------

--//Ermittelt ob [Item] tatsächlich Existiert
--//Rückgaben
--//Item Existiert 			-> True
--//Item Existiert nicht 	-> False

function Autoloot:DoItemExist(Item)
	local itemName = GetItemInfo(Item);
	
	if itemName ~= nil then
		return true;
	end
	
	return false;
end

-------------------------------------------------------------------------------------------------------

--//Gibt [Text] im Chatfenster aus, falls Autoloot im Debug-Mods ist

function Autoloot:Printf(Text)
	if Autoloot.Preferences.Debug == true then
		print("|cFF99ff66 [Autoloot Internal]: |r"..Text);
	end
end

-------------------------------------------------------------------------------------------------------