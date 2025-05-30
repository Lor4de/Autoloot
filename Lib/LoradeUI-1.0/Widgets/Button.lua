local LoradeUI = select(2,...);

LoradeUI.Button = {}; 
LoradeUI.Button__index = LoradeUI.Button;   
function LoradeUI.Button:Create(Name, Parent, XPos, YPos, Width, Height, Text, Template, Visible)
	local self = {};
	setmetatable(self, LoradeUI.Button); 
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	 
	function SetButtonBlackBorder(button)
		local frameWidth = button:GetWidth()
		local frameHeight = button:GetHeight()

		-- Oberer Rahmen
		local borderTop = button:CreateTexture(nil, "OVERLAY")
		borderTop:SetSize(frameWidth + 1, 1) -- Buttonbreite + 2px für Ecken, Höhe 1px
		borderTop:SetPoint("TOPLEFT", button, "TOPLEFT", -1, 1) -- 1px links, 1px nach oben
		borderTop:SetTexture("Interface\\BUTTONS\\WHITE8X8") -- Winzige weiße Textur als Basis
		borderTop:SetColorTexture(LoradeUI.HexToRGB("#000000"))

		-- Unterer Rahmen
		local borderBottom = button:CreateTexture(nil, "OVERLAY")
		borderBottom:SetSize(frameWidth + 1, 1)
		borderBottom:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", -1, -1) -- 1px links, 1px nach unten
		borderBottom:SetTexture("Interface\\BUTTONS\\WHITE8X8")
		borderBottom:SetColorTexture(LoradeUI.HexToRGB("#000000"))

		-- Linker Rahmen
		local borderLeft = button:CreateTexture(nil, "OVERLAY")
		borderLeft:SetSize(1, frameHeight + 1) -- Breite 1px, Buttonhöhe + 2px für Ecken
		borderLeft:SetPoint("TOPLEFT", button, "TOPLEFT", -1, 1) -- 1px links, 1px nach oben
		borderLeft:SetTexture("Interface\\BUTTONS\\WHITE8X8")
		borderLeft:SetColorTexture(LoradeUI.HexToRGB("#000000"))

		-- Rechter Rahmen
		local borderRight = button:CreateTexture(nil, "OVERLAY")
		borderRight:SetSize(1, frameHeight + 1)
		borderRight:SetPoint("TOPRIGHT", button, "TOPRIGHT", 1, 1) -- 1px rechts, 1px nach oben
		borderRight:SetTexture("Interface\\BUTTONS\\WHITE8X8")
		borderRight:SetColorTexture(LoradeUI.HexToRGB("#000000"))
	end


	-- Erstelle den Button
	self.Framepointer = CreateFrame("Button", Name, Parent, "UIPanelButtonTemplate, BackdropTemplate")
	self.Framepointer:SetSize(Width, Height)
	self.Framepointer:SetPoint("CENTER", XPos, YPos)
	self.Framepointer:SetText(Text)

	local normalTexture = self.Framepointer:CreateTexture(nil, "ARTWORK")
	normalTexture:SetSize(self.Framepointer:GetSize())
	normalTexture:SetPoint("CENTER", self.Framepointer, "CENTER", 0, 0)
	normalTexture:SetTexture("Interface\\BUTTONS\\WHITE8X8") -- Pfad zur 8x8 White Textur
	normalTexture:SetColorTexture(LoradeUI.HexToRGB("#212121")) -- Setze die Farbe auf Schwarz

	self.Framepointer:SetNormalTexture(normalTexture)


	local pushedTexture = self.Framepointer:CreateTexture(nil, "ARTWORK")
	pushedTexture:SetSize(self.Framepointer:GetSize())
	pushedTexture:SetPoint("CENTER", self.Framepointer, "CENTER", 0, 0)
	pushedTexture:SetTexture("Interface\\BUTTONS\\WHITE8X8") -- Pfad zur 8x8 White Textur
	pushedTexture:SetColorTexture(LoradeUI.HexToRGB("#212121")) -- Setze die Farbe auf Schwarz

	self.Framepointer:SetPushedTexture(pushedTexture)

	local highlightTexture = self.Framepointer:GetHighlightTexture()
	if highlightTexture then
		highlightTexture:SetColorTexture(0.5, 0.5, 0.5, 0.5) -- Beispiel: Grau und halbtransparent
		highlightTexture:SetBlendMode("ADD") -- Wichtig für Highlight-Texturen
	end

	SetButtonBlackBorder(self.Framepointer)
	 
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
	
	function self:GetWidth()
		return self.Framepointer:GetWidth()
	end
	
	function self:GetHeight()
		return self.Framepointer:GetHeight()
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
	
	function self:GetTexture()
		return self.Frametexture:GetTexture()
	end
	
	
	function self:ToParent()
		return self.Framepointer
	end
	
	function self:GetText()
		return self.Framepointer:GetText()
	end
	
------------------------------------------------------------------------------------------------------- 

	--//Set Functions
	
	function self:Show()
		self.Framepointer:Show();
	end
	
	function self:Hide()
		self.Framepointer:Hide();
	end
	
	function self:SetWidth(Width)
		self.Framepointer:SetWidth(Width)
	end
	
	function self:SetHeight(Height)
		self.Framepointer:SetHeight(Height)
	end
	
	function self:SetXPos(XPos)
		self.SetPoint("CENTER", XPos, self:GetYPos())
	end
	
	function self:SetYPos(YPos)
		self.SetPoint("CENTER", self:GetXPos(), YPos)
	end
	
	function self:SetText(Text)
		self.Framepointer:SetText(Text)
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