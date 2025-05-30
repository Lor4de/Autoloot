local LoradeUI = select(2,...);

local Autoloot = LibStub("AceAddon-3.0"):GetAddon("Autoloot")
local L = LibStub("AceLocale-3.0"):GetLocale("Autoloot")

local _ = nil

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	Autoloot.Interface.MainBackgroundFrame = LoradeUI.Frame:Create("AutolootMainBackgroundFrame", UIParent, 0, 0, 700, 450, false)
	Autoloot.Interface.MainBackgroundFrame:SetBackdropColor("#212121")
	Autoloot.Interface.MainBackgroundFrame:SetBackdropBorderColor("#000000")
	Autoloot.Interface.MainBackgroundFrame:EnableMoveable();

	Autoloot.Interface.MainBackgroundFrameTabContainer = LoradeUI.TabContainer:Create("AutolootMainBackgroundFrameTabContainer", Autoloot.Interface.MainBackgroundFrame.Framepointer, 0, 0, 700, 450)

		Autoloot.Interface.MainBackgroundFrameTitle = LoradeUI.Fontstring:Create("MainBackgroundFrameTitle", Autoloot.Interface.MainBackgroundFrame:ToParent(), "CENTER", 0, (Autoloot.Interface.MainBackgroundFrame:GetHeight() / 2), "Autoloot", "GameFontNormalLarge", true)
		Autoloot.Interface.MainBackgroundFrameCloseButton = LoradeUI.Button:Create("AutolootMainBackgroundFrameCloseButton", Autoloot.Interface.MainBackgroundFrame:ToParent(), (Autoloot.Interface.MainBackgroundFrame:GetWidth() / 2) - (80 / 2) + 10, ((Autoloot.Interface.MainBackgroundFrame:GetHeight() / 2) * -1) + (24 / 2) + 10, 80, 24, "Close", "UIPanelButtonTemplate", true)
		Autoloot.Interface.MainBackgroundFrameCloseButton:RegisterEvent("OnClick", (function()

			Autoloot.Interface.MainBackgroundFrame:Hide()

		end))
		_, _, Autoloot.Interface.MainFrameScrollerContentFrame = LoradeUI.ScrollBar:Create("Test", Autoloot.Interface.MainBackgroundFrame:ToParent(), 10, 10, -5 ,700, 450, 200, 1, "Interface\\DialogFrame\\UI-DialogBox-Background", {1,1,1,1}, true)
		
		
	-------------------------------------------------------------------------------MAINCONTENT----------------------------------------------------------------------------------------------------

			LoradeUI.LabeledCheckbox:Create("CB_Autoloot_Activated", Autoloot.Interface.MainFrameScrollerContentFrame, 0, 180, 24, "Autoloot Aktiviert", "GameFontNormal", "ChatConfigCheckButtonTemplate", true)
			
			Autoloot.Interface.AutolootQualityLabel = LoradeUI.Fontstring:Create("LBL_Autoloot_Quality", Autoloot.Interface.MainFrameScrollerContentFrame, "CENTER", 0, 32, "Autoloot Qualität", "GameFontNormal", true)
			
			LoradeUI.LabeledCheckbox:Create("Test", Autoloot.Interface.MainFrameScrollerContentFrame, 0, 148, 24, "Alles", "GameFontNormal", "ChatConfigCheckButtonTemplate", true)
			LoradeUI.LabeledCheckbox:Create("Test", Autoloot.Interface.MainFrameScrollerContentFrame, 0, 116, 24, "Weiss", "GameFontNormal", "ChatConfigCheckButtonTemplate", true)
			LoradeUI.LabeledCheckbox:Create("Test", Autoloot.Interface.MainFrameScrollerContentFrame, 0, 84, 24, "Grün", "GameFontNormal", "ChatConfigCheckButtonTemplate", true)
			LoradeUI.LabeledCheckbox:Create("Test", Autoloot.Interface.MainFrameScrollerContentFrame, 0, 52, 24, "Blau", "GameFontNormal", "ChatConfigCheckButtonTemplate", true)



	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	Autoloot.Interface.BlacklistAddItemFrame = LoradeUI.Frame:Create("BlacklistAddItemFrame", UIParent, 0, 0, 300, 200, "Interface\\DialogFrame\\UI-DialogBox-Background", false)
	Autoloot.Interface.BlacklistAddItemFrameTextbox = LoradeUI.Textbox:Create("BlacklistAddItemFrameTextbox", Autoloot.Interface.BlacklistAddItemFrame.Framepointer, 0, 0, 140, 32, "Itemname", "InputBoxTemplate", true)
	Autoloot.Interface.BlacklistAddItemFrameOkButton = LoradeUI.Button:Create("BlacklistAddItemFrameOkButton", Autoloot.Interface.BlacklistAddItemFrame.Framepointer, 85, -75, 80, 24, "Add", "UIPanelButtonTemplate", true)
	Autoloot.Interface.BlacklistAddItemFrameCloseButton = LoradeUI.Button:Create("BlacklistAddItemFrameOkButton", Autoloot.Interface.BlacklistAddItemFrame.Framepointer, -85, -75, 80, 24, "Close", "UIPanelButtonTemplate", true)

	Autoloot.Interface.BlacklistAddItemFrameOkButton:RegisterEvent("OnClick", (function()

		Autoloot:AddItemToBlacklist(Autoloot.Interface.BlacklistAddItemFrameTextbox:GetText())
		Autoloot.Interface.BlacklistAddItemFrameTextbox:Clear("Test");

	end))

	Autoloot.Interface.BlacklistAddItemFrameCloseButton:RegisterEvent("OnClick", (function()

		Autoloot.Interface.BlacklistAddItemFrame:Hide()

	end))

	Autoloot.Interface.BlacklistAddItemFrameTitle = LoradeUI.Fontstring:Create("BlacklistAddItemFrameTitle", Autoloot.Interface.BlacklistAddItemFrame.Framepointer, "CENTER", 0, 100, "Autoloot Blacklist Add Item", "GameFontNormalLarge", true)
	Autoloot.Interface.BlacklistAddItemFrameInfoText = LoradeUI.Fontstring:Create("BlacklistAddItemFrameInfoText", Autoloot.Interface.BlacklistAddItemFrame.Framepointer, "CENTER", 0, 45, "Itemname oder ID eingeben", "GameFontNormal", true)

	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	Autoloot.Interface.BlacklistRemoveItemFrame = LoradeUI.Frame:Create("BlacklistRemoveItemFrame", UIParent, 0, 0, 300, 200, "Interface\\DialogFrame\\UI-DialogBox-Background", false)
	Autoloot.Interface.BlacklistRemoveItemFrameTextbox = LoradeUI.Textbox:Create("BlacklistRemoveItemFrameTextbox", Autoloot.Interface.BlacklistRemoveItemFrame.Framepointer, 0, 0, 140, 32, "Itemname", "InputBoxTemplate", true)
	Autoloot.Interface.BlacklistRemoveItemFrameOkButton = LoradeUI.Button:Create("BlacklistRemoveItemFrameOkButton", Autoloot.Interface.BlacklistRemoveItemFrame.Framepointer, 85, -75, 80, 24, "Remove", "UIPanelButtonTemplate", true)
	Autoloot.Interface.BlacklistRemoveItemFrameCloseButton = LoradeUI.Button:Create("BlacklistRemoveItemFrameOkButton", Autoloot.Interface.BlacklistRemoveItemFrame.Framepointer, -85, -75, 80, 24, "Close", "UIPanelButtonTemplate", true)

	Autoloot.Interface.BlacklistRemoveItemFrameOkButton:RegisterEvent("OnClick", (function()

		Autoloot:RemoveItemFromBlacklist(Autoloot.Interface.BlacklistRemoveItemFrameTextbox:GetText())
		Autoloot.Interface.BlacklistRemoveItemFrameTextbox:Clear();

	end))

	Autoloot.Interface.BlacklistRemoveItemFrameCloseButton:RegisterEvent("OnClick", (function()

		Autoloot.Interface.BlacklistRemoveItemFrame:Hide()

	end))

	Autoloot.Interface.BlacklistRemoveItemFrameTitle = LoradeUI.Fontstring:Create("BlacklistRemoveItemFrameTitle", Autoloot.Interface.BlacklistRemoveItemFrame.Framepointer, "CENTER", 0, 100, "Autoloot Blacklist Remove Item", "GameFontNormalLarge", true)
	Autoloot.Interface.BlacklistRemoveItemFrameInfoText = LoradeUI.Fontstring:Create("BlacklistRemoveItemFrameInfoText", Autoloot.Interface.BlacklistRemoveItemFrame.Framepointer, "CENTER", 0, 45, "Itemname oder ID eingeben", "GameFontNormal", true)
