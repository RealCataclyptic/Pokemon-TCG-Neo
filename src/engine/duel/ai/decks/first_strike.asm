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
	db HITMONTOP
	db MILTANK
	db STANTLER
	db WOOPER
	db MACHOP
	db $00

.list_bench
	db HITMONTOP
	db WOOPER
	db MACHOP
	db MILTANK
	db STANTLER
	db $00

.list_retreat
	ai_retreat HITMONTOP,  -1
	ai_retreat MILTANK, -1
	ai_retreat MACHAMP,  -2
	db $00

.list_energy
	ai_energy WOOPER,     2, +1
	ai_energy QUAGSIRE,    3, +3
	ai_energy HITMONTOP,    3, +4
	ai_energy MACHOP, 	3, +0
	ai_energy MACHOKE,     4, +1
	ai_energy MACHAMP,     4, +4
	ai_energy MILTANK,   3, +2
	ai_energy STANTLER,   3, +1
	db $00

.list_prize
	db DOUBLE_COLORLESS_ENERGY
	db HITMONTOP
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
