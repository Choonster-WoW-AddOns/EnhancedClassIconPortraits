-- Code adapted from ClassIconNotPortrait by machinelfgaming:
-- https://wow.curseforge.com/projects/classiconnotportrait

local _, ns = ...
local units = ns.units

local TEXTURE_NAME = "Interface\\AddOns\\EnhancedClassIconPortraits\\Textures\\%s.tga"

local function EnabledForUnit(unit)
	local enabled = units[unit]

	if enabled == nil then
		return units.DEFAULT
	end

	return enabled
end

hooksecurefunc("UnitFramePortrait_Update", function(self)
	if self.portrait and UnitIsPlayer(self.unit) and EnabledForUnit(self.unit) then
		local _, class = UnitClass(self.unit)
		if class then
			self.portrait:SetTexture(TEXTURE_NAME:format(class))
		else
			--@alpha@
			print(("EnhancedClassIconPortraits Error: UnitClass returned nil for unit %q"):format(self.unit))
			--@end-alpha@
		end
	end
end)
