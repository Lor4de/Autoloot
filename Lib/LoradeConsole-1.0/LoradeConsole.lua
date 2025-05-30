local LoradeConsole = select(2,...);

LoradeConsole.Spacer = "";
LoradeConsole.Seperator = "\\";

LoradeConsole.Console = {}; 
LoradeConsole.Console__index = LoradeConsole.Console;
function LoradeConsole.Console:Create(Name, Prefix)
	local self = {};
	setmetatable(self, LoradeConsole.Console);
	 
-------------------------------------------------------------------------------------------------------

	--//Variables

	self.Name = Name;
	self.Prefix = Prefix;
	self.Keywords = {};

	SLASH_CONSOLE1 = string.lower(Prefix);
	local function handler(Keyword, editbox)

		if self.Keywords[string.lower(Keyword)] then
			local Delegate = self.Keywords[string.lower(Keyword)]
			Delegate();
		end
	end
	SlashCmdList["CONSOLE"] = handler;
	 
-------------------------------------------------------------------------------------------------------
	 
------------------------------------------------------------------------------------------------------- 
	
	--//Get Functions
	
	function self:GetName()
		return self.Name;
	end

	function self:Print(Text)
		print("|cFF99ff66 ["..self.Name.."]: |r"..Text);
	end

	function self:DoesKeywordExist(Keyword)

		local Keyword = string.lower(Keyword)

		if self.Keywords[Keyword] == nil then
			return false;
		end
		
		return true;
	end

	function self:GetDelegateOf(Keyword)
		return self.Keywords[string.lower(Keyword)];
	end
	
	
------------------------------------------------------------------------------------------------------- 

	--//Set Functions
	
	function self:Show()
		self.Framepointer:Show();
	end

	function self:RegisterKeyword(Keyword, Delegate)

		local Keyword = string.lower(Keyword)

		if self.Keywords[Keyword] == nil then
			self.Keywords[Keyword] = Delegate;
		end
	end
	
	 
------------------------------------------------------------------------------------------------------- 
	 
    return self;
 end
 
 ------------------------------------------------------------------------------------------------------- 