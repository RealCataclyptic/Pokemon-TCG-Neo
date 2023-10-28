AIActionTable_PowerfulRonald:
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
	db HITMONCHAN
	db HITMONLEE
	db ELECTABUZZ
	db MISDREAVUS
	db JYNX
	db MEWTWO
	db SKARMORY
	db SMEARGLE
	db MILTANK
	db TOGEPI1
	db $00

.list_bench
	db HITMONCHAN
	db HITMONLEE
	db ELECTABUZZ
	db MISDREAVUS
	db JYNX
	db MEWTWO
	db SKARMORY
	db SMEARGLE
	db MILTANK
	db TOGEPI1
	db $00

.list_retreat
	ai_retreat SMEARGLE, -1
	ai_retreat STANTLER,      -1
	ai_retreat MILTANK,     -1
	db $00

.list_energy
	ai_energy ELECTABUZZ, 2, +1
	ai_energy HITMONLEE,       3, +1
	ai_energy HITMONCHAN,      4, +1
	ai_energy MISDREAVUS,         2, +0
	ai_energy JYNX,            3, +0
	ai_energy MEWTWO,     3, +1
	ai_energy TOGEPI1,           2, -1
	ai_energy TOGETIC1,          3, +0
	ai_energy SKARMORY,       3, +1
	ai_energy SMEARGLE,      3, -1
	ai_energy MILTANK,          2, -1
	db $00

.list_prize
	db STRENGTH_CHARM
	db ENERGY_REMOVAL2
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
