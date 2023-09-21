AIActionTable_FirstStrike:
	dw .do_turn ; unused
	dw .do_turn
	dw .start_duel
	dw .forced_switch
	dw .ko_switch
	dw .take_prize

.do_turn
	call AIMainTurnLogic
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
	db MACHOP
	db MANKEY
	db PRIMEAPE
	db DODUO
	db FARFETCHD
	db $00

.list_bench
	db MACHOP
	db MANKEY
	db PRIMEAPE
	db DODUO
	db FARFETCHD
	db $00

.list_retreat
	ai_retreat MACHOP,  -1
	ai_retreat PRIMEAPE, -1
	ai_retreat FARFETCHD,  -2
	db $00

.list_energy
	ai_energy MANKEY,     3, +1
	ai_energy PRIMEAPE,    3, +1
	ai_energy MACHOP,    3, +3
	ai_energy VOLTORB , 3, -2
	ai_energy DODUO,  3, +1
	ai_energy FARFETCHD,     3, +0
	ai_energy MYSTERIOUS_FOSSIL,   2, -3
	db $00

.list_prize
	db VOLTORB
	db MACHOP
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
