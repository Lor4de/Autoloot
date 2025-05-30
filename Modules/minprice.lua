local Autoloot = LibStub("AceAddon-3.0"):GetAddon("Autoloot")

-------------------------------------------------------------------------------------------------------

function Autoloot:DoItemExist(Item)
	local itemName = GetItemInfo(Item);
	
	if itemName ~= nil then
		return true;
	end
	
	return false;
end

function Autoloot:ToggleMinprice()
	
	if Autoloot.Preferences.Minprice.Enabled == true then
		Autoloot.Preferences.Minprice.Enabled = false;
	else
		Autoloot.Preferences.Minprice.Enabled = true;
	end

	Autoloot:Printf(Autoloot.Locale.Strings["MINPRICE_STATUS_CHANGED_TO"].." -> ["..tostring(Autoloot.Preferences.Minprice.Enabled).."]");
	
end

-------------------------------------------------------------------------------------------------------

function Autoloot:PrintMinpriceEnabled()
	Autoloot.Console:Print(Autoloot.Locale.Strings["MINPRICE_STATUS"].." -> ["..tostring(Autoloot.Preferences.Minprice.Enabled).."]")
end


-------------------------------------------------------------------------------------------------------

function Autoloot:GetItemPrice(Item)

	if Autoloot:DoItemExist(Item) then

		local _, _, _, _, _, _, _, _, _, _, _Price = GetItemInfo(Item);

		return _Price;
	end
	
	return 0;
end


-------------------------------------------------------------------------------------------------------

function Autoloot:ConvertIntToGSC(GoldAsDecimal)

	local Gold = math.modf(GoldAsDecimal / 10000);
	local Rest = GoldAsDecimal - Gold * 10000
	local Silver = math.modf(Rest / 100)
	Rest = Rest - (Silver * 100)
	local Copper = Rest;
	
	return unpack({Gold, Silver, Copper})
		
end

-------------------------------------------------------------------------------------------------------

function Autoloot:ConvertGSCToInt(Gold, Silver, Copper)

	return (Gold * 10000) + (Silver * 100) + Copper;

end


-------------------------------------------------------------------------------------------------------

function Autoloot:IsPriceHigher(PriceA, PriceB)
	if PriceA > PriceB then
		return true;
	end
	return false
end	

-------------------------------------------------------------------------------------------------------
	
