local LoradeUI = select(2,...);

LoradeUI.Frame = {}; 
LoradeUI.Frame__index = LoradeUI.Frame;   
function LoradeUI.Frame:Create(Name, Parent, XPos, YPos, Width, Height, Visible)
	local self = {};
	setmetatable(self, LoradeUI.Frame);
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	self.Moveable = false;
	 
-------------------------------------------------------------------------------------------------------
	 
	self.Framepointer = CreateFrame("Frame", Name, Parent, "BackdropTemplate")
	self.Framepointer:SetFrameStrata("BACKGROUND")
	self.Framepointer:SetWidth(Width)
	self.Framepointer:SetHeight(Height)

	self.Framepointer:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8x8",
		edgeFile = "Interface\\Buttons\\WHITE8x8",
		tile = true,
		tileEdge = true,
		tileSize = 1,
		edgeSize = 1,
		insets = { left = 1, right = 1, top = 1, bottom = 1 },
	})

	self.Framepointer:SetAlpha(1)
	self.Framepointer:SetBackdropColor(0, 0, 0, 1) -- Färbt die vorhandene Textur ein, aber ihre Transparenz bleibt

	self.Framepointer:SetClampedToScreen(true)

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

	function self:EnableMoveable()
		self.Framepointer:SetMovable(true)
		self.Moveable = true

		self.Framepointer:RegisterForDrag("LeftButton")

		self.Framepointer:SetScript("OnDragStart", function(self)
			self:StartMoving() -- Beginnt den Bewegungsmodus beim Drag-Start
		end)

		self.Framepointer:SetScript("OnDragStop", function(self)
			self:StopMovingOrSizing() -- Beendet den Bewegungsmodus beim Drag-Stop
		end)

		self.Framepointer:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" and self.Moveable == true then
				self:StartMoving()
			end
		end)

		self.Framepointer:SetScript("OnMouseUp", function(self, button)
			if button == "LeftButton" and self.IsMovable == true then
				self:StopMovingOrSizing()
			end
		end)
	end
	
	function self:SetTexture(Texture)
		
		self.Frametexture = self.Framepointer:CreateTexture(self.Name.."_TEXTURE","BACKGROUND")
		self.Frametexture:SetTexture(Texture)
		self.Frametexture:SetAllPoints(self.Framepointer)
		self.Framepointer.texture = self.Frametexture

	end

	function self:SetBackdrop(Backdrop, Color)
		local r, g, b, a = unpack(Color)
		self.Framepointer:SetBackdrop(Backdrop)
		self.Framepointer:SetBackdropColor(r, g, b, a)
	end

	function self:SetBackdropColor(hexColor)
		self.Framepointer:SetBackdropColor(LoradeUI.HexToRGB(hexColor))
	end

	function self:SetBackdropBorderColor(hexColor)
		self.Framepointer:SetBackdropBorderColor(LoradeUI.HexToRGB(hexColor))
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