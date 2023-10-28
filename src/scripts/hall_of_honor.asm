HallOfHonorLoadMap:
	ld a, SFX_10
	call PlaySFX
	ret

Script_fbe1:
	start_script
	print_text Text05b5
	ask_question_jump_default_yes Text05b6, .ows_fbee
	print_text Text05b7
	quit_script_fully

.ows_fbee
	open_deck_machine $0a
	quit_script_fully

Script_fbf1:
	start_script
	jump_if_event_true EVENT_RECEIVED_LEGENDARY_CARDS, .ows_fc10
	max_out_event_value EVENT_RECEIVED_LEGENDARY_CARDS
	print_text Text05b8
	give_card CHARIZARD_C
	give_card LUGIA_C
	give_card CELEBI_C
	give_card HOOH_C
	show_card_received_screen $ff
.ows_fc05
	flash_screen 0
	print_text Text05b9
.ows_fc0a
	flash_screen 1
	save_game 1
	play_credits
	quit_script_fully

.ows_fc10
	jump_if_event_equal EVENT_LEGENDARY_CARDS_RECEIVED_FLAGS, %1111, .ows_fc20
	print_text Text05ba
	give_card CHARIZARD_C
	give_card LUGIA_C
	give_card CELEBI_C
	give_card HOOH_C
	show_card_received_screen $ff
	script_jump .ows_fc05

.ows_fc20
	print_text Text05bb
	flash_screen 0
	print_text Text05bc
	script_jump .ows_fc0a
