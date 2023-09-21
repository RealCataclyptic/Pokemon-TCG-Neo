FightingClubAfterDuel:
	ld hl, .after_duel_table
	call FindEndOfDuelScript
	ret

.after_duel_table
	db NPC_CHRIS
	db NPC_CHRIS
	dw Script_BeatChrisInFightingClub
	dw Script_LostToChrisInFightingClub

	db NPC_MICHAEL
	db NPC_MICHAEL
	dw Script_BeatMichaelInFightingClub
	dw Script_LostToMichaelInFightingClub

	db NPC_JESSICA
	db NPC_JESSICA
	dw Script_BeatJessicaInFightingClub
	dw Script_LostToJessicaInFightingClub

	db NPC_MITCH
	db NPC_MITCH
	dw Script_BeatMitch
	dw Script_LostToMitch
	db $00

Script_Mitch:
	start_script
	try_give_pc_pack $02
	jump_if_event_true EVENT_BEAT_MITCH, Script_Mitch_AlreadyHaveMedal
	fight_club_pupil_jump .first_interaction, .three_pupils_remaining, \
		.two_pupils_remaining, .one_pupil_remaining, .all_pupils_defeated
.first_interaction
	print_npc_text Text0477
	set_event EVENT_PUPIL_MICHAEL_STATE, PUPIL_ACTIVE
	set_event EVENT_PUPIL_CHRIS_STATE, PUPIL_ACTIVE
	set_event EVENT_PUPIL_JESSICA_STATE, PUPIL_ACTIVE
	quit_script_fully

.three_pupils_remaining
	print_text_quit_fully Text0478

.two_pupils_remaining
	print_text_quit_fully Text0479

.one_pupil_remaining
	print_text_quit_fully Text047a

.all_pupils_defeated
	print_npc_text Text047b
	ask_question_jump Text047c, .start_duel
	print_npc_text Text047d
	quit_script_fully

.start_duel
	print_npc_text Text047e
	start_duel PRIZES_6, FIRST_STRIKE_DECK_ID, MUSIC_DUEL_THEME_2
	quit_script_fully

Script_BeatMitch:
	start_script
	jump_if_event_true EVENT_BEAT_MITCH, Script_Mitch_GiveBoosters
	print_npc_text Text047f
	max_out_event_value EVENT_BEAT_MITCH
	try_give_medal_pc_packs
	show_medal_received_screen EVENT_BEAT_MITCH
	record_master_win $01
	print_npc_text Text0480
	give_booster_packs BOOSTER_LABORATORY_NEUTRAL, BOOSTER_LABORATORY_NEUTRAL, NO_BOOSTER
	print_npc_text Text0481
	quit_script_fully

Script_LostToMitch:
	start_script
	jump_if_event_true EVENT_BEAT_MITCH, Script_Mitch_PrintTrainHarderText
	print_text_quit_fully Text0482

Script_Mitch_AlreadyHaveMedal:
	print_npc_text Text0483
	ask_question_jump Text047c, .start_duel
	print_npc_text Text0484
	quit_script_fully

.start_duel
	print_npc_text Text0485
	start_duel PRIZES_6, FIRST_STRIKE_DECK_ID, MUSIC_DUEL_THEME_2
	quit_script_fully

Script_Mitch_GiveBoosters:
	print_npc_text Text0486
	give_booster_packs BOOSTER_LABORATORY_NEUTRAL, BOOSTER_LABORATORY_NEUTRAL, NO_BOOSTER
	print_npc_text Text0487
	quit_script_fully

Script_Mitch_PrintTrainHarderText:
	print_text_quit_fully Text0488

Preload_ChrisInFightingClub:
	get_event_value EVENT_PUPIL_CHRIS_STATE
	cp PUPIL_DEFEATED
	ccf
	ret

Script_de4b:
	test_if_event_equal EVENT_PUPIL_CHRIS_STATE, PUPIL_DEFEATED
	print_variable_npc_text Text0489, Text048a
	set_event EVENT_PUPIL_CHRIS_STATE, PUPIL_REVISITED
	ask_question_jump Text048b, .ows_de61
	print_npc_text Text048c
	quit_script_fully

.ows_de61
	print_npc_text Text048d
	start_duel PRIZES_4, MUSCLES_FOR_BRAINS_DECK_ID, MUSIC_DUEL_THEME_1
	quit_script_fully

Script_BeatChrisInFightingClub:
	start_script
	print_npc_text Text048e
	give_booster_packs BOOSTER_EVOLUTION_FIGHTING, BOOSTER_EVOLUTION_FIGHTING, NO_BOOSTER
	print_npc_text Text048f
	quit_script_fully

Script_LostToChrisInFightingClub:
	start_script
	print_text_quit_fully Text0490

Preload_MichaelInFightingClub:
	get_event_value EVENT_PUPIL_MICHAEL_STATE
	cp PUPIL_DEFEATED
	ccf
	ret

Script_MichaelRematch:
	print_npc_text Text0491
	ask_question_jump Text0492, .ows_de8d
	print_npc_text Text0493
	quit_script_fully

.ows_de8d
	print_npc_text Text0494
	start_duel PRIZES_4, HEATED_BATTLE_DECK_ID, MUSIC_DUEL_THEME_1
	quit_script_fully

Script_BeatMichaelInFightingClub:
	start_script
	print_npc_text Text0495
	give_booster_packs BOOSTER_COLOSSEUM_FIGHTING, BOOSTER_COLOSSEUM_FIGHTING, NO_BOOSTER
	print_npc_text Text0496
	quit_script_fully

Script_LostToMichaelInFightingClub:
	start_script
	print_text_quit_fully Text0497

Preload_JessicaInFightingClub:
	get_event_value EVENT_PUPIL_JESSICA_STATE
	cp PUPIL_DEFEATED
	ccf
	ret

Script_dead:
	print_npc_text Text0498
	ask_question_jump Text0499, .ows_deb9
	print_npc_text Text049a
	quit_script_fully

.ows_deb9
	print_npc_text Text049b
	start_duel PRIZES_4, LOVE_TO_BATTLE_DECK_ID, MUSIC_DUEL_THEME_1
	quit_script_fully

Script_BeatJessicaInFightingClub:
	start_script
	print_npc_text Text049c
	give_booster_packs BOOSTER_COLOSSEUM_FIGHTING, BOOSTER_COLOSSEUM_FIGHTING, NO_BOOSTER
	print_npc_text Text049d
	quit_script_fully

Script_LostToJessicaInFightingClub:
	start_script
	print_text_quit_fully Text049e
