local Interface = select(2,...);

Interface.Textbox = {}; 
Interface.Button__index = Interface.Textbox;   
function Interface.Textbox:Create(Name, Parent, XPos, YPos, Width, Height, Text, Template, Visible)
	local self = {};
	setmetatable(self, Interface.Textbox); 
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	 
	 
    self.Framepointer = CreateFrame("EditBox", Name, Parent, Template)
	self.Framepointer:SetSize(Width, Height)
	self.Framepointer:SetAutoFocus(false)
	 
	self.Framepointer:SetText(Text)
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
	
	function self:GetText()
		return self.Framepointer:GetText()
	end
	
	function self:GetAutoFocus(AutoFocus)
		self.Framepointer:IsAutoFocus()
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
	
	function self:SetText(Text)
		self.Framepointer:SetText(Text)
	end
	
	function self:SetAutoFocus(AutoFocus)
		self.Framepointer:SetAutoFocus(AutoFocus)
	end
	
	function self:RegisterEvent(Event, Delegate)
		self.Framepointer:SetScript(Event, function(self, args)
			Delegate()
		end)
	end
	
	function self:UnregisterEvent(Event)
		self.Framepointer:UnregisterEvent(Event)
	end
	
	function self:Clear()
		self.Framepointer:SetText("")
	end
	 
------------------------------------------------------------------------------------------------------- 
	 
    return self;
 end
 
 ------------------------------------------------------------------------------------------------------- 
 