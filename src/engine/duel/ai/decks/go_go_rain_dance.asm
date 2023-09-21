AIActionTable_GoGoRainDance:
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
	db KINGLER
	db SEAKING
	db TENTACRUEL
	db $00

.list_bench
	db TENTACRUEL
	db KINGLER
	db SEAKING
	db $00

.list_retreat
	ai_retreat TENTACRUEL,  -3
	ai_retreat SEEL, -2
	ai_retreat DEWGONG,    -1
	db $00

.list_energy
	ai_energy TENTACRUEL, 2, +0
	ai_energy SEEL, 3, +0
	ai_energy DEWGONG, 3, -1
	ai_energy SEAKING,   2, +1
	ai_energy STARMIE,   4, +3
	ai_energy FLAREON_LV22,    2, +0
	ai_energy FLAREON_LV28,    5, +3
	ai_energy KINGLER,    3, +0
	db $00

.list_prize
	db GAMBLER
	db ENERGY_RETRIEVAL
	db SUPER_ENERGY_RETRIEVAL
	db DEWGONG
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
