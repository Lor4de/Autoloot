local Autoloot = select(2,...)

-------------------------------------------------------------------------------------------------------

if Autoloot.Console.Enabled == true then
	SLASH_AUTOLOOT1 = string.lower(Autoloot.Console.Prefix);
	local function handler(Keyword, editbox)

		if Autoloot.Console:DoKeywordExist(Keyword) then
			local Delegate = Autoloot.Console:GetDelegateOf(Keyword);
			Delegate();
		end
	end
	SlashCmdList["AUTOLOOT"] = handler;
end

-------------------------------------------------------------------------------------------------------

Autoloot.EventHandler = {}

Autoloot.EventHandler.Internal = CreateFrame("Frame")
Autoloot.EventHandler.Internal:RegisterEvent("PLAYER_LOGIN") 
Autoloot.EventHandler.Internal:RegisterEvent("PLAYER_LOGOUT")
Autoloot.EventHandler.Internal:RegisterEvent("PLAYER_LEAVING_WORLD")

Autoloot.EventHandler.Internal:SetScript("OnEvent", function(Self, Event, ...)

	if Event == "PLAYER_LOGIN" then
		
		if ForceReset == true then
			Autoloot:LoadVariablesFromDefault();
		else
			Autoloot:LoadVariablesFromWTF();
		end
		
		Autoloot:GetLocale()
		Autoloot:SetAddonLanguage()	
		--Autoloot:PrintWelcomeMessage()
	
	elseif Event == "PLAYER_LOGOUT" or Event == "PLAYER_LEAVING_WORLD" then
	
		Autoloot:SaveVariablesToWTF();
	
	end

end)

-------------------------------------------------------------------------------------------------------

Autoloot.EventHandler.Loot = CreateFrame("Frame")
Autoloot.EventHandler.Loot:RegisterEvent("LOOT_OPENED")
Autoloot.EventHandler.Loot:RegisterEvent("LOOT_BIND_CONFIRM")

Autoloot.EventHandler.Loot:SetScript("OnEvent", function(self, Event, ...)

	if Event == "LOOT_OPENED" then
	
		if Autoloot:IsShiftKeyDown() == false then
		
			if Autoloot.Preferences.Loot.Enabled == true then
			
				if Autoloot:IsPlayerInRaid() == false and Autoloot:IsPlayerInGroup() == false then
					
						for i = 1, Autoloot:GetNumLootItems(), 1 do --//Schleife Durchläuft jedes Item im Loot
				
							local _, _Name, _Quantity, _Quality = Autoloot:GetLootSlotItemInfo(i);					
							
							if _Quality >= Autoloot.Preferences.Loot.Quality then --//Wenn Qualität größer gleich Autoloot - Qualität
							
								if Autoloot:IsPriceHigher(Autoloot:GetItemPrice(_Name), Autoloot.Preferences.Minprice.Price) == true and Autoloot.Preferences.Minprice.Enabled == true or Autoloot.Preferences.Minprice.Enabled == false then
							
									if Autoloot.Preferences.Blacklist.Enabled == true then --//Falls Blacklist Aktiviert ist
									
										if Autoloot.Preferences.Blacklist.Inverted == true then --//Falls Blacklist Invertiert ist (Whitelist)
											
											if Autoloot:BlacklistContainsItem(_Name) == true then
												Autoloot:LootSlot(i); --//Loote Item
											end
										
										else --//Blacklist nicht Invertiert
										
											if Autoloot:BlacklistContainsItem(_Name) == false then
												Autoloot:LootSlot(i); --//Loote Item
											end
										
										end
									else --//Blacklist Deaktiviert
										Autoloot:LootSlot(i); --//Loote Item
									end
									
									if Autoloot.Preferences.Lootlog.Enabled == true then
									
										if Autoloot:IsItemMoney(_Name, _Quantity) == true then
											_Name = "Money";
										end
										
										if Autoloot:LootlogContainsItem(_Name) == false then
											Autoloot:AddItemToLootlog(_Name, _Quantity)
										else
											Autoloot:UpdateItemAtLootlog(_Name, _Quantity)
										end
								
									end
								end
							end
						end
					
					CloseLoot();
				
				end
			else
				Autoloot:Printf("Loot wurde geöffnet, jedoch ist Autoloot deaktiviert");
			end
		end	
	elseif Event == "LOOT_BIND_CONFIRM" then
	
		if Autoloot:IsPlayerInRaid() == false and Autoloot:IsPlayerInGroup() == false then
	
			for i = 1, Autoloot:GetNumLootItems(), 1 do
				local _, _Name, _Quantity, _Quality, _BoP = Autoloot:GetLootSlotItemInfo(i);
				
				if _BoP == true then
					Autoloot:ConfirmLootBoPSlot(i);
				end
			end
		
		end
	end
	
end)

-------------------------------------------------------------------------------------------------------

Autoloot.EventHandler.Autoroll = CreateFrame("Frame")
Autoloot.EventHandler.Autoroll:RegisterEvent("START_LOOT_ROLL")
Autoloot.EventHandler.Autoroll:RegisterEvent("CONFIRM_LOOT_ROLL")
Autoloot.EventHandler.Autoroll:RegisterEvent("CONFIRM_DISENCHANT_ROLL")

Autoloot.EventHandler.Autoroll:SetScript("OnEvent", function(self, Event, ...)

	local ID = select(1, ...)

	if Event == "START_LOOT_ROLL" then
	
		if Autoloot.Preferences.Autoroll.Enabled == true then
	
			if Autoloot:IsPlayerInRaid() == false and Autoloot:IsPlayerInGroup() == false then
			
				local Texture, Name, Count, Quality, _, _, CanGreed, CanDisenchant =  Autoloot:GetLootRollItemInfo(ID)
				
				if Quality == Autoloot.Quality.Green then
					if Autoloot.Preferences.Autoroll.Quality.Green.AutoRollType ~= Autoloot.Rolltype.None then
						if CanDisenchant == true and Autoloot.Preferences.Autoroll.Quality.Green.AutoRollType == Autoloot.Rolltype.Disenchant or Autoloot.Preferences.Autoroll.Quality.Green.AutoRollType ~= Autoloot.Rolltype.Disenchant then
							Autoloot:RollOnLoot(ID, Autoloot.Preferences.Autoroll.Quality.Green.AutoRollType)
						end
					end
				elseif Quality == Autoloot.Quality.Blue then
					if Autoloot.Preferences.Autoroll.Quality.Blue.AutoRollType ~= Autoloot.Rolltype.None then
					
						if CanDisenchant == true and Autoloot.Preferences.Autoroll.Quality.Blue.AutoRollType == Autoloot.Rolltype.Disenchant or Autoloot.Preferences.Autoroll.Quality.Blue.AutoRollType ~= Autoloot.Rolltype.Disenchant then
							Autoloot:RollOnLoot(ID, Autoloot.Preferences.Autoroll.Quality.Blue.AutoRollType)
						end
					end
				end
			end
		end
	
	elseif Event == "CONFIRM_LOOT_ROLL" or Event == "CONFIRM_DISENCHANT_ROLL" then

		local RollType = select(2, ...)
		ConfirmLootRoll(ID, RollType)
		
	end   

end)

-------------------------------------------------------------------------------------------------------

