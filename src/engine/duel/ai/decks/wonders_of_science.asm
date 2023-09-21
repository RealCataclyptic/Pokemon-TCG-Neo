AIActionTable_WondersOfScience:
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
	db VILEPLUME
	db WEEPINBELL
	db HITMONLEE
	db EKANS
	db KANGASKHAN
	db DODRIO
	db $00

.list_bench
	db WEEPINBELL
	db EKANS
	db HITMONLEE
	db DODRIO
	db VILEPLUME
	db KANGASKHAN
	db $00

.list_retreat
	db $00

.list_energy
	ai_energy EKANS,          2, +1
	ai_energy ARBOK,             2, +1
	ai_energy NIDORANF,         3, +4
	ai_energy VILEPLUME,         3, +0
	ai_energy HITMONLEE,     3, +2
	ai_energy WEEPINBELL  , 2, +1
	ai_energy KANGASKHAN,     2, +0
	ai_energy LICKITUNG,         3, +1
	ai_energy DODRIO,	2, +0
	db $00

.list_prize
	db WEEPINBELL
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
