dofile_once("data/scripts/gun/procedural/gun_action_utils.lua")
dofile_once("data/scripts/perks/perk_utilities.lua")

STACKABLE_YES = true
STACKABLE_NO = false

STACKABLE_MAX_AMOUNT = true --this is left for mod backwards compatibility

disparity_list =
{
	--[[
	{
		id = "AGORA",
		ui_name = "Agoraphobia",
		ui_description = "$DISP_AGORA",
		perk_icon = "mods/despair2/files/perk_gfx/agoraphobia.png",
		ui_icon = "mods/despair2/files/ui_gfx/agoraphobia.png",
		stackable = STACKABLE_YES,
		func = function( entity_perk_item, entity_who_picked, item_name )
			if not GameHasFlagRun( "DISPARITY_PICKED_AGORA" ) then
				EntityAddComponent( entity_who_picked, "LuaComponent", 
				{ 
					_tags = "disp_component",
					script_shot = "mods/despair2/files/scripts/disparity/agora.lua",
					script_source_file="mods/despair2/files/scripts/disparity/agora_check.lua",
					execute_every_n_frame = "3",
				} )
				local x, y = EntityGetTransform( entity_who_picked )
				local visual_ent = EntityLoad( "mods/despair2/files/entities/agora_visual.xml", x, y )
				EntityAddChild( entity_who_picked, visual_ent )
			end
		end,
	},
	]]--  OLD PERK ONLY USE AS A TEMPLATE
}


function get_perk_with_id( perk_list, perk_id )
	local perk_data = nil
	for i,perk in ipairs(perk_list) do
		if perk.id == perk_id then
			perk_data = perk
			break
		end
	end

	return perk_data
end

function get_perk_picked_flag_name( perk_id )
	return "DISPARITY_PICKED_" .. perk_id
end
