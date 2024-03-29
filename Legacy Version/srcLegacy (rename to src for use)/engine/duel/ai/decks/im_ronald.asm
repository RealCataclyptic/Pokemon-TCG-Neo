AIActionTable_ImRonald:
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
	db HITMONTOP
	db MEW
	db EEVEE
	db GASTLY
	db DELIBIRD
	db ABRA
	db $00

.list_bench
	db HITMONCHAN
	db HITMONTOP
	db MEW
	db EEVEE
	db GASTLY
	db DELIBIRD
	db ABRA
	db $00

.list_retreat
	db $00

.list_energy
	ai_energy GASTLY,   	  1, +0
	ai_energy HAUNTER,   2, +0
	ai_energy EEVEE,    2, +1
	ai_energy ESPEON2,	  3, +3
	ai_energy DELIBIRD,      2, +1
	ai_energy HITMONCHAN,      3, +1
	ai_energy HITMONTOP,           3, +0
	ai_energy MACHOP,        2, +0
	ai_energy MACHOKE,         3, +2
	ai_energy ABRA,         1, +0
	ai_energy MEW,         2, +0
	db $00

.list_prize
	db EEVEE
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
