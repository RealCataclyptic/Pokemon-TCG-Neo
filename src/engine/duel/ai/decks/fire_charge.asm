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
	db MOLTRES
	db MAGMAR
	db CYNDAQUIL1
	db HOUNDOUR1
	db $00

.list_bench
	db CYNDAQUIL1
	db MOLTRES
	db MAGMAR
	db HOUNDOUR1
	db $00

.list_retreat
	ai_retreat MOLTRES, 		-2
	ai_retreat MAGMAR,       	  -1
	ai_retreat TYPHLOSION2,    	   -2
	db $00

.list_energy
	ai_energy CYNDAQUIL1,   	2, +1
	ai_energy QUILAVA2,   		3, +2
	ai_energy TYPHLOSION2,  	3, +3
	ai_energy HOUNDOUR1, 		2, +0
	ai_energy HOUNDOOM, 		3, +1
	ai_energy MOLTRES,      	4, +0
	ai_energy MAGMAR,       	2, +2
	db $00

.list_prize
	db TYPHLOSION2
	db QUILAVA2
	db CYNDAQUIL1
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
