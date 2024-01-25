AIActionTable_LegendaryMoltres:
	dw .do_turn ; unused
	dw .do_turn
	dw .start_duel
	dw .forced_switch
	dw .ko_switch
	dw .take_prize

.do_turn
	call AIDoTurn_LegendaryMoltres
	ret

.start_duel
	call InitAIDuelVars
	call .store_list_pointers
	call SetUpBossStartingHandAndDeck
	call TrySetUpBossStartingPlayArea
	ret nc ; Play Area set up was successful
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
	db SENTRET
	db HOOH_C
	db VOLTORB
	db MAGNEMITE
	db GROWLITHE
	db $00

.list_bench
	db HOOH_C
	db VOLTORB
	db GROWLITHE
	db MAGNEMITE
	db SENTRET
	db $00

.list_play_hand
	db HOOH_C
	db VOLTORB
	db GROWLITHE
	db MAGNEMITE
	db SENTRET
	db $00

.list_retreat
	ai_retreat HOOH_C,	-3
	ai_retreat ARCANINE,   	-2
	db $00

.list_energy
	ai_energy HOOH_C, 		3, +4
	ai_energy VOLTORB, 		1, +0
	ai_energy ELECTRODE,  		2, +3
	ai_energy GROWLITHE,    	2, +0
	ai_energy ARCANINE,    		3, +2
	ai_energy MAGNEMITE,   		2, +0
	ai_energy MAGNETON,   		3, +1
	ai_energy SENTRET,   		1, +1
	db $00

.list_prize
	db HOOH_C
	db ENERGY_SEARCH
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_play_hand
	store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret

AIDoTurn_LegendaryMoltres:
; initialize variables
	call InitAITurnVars
	farcall HandleAIAntiMewtwoDeckStrategy
	jp nc, .try_attack
; process Trainer cards
; phase 2 through 4.
	ld a, AI_TRAINER_CARD_PHASE_02
	call AIProcessHandTrainerCards
	ld a, AI_TRAINER_CARD_PHASE_04
	call AIProcessHandTrainerCards

; check if AI can play MoltresLv37
; from hand and if so, play it.
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp MAX_PLAY_AREA_POKEMON
	jr nc, .skip_moltres ; skip if bench is full
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	cp DECK_SIZE - 9
	jr nc, .skip_moltres ; skip if cards in deck <= 9
	ld a, ARCADE_GAME
	call CountPokemonIDInBothPlayAreas
	jr c, .skip_moltres ; skip if Muk in play
	ld a, MAIL_FROM_BILL
	call LookForCardIDInHandList_Bank5
	jr nc, .skip_moltres ; skip if no MoltresLv37 in hand
	ldh [hTemp_ffa0], a
	ld a, OPPACTION_PLAY_BASIC_PKMN
	bank1call AIMakeDecision

.skip_moltres
; play Pokemon from hand
	call AIDecidePlayPokemonCard
	ret c ; return if turn ended
; process Trainer cards
	ld a, AI_TRAINER_CARD_PHASE_05
	call AIProcessHandTrainerCards
	call AIProcessRetreat
	ld a, AI_TRAINER_CARD_PHASE_10
	call AIProcessHandTrainerCards
	ld a, AI_TRAINER_CARD_PHASE_11
	call AIProcessHandTrainerCards
; play Energy card if possible
	ld a, [wAlreadyPlayedEnergy]
	or a
	jr nz, .skip_attach_energy

; if MagmarLv31 is the Arena card and has no energy attached,
; try attaching an energy card to it from the hand.
; otherwise, run normal AI energy attach routine.
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call GetCardIDFromDeckIndex
	ld a, MAGMAR
	cp e
	jr nz, .attach_normally
	; MagmarLv31 is the Arena card
	call CreateEnergyCardListFromHand
	jr c, .skip_attach_energy
	ld e, PLAY_AREA_ARENA
	call CountNumberOfEnergyCardsAttached
	or a
	jr nz, .attach_normally
	xor a ; PLAY_AREA_ARENA
	ldh [hTempPlayAreaLocation_ff9d], a
	call AITryToPlayEnergyCard
	jr c, .skip_attach_energy

.attach_normally
; play Energy card if possible
	call AIProcessAndTryToPlayEnergy
.skip_attach_energy
; try playing Pokemon cards from hand again
	call AIDecidePlayPokemonCard
	ld a, AI_TRAINER_CARD_PHASE_13
	call AIProcessHandTrainerCards

.try_attack
; attack if possible, if not,
; finish turn without attacking.
	call AIProcessAndTryToUseAttack
	ret c
	ld a, OPPACTION_FINISH_NO_ATTACK
	bank1call AIMakeDecision
	ret
