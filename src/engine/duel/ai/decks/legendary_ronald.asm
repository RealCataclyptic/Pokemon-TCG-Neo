AIActionTable_LegendaryRonald:
	dw .do_turn ; unused
	dw .do_turn
	dw .start_duel
	dw .forced_switch
	dw .ko_switch
	dw .take_prize

.do_turn
	call AIDoTurn_LegendaryRonald
	ret

.start_duel
	call InitAIDuelVars
	call .store_list_pointers
	call SetUpBossStartingHandAndDeck
	call TrySetUpBossStartingPlayArea
	ret nc
	call AIPlayInitialBasicCards
	ret

.forced_switch
	call AIDecideBenchPokemonToSwitchTo
	ret

.ko_switch
	call AIDecideBenchPokemonToSwitchTo
	ret

.take_prize
	call AIPickPrizeCards
	ret

.list_arena
	db GASTLY_LV17
	db HITMONLEE
	db MANKEY
	db JIGGLYPUFF_LV13
	db MACHOKE
	db IMAKUNI_CARD
	db $00

.list_bench
	db GASTLY_LV17
	db MACHOKE
	db HITMONLEE
	db MANKEY
	db JIGGLYPUFF_LV13
	db IMAKUNI_CARD
	db $00

.list_play_hand
	db IMAKUNI_CARD
	db MACHOKE
	db GASTLY_LV17
	db HITMONLEE
	db MANKEY
	db JIGGLYPUFF_LV13

.list_retreat
	ai_retreat IMAKUNI_CARD, -5
	ai_retreat GASTLY_LV17, -5
	ai_retreat GEODUDE, -5
	db $00

.list_energy
	ai_energy IMAKUNI_CARD,   6, +3
	ai_energy HITMONLEE,   3, +1
	ai_energy GASTLY_LV17,  2, +0
	ai_energy JIGGLYPUFF_LV13,  2, +0
	ai_energy KABUTOPS,   3, +1
	ai_energy AERODACTYL,    3, +1
	ai_energy MANKEY,          3, +0
	ai_energy MACHOKE,      2, +1
	ai_energy MACHAMP,	3, +2
	ai_energy GEODUDE, 	4, +3
	db $00

.list_prize
	db BILL
	db PROFESSOR_OAK
	db ENERGY_REMOVAL
	db SUPER_ENERGY_REMOVAL
	db IMAKUNI_CARD
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_play_hand
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret

AIDoTurn_LegendaryRonald:
; initialize variables
	call InitAITurnVars
; process Trainer cards
	ld a, AI_TRAINER_CARD_PHASE_01
	call AIProcessHandTrainerCards
	ld a, AI_TRAINER_CARD_PHASE_02
	call AIProcessHandTrainerCards
	ld a, AI_TRAINER_CARD_PHASE_04
	call AIProcessHandTrainerCards

; check if AI can play MoltresLv37
; from hand and if so, play it.
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp MAX_PLAY_AREA_POKEMON
	jr nc, .skip_moltres_1 ; skip if bench is full
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	cp DECK_SIZE - 9
	jr nc, .skip_moltres_1 ; skip if cards in deck <= 9
	ld a, GOLDUCK
	call CountPokemonIDInBothPlayAreas
	jr c, .skip_moltres_1 ; skip if Muk in play
	ld a, IMAKUNI_CARD
	call LookForCardIDInHandList_Bank5
	jr nc, .skip_moltres_1 ; skip if no MoltresLv37 in hand
	ldh [hTemp_ffa0], a
	ld a, OPPACTION_PLAY_BASIC_PKMN
	bank1call AIMakeDecision

.skip_moltres_1
; play Pokemon from hand
	call AIDecidePlayPokemonCard
	ret c ; return if turn ended
; process Trainer cards
	ld a, AI_TRAINER_CARD_PHASE_05
	call AIProcessHandTrainerCards
	ld a, AI_TRAINER_CARD_PHASE_07
	call AIProcessHandTrainerCards
	call AIProcessRetreat
	ld a, AI_TRAINER_CARD_PHASE_10
	call AIProcessHandTrainerCards
; play Energy card if possible
	ld a, [wAlreadyPlayedEnergy]
	or a
	jr nz, .skip_attach_energy_1
	call AIProcessAndTryToPlayEnergy
.skip_attach_energy_1
; try playing Pokemon cards from hand again
	call AIDecidePlayPokemonCard
	ret c ; return if turn ended
	ld a, AI_TRAINER_CARD_PHASE_15
; if used Professor Oak, process new hand
; if not, then proceed to attack.
	call AIProcessHandTrainerCards
	ld a, [wPreviousAIFlags]
	and AI_FLAG_USED_PROFESSOR_OAK
	jr z, .try_attack
	ld a, AI_TRAINER_CARD_PHASE_01
	call AIProcessHandTrainerCards
	ld a, AI_TRAINER_CARD_PHASE_02
	call AIProcessHandTrainerCards
	ld a, AI_TRAINER_CARD_PHASE_04
	call AIProcessHandTrainerCards

; check if AI can play MoltresLv37
; from hand and if so, play it.
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp MAX_PLAY_AREA_POKEMON
	jr nc, .skip_moltres_2 ; skip if bench is full
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	cp DECK_SIZE - 9
	jr nc, .skip_moltres_2 ; skip if cards in deck <= 9
	ld a, GOLDUCK
	call CountPokemonIDInBothPlayAreas
	jr c, .skip_moltres_2 ; skip if Muk in play
	ld a, IMAKUNI_CARD
	call LookForCardIDInHandList_Bank5
	jr nc, .skip_moltres_2 ; skip if no MoltresLv37 in hand
	ldh [hTemp_ffa0], a
	ld a, OPPACTION_PLAY_BASIC_PKMN
	bank1call AIMakeDecision

.skip_moltres_2
	call AIDecidePlayPokemonCard
	ret c ; return if turn ended
	ld a, AI_TRAINER_CARD_PHASE_05
	call AIProcessHandTrainerCards
	ld a, AI_TRAINER_CARD_PHASE_07
	call AIProcessHandTrainerCards
	call AIProcessRetreat
	ld a, AI_TRAINER_CARD_PHASE_10
	call AIProcessHandTrainerCards
	ld a, [wAlreadyPlayedEnergy]
	or a
	jr nz, .skip_attach_energy_2
	call AIProcessAndTryToPlayEnergy
.skip_attach_energy_2
	call AIDecidePlayPokemonCard
	ret c ; return if turn ended
.try_attack
; attack if possible, if not,
; finish turn without attacking.
	call AIProcessAndTryToUseAttack
	ret c ; return if turn ended
	ld a, OPPACTION_FINISH_NO_ATTACK
	bank1call AIMakeDecision
	ret
