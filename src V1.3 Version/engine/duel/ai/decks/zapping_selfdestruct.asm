AIActionTable_ZappingSelfdestruct:
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
	db VOLTORB
	db HOOTHOOT
	db MAREEP1
	db ZAPDOS
	db $00

.list_bench
	db MAREEP1
	db VOLTORB
	db HOOTHOOT
	db ZAPDOS
	db $00

.list_retreat
	ai_retreat AMPHAROS1, -1
	ai_retreat AMPHAROS2, -2
	ai_retreat ELECTRODE, -3
	ai_retreat ZAPDOS, -1
	db $00

.list_energy
	ai_energy MAREEP1,       	2, +1
	ai_energy FLAAFFY1,  		4, +2
	ai_energy AMPHAROS1, 		4, +3
	ai_energy AMPHAROS2, 		4, +3
	ai_energy HOOTHOOT,		2, +0
	ai_energy NOCTOWL, 		3, +0
	ai_energy VOLTORB,     	 	1, +1
	ai_energy ELECTRODE,      	2, +1
	ai_energy ZAPDOS,     	 	3, +0
	db $00

.list_prize
	db PROFESSOR_ELM
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
