AIActionTable_FlowerPower:
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
	db KANGASKHAN
	db NIDOKING
	db NIDORINA
	db IVYSAUR
	db BELLSPROUT
	db PIDGEOT_LV40
	db NIDOKING
	db $00

.list_bench
	db NIDORINA
	db NIDOKING
	db KANGASKHAN
	db NIDOKING
	db IVYSAUR
	db BELLSPROUT
	db PIDGEOT_LV40
	db $00

.list_retreat
	ai_retreat NIDORINO,     -2
	ai_retreat KANGASKHAN, -2
	ai_retreat VENUSAUR_LV67, -2
	ai_retreat RATTATA,   -2
	db $00

.list_energy
	ai_energy NIDORINA,      2, +1
	ai_energy NIDOQUEEN,        3, +1
	ai_energy NIDORINO,  3, +3
	ai_energy KANGASKHAN,         3, +0
	ai_energy IVYSAUR,          2, -1
	ai_energy VENUSAUR_LV67,      3, +0
	ai_energy CATERPIE,      4, +0
	ai_energy PIDGEOT_LV40,     2, +0
	ai_energy RATTATA,	3, +1
	ai_energy NIDOKING,      1, +1
	ai_energy ZUBAT,     2, +0
	ai_energy GOLBAT,	2, +1
	db $00

.list_prize
	db NIDORINO
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
