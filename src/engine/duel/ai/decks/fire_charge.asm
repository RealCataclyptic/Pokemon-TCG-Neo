AIActionTable_FireCharge:
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
	db GRIMER
	db NINETALES_LV32
	db MUK
	db PINSIR
	db TAUROS
	db $00

.list_bench
	db GRIMER
	db MUK
	db PINSIR
	db TAUROS
	db NINETALES_LV32
	db $00

.list_retreat
	ai_retreat NINETALES_LV32, -1
	ai_retreat TAUROS,         -1
	ai_retreat WEEZING,       -1
	db $00

.list_energy
	ai_energy MUK,       2, +0
	ai_energy EXEGGUTOR,   3, +1
	ai_energy WEEZING,     4, +3
	ai_energy PINSIR, 2, -1
	ai_energy CHARMELEON, 3, +0
	ai_energy TAUROS,      3, -2
	ai_energy DITTO,         4, -2
	ai_energy NINETALES_LV32,          5, +1
	db $00

.list_prize
	db POKE_BALL
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
