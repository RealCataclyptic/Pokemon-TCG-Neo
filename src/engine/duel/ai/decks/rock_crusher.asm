AIActionTable_RockCrusher:
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
	db JIGGLYPUFF_LV12
	db SANDSHREW
	db ELECTABUZZ_LV20
	db MACHOKE
	db $00

.list_bench
	db MACHOKE
	db ELECTABUZZ_LV20
	db SANDSHREW
	db JIGGLYPUFF_LV12
	db $00

.list_retreat
	ai_retreat ELECTABUZZ_LV35, -5
	ai_retreat GEODUDE, -5
	ai_retreat JIGGLYPUFF_LV12, -5
	db $00

.list_energy
	ai_energy ELECTABUZZ_LV20,  2, +1
	ai_energy ELECTABUZZ_LV35,  4, +5
	ai_energy MACHOKE,  2, -1
	ai_energy MACHAMP, 2, +1
	ai_energy GEODUDE,    4, +4
	ai_energy SANDSHREW,     2, -1
	ai_energy SANDSLASH,  3, +0
	ai_energy JIGGLYPUFF_LV12,	2, +1
	db $00

.list_prize
	db ENERGY_REMOVAL
	db GEODUDE
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
