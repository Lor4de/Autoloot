local Autoloot = select(2,...);
local Interface = select(2,...);

local _ = nil


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Autoloot.MainBackgroundFrame = Interface.Frame:Create("AutolootMainBackgroundFrame", UIParent, 0, 0, 700, 450, "Interface\\DialogFrame\\UI-DialogBox-Background", false)

	Autoloot.MainBackgroundFrameTitle = Interface.Fontstring:Create("MainBackgroundFrameTitle", Autoloot.MainBackgroundFrame:ToParent(), 0, (Autoloot.MainBackgroundFrame:GetHeight() / 2), "Autoloot", "GameFontNormalLarge", true)
	Autoloot.MainBackgroundFrameCloseButton = Interface.Button:Create("AutolootMainBackgroundFrameCloseButton", Autoloot.MainBackgroundFrame:ToParent(), (Autoloot.MainBackgroundFrame:GetWidth() / 2) - (80 / 2), ((Autoloot.MainBackgroundFrame:GetHeight() / 2) * -1) + (24 / 2), 80, 24, "Close", "UIPanelButtonTemplate", true)
	Autoloot.MainBackgroundFrameCloseButton:RegisterEvent("OnClick", (function()

		Autoloot.MainBackgroundFrame:Hide()

	end))
	_, _, Autoloot.MainFrameScrollerContentFrame =Interface.ScrollBar:Create("Test", Autoloot.MainBackgroundFrame:ToParent(), 10, 10, 2 ,700, 450, 200, 1, "Interface\\DialogFrame\\UI-DialogBox-Background", {1,1,1,1}, true)
	
	
-------------------------------------------------------------------------------MAINCONTENT----------------------------------------------------------------------------------------------------

		Interface.LabeledCheckbox:Create("CB_Autoloot_Activated", Autoloot.MainFrameScrollerContentFrame, 0, 180, 32, "Autoloot Aktiviert", "GameFontNormal", "ChatConfigCheckButtonTemplate", true)
		
		Autoloot.AutolootQualityLabel = Interface.Fontstring:Create("LBL_Autoloot_Quality", Autoloot.MainFrameScrollerContentFrame, 0, 32, "Autoloot Qualität", "GameFontNormal", true)
		
		Interface.LabeledCheckbox:Create("Test", Autoloot.MainFrameScrollerContentFrame, 0, 148, 32, "Alles", "GameFontNormal", "ChatConfigCheckButtonTemplate", true)
		Interface.LabeledCheckbox:Create("Test", Autoloot.MainFrameScrollerContentFrame, 0, 116, 32, "Weiss", "GameFontNormal", "ChatConfigCheckButtonTemplate", true)
		Interface.LabeledCheckbox:Create("Test", Autoloot.MainFrameScrollerContentFrame, 0, 84, 32, "Grün", "GameFontNormal", "ChatConfigCheckButtonTemplate", true)
		Interface.LabeledCheckbox:Create("Test", Autoloot.MainFrameScrollerContentFrame, 0, 52, 32, "Blau", "GameFontNormal", "ChatConfigCheckButtonTemplate", true)



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Autoloot.BlacklistAddItemFrame = Interface.Frame:Create("BlacklistAddItemFrame", UIParent, 0, 0, 300, 200, "Interface\\DialogFrame\\UI-DialogBox-Background", false)
Autoloot.BlacklistAddItemFrameTextbox = Interface.Textbox:Create("BlacklistAddItemFrameTextbox", Autoloot.BlacklistAddItemFrame.Framepointer, 0, 0, 140, 32, "Itemname", "InputBoxTemplate", true)
Autoloot.BlacklistAddItemFrameOkButton = Interface.Button:Create("BlacklistAddItemFrameOkButton", Autoloot.BlacklistAddItemFrame.Framepointer, 85, -75, 80, 24, "Add", "UIPanelButtonTemplate", true)
Autoloot.BlacklistAddItemFrameCloseButton = Interface.Button:Create("BlacklistAddItemFrameOkButton", Autoloot.BlacklistAddItemFrame.Framepointer, -85, -75, 80, 24, "Close", "UIPanelButtonTemplate", true)

Autoloot.BlacklistAddItemFrameOkButton:RegisterEvent("OnClick", (function()

	Autoloot:AddItemToBlacklist(Autoloot.BlacklistAddItemFrameTextbox:GetText())
	Autoloot.BlacklistAddItemFrameTextbox:Clear("Test");

end))

Autoloot.BlacklistAddItemFrameCloseButton:RegisterEvent("OnClick", (function()

	Autoloot.BlacklistAddItemFrame:Hide()

end))

Autoloot.BlacklistAddItemFrameTitle = Interface.Fontstring:Create("BlacklistAddItemFrameTitle", Autoloot.BlacklistAddItemFrame.Framepointer, 0, 100, "Autoloot Blacklist Add Item", "GameFontNormalLarge", true)
Autoloot.BlacklistAddItemFrameInfoText = Interface.Fontstring:Create("BlacklistAddItemFrameInfoText", Autoloot.BlacklistAddItemFrame.Framepointer, 0, 45, "Itemname oder ID eingeben", "GameFontNormal", true)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Autoloot.BlacklistRemoveItemFrame = Interface.Frame:Create("BlacklistRemoveItemFrame", UIParent, 0, 0, 300, 200, "Interface\\DialogFrame\\UI-DialogBox-Background", false)
Autoloot.BlacklistRemoveItemFrameTextbox = Interface.Textbox:Create("BlacklistRemoveItemFrameTextbox", Autoloot.BlacklistRemoveItemFrame.Framepointer, 0, 0, 140, 32, "Itemname", "InputBoxTemplate", true)
Autoloot.BlacklistRemoveItemFrameOkButton = Interface.Button:Create("BlacklistRemoveItemFrameOkButton", Autoloot.BlacklistRemoveItemFrame.Framepointer, 85, -75, 80, 24, "Remove", "UIPanelButtonTemplate", true)
Autoloot.BlacklistRemoveItemFrameCloseButton = Interface.Button:Create("BlacklistRemoveItemFrameOkButton", Autoloot.BlacklistRemoveItemFrame.Framepointer, -85, -75, 80, 24, "Close", "UIPanelButtonTemplate", true)

Autoloot.BlacklistRemoveItemFrameOkButton:RegisterEvent("OnClick", (function()

	Autoloot:RemoveItemFromBlacklist(Autoloot.BlacklistRemoveItemFrameTextbox:GetText())
	Autoloot.BlacklistRemoveItemFrameTextbox:Clear();

end))

Autoloot.BlacklistRemoveItemFrameCloseButton:RegisterEvent("OnClick", (function()

	Autoloot.BlacklistRemoveItemFrame:Hide()

end))

Autoloot.BlacklistRemoveItemFrameTitle = Interface.Fontstring:Create("BlacklistRemoveItemFrameTitle", Autoloot.BlacklistRemoveItemFrame.Framepointer, 0, 100, "Autoloot Blacklist Remove Item", "GameFontNormalLarge", true)
Autoloot.BlacklistRemoveItemFrameInfoText = Interface.Fontstring:Create("BlacklistRemoveItemFrameInfoText", Autoloot.BlacklistRemoveItemFrame.Framepointer, 0, 45, "Itemname oder ID eingeben", "GameFontNormal", true)



