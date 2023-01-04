-- Code adapted from ClassIconNotPortrait by machinelfgaming:
-- https://wow.curseforge.com/projects/classiconnotportrait

local _, ns = ...
local config = ns.config
local units = ns.units

local TEXTURE_BASE_PATH = "Interface\\AddOns\\EnhancedClassIconPortraits\\Textures\\"
local TEXTURE_NAME_ORIGINAL = TEXTURE_BASE_PATH .. "Original\\%s.tga"
local TEXTURE_NAME_FLAT = TEXTURE_BASE_PATH .. "Flat\\%s.tga"
local TEXTURE_NAME = config.USE_FLAT_ICONS and TEXTURE_NAME_FLAT or TEXTURE_NAME_ORIGINAL

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

if EnabledForUnit("player") then
	local background = PlayerFrame:CreateTexture("EnhancedClassIconPortraits_PlayerFramePortraitBackground", "BACKGROUND")
	background:SetColorTexture(0, 0, 0)
	background:SetPoint(PlayerFrame.portrait:GetPoint(1))
	background:SetSize(PlayerFrame.portrait:GetSize())
	
	local layer, subLevel = PlayerFrame.portrait:GetDrawLayer()
	background:SetDrawLayer(layer, subLevel - 1)

	background:AddMaskTexture(PlayerFrame.portrait:GetMaskTexture(1))
end
