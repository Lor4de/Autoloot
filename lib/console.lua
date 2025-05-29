local Autoloot = select(2,...);

-------------------------------------------------------------------------------------------------------

--//Gibt [Text] im Chatfenster aus

function Autoloot.Console:Print(Text)
	print("|cFF99ff66 [Autoloot Console]: |r"..Text);
end

-------------------------------------------------------------------------------------------------------

--//Registriert [Keyword] in der Keywordliste, welche im Nachhinein die Konsolenbefehle darstellen

function Autoloot.Console:RegisterKeyword(Keyword, Delegate)

	local Keyword = string.lower(Keyword)

	if Autoloot.Console.Keywords[Keyword] == nil then
		Autoloot.Console.Keywords[Keyword] = Delegate;
	end
end

-------------------------------------------------------------------------------------------------------

--//Überprüft ob [Keyword] bereits in der Keywordliste ist

function Autoloot.Console:DoKeywordExist(Keyword)

	local Keyword = string.lower(Keyword)

	if Autoloot.Console.Keywords[Keyword] == nil then
		return false;
	end
	
	return true;
end

-------------------------------------------------------------------------------------------------------

--//Gibt den Tablepointer des Delegates von [Keyword] zurück

function Autoloot.Console:GetDelegateOf(Keyword)
	return Autoloot.Console.Keywords[string.lower(Keyword)];
end
