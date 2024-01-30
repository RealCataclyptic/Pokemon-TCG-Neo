AIActionTable_LegendaryArticuno:
	dw .do_turn ; unused
	dw .do_turn
	dw .start_duel
	dw .forced_switch
	dw .ko_switch
	dw .take_prize

.do_turn
	call AIDoTurn_LegendaryArticuno
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
	db SUICUNE
	db ARTICUNO
	db MEW
	db NATU
	db EEVEE
	db $00

.list_bench
	db SUICUNE
	db ARTICUNO
	db MEW
	db NATU
	db EEVEE
	db $00

.list_retreat
	ai_retreat SUICUNE,  -3
	ai_retreat ARTICUNO, -3
	db $00

.list_energy
	ai_energy EEVEE,          1, +1
	ai_energy UMBREON,       3, +2
	ai_energy ESPEON1,        3, +3
	ai_energy MEW,	 	2, +0
	ai_energy NATU, 	2, +0
	ai_energy XATU,       3, +0
	ai_energy SUICUNE,         3, +3
	ai_energy ARTICUNO,		4, +2
	db $00

.list_prize
	db SUICUNE
	db TEAM_ROCKETS_EVIL_DEEDS
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret

; this routine handles how Legendary Articuno
; prioritizes playing energy cards to each Pokémon.
; first, it makes sure that all Lapras have at least
; 3 energy cards before moving on to Articuno,
; and then to Dewgong and Seel
ScoreLegendaryArticunoCards:
	call SwapTurn
	call CountPrizes
	call SwapTurn
	cp 3
	ret c

; player prizes >= 3
; if Lapras has more than half HP and
; can use second attack, check next for Articuno
; otherwise, check if Articuno or Dewgong
; have more than half HP and can use second attack
; and if so, the next Pokémon to check is Lapras
	ld a, SUICUNE
	call CheckForBenchIDAtHalfHPAndCanUseSecondAttack
	jr c, .articuno
	ld a, ARTICUNO
	call CheckForBenchIDAtHalfHPAndCanUseSecondAttack
	jr c, .lapras
	ld a, ARTICUNO
	call CheckForBenchIDAtHalfHPAndCanUseSecondAttack
	jr c, .lapras
	jr .articuno

; the following routines check for certain card IDs in bench
; and call RaiseAIScoreToAllMatchingIDsInBench if these are found.
; for Lapras, an additional check is made to its
; attached energy count, which skips calling the routine
; if this count is >= 3
.lapras
	ld a, HORSEA
	ld b, PLAY_AREA_BENCH_1
	call LookForCardIDInPlayArea_Bank5
	jr nc, .articuno
	ld e, a
	call CountNumberOfEnergyCardsAttached
	cp 3
	jr nc, .articuno
	ld a, SEADRA
	call RaiseAIScoreToAllMatchingIDsInBench
	ret

.articuno
	ld a, SEADRA
	ld b, PLAY_AREA_BENCH_1
	call LookForCardIDInPlayArea_Bank5
	jr nc, .dewgong
	ld a, KINGDRA
	call RaiseAIScoreToAllMatchingIDsInBench
	ret

.dewgong
	ld a, SUICUNE
	ld b, PLAY_AREA_BENCH_1
	call LookForCardIDInPlayArea_Bank5
	jr nc, .seel
	ld a, SUICUNE
	call RaiseAIScoreToAllMatchingIDsInBench
	ret

.seel
	ld a, SUICUNE
	ld b, PLAY_AREA_BENCH_1
	call LookForCardIDInPlayArea_Bank5
	ret nc
	ld a, SUICUNE
	call RaiseAIScoreToAllMatchingIDsInBench
	ret

AIDoTurn_LegendaryArticuno:
; initialize variables
	call InitAITurnVars
	ld a, AI_TRAINER_CARD_PHASE_01
	call AIProcessHandTrainerCards
	farcall HandleAIAntiMewtwoDeckStrategy
	jp nc, .try_attack
; process Trainer cards
	ld a, AI_TRAINER_CARD_PHASE_02
	call AIProcessHandTrainerCards
; play Pokemon from hand
	call AIDecidePlayPokemonCard
	ret c ; return if turn ended
	call AIProcessRetreat
	ld a, AI_TRAINER_CARD_PHASE_10
	call AIProcessHandTrainerCards
; play Energy card if possible
	ld a, [wAlreadyPlayedEnergy]
	or a
	jr nz, .skip_energy_attach_1
	call AIProcessAndTryToPlayEnergy
.skip_energy_attach_1
; play Pokemon from hand again
	call AIDecidePlayPokemonCard
; process Trainer cards phases 13 and 15
	ld a, AI_TRAINER_CARD_PHASE_13
	call AIProcessHandTrainerCards
	ld a, AI_TRAINER_CARD_PHASE_15
	call AIProcessHandTrainerCards
; if used Professor Oak, process new hand
	ld a, [wPreviousAIFlags]
	and AI_FLAG_USED_PROFESSOR_ELM
	jr z, .try_attack
	ld a, AI_TRAINER_CARD_PHASE_01
	call AIProcessHandTrainerCards
	ld a, AI_TRAINER_CARD_PHASE_02
	call AIProcessHandTrainerCards
	call AIDecidePlayPokemonCard
	ret c ; return if turn ended
	call AIProcessRetreat
	ld a, AI_TRAINER_CARD_PHASE_10
	call AIProcessHandTrainerCards
	ld a, [wAlreadyPlayedEnergy]
	or a
	jr nz, .skip_energy_attach_2
	call AIProcessAndTryToPlayEnergy
.skip_energy_attach_2
	call AIDecidePlayPokemonCard
.try_attack
; attack if possible, if not,
; finish turn without attacking.
	call AIProcessAndTryToUseAttack
	ret c ; return if turn ended
	ld a, OPPACTION_FINISH_NO_ATTACK
	bank1call AIMakeDecision
	ret
