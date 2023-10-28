AIActionTable_InvincibleRonald:
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
	db AIPOM
	db MAGMAR
	db SUNKERN
	db PINECO
	db CYNDAQUIL1
	db CYNDAQUIL2
	db $00

.list_bench
	db SUNKERN
	db AIPOM
	db MAGMAR
	db PINECO
	db CYNDAQUIL1
	db CYNDAQUIL2
	db $00

.list_retreat
	ai_retreat MAGMAR, 0
	db $00

.list_energy
	ai_energy SUNKERN,         2, +0
	ai_energy SUNFLORA,            3, +1
	ai_energy PINECO,        2, +0
	ai_energy FORRETRESS,    2, +1		
	ai_energy MAGMAR, 	2, +1
	ai_energy CYNDAQUIL1,        2, +0
	ai_energy CYNDAQUIL2,       2, +0
	ai_energy QUILAVA2,        3, +1
	ai_energy TYPHLOSION2,     2, +4
	ai_energy AIPOM, 	2, +0
	db $00

.list_prize
	db TYPHLOSION2
	db SUNFLORA
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
