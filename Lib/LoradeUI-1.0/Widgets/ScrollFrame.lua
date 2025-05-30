local LoradeUI = select(2,...);

LoradeUI.ScrollBar = {}; 
LoradeUI.ScrollBar__index = LoradeUI.ScrollBar;   
function LoradeUI.ScrollBar:Create(Name, Parent, XOffSet, YOffSet, HorizontalBarOffset, Width, Height, ScrollBarMaxValue, ScrollBarStepValue, ScrollBarTexture, ContentFrameTexture, Visible)
	local self = {};
	setmetatable(self, LoradeUI.ScrollBar); 
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	
	--Scrollframe 
	self.ScrollFrame = CreateFrame("ScrollFrame", self.Name.."_SCROLLFRAME", Parent)
	self.ScrollFrame:SetPoint("TOPLEFT", XOffSet, XOffSet * -1)
	self.ScrollFrame:SetPoint("BOTTOMRIGHT", YOffSet * -1, YOffSet)
	--self.ScrollFrame:SetBackdropColor(0, 0, 0, 1)
	Parent.scrollframe = self.ScrollFrame

	--Scrollbar 
	self.Scrollbar = CreateFrame("Slider", self.Name.."_SCROLLBAR", self.ScrollFrame, "UIPanelScrollBarTemplate, BackdropTemplate")
	self.Scrollbar:SetPoint("TOPLEFT", Parent, "TOPRIGHT", HorizontalBarOffset, -5)
	self.Scrollbar:SetPoint("BOTTOMLEFT", Parent, "BOTTOMRIGHT", HorizontalBarOffset, 5)
	self.Scrollbar:SetMinMaxValues(1, ScrollBarMaxValue)
	self.Scrollbar:SetValueStep(ScrollBarStepValue)
	self.Scrollbar.scrollStep = ScrollBarStepValue
	self.Scrollbar:SetValue(0) 
	self.Scrollbar:SetWidth(5)

	self.Scrollbar:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8x8",
		edgeFile = "Interface\\Buttons\\WHITE8x8",
		tile = true,
		tileEdge = true,
		tileSize = 1,
		edgeSize = 1,
		insets = { left = 1, right = 1, top = 1, bottom = 1 },
	})

	self.Scrollbar:SetBackdropColor(LoradeUI.HexToRGB("#212121"))
	self.Scrollbar:SetBackdropBorderColor(LoradeUI.HexToRGB("#000000"))
	
	local thumb = self.Scrollbar:GetThumbTexture() -- Zugriff auf die Standard-Thumb-Texture

	if thumb then
		thumb:SetTexture("Interface\\Buttons\\WHITE8x8")
		thumb:SetSize(5, 5) -- Beispielgröße für den Thumb (Breite, Höhe)
		thumb:SetColorTexture(0.7, 0.7, 0.7, 1) -- Helles Grau für den Thumb
	end

local upButton = self.Scrollbar.ScrollUpButton -- Direkter Zugriff auf den Up-Button
local downButton = self.Scrollbar.ScrollDownButton -- Direkter Zugriff auf den Down-Button

if upButton then
    upButton:SetSize(5, 5)
    upButton:SetPoint("BOTTOMLEFT", self.Scrollbar, "TOPLEFT", 0, 0) -- Position über der Scrollbar
    
    -- Texturen der Buttons anpassen
    upButton:GetNormalTexture():SetTexture("Interface\\Buttons\\WHITE8x8")
    upButton:GetPushedTexture():SetTexture("Interface\\Buttons\\WHITE8x8")
    upButton:GetHighlightTexture():SetTexture("Interface\\Buttons\\WHITE8x8")
    
    -- Farben anpassen
    upButton:GetNormalTexture():SetColorTexture(0.5, 0.5, 0.5, 1)
    upButton:GetPushedTexture():SetColorTexture(0.3, 0.3, 0.3, 1)
    upButton:GetHighlightTexture():SetColorTexture(0.8, 0.8, 0.8, 0.5)
    upButton:GetHighlightTexture():SetBlendMode("ADD")
    print("Scrollbar Up Button Texturen gesetzt.")
else
    print("Warnung: ScrollUpButton nicht gefunden.")
end

if downButton then
    downButton:SetSize(5, 5)
    downButton:SetPoint("TOPLEFT", self.Scrollbar, "BOTTOMLEFT", 0, 0) -- Position unter der Scrollbar

    -- Texturen der Buttons anpassen
    downButton:GetNormalTexture():SetTexture("Interface\\Buttons\\WHITE8x8")
    downButton:GetPushedTexture():SetTexture("Interface\\Buttons\\WHITE8x8")
    downButton:GetHighlightTexture():SetTexture("Interface\\Buttons\\WHITE8x8")

    -- Farben anpassen
    downButton:GetNormalTexture():SetColorTexture(0.5, 0.5, 0.5, 1)
    downButton:GetPushedTexture():SetColorTexture(0.3, 0.3, 0.3, 1)
    downButton:GetHighlightTexture():SetColorTexture(0.8, 0.8, 0.8, 0.5)
    downButton:GetHighlightTexture():SetBlendMode("ADD")
    print("Scrollbar Down Button Texturen gesetzt.")
else
    print("Warnung: ScrollDownButton nicht gefunden.")
end

	
	local scrollbg = self.Scrollbar:CreateTexture(nil, "BACKGROUND")
	scrollbg:SetAllPoints(self.Scrollbar)
	
	if type(ScrollBarTexture) == "table" then
		scrollbg:SetTexture(unpack(ScrollBarTexture))
	else 
		scrollbg:SetTexture(ScrollBarTexture) 
	end
	
	Parent.scrollbar = self.Scrollbar

	--Content frame 

	self.ContentFrame = CreateFrame("Frame", self.Name.."_CONTENTFRAME", self.ScrollFrame, "BackdropTemplate") -- 'nil' als Parent vorerst
	self.ContentFrame:SetSize(Width, Height) -- WICHTIG: Das Content Frame muss HÖHER/BREITER sein als das ScrollFrame, um scrollbar zu sein
	self.ContentFrame:SetBackdropColor(0.2, 0.2, 0.2, 0.8) -- Optional: einen dunkleren Hintergrund für den Inhalt
	
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

 
 