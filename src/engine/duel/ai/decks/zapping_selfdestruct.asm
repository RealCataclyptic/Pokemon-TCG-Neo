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
	db MAGNEMITE_LV13
	db VAPOREON_LV42
	db PIKACHU_LV16
	db PIDGEOTTO
	db $00

.list_bench
	db PIKACHU_LV16
	db VAPOREON_LV42
	db MAGNEMITE_LV13
	db PIDGEOTTO
	db $00

.list_retreat
	ai_retreat PIDGEOTTO, -1
	db $00

.list_energy
	ai_energy PIDGEOTTO,   2, +1
	ai_energy PIDGEOT_LV38,   3, +1
	ai_energy PIKACHU_LV16,         2, +1
	ai_energy FLYING_PIKACHU,  3, +0
	ai_energy RAICHU_LV40, 4, +3
	ai_energy VAPOREON_LV42, 	2, +0
	ai_energy ARTICUNO_LV35,      2, +1
	ai_energy SURFING_PIKACHU_ALT_LV13,          4, +3
	ai_energy MAGNEMITE_LV13,	3, +1
	db $00

.list_prize
	db PIDGEOTTO
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
