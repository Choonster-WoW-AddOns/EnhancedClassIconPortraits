local units = {}

-- Do not change anything above this line
---------------------
-- START OF CONFIG --
---------------------

-- Each `units.<unit> = true/false` line determines whether class icon portraits are enabled (true) or disabled (false) for the specified unit (https://wowpedia.fandom.com/wiki/UnitId)
-- Additional lines can be added for any unit that has a unit frame with a portrait

-- Default setting for any unit not listed here
units.DEFAULT = true

units.player = true

units.target = true

units.targettarget = true

units.focus = true

units.focustarget = true

-------------------
-- END OF CONFIG --
-------------------
-- Do not change anything below this line

local _, ns = ...
ns.units = units
