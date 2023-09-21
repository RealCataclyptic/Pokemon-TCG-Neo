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
	db PRIMEAPE
	db MACHOP
	db HITMONCHAN
	db JIGGLYPUFF_LV13
	db CUBONE
	db FARFETCHD
	db JOLTEON_LV24
	db $00

.list_bench
	db PRIMEAPE
	db MACHOP
	db HITMONCHAN
	db JIGGLYPUFF_LV13
	db CUBONE
	db FARFETCHD
	db JOLTEON_LV24
	db $00

.list_retreat
	db $00

.list_energy
	ai_energy CUBONE,   	  2, +0
	ai_energy MAROWAK_LV26,   2, +0
	ai_energy JIGGLYPUFF_LV13,    2, +1
	ai_energy KABUTOPS,	  3, +1
	ai_energy FARFETCHD,      3, +1
	ai_energy PRIMEAPE,      4, +1
	ai_energy MACHOP,           3, +0
	ai_energy JOLTEON_LV24,        2, -1
	ai_energy HITMONCHAN,         2, +0
	db $00

.list_prize
	db LAPRAS
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
