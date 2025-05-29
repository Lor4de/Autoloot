local Autoloot = select(2,...);

-------------------------------------------------------------------------------------------------------

function Autoloot:ToggleDisableInGroups()
	if Autoloot.Preferences.Autodisable.InGroups == true then
		Autoloot.Preferences.Autodisable.InGroups = false;
	else
		Autoloot.Preferences.Autodisable.InGroups = true;
	end
	
	Autoloot:Printf(Autoloot.Locale.Strings["AUTODISABLE_STATUS_IN_GROUPS_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.Autodisable.InGroups).."]");
end

-------------------------------------------------------------------------------------------------------

function Autoloot:PrintDisableInGroups()
	Autoloot.Console:Print(Autoloot.Locale.Strings["AUTODISABLE_STATUS_IN_GROUPS"].." -> ["..tostring(Autoloot.Preferences.Autodisable.InGroups).."]")
end

-------------------------------------------------------------------------------------------------------

function Autoloot:ToggleDisableInRaids()
	if Autoloot.Preferences.Autodisable.InRaids == true then
		Autoloot.Preferences.Autodisable.InRaids = false;
	else
		Autoloot.Preferences.Autodisable.InRaids = true;
	end
	
	Autoloot:Printf(Autoloot.Locale.Strings["AUTODISABLE_STATUS_IN_RAIDS_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.Autodisable.InRaids).."]");
end

-------------------------------------------------------------------------------------------------------

function Autoloot:PrintDisableInRaids()
	Autoloot.Console:Print(Autoloot.Locale.Strings["AUTODISABLE_STATUS_IN_RAIDS"].." -> ["..tostring(Autoloot.Preferences.Autodisable.InRaids).."]")
end

-------------------------------------------------------------------------------------------------------

function Autoloot:IsPlayerInGroup()
	
	if Autoloot.Preferences.Autodisable.InGroups == true and IsInGroup() == false or Autoloot.Preferences.Autodisable.InGroups == false then

		return false
	
	end
	
	return true;
end

-------------------------------------------------------------------------------------------------------

function Autoloot:IsPlayerInRaid()

	if Autoloot.Preferences.Autodisable.InRaids == true and IsInRaid() == false or Autoloot.Preferences.Autodisable.InRaids == false then
		return false;
	end
	
	return true;
end
-------------------------------------------------------------------------------------------------------
	