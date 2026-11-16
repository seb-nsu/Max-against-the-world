-- Couch Quest: Farben eines Bildes nach einer Tabelle umfärben (Aseprite, Batch-Modus)
--
-- Aufruf:
--   Aseprite.exe -b --script-param bild=<eingabe.png> --script-param karte=<tabelle.csv>
--                   [--script-param ziel=<ausgabe.png>] --script umfaerben.lua
--
-- Tabelle (CSV, Semikolon, Kopfzeile wird übersprungen, # leitet Kommentare ein):
--   alt;neu;notiz
--   #3e8948;#3a7d44;Haut Mitte
-- Farben, die nicht in der Tabelle stehen, bleiben unverändert. Alpha bleibt erhalten.
-- Ohne „ziel“ wird das Eingabebild überschrieben. Am Ende stehen die Zählungen je Zeile auf der Konsole.

local bild = app.params["bild"]
local karte = app.params["karte"]
local ziel = app.params["ziel"] or bild
assert(bild and karte, "bild und karte angeben")

local function hex(s)
  s = s:gsub("#", ""):lower()
  return tonumber(s:sub(1,2),16), tonumber(s:sub(3,4),16), tonumber(s:sub(5,6),16)
end

local tabelle, reihenfolge = {}, {}
local erste = true
for zeile in io.lines(karte) do
  zeile = zeile:gsub("\r", "")
  if erste then erste = false
  else
    local alt, neu = zeile:match("^%s*(#%x%x%x%x%x%x)%s*;%s*(#%x%x%x%x%x%x)")
    if alt then
      local r, g, b = hex(alt)
      local key = r * 65536 + g * 256 + b
      tabelle[key] = { hex(neu) }
      tabelle[key].name = alt .. " -> " .. neu
      tabelle[key].n = 0
      table.insert(reihenfolge, key)
    end
  end
end

local spr = app.open(bild)
assert(spr, "Bild nicht lesbar: " .. bild)
if spr.colorMode ~= ColorMode.RGB then app.command.ChangePixelFormat{ format = "rgb" } end
local pc = app.pixelColor
for _, cel in ipairs(spr.cels) do
  local img = cel.image:clone()
  for it in img:pixels() do
    local v = it()
    local a = pc.rgbaA(v)
    if a > 0 then
      local key = pc.rgbaR(v) * 65536 + pc.rgbaG(v) * 256 + pc.rgbaB(v)
      local t = tabelle[key]
      if t then
        it(pc.rgba(t[1], t[2], t[3], a))
        t.n = t.n + 1
      end
    end
  end
  cel.image = img
end
spr:saveAs(ziel)
for _, key in ipairs(reihenfolge) do
  print(tabelle[key].name .. ": " .. tabelle[key].n .. " Pixel")
end
print("gespeichert: " .. ziel)
