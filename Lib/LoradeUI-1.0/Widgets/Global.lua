local LoradeUI = select(2,...);

function LoradeUI.HexToRGB(hexColor)
    hexColor = hexColor:gsub("#", "") -- Entferne eventuelle '#' Präfixe
    local r, g, b, a

    if #hexColor == 6 then
        -- RRGGBB Format
        r = tonumber("0x" .. hexColor:sub(1, 2)) / 255
        g = tonumber("0x" .. hexColor:sub(3, 4)) / 255
        b = tonumber("0x" .. hexColor:sub(5, 6)) / 255
        a = 1.0 -- Standard-Alpha, wenn nicht angegeben
    elseif #hexColor == 8 then
        -- AARRGGBB oder RRGGBBAA Format
        -- Die meisten Hex-Farben in UI-Kontexten sind RRGGBBAA
        -- Aber in WoW's Text-Markup ist es AARRGGBB.
        -- Wir nehmen hier an, es ist RRGGBBAA, da es für UI-Elemente logischer ist.
        r = tonumber("0x" .. hexColor:sub(1, 2)) / 255
        g = tonumber("0x" .. hexColor:sub(3, 4)) / 255
        b = tonumber("0x" .. hexColor:sub(5, 6)) / 255
        a = tonumber("0x" .. hexColor:sub(7, 8)) / 255
        
        -- Wenn es AARRGGBB ist, müsstest du die Reihenfolge ändern:
        -- a = tonumber("0x" .. hexColor:sub(1, 2)) / 255
        -- r = tonumber("0x" .. hexColor:sub(3, 4)) / 255
        -- g = tonumber("0x" .. hexColor:sub(5, 6)) / 255
        -- b = tonumber("0x" .. hexColor:sub(7, 8)) / 255
    else
        -- Ungültiges Format
        error("Ungültiges Hex-Farbformat: " .. hexColor)
    end

    return r, g, b, a
end