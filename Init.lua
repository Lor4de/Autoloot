local Autoloot = LibStub("AceAddon-3.0"):NewAddon("Autoloot", "AceEvent-3.0")

Autoloot.Runtime = {};
Autoloot.Interface = {};
Autoloot.Console = {};
Autoloot.EventHandler = {};

function Autoloot:OnInitialize()

    self.Variables = {
        Quality = {
            Everything 		= -1,
            Grey 			= 0,
            White 			= 1,
            Green 			= 2,
            Blue 			= 3,
            Epic 			= 4,
        },

        Rolltype = {
            None 			= -1,
            Greed			= 2,
            Pass			= 0,
            Disenchant		= 3,
        },
    }

	local Defaults = {
        profile = {
            Settings = {
                General = {
					Enabled	= true,
                },
                Blacklist = {
                    NumItems = 0,
                    Items = {},
                },
                LootLog = {
                    NumItems = 0,
                    Items = {},
                },
                Preferences = {
                    FirstStart = true,
                    Debug = false,
                    ShowMinimapButton = false,
                    DisableLoginMsg = false,

                    Loot = {
                        Enabled = true,
                        ShiftToDisable = true,
                        Quality = self.Variables.Quality.Everything,
                    },

                    Blacklist = {
                        Enabled = false,
                        Inverted = false,
                    },

                    Lootlog = {
                        Enabled = true,
                    },

                    Autoroll = {
                        Enabled = false,
                        Rolltype = self.Variables.Rolltype.None,
                        Quality = -1,
                    },

                    Minprice = {
                        Enabled = false,
                        Quality = -1,
                        MinPrice = 0,
                    },

                    Lootdisplay = {
                        Enabled = false,
                    },

                    Autodisable = {
                        InRaids= false,
                        InGroups = false,
                    },
                },
            },
        },
	}

	self.db = LibStub("AceDB-3.0"):New("AutolootDB", Defaults, true)

end

function Autoloot:OnEnable()
 
    Autoloot.EventHandler = {}

-------------------------------------------------------------------------------------------------------

    Autoloot.EventHandler.Loot = CreateFrame("Frame")
    Autoloot.EventHandler.Loot:RegisterEvent("LOOT_OPENED")
    Autoloot.EventHandler.Loot:RegisterEvent("LOOT_BIND_CONFIRM")

    Autoloot.EventHandler.Loot:SetScript("OnEvent", function(self, Event, ...)

        if Event == "LOOT_OPENED" then
        
            if Autoloot:IsShiftKeyDown() == false then
            
                if Autoloot.db.profile.Settings.Preferences.Loot.ShiftToDisable == true then
                
                    if Autoloot:IsPlayerInRaid() == false and Autoloot:IsPlayerInGroup() == false then
                        
                            for i = 1, Autoloot:GetNumLootItems(), 1 do --//Schleife Durchläuft jedes Item im Loot
                    
                                local _, _Name, _Quantity, _Quality = Autoloot:GetLootSlotItemInfo(i);
                                
                                if _Quality >= Autoloot.db.profile.Settings.Preferences.Loot.Quality then --//Wenn Qualität größer gleich Autoloot - Qualität
                                
                                    --if Autoloot:IsPriceHigher(Autoloot:GetItemPrice(_Name), Autoloot.db.profile.Settings.Preferences.Minprice.Price) == true and Autoloot.db.profile.Settings.Preferences.Minprice.Enabled == true or Autoloot.db.profile.Settings.Preferences.Minprice.Enabled == false then
                                
                                        --if Autoloot.db.profile.Settings.Preferences.Blacklist.Enabled == true then --//Falls Blacklist Aktiviert ist
                                        
                                            --if Autoloot.db.profile.Settings.Preferences.Blacklist.Inverted == true then --//Falls Blacklist Invertiert ist (Whitelist)
                                                
                                                --if Autoloot:BlacklistContainsItem(_Name) == true then
                                                    --Autoloot:LootSlot(i); --//Loote Item
                                                --end
                                            
                                            --else --//Blacklist nicht Invertiert
                                            
                                                --if Autoloot:BlacklistContainsItem(_Name) == false then
                                                    --Autoloot:LootSlot(i); --//Loote Item
                                                --end
                                            
                                            --end
                                        --else --//Blacklist Deaktiviert
                                            Autoloot:LootSlot(i); --//Loote Item
                                        --end
                                        
                                        --if Autoloot.db.profile.Settings.Preferences.Lootlog.Enabled == true then
                                        
                                            --if Autoloot:IsItemMoney(_Name, _Quantity) == true then
                                                --_Name = "Money";
                                            --end
                                            
                                            --if Autoloot:LootlogContainsItem(_Name) == false then
                                                --Autoloot:AddItemToLootlog(_Name, _Quantity)
                                            --else
                                                --Autoloot:UpdateItemAtLootlog(_Name, _Quantity)
                                            --end
                                    
                                        --end
                                    --end
                                end
                            end
                        
                        CloseLoot();
                    
                    end
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
        
            if Autoloot.db.profile.Settings.Autoroll.Enabled == true then
        
                if Autoloot:IsPlayerInRaid() == false and Autoloot:IsPlayerInGroup() == false then
                
                    local Texture, Name, Count, Quality, _, _, CanGreed, CanDisenchant =  Autoloot:GetLootRollItemInfo(ID)
                    
                    if Quality == Autoloot.Quality.Green then
                        if Autoloot.db.profile.Settings.Autoroll.Quality.Green.AutoRollType ~= Autoloot.Rolltype.None then
                            if CanDisenchant == true and Autoloot.db.profile.Settings.Autoroll.Quality.Green.AutoRollType == Autoloot.Rolltype.Disenchant or Autoloot.db.profile.Settings.Autoroll.Quality.Green.AutoRollType ~= Autoloot.Rolltype.Disenchant then
                                Autoloot:RollOnLoot(ID, Autoloot.db.profile.Settings.Autoroll.Quality.Green.AutoRollType)
                            end
                        end
                    elseif Quality == Autoloot.Quality.Blue then
                        if Autoloot.db.profile.Settings.Autoroll.Quality.Blue.AutoRollType ~= Autoloot.Rolltype.None then
                        
                            if CanDisenchant == true and Autoloot.db.profile.Settings.Autoroll.Quality.Blue.AutoRollType == Autoloot.Rolltype.Disenchant or Autoloot.db.profile.Settings.Autoroll.Quality.Blue.AutoRollType ~= Autoloot.Rolltype.Disenchant then
                                Autoloot:RollOnLoot(ID, Autoloot.db.profile.Settings.Autoroll.Quality.Blue.AutoRollType)
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
end

function Autoloot:OnDisable()
    print("Disable")
end