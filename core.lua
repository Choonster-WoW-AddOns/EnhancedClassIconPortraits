-- Code adapted from ClassIconNotPortrait by machinelfgaming:
-- https://wow.curseforge.com/projects/classiconnotportrait

local TEXTURE_NAME = "Interface\\AddOns\\EnhancedClassIconPortraits\\Textures\\%s.tga"

hooksecurefunc("UnitFramePortrait_Update", function(self)
	if self.portrait then
		if UnitIsPlayer(self.unit) then
			local _, class = UnitClass(self.unit)
			self.portrait:SetTexture(TEXTURE_NAME:format(class))
		end
	end
end)
