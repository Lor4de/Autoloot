local LoradeUI = select(2,...);

LoradeUI.Fontstring = {}; 
LoradeUI.Fontstring__index = LoradeUI.Fontstring;   
function LoradeUI.Fontstring:Create(Name, Parent, Point , XPos, YPos, Text, Font, Visible)
	local self = {};
	setmetatable(self, LoradeUI.Fontstring); 
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	 
	self.Framepointer = Parent:CreateFontString(Name, "OVERLAY", Font)
	self.Framepointer:SetText(Text)
	self.Framepointer:SetPoint(Point, XPos, YPos)
	 
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
	
	function self:GetYPos(Index)
	
		if Index == nil then
			local _, _, _, _, yPos = self.Framepointer:GetPoint(0)
		else
			local _, _, _, _, yPos = self.Framepointer:GetPoint(Index)
		end
		
		return yPos
	end
	
	function self:GetStringWidth()
		return self.Framepointer:GetStringWidth()
	end
	
	function self:ToParent()
		return self.Framepointer
	end
	
	function self:GetText()
		return self.Framepointer:GetText()
	end
	
	function self:GetMultiline(Multiline)
		return self.Framepointer:CanWordWrap()
	end
	
	function self:GetTextColor()
		unpack(self.Framepointer:GetTextColor())
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
		self.Framepointer:SetPoint("CENTER", XPos, self:GetYPos(0))
	end
	
	function self:SetYPos(YPos)
		self.Framepointer:SetPoint("CENTER", self:GetXPos(0), YPos)
	end
	
	function self:SetText(Text)
		self.Framepointer:SetText(Text)
	end
	
	function self:SetMultiline(Multiline)
		self.Framepointer:SetWordWrap(Multiline)
	end
	
	function self:SetTextColor(R, G, B, A)
		self.Framepointer:SetTextColor(R, G, B, A)
	end
	
	 
------------------------------------------------------------------------------------------------------- 
	 
    return self;
 end
 
 ------------------------------------------------------------------------------------------------------- 
 