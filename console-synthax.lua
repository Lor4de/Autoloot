local Autoloot = select(2,...);

Autoloot.Console.Spacer = "";
Autoloot.Console.Seperator = "\\"

-------------------------------------------------------------------------------------------------------

Autoloot.Console:RegisterKeyword("", (function()
	Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Modules]]");
	Autoloot.Console:Print(Autoloot.Console.Spacer);
	
	Autoloot.Console:Print("Loot");
	Autoloot.Console:Print("Blacklist");
	Autoloot.Console:Print("Lootlog");
	--Autoloot.Console:Print("Autoroll");
	Autoloot.Console:Print("Minprice");
	Autoloot.Console:Print("Autodisable");
	--Autoloot.Console:Print("Lootdisplay")
	Autoloot.Console:Print("About");
	Autoloot.Console:Print("Changes");
	Autoloot.Console:Print(" ");
	Autoloot.Console:Print("Show");
	
	Autoloot.Console:Print(Autoloot.Console.Spacer);
end))

-------------------------------------------------------------------------------------------------------

	Autoloot.Console:RegisterKeyword("Loot", (function()
		Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Loot]]");
		Autoloot.Console:Print(Autoloot.Console.Spacer);
		
		Autoloot.Console:Print("[1] Toggle");
		Autoloot.Console:Print("[2] Quality");
		Autoloot.Console:Print("[3] ShiftToDisable")
		
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	end))

		Autoloot.Console:RegisterKeyword("Loot Toggle", (function()
			Autoloot:ToggleAutoloot();
		end))

		Autoloot.Console:RegisterKeyword("Loot Toggle ?", (function()
			Autoloot:PrintAutolootEnabled();
		end))
		
		Autoloot.Console:RegisterKeyword("Loot ShiftToDisable", (function()
			Autoloot:ToggleShiftToDisable();
		end))

		Autoloot.Console:RegisterKeyword("Loot ShiftToDisable ?", (function()
			Autoloot:PrintAutolootShiftToDisable();
		end))

		Autoloot.Console:RegisterKeyword("Loot Quality", (function()
			Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Loot "..Autoloot.Console.Seperator.." Quality]]")
			Autoloot.Console:Print(Autoloot.Console.Spacer);
				
			Autoloot.Console:Print("[1] Everything")
			Autoloot.Console:Print("[2] Grey")
			Autoloot.Console:Print("[3] White")
			Autoloot.Console:Print("[4] Green")
			Autoloot.Console:Print("[5] Blue")
				
			Autoloot.Console:Print(Autoloot.Console.Spacer);
		end))
		
		Autoloot.Console:RegisterKeyword("Loot Quality ?", (function()
			Autoloot:PrintAutolootQuality();
		end))
		
			Autoloot.Console:RegisterKeyword("Loot Quality Everything", (function()
				Autoloot:SetAutolootQuality(Autoloot.Quality.Everything)
			end))

			Autoloot.Console:RegisterKeyword("Loot Quality Grey", (function()
				Autoloot:SetAutolootQuality(Autoloot.Quality.Grey)
			end))

			Autoloot.Console:RegisterKeyword("Loot Quality White", (function()
				Autoloot:SetAutolootQuality(Autoloot.Quality.White)
			end))

			Autoloot.Console:RegisterKeyword("Loot Quality Green", (function()
				Autoloot:SetAutolootQuality(Autoloot.Quality.Green)
			end))

			Autoloot.Console:RegisterKeyword("Loot Quality Blue", (function()
				Autoloot:SetAutolootQuality(Autoloot.Quality.Blue)
			end))
			
-------------------------------------------------------------------------------------------------------
			
	Autoloot.Console:RegisterKeyword("Blacklist", (function()
		Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Blacklist]]");
		Autoloot.Console:Print(Autoloot.Console.Spacer);
			
		Autoloot.Console:Print("[1] Toggle");
		Autoloot.Console:Print("[2] Print")
		Autoloot.Console:Print("[3] Invert")
		Autoloot.Console:Print("[4] Clear")
		Autoloot.Console:Print("[5] Add")
		Autoloot.Console:Print("[5] Remove")
			
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	end))
	
		Autoloot.Console:RegisterKeyword("Blacklist Toggle", (function()
			Autoloot:ToggleBlacklist();
		end))
		
		Autoloot.Console:RegisterKeyword("Blacklist Toggle ?", (function()
			Autoloot:PrintBlacklistEnabled();
		end))
		
		Autoloot.Console:RegisterKeyword("Blacklist Add", (function()
			Autoloot.BlacklistAddItemFrame:Show()
		end))
		
		Autoloot.Console:RegisterKeyword("Blacklist Remove", (function()
			Autoloot.BlacklistRemoveItemFrame:Show()
		end))
		
		Autoloot.Console:RegisterKeyword("Blacklist Print", (function()
			Autoloot:PrintBlacklist();
		end))
		
		Autoloot.Console:RegisterKeyword("Blacklist Invert", (function()
			Autoloot:ToggleBlacklistInverted();
		end))
		
		Autoloot.Console:RegisterKeyword("Blacklist Invert ?", (function()
			Autoloot:PrintBlacklistInverted();
		end))
		
		Autoloot.Console:RegisterKeyword("Blacklist Clear", (function()
			Autoloot:ClearBlacklist();
		end))
		
-------------------------------------------------------------------------------------------------------
		
	Autoloot.Console:RegisterKeyword("Lootlog", (function()
		Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Lootlog]]");
		Autoloot.Console:Print(Autoloot.Console.Spacer);
		
		Autoloot.Console:Print("[1] Toggle");
		Autoloot.Console:Print("[2] Print")
		Autoloot.Console:Print("[3] Clear")
		
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	end))
	
		Autoloot.Console:RegisterKeyword("Lootlog Toggle", (function()
			Autoloot:ToggleLootlog();
		end))
		
		Autoloot.Console:RegisterKeyword("Lootlog Toggle ?", (function()
			Autoloot:PrintLootlogEnabled();
		end))

		Autoloot.Console:RegisterKeyword("Lootlog Print", (function()
			Autoloot:PrintLootlog();
		end))

		Autoloot.Console:RegisterKeyword("Lootlog Clear", (function()
			Autoloot:ClearLootlog();
		end))
		
-------------------------------------------------------------------------------------------------------
		
Autoloot.Console:RegisterKeyword("Autoroll", (function()
		Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Autoroll]]");
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	
		Autoloot.Console:Print("[1] Toggle");
		Autoloot.Console:Print("[2] Set")
	
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	end))
	
		Autoloot.Console:RegisterKeyword("Autoroll Toggle", (function()
			Autoloot:ToggleAutoroll();
		end))
		
		Autoloot.Console:RegisterKeyword("Autoroll Toggle ?", (function()
			Autoloot:PrintAutorollEnabled();
		end))
		
		Autoloot.Console:RegisterKeyword("Autoroll Set", (function()
			Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Autoroll "..Autoloot.Console.Seperator.." Set]]");
			Autoloot.Console:Print(Autoloot.Console.Spacer);
		
			Autoloot.Console:Print("[1] Green");
			Autoloot.Console:Print("[2] Blue")
		
			Autoloot.Console:Print(Autoloot.Console.Spacer);
		end))
		
			Autoloot.Console:RegisterKeyword("Autoroll Set Green", (function()
				Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Autoroll "..Autoloot.Console.Seperator.." Set "..Autoloot.Console.Seperator.." Green]]");
				Autoloot.Console:Print(Autoloot.Console.Spacer);
			
				Autoloot.Console:Print("[1] Greed");
				Autoloot.Console:Print("[2] Disenchant")
				Autoloot.Console:Print("[2] Pass")
			
				Autoloot.Console:Print(Autoloot.Console.Spacer);
			end))
			
			
			Autoloot.Console:RegisterKeyword("Autoroll Set Green ?", (function()
				Autoloot:PrintAutorollRollType("Green");
			end))
			
				Autoloot.Console:RegisterKeyword("Autoroll Set Green Greed", (function()
					Autoloot:SetAutorollRollType("Green", Autoloot.Rolltype.Greed)
				end))
				
				Autoloot.Console:RegisterKeyword("Autoroll Set Green Disenchant", (function()
					Autoloot:SetAutorollRollType("Green", Autoloot.Rolltype.Disenchant)
				end))
				
				Autoloot.Console:RegisterKeyword("Autoroll Set Green Pass", (function()
					Autoloot:SetAutorollRollType("Green", Autoloot.Rolltype.Pass)
				end))
		
			Autoloot.Console:RegisterKeyword("Autoroll Set Blue", (function()
				Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Autoroll "..Autoloot.Console.Seperator.." Set "..Autoloot.Console.Seperator.." Blue]]");
				Autoloot.Console:Print(Autoloot.Console.Spacer);
			
				Autoloot.Console:Print("[1] Greed");
				Autoloot.Console:Print("[2] Disenchant")
				Autoloot.Console:Print("[2] Pass")
			
				Autoloot.Console:Print(Autoloot.Console.Spacer);
			end))
			
			Autoloot.Console:RegisterKeyword("Autoroll Set Blue ?", (function()
				Autoloot:PrintAutorollRollType("Blue");
			end))
			
				Autoloot.Console:RegisterKeyword("Autoroll Set Blue Greed", (function()
					Autoloot:SetAutorollRollType("Blue", Autoloot.Rolltype.Greed)
				end))
				
				Autoloot.Console:RegisterKeyword("Autoroll Set Blue Disenchant", (function()
					Autoloot:SetAutorollRollType("Blue", Autoloot.Rolltype.Disenchant)
				end))
				
				Autoloot.Console:RegisterKeyword("Autoroll Set Blue Pass", (function()
					Autoloot:SetAutorollRollType("Blue", Autoloot.Rolltype.Pass)
				end))

-------------------------------------------------------------------------------------------------------
		
	Autoloot.Console:RegisterKeyword("Minprice", (function()
		Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Minprice]]");
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	
		Autoloot.Console:Print("[1] Toggle");
		Autoloot.Console:Print("[2] Set")
	
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	end))
	
		Autoloot.Console:RegisterKeyword("Minprice Toggle", (function()
			Autoloot:ToggleMinprice();
		end))
		
		Autoloot.Console:RegisterKeyword("Minprice Toggle ?", (function()
			Autoloot:PrintMinpriceEnabled();
		end))
		
		Autoloot.Console:RegisterKeyword("Minprice Set", (function()
			--
		end))
		
		Autoloot.Console:RegisterKeyword("Minprice Set ?", (function()
			--
		end))
		
-------------------------------------------------------------------------------------------------------
		
	Autoloot.Console:RegisterKeyword("Autodisable", (function()
		Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Autodisable]]");
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	
		Autoloot.Console:Print("[1] Raids");
		Autoloot.Console:Print("[2] Groups")
	
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	end))
	
		Autoloot.Console:RegisterKeyword("Autodisable Raids", (function()
			Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Autodisable "..Autoloot.Console.Seperator.." Raids]]");
			Autoloot.Console:Print(Autoloot.Console.Spacer);
		
			Autoloot.Console:Print("[1] Toggle");
		
			Autoloot.Console:Print(Autoloot.Console.Spacer);
		end))
		
		Autoloot.Console:RegisterKeyword("Autodisable Raids Toggle", (function()
			Autoloot:ToggleDisableInRaids();
		end))
		
		Autoloot.Console:RegisterKeyword("Autodisable Raids Toggle ?", (function()
			Autoloot:PrintDisableInRaids();
		end))
		
		Autoloot.Console:RegisterKeyword("Autodisable Groups", (function()
			Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Autodisable "..Autoloot.Console.Seperator.." Groups]]");
			Autoloot.Console:Print(Autoloot.Console.Spacer);
		
			Autoloot.Console:Print("[1] Toggle");
		
			Autoloot.Console:Print(Autoloot.Console.Spacer);
		end))
		
		Autoloot.Console:RegisterKeyword("Autodisable Groups Toggle", (function()
			Autoloot:ToggleDisableInGroups();
		end))
		
		Autoloot.Console:RegisterKeyword("Autodisable Groups Toggle ?", (function()
			Autoloot:PrintDisableInGroups();
		end))
		
------------------------------------------------Über---------------------------------------------------

Autoloot.Console:RegisterKeyword("About", (function()
		Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Over]]");
		Autoloot.Console:Print(Autoloot.Console.Spacer);
		
		Autoloot.Console:Print(Autoloot.AddonName);
		Autoloot.Console:Print("Created by "..Autoloot:GetAuthor());
		
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	end))
	
		
--------------------------------------------DEV COMMANDS-----------------------------------------------

	Autoloot.Console:RegisterKeyword("Dev", (function()
		Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Dev]]");
		Autoloot.Console:Print(Autoloot.Console.Spacer);
		
		Autoloot.Console:Print("Dies sind die Entwicklerfunktioen");
		Autoloot.Console:Print("Diese Befehle sollten nur verwendet werden,")
		Autoloot.Console:Print("falls du weißt was sie tun. Sie können Autoloot")
		Autoloot.Console:Print("komplett zurücksetzen, oder zu ungewünschten Effekten führen")
		Autoloot.Console:Print("Zur eigenen Sicherheit werden hier keine Befehle vorgeschlagen")
		
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	end))
	
		Autoloot.Console:RegisterKeyword("Dev Toggle", (function()
			Autoloot:ToggleDebugMode();
		end))
		
		Autoloot.Console:RegisterKeyword("Dev Toggle ?", (function()
			Autoloot:PrintDebugMode();
		end))
		
		Autoloot.Console:RegisterKeyword("Dev Reset", (function()
			Autoloot:CallResetPreferences();
		end))
		
		Autoloot.Console:RegisterKeyword("Dev Cancel Reset", (function()
			Autoloot:CancelCallResetPreferences();
		end))
		
		Autoloot.Console:RegisterKeyword("Dev LMSG Toggle", (function()
			Autoloot:ToggleDisableLoginMsg();
		end))
		
		Autoloot.Console:RegisterKeyword("Dev LMSG Toggle ?", (function()
			Autoloot:PrintDisableLoginMsg();
		end))
		
		Autoloot.Console:RegisterKeyword("Dev Language", (function()
			Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Dev "..Autoloot.Console.Seperator.." Language]]");
			Autoloot.Console:Print(Autoloot.Console.Spacer);
		
			Autoloot.Console:Print("[1] Force");
		
			Autoloot.Console:Print(Autoloot.Console.Spacer);
		end))
		
			Autoloot.Console:RegisterKeyword("Dev Force Language", (function()
				Autoloot.Console:Print("[1] German");
				Autoloot.Console:Print("[2] English");
				Autoloot.Console:Print("[3] Keine (Deaktiviert)");
			end))
			
				Autoloot.Console:RegisterKeyword("Dev Force Language German", (function()
					Autoloot:SetForceLanguage(Autoloot.Locale.German)
				end))
				
				Autoloot.Console:RegisterKeyword("Dev Force Language English", (function()
					Autoloot:SetForceLanguage(Autoloot.Locale.English)
				end))
				
				Autoloot.Console:RegisterKeyword("Dev Force Language Keine", (function()
					Autoloot:SetForceLanguage(Autoloot.Locale.None)
				end))
				
			Autoloot.Console:RegisterKeyword("Dev Force Language ?", (function()
				Autoloot:GetForceLanguage()
			end))
		
		
		Autoloot.Console:RegisterKeyword("Dev Version", (function()
			Autoloot.Console:Print("Version: "..tostring(Autoloot:GetVersion()));
		end))
		
		
-------------------------------------------------------------------------------------------------------
	
	Autoloot.Console:RegisterKeyword("Changes", (function()
		Autoloot.Console:Print("[[Autoloot "..Autoloot.Console.Seperator.." Console "..Autoloot.Console.Seperator.." Changes]]");
		Autoloot.Console:Print(Autoloot.Console.Spacer);
		Autoloot.Console:Print("Derzeit sind keine änderungen Verfügbar");
		
		Autoloot.Console:Print(Autoloot.Console.Spacer);
	end))
	
-------------------------------------------------------------------------------------------------------
	
	Autoloot.Console:RegisterKeyword("Show", (function()
		if Autoloot.MainBackgroundFrame:IsVisible() == true then
			Autoloot.MainBackgroundFrame:Hide();
		else
			Autoloot.MainBackgroundFrame:Show();
		end
	end))
	
