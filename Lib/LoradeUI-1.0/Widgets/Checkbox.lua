local LoradeUI = select(2,...);

LoradeUI.Checkbox = {}; 
LoradeUI.Checkbox__index = LoradeUI.Checkbox;   
function LoradeUI.Checkbox:Create(Name, Parent, XPos, YPos, Size, Template, Visible)
	local self = {};
	setmetatable(self, LoradeUI.Checkbox); 
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	 
	self.Framepointer = CreateFrame("CheckButton", Name, Parent, Template);
	self.Framepointer:SetPoint("CENTER", XPos, YPos)
	self.Framepointer:SetSize(Size, Size)
	 
	if Visible == true then
		self.Framepointer:Show();
	else
		self.Framepointer:Hide();
	end
	 
------------------------------------------------------------------------------------------------------- 
	
	--//Get Functions
	
	function self:GetName()
		return self.Name;
	end
	
	function self:IsVisible()	
		return self.Framepointer:IsVisible()
	end
	
	function self:GetParent()
		return self.Framepointer:GetParent()
	end
	
	function self:GetXPos(Index)
	
		if Index == nil then
			local _, _, _, xPos = self.Framepointer:GetPoint(0)
		else
			local _, _, _, xPos = self.Framepointer:GetPoint(Index)
		end
		
		return xPos
	end
	
	function self:GetYPos()
	
		if Index == nil then
			local _, _, _, _, yPos = self.Framepointer:GetPoint(0)
		else
			local _, _, _, _, yPos = self.Framepointer:GetPoint(Index)
		end
		
		return yPos
	end
	
	function self:ToParent()
		return self.Framepointer
	end
	
	function self:GetTooltipText()
		return self.Framepointer.tooltip
	end
	
------------------------------------------------------------------------------------------------------- 

	--//Set Functions
	
	function self:Show()
		self.Framepointer:Show();
	end
	
	function self:Hide()
		self.Framepointer:Hide();
	end
	
	function self:SetXPos(XPos)
		self.SetPoint("CENTER", XPos, self:GetYPos())
	end
	
	function self:SetYPos(YPos)
		self.SetPoint("CENTER", self:GetXPos(), YPos)
	end
	
	function self:SetTooltipText(Text)
		self.Framepointer.tooltip = Text;
	end
	
	function self:RegisterEvent(Event, Delegate)
		self.Framepointer:SetScript(Event, function(self, args)
			Delegate(args)
		end)
	end
	
	function self:UnregisterEvent(Event)
		self.Framepointer:UnregisterEvent(Event)
	end
	 
------------------------------------------------------------------------------------------------------- 
	 
    return self;
 end
 
 -------------------------------------------------------------------------------------------------------
 
 
 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


 
LoradeUI.LabeledCheckbox = {}; 
LoradeUI.LabeledCheckbox__index = LoradeUI.LabeledCheckbox;   
function LoradeUI.LabeledCheckbox:Create(Name, Parent, XPos, YPos, Size, Text, Font, Template, Visible)
	local self = {};
	setmetatable(self, LoradeUI.LabeledCheckbox); 
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	 
	self.Framepointer = CreateFrame("CheckButton", "MyCheckbox", Parent, "UICheckButtonTemplate, BackdropTemplate")
	self.Framepointer:SetPoint("CENTER", XPos, YPos)
	self.Framepointer:SetSize(Size, Size)

	-- Direkt einen Rahmen zum Button hinzufügen
	self.Framepointer:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8x8",
		edgeFile = "Interface\\Buttons\\WHITE8x8",
		tile = true,
		tileEdge = true,
		tileSize = 1,
		edgeSize = 1,
		insets = { left = 1, right = 1, top = 1, bottom = 1 },
	})
	self.Framepointer:SetBackdropColor(LoradeUI.HexToRGB("#212121"))
	self.Framepointer:SetBackdropBorderColor(LoradeUI.HexToRGB("#000000"))  -- Weißer Rahmen

	-- Leere oder gefüllte Checkbox je nach Zustand
	local checkTexture = self.Framepointer:CreateTexture(nil, "ARTWORK")
	checkTexture:SetTexture("Interface\\Buttons\\WHITE8x8")  -- Einfarbige Textur für Füllung
	checkTexture:SetVertexColor(LoradeUI.HexToRGB("#ffffff"))  -- Weiß gefüllt
	checkTexture:SetPoint("TOPLEFT", 1, -1)
	checkTexture:SetPoint("BOTTOMRIGHT", -1, 1)
	self.Framepointer:SetCheckedTexture(checkTexture)  -- Wird angezeigt, wenn angehakt

	local normalTexture = self.Framepointer:CreateTexture(nil, "BACKGROUND")
	normalTexture:SetTexture("Interface\\Buttons\\WHITE8x8")  -- Hintergrund
	normalTexture:SetVertexColor(0, 0, 0, 0)  -- Transparenter Hintergrund
	normalTexture:SetAllPoints()
	self.Framepointer:SetNormalTexture(normalTexture)  -- Wird angezeigt, wenn nicht angehakt

	local highlightTexture = self.Framepointer:GetHighlightTexture()
	if highlightTexture then
		highlightTexture:SetColorTexture(0.5, 0.5, 0.5, 0.5) -- Beispiel: Grau und halbtransparent
		highlightTexture:SetBlendMode("ADD") -- Wichtig für Highlight-Texturen
	end

	
	self.Label = LoradeUI.Fontstring:Create(Name.."_Label", self.Framepointer, "LEFT", Size + 10 , 0, Text, Font, Visible)
	 
	if Visible == true then
		self.Framepointer:Show();
	else
		self.Framepointer:Hide();
	end
	 
------------------------------------------------------------------------------------------------------- 
	
	--//Get Functions
	
	function self:GetName()
		return self.Name;
	end
	
	function self:IsVisible()	
		return self.Framepointer:IsVisible()
	end
	
	function self:GetParent()
		return self.Framepointer:GetParent()
	end
	
	function self:GetXPos(Index)
	
		if Index == nil then
			local _, _, _, xPos = self.Framepointer:GetPoint(0)
		else
			local _, _, _, xPos = self.Framepointer:GetPoint(Index)
		end
		
		return xPos
	end
	
	function self:GetYPos()
	
		if Index == nil then
			local _, _, _, _, yPos = self.Framepointer:GetPoint(0)
		else
			local _, _, _, _, yPos = self.Framepointer:GetPoint(Index)
		end
		
		return yPos
	end
	
	function self:ToParent()
		return self.Framepointer
	end
	
	function self:GetTooltipText()
		return self.Framepointer.tooltip
	end
	
	function self:GetLabelTextObject()
		return self.Label
	end
	
------------------------------------------------------------------------------------------------------- 

	--//Set Functions
	
	function self:Show()
		self.Framepointer:Show();
	end
	
	function self:Hide()
		self.Framepointer:Hide();
	end
	
	function self:SetXPos(XPos)
		self.SetPoint("CENTER", XPos, self:GetYPos())
	end
	
	function self:SetYPos(YPos)
		self.SetPoint("CENTER", self:GetXPos(), YPos)
	end
	
	function self:CorrectLabelPosition()
		self.Label:SetXPos(500)
		
		self.Label.Framepointer:SetPoint("CENTER", self.Label:GetStringWidth(), 0)
	end
	
	function self:SetTooltipText(Text)
		self.Framepointer.tooltip = Text;
	end
	
	function self:RegisterEvent(Event, Delegate)
		self.Framepointer:SetScript(Event, function(self, args)
			Delegate(args)
		end)
	end
	
	function self:UnregisterEvent(Event)
		self.Framepointer:UnregisterEvent(Event)
	end
	 
------------------------------------------------------------------------------------------------------- 
	 
	 
	self:CorrectLabelPosition()
	 
    return self, self.Label;
 end
 
 ------------------------------------------------------------------------------------------------------- 
 
 --Interface.LabeledCheckbox:Create("Test", UIParent, 0, 0, 32, "Hallo", "GameFontNormalLarge", "ChatConfigCheckButtonTemplate", true)
 
 --b = Interface.Checkbox:Create("Test", UIParent, 0, 0, 32,"ChatConfigCheckButtonTemplate", true)
 --b:SetTooltipText("Hallo")