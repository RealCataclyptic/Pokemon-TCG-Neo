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
	db YANMA
	db CELEBI_S
	db MEWTWO
	db ZUBAT
	db SMEARGLE
	db PORYGON
	db $00

.list_bench
	db CELEBI_S
	db ZUBAT
	db MEWTWO
	db PORYGON
	db YANMA
	db SMEARGLE
	db $00

.list_retreat
	db $00

.list_energy
	ai_energy ZUBAT,         	 2, +1
	ai_energy GOLBAT,             2, +1
	ai_energy CROBAT,        	 3, +4
	ai_energy YANMA,         	3, +1
	ai_energy MEWTWO,     		3, +0
	ai_energy CELEBI_S,   		2, +2
	ai_energy SMEARGLE,    		 2, +0
	ai_energy PORYGON,		2, +1
	ai_energy PORYGON_2,         3, +2
	db $00

.list_prize
	db CELEBI_S
	db CROBAT
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
