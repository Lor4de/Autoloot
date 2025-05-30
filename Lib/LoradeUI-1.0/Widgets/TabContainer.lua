local LoradeUI = select(2,...);

LoradeUI.TabContainer = {}; 
LoradeUI.TabContainer = LoradeUI.TabContainer;
function LoradeUI.TabContainer:Create(Name, Parent, XPos, YPos, Width, Height, Visible)
	local self = {};
	setmetatable(self, LoradeUI.TabContainer);
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	 
-------------------------------------------------------------------------------------------------------
	 

    self.Framepointer = CreateFrame("Frame", Name, Parent, "BackdropTemplate")
    self.Framepointer:SetSize(Width, Height) -- Größe des gesamten Fensters
    self.Framepointer:SetPoint("CENTER", UIParent, "CENTER", XPos, YPos)

    -- Optional: Hintergrund und Rahmen für das Hauptfenster
    self.Framepointer:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    self.Framepointer:SetBackdropColor(0.1, 0.1, 0.1, 0.8) -- Dunkler Hintergrund
    self.Framepointer:SetBackdropBorderColor(0.5, 0.5, 0.5, 1) -- Grauer Rand
	
    -- Tabelle der Tabs
    local tabs = {
        {name = "Tab 1", id = "TAB1"},
        {name = "Tab 2", id = "TAB2"},
        {name = "Tab 3", id = "TAB3"}
    }

    local tabButtons = {} -- Tabelle, um die Button-Objekte zu speichern
    local currentActiveTab = nil -- Speichert den aktuell ausgewählten Tab

    local tabXOffset = 15 -- Startposition für den ersten Tab
    local tabYOffset = -40 -- Y-Position der Tabs (unterhalb des Titels)
    local tabWidth = 100
    local tabHeight = 25

    local contentFrames = {} -- Tabelle, um die Inhalts-Frames zu speichern

    function self:SelectTab(tabID)
    -- Alle Tab-Inhalte ausblenden
        for id, frame in pairs(contentFrames) do
            frame:Hide()
        end
    end

    for i, tabInfo in ipairs(tabs) do
        local tabButton = CreateFrame("Button", nil, self.Framepointer, "BackdropTemplate, UIPanelButtonTemplate")
        tabButton:SetSize(tabWidth, tabHeight)
        tabButton:SetPoint("TOPLEFT", self.Framepointer, "TOPLEFT", tabXOffset, tabYOffset)
        tabButton:SetText(tabInfo.name)
        tabButton.tabID = tabInfo.id -- Speichern der ID im Button-Objekt

        tabXOffset = tabXOffset + tabWidth + 5 -- Abstand zwischen den Tabs

        local normalTexture = tabButton:CreateTexture(nil, "ARTWORK")
        normalTexture:SetSize(tabButton:GetSize())
        normalTexture:SetPoint("CENTER", tabButton, "CENTER", 0, 0)
        normalTexture:SetTexture("Interface\\BUTTONS\\WHITE8X8") -- Pfad zur 8x8 White Textur
        normalTexture:SetColorTexture(LoradeUI.HexToRGB("#212121")) -- Setze die Farbe auf Schwarz

        tabButton:SetNormalTexture(normalTexture)

        -- Funktion zum Umschalten der Tabs
        tabButton:SetScript("OnClick", function(Button)
            self:SelectTab(Button.tabID)
        end)

        tabButtons[tabInfo.id] = tabButton -- Speichern des Buttons unter seiner ID
    end

    -- Bereich, in dem der Inhalt angezeigt wird
    local contentFrameContainer = CreateFrame("Frame", nil, self.Framepointer, "BackdropTemplate")
    contentFrameContainer:SetPoint("TOPLEFT", self.Framepointer, "TOPLEFT", 10, -70) -- Unter den Tabs
    contentFrameContainer:SetPoint("BOTTOMRIGHT", self.Framepointer, "BOTTOMRIGHT", -10, 10)
    contentFrameContainer:SetBackdrop({
        bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    contentFrameContainer:SetBackdropColor(0.2, 0.2, 0.2, 0.9) -- Leichter Hintergrund für den Inhaltsbereich

    -- --- Inhalt für TAB 1 ---
    local tab1Content = CreateFrame("Frame", nil, contentFrameContainer)
    tab1Content:SetAllPoints() -- Füllt den gesamten Inhaltsbereich aus
   
    contentFrames.TAB1 = tab1Content
    tab1Content:Hide()

    -- --- Inhalt für TAB 2 ---
    local tab2Content = CreateFrame("Frame", nil, contentFrameContainer)
    tab2Content:SetAllPoints()

    contentFrames.TAB2 = tab2Content
    tab2Content:Hide()

    -- --- Inhalt für TAB 3 ---
    local tab3Content = CreateFrame("Frame", nil, contentFrameContainer)
    tab3Content:SetAllPoints()
    
    contentFrames.TAB3 = tab3Content
    tab3Content:Hide()

    -- Alle Tab-Buttons "deaktivieren" (optisch)
    for id, button in pairs(tabButtons) do
        button:GetNormalTexture():SetVertexColor(0.3, 0.3, 0.3) -- Gedimmte Farbe
        -- Setzt die Textur des Buttons auf den normalen (unselected) Zustand
    end

    -- Den ausgewählten Tab-Inhalt anzeigen
    if contentFrames[tabID] then
        contentFrames[tabID]:Show()
        currentActiveTab = tabID
    end

    -- Den ausgewählten Tab-Button "aktivieren" (optisch)
    if tabButtons[tabID] then
        tabButtons[tabID]:GetNormalTexture():SetVertexColor(1, 1, 1) -- Helle Farbe
        --tabButtons[tabID]:SetPushed(true) -- Setzt den Button in den "gedrückt" Zustand
    end

-- Beim Laden des Addons den ersten Tab auswählen
    self.Framepointer:SetScript("OnShow", function(Frame)
    if not currentActiveTab then -- Nur beim ersten Mal den Standard-Tab setzen
        self:SelectTab("TAB1")
    end
end)
	 
------------------------------------------------------------------------------------------------------- 
	
	--//Get Functions
	
	function self:GetName()
		return self.Name;
	end
	
	function self:IsVisible()	
		return self.Framepointer:IsVisible()
	end
	
------------------------------------------------------------------------------------------------------- 

	--//Set Functions
	
	function self:Show()
		self.Framepointer:Show();
	end
	
	function self:Hide()
		self.Framepointer:Hide();
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