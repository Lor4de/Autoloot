local Interface = select(2,...);

Interface.Frame = {}; 
Interface.Frame__index = Interface.Frame;   
function Interface.Frame:Create(Name, Parent, XPos, YPos, Width, Height, Texture, Visible)
	local self = {};
	setmetatable(self, Interface.Frame); 
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	 
	self.Framepointer = CreateFrame("Frame", Name, Parent)
	self.Framepointer:SetFrameStrata("BACKGROUND")
	self.Framepointer:SetWidth(Width)
	self.Framepointer:SetHeight(Height)
	
	self.Framepointer:RegisterForDrag("LeftButton")
	self.Framepointer:SetScript("OnDragStart", self.Framepointer.StartMoving)
	self.Framepointer:SetScript("OnDragStop", self.Framepointer.StopMovingOrSizing)

	self.Frametexture = self.Framepointer:CreateTexture(Name.."_TEXTURE","BACKGROUND")
	self.Frametexture:SetTexture(Texture)
	self.Frametexture:SetAllPoints(self.Framepointer)
	self.Framepointer.texture = self.Frametexture

	self.Framepointer:SetPoint("CENTER", XPos, YPos)
	 
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
	
	function self:GetMoveable()
		return self.Framepointer:IsMovable()
	end
	
	function self:IsClampedToScreen()
		return self.Framepointer:IsClampedToScreen()
	end
	
	function self:IsMouseEnabled()
		return self.Framepointer:IsMouseEnabled()
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
	
	function self:SetTexture(Texture)
		
		self.Frametexture = self.Framepointer:CreateTexture(self.Name.."_TEXTURE","BACKGROUND")
		self.Frametexture:SetTexture(Texture)
		self.Frametexture:SetAllPoints(self.Framepointer)
		self.Framepointer.texture = self.Frametexture

	end
	
	function self:SetMoveable(Moveable)
		self.Framepointer:SetMovable(Moveable)
	end
	
	function self:SetClampToScreen(ClampToScreen)
		self.Framepointer:SetClampedToScreen(ClampToScreen)
	end
	
	function self:SetMouseEnabled(MouseEnabled)
		self.Framepointer:EnableMouse(MouseEnabled)
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

 