/// Returns true if the human has a accessible breasts for the parameter. Accepts any of the `REQUIRE_GENITAL_` defines.
/mob/living/carbon/human/proc/has_belly(required_state = REQUIRE_GENITAL_ANY)
	var/obj/item/organ/external/genital/genital = get_organ_slot(ORGAN_SLOT_BELLY)
	if(!genital)
		return FALSE

	switch(required_state)
		if(REQUIRE_GENITAL_ANY)
			return TRUE
		if(REQUIRE_GENITAL_EXPOSED)
			return genital.visibility_preference == GENITAL_ALWAYS_SHOW || is_topless()
		if(REQUIRE_GENITAL_UNEXPOSED)
			return genital.visibility_preference != GENITAL_ALWAYS_SHOW && !is_topless()
		else
			return TRUE
