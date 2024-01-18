/datum/sprite_accessory/genital/belly
	icon = 'modular_zubbers/modules/customization/icons/belly_onmob.dmi'
	organ_type = /obj/item/organ/external/genital/belly
	associated_organ_slot = ORGAN_SLOT_BELLY
	key = ORGAN_SLOT_BELLY
	always_color_customizable = TRUE
	default_color = DEFAULT_SKIN_OR_PRIMARY
	relevent_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)
	has_skintone_shading = TRUE
	genital_location = CHEST
	genetic = TRUE

/datum/sprite_accessory/genital/belly/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/belly/tummy
	icon_state = "tummy"
	name = "Tummy"

/datum/sprite_accessory/genital/belly/obese
	icon_state = "obese"
	name = "Obese"

