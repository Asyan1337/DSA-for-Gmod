-- Version 0.0.5

local tablicaHuini = {
	["CHudHealth"] = false,
	["CHudDeathNotice"] = false,
	["CHudHistoryResource"] = false,
	["CHudAmmo"] = false,
	-- сюда тоже добавить надо

}

hook.Add("HUDShouldDraw", "DSAHudControl", function(name)
    if tablicaHuini[name] ~= nil then
        return not tablicaHuini[name]
    end
    return false
end)

concommand.Add("dsa_menu",function(ply)
	--if not ply:IsAdmin() or not ply:IsSuperAdmin() then return end

	local maindsa = vgui.Create("DFrame")

	local w , h = ScrW() / 4 , ScrH() / 2

	maindsa:SetSize(0,0)

	maindsa:SetTitle("DSA    V0.0.6")

	maindsa:Center()

	maindsa:MakePopup()
	maindsa.anim = true
	-- https://wiki.facepunch.com/gmod/PANEL:PerformLayout
    -- checha work
	local oThink = maindsa.Think
    -- done
	maindsa.Think = function(self)
	   oThink(self) -- checha hui work


	   if self.anim then self:Center() end
	end


	maindsa:SizeTo(w,h,0.4,0,-1,function(_,p)


		p:Center()

		p.anim = false

	end)









	local CHudBatteryDIS = maindsa:Add( "DCheckBox" )
	CHudBatteryDIS:SetPos( 25, 50 )
	CHudBatteryDIS:SetValue(tablicaHuini["CHudHealth"])

	CHudBatteryDIS.OnChange = function(_,niggachain)
	   tablicaHuini["CHudHealth"] = niggachain
	end

	local DLabel = vgui.Create( "DLabel", maindsa )
	DLabel:SetPos( 50, 48 )
	DLabel:SetText( "Health Bar" )









	local CHudDeathNoticeDIS = maindsa:Add( "DCheckBox" )
	CHudDeathNoticeDIS:SetPos( 25, 70 )
	CHudDeathNoticeDIS:SetValue(tablicaHuini["CHudDeathNotice"])

	CHudDeathNoticeDIS.OnChange = function(_,niggachain)
	   tablicaHuini["CHudDeathNotice"] = niggachain
	end

	local DLabel = vgui.Create( "DLabel", maindsa )
	DLabel:SetPos( 50, 70 )
	DLabel:SetText( "Death Notice" )







	-- ПРИМЕР ДОБАВЛЕНИЯ
    --[[

	local CHudDeathNoticeDIS = maindsa:Add( "DCheckBox" )
	CHudDeathNoticeDIS:SetPos( 25, 70 )
	CHudDeathNoticeDIS:SetValue(tablicaHuini["CHudDeathNotice"])

	CHudDeathNoticeDIS.OnChange = function(_,niggachain)
	   tablicaHuini["CHudDeathNotice"] = niggachain
	end


	local DLabel = vgui.Create( "DLabel", maindsa )
	DLabel:SetPos( 50, 70 )
	DLabel:SetText( "Death Notice" )

	--]]


	local CHudHistoryResourceDIS = maindsa:Add( "DCheckBox" )
	CHudHistoryResourceDIS:SetPos( 25, 90 )
	CHudHistoryResourceDIS:SetValue(tablicaHuini["CHudHistoryResource"])

	CHudHistoryResourceDIS.OnChange = function(_,niggachain)
	   tablicaHuini["CHudHistoryResource"] = niggachain
	end

	

	local DLabel = vgui.Create( "DLabel", maindsa )
	DLabel:SetPos( 50, 90 )
	DLabel:SetText( "Info Weapon" )






	local CHudAmmoDIS = maindsa:Add( "DCheckBox" )
	CHudAmmoDIS:SetPos( 25, 110 )
	CHudAmmoDIS:SetValue(tablicaHuini["CHudAmmo"])

	CHudAmmoDIS.OnChange = function(_,niggachain)
	   tablicaHuini["CHudAmmo"] = niggachain
	end

	

	local DLabel = vgui.Create( "DLabel", maindsa )
	DLabel:SetPos( 50, 110 )
	DLabel:SetText( "Ammo hud" )
end)
