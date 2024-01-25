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
	db AIPOM
	db YANMA
 	db SNORLAX
	db SUNKERN
	db ODDISH
	db HOPPIP
	db $00

.list_bench
	db ODDISH
	db HOPPIP
	db AIPOM
	db YANMA
 	db SNORLAX
	db SUNKERN
	db $00

.list_retreat
	ai_retreat BELLOSSOM,     -3
	ai_retreat AIPOM, -2
	ai_retreat SNORLAX, -2
	db $00

.list_energy
	ai_energy ODDISH,      2, +2
	ai_energy GLOOM,        3, +2
	ai_energy BELLOSSOM,  3, +3
	ai_energy HOPPIP,      1, +1
	ai_energy SKIPLOOM,     1, +1
	ai_energy JUMPLUFF,	1, +2
	ai_energy YANMA,	3, +1
	ai_energy SUNKERN,	3, +0
	ai_energy SUNFLORA,	3, +1
	ai_energy SNORLAX,	3, +0
	ai_energy AIPOM,	2, +1
	db $00

.list_prize
	db BELLOSSOM
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
