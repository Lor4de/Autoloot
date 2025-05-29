local Interface = select(2,...);

Interface.Checkbox = {}; 
Interface.Checkbox__index = Interface.Checkbox;   
function Interface.Checkbox:Create(Name, Parent, XPos, YPos, Size, Template, Visible)
	local self = {};
	setmetatable(self, Interface.Checkbox); 
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	 
	self.Framepointer = CreateFrame("CheckButton", Name, Parent, Template);
	self.Framepointer:SetText(Text)
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


 
Interface.LabeledCheckbox = {}; 
Interface.LabeledCheckbox__index = Interface.LabeledCheckbox;   
function Interface.LabeledCheckbox:Create(Name, Parent, XPos, YPos, Size, Text, Font, Template, Visible)
	local self = {};
	setmetatable(self, Interface.LabeledCheckbox); 
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	 
	self.Framepointer = CreateFrame("CheckButton", Name, Parent, Template);
	self.Framepointer:SetPoint("CENTER", XPos, YPos)
	self.Framepointer:SetSize(Size, Size)
	
	self.Label = Interface.Fontstring:Create(Name.."_Label", self.Framepointer, Size , 0, Text, Font, Visible)
	 
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