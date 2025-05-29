local Interface = select(2,...);

Interface.ScrollBar = {}; 
Interface.ScrollBar__index = Interface.ScrollBar;   
function Interface.ScrollBar:Create(Name, Parent, XOffSet, YOffSet, HorizontalBarOffset, Width, Height, ScrollBarMaxValue, ScrollBarStepValue, ScrollBarTexture, ContentFrameTexture, Visible)
	local self = {};
	setmetatable(self, Interface.ScrollBar); 
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	
	--Scrollframe 
	self.ScrollFrame = CreateFrame("ScrollFrame", nil, Parent) 
	self.ScrollFrame:SetPoint("TOPLEFT", XOffSet, XOffSet * -1) 
	self.ScrollFrame:SetPoint("BOTTOMRIGHT", YOffSet * -1, YOffSet) 
	local texture = self.ScrollFrame:CreateTexture() 
	texture:SetAllPoints() 
	texture:SetTexture(.5,.5,.5,1) 
	Parent.scrollframe = self.ScrollFrame 

	--Scrollbar 
	self.Scrollbar = CreateFrame("Slider", nil, self.ScrollFrame, "UIPanelScrollBarTemplate") 
	self.Scrollbar:SetPoint("TOPLEFT", Parent, "TOPRIGHT", HorizontalBarOffset, -16) 
	self.Scrollbar:SetPoint("BOTTOMLEFT", Parent, "BOTTOMRIGHT", HorizontalBarOffset, 16) 
	self.Scrollbar:SetMinMaxValues(1, ScrollBarMaxValue) 
	self.Scrollbar:SetValueStep(ScrollBarStepValue) 
	self.Scrollbar.scrollStep = ScrollBarStepValue
	self.Scrollbar:SetValue(0) 
	self.Scrollbar:SetWidth(16)
	
	self.Scrollbar:SetScript("OnValueChanged", function (self, value) 
		self:GetParent():SetVerticalScroll(value) 
	end) 
	
	local scrollbg = self.Scrollbar:CreateTexture(nil, "BACKGROUND") 
	scrollbg:SetAllPoints(self.Scrollbar)
	
	if type(ScrollBarTexture) == "table" then
		scrollbg:SetTexture(unpack(ScrollBarTexture)) 
	else 
		scrollbg:SetTexture(ScrollBarTexture) 
	end
	
	Parent.scrollbar = self.Scrollbar 

	--Content frame 
	self.ContentFrame = CreateFrame("Frame", nil, self.Scrollframe) 
	self.ContentFrame:SetSize(Width, Height) 
	local texture = self.ContentFrame:CreateTexture() 
	texture:SetAllPoints() 
	
	if type(ContentFrameTexture) == "table" then
		texture:SetTexture(unpack(ContentFrameTexture)) 
	else 
		texture:SetTexture(ContentFrameTexture) 
	end
	
	self.ContentFrame.texture = texture 
	self.ScrollFrame.content = self.ContentFrame 

	self.ScrollFrame:SetScrollChild(self.ContentFrame)
	
	
	 
	if Visible == true then
		self.ScrollFrame:Show();
	else
		self.ScrollFrame:Hide();
	end
	 
------------------------------------------------------------------------------------------------------- 
	
	--//Get Functions
	
	function self:GetName()
		return self.Name;
	end
	
	function self:IsVisible()	
		return self.ScrollFrame:IsVisible()
	end
	
	function self:GetParent()
		return self.ScrollFrame:GetParent()
	end
	
	function self:GetWidth()
		return self.ContentFrame:GetWidth()
	end
	
	function self:GetHeight()
		return self.ContentFrame:GetHeight()
	end
	
	function self:ToParent()
		return self.Framepointer
	end
	
------------------------------------------------------------------------------------------------------- 

	--//Set Functions
	
	function self:Show()
		self.ScrollFrame:Show();
	end
	
	function self:Hide()
		self.ScrollFrame:Hide();
	end
	
	function self:SetWidth(Width)
		self.ContentFrame:SetWidth(Width)
	end
	
	function self:SetHeight(Height)
		self.ContentFrame:SetHeight(Height)
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
	 
    return unpack({self.ScrollFrame, self.ScrollBar, self.ContentFrame});
 end
 
 ------------------------------------------------------------------------------------------------------- 

 
 