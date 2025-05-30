local Autoloot = LibStub("AceAddon-3.0"):GetAddon("Autoloot")

-------------------------------------------------------------------------------------------------------

--//Schalter zum Aktivieren / Deaktivieren des Autoroll-Modules
--//Der Vorhandene Wert wird immer Invertiert

function Autoloot:ToggleAutoroll()
	if Autoloot.Preferences.Autoroll.Enabled == true then
		Autoloot.Preferences.Autoroll.Enabled = false;
	else
		Autoloot.Preferences.Autoroll.Enabled = true;
	end
	
	Autoloot:Printf(Autoloot.Locale.Strings["AUTOROLL_STATUS_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.Autoroll.Enabled).."]");
end

-------------------------------------------------------------------------------------------------------

function Autoloot:SetAutorollRollType(Color, RollType)

	local Color = string.lower(Color)

	if Color == "green" then
		Autoloot.Preferences.Autoroll.Quality.Green.AutoRollType = RollType;
		Autoloot:Printf(Autoloot.Locale.Strings["AUTOROLL_ROLLTYPE_GREEN_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.Autoroll.Quality.Green.AutoRollType).."]");
	elseif Color == "blue" then
		Autoloot.Preferences.Autoroll.Quality.Blue.AutoRollType = RollType;
		Autoloot:Printf(Autoloot.Locale.Strings["AUTOROLL_ROLLTYPE_BLUE_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.Autoroll.Quality.Blue.AutoRollType).."]");
	end
end

-------------------------------------------------------------------------------------------------------

function Autoloot:PrintAutorollRollType(Color)
	
	local Color = string.lower(Color)

	if Color == "green" then
		Autoloot:Printf(Autoloot.Locale.Strings["AUTOROLL_ROLLTYPE_GREEN"].." -> ["..tostring(Autoloot.Preferences.Autoroll.Quality.Green.AutoRollType).."]");
	elseif Color == "blue" then
		Autoloot:Printf(Autoloot.Locale.Strings["AUTOROLL_ROLLTYPE_BLUE"].." -> ["..tostring(Autoloot.Preferences.Autoroll.Quality.Blue.AutoRollType).."]");
	end
	
end

-------------------------------------------------------------------------------------------------------

function Autoloot:RollOnLoot(ID, RollType)
	RollOnLoot(ID, RollType);
	
	Autoloot:Printf(Autoloot.Locale.Strings["AUTOROLL_ROLL_THE_DICE"].." ["..RollType.."] "..Autoloot.Locale.Strings["AUTOROLL_ITEM_AT_ROLLID"].." ["..ID.."]");
end

-------------------------------------------------------------------------------------------------------

function Autoloot:GetLootRollItemInfo(ID)
	return unpack(GetLootRollItemInfo(ID));
end

-------------------------------------------------------------------------------------------------------

function Autoloot:PrintAutorollEnabled()
	Autoloot.Console:Print(Autoloot.Locale.Strings["AUTOROLL_STATUS"].."-> ["..tostring(Autoloot.Preferences.Autoroll.Enabled).."]")
end

-------------------------------------------------------------------------------------------------------
	
	