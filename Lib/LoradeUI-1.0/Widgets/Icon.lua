local LoradeUI = select(2,...);

LoradeUI.Icon = {}; 
LoradeUI.Icon__index = LoradeUI.Icon;   
function LoradeUI.Icon:Create(Name, Parent, XPos, YPos, Size, Texture, Template, Visible)
	local self = {};
	setmetatable(self, LoradeUI.Icon); 
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	 
	self.Framepointer = CreateFrame("Button", Name, Parent, Template)
	self.Framepointer:SetPoint("CENTER", XPos, YPos)
	self.Framepointer:SetSize(Size, Size)
	
	local icon = self.Framepointer:CreateTexture(nil, "ARTWORK")
	icon:SetAllPoints(true)
	icon:SetTexture(Texture)
	self.Framepointer.icon = icon
	 
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
	
	function self:SetTexture(Texture)
		self.SetTexture(Texture)
	end
	 
------------------------------------------------------------------------------------------------------- 
	 
    return self;
 end
 
 ------------------------------------------------------------------------------------------------------- 