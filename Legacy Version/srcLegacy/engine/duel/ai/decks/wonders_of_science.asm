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
	db MAGMAR
	db BULBASAUR
	db ZUBAT
	db VULPIX
	db $00

.list_bench
	db ZUBAT
	db BULBASAUR
	db VULPIX
	db MAGMAR
	db $00

.list_retreat
	db $00

.list_energy
	ai_energy ZUBAT,         	 2, +1
	ai_energy GOLBAT,             2, +1
	ai_energy CROBAT,        	 3, +4
	ai_energy MAGMAR,         	3, +1
	ai_energy CHIKORITA1,     	2, +0
	ai_energy BAYLEEF1,   		3, +1
	ai_energy MEGANIUM1,    	4, +3
	ai_energy VULPIX,         2, +0
	ai_energy NINETALES,         3, +1
	db $00

.list_prize
	db PROFESSOR_ELM
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
