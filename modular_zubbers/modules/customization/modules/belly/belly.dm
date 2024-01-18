/obj/item/organ/external/genital/belly
	name = "belly"
	desc = "Its a belly!"
	icon_state = "belly"
	icon = 'modular_zubbers/modules/customization/icons/belly.dmi'
	genital_type = "tummy"
	mutantpart_key = ORGAN_SLOT_BELLY
	mutantpart_info = list(MUTANT_INDEX_NAME = "Tummy", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BELLY
	genital_location = CHEST
	aroused = AROUSAL_CANT
	drop_when_organ_spilling = FALSE
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/belly
	var/rolled_description = "cute belly"
	var/described_size = 0

/datum/bodypart_overlay/mutant/genital/belly
	feature_key = ORGAN_SLOT_BELLY
	layers = EXTERNAL_FRONT | EXTERNAL_BEHIND

/obj/item/organ/external/genital/belly/get_description_string(datum/sprite_accessory/genital/gas)
	if(text2num(genital_size) != described_size)
		set_rolled_description()
	return "You see a\ [rolled_description]"

/obj/item/organ/external/genital/belly/get_sprite_size_string()
	var/current_size = clamp(FLOOR(genital_size, 1), BELLY_MIN_SIZE, BELLY_MAX_SIZE)
	var/passed_string = "belly_[genital_type]_[current_size]"
	return passed_string

/obj/item/organ/external/genital/belly/build_from_dna(datum/dna/DNA, associated_key)
	uses_skin_color = DNA.features["belly_uses_skincolor"]
	set_size(DNA.features["belly_size"])

	return ..()

/obj/item/organ/external/genital/belly/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(DNA.features["belly_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading

/datum/bodypart_overlay/mutant/genital/breasts/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_BELLY]

/obj/item/organ/external/genital/belly/set_size(size)
	. = ..()
	set_rolled_description()

/obj/item/organ/external/genital/belly/proc/set_rolled_description()
	var/prefix = "cute"
	var/suffix = "belly"
	switch(genital_type)
		if(BELLY_SHAPE_TUMMY)
			prefix = pick(GLOB.belly_tummy_size_prefixes)
			suffix = pick(GLOB.belly_tummy_size_suffixes)
		if(BELLY_SHAPE_OBESE)
			prefix = pick(GLOB.belly_obese_size_prefixes)
			suffix = pick(GLOB.belly_obese_size_suffixes)
	rolled_description = "[prefix] [suffix]"
	described_size = text2num(genital_size)
