local Autoloot = LibStub("AceAddon-3.0"):GetAddon("Autoloot")

-------------------------------------------------------------------------------------------------------

function Autoloot:ToggleDisableInGroups()
	if Autoloot.db.profile.Settings.Preferences.Autodisable.InGroups == true then
		Autoloot.db.profile.Settings.Preferences.Autodisable.InGroups = false;
	else
		Autoloot.db.profile.Settings.Preferences.Autodisable.InGroups = true;
	end
	
end

-------------------------------------------------------------------------------------------------------

function Autoloot:PrintDisableInGroups()
	Autoloot.Console:Print(Autoloot.Locale.Strings["AUTODISABLE_STATUS_IN_GROUPS"].." -> ["..tostring(Autoloot.db.profile.Settings.Preferences.Autodisable.InGroups).."]")
end

-------------------------------------------------------------------------------------------------------

function Autoloot:ToggleDisableInRaids()
	if Autoloot.db.profile.Settings.Preferences.Autodisable.InRaids == true then
		Autoloot.db.profile.Settings.Preferences.Autodisable.InRaids = false;
	else
		Autoloot.db.profile.Settings.Preferences.Autodisable.InRaids = true;
	end
	
end

-------------------------------------------------------------------------------------------------------

function Autoloot:PrintDisableInRaids()
	Autoloot.Console:Print(Autoloot.Locale.Strings["AUTODISABLE_STATUS_IN_RAIDS"].." -> ["..tostring(Autoloot.db.profile.Settings.Preferences.Autodisable.InRaids).."]")
end

-------------------------------------------------------------------------------------------------------

function Autoloot:IsPlayerInGroup()
	
	if Autoloot.db.profile.Settings.Preferences.Autodisable.InGroups == true and IsInGroup() == false or Autoloot.db.profile.Settings.Preferences.Autodisable.InGroups == false then

		return false
	
	end
	
	return true;
end

-------------------------------------------------------------------------------------------------------

function Autoloot:IsPlayerInRaid()

	if Autoloot.db.profile.Settings.Preferences.Autodisable.InRaids == true and IsInRaid() == false or Autoloot.db.profile.Settings.Preferences.Autodisable.InRaids == false then
		return false;
	end
	
	return true;
end
-------------------------------------------------------------------------------------------------------
	