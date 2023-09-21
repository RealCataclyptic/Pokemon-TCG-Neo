AIActionTable_PowerfulRonald:
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
	db MANKEY
	db MAGNEMITE_LV13
	db SLOWPOKE_LV18
	db GENGAR
	db HITMONLEE
	db DODUO
	db KANGASKHAN
	db TAUROS
	db SPEAROW
	db $00

.list_bench
	db PRIMEAPE
	db MANKEY
	db MAGNEMITE_LV13
	db SLOWPOKE_LV18
	db GENGAR
	db HITMONLEE
	db DODUO
	db KANGASKHAN
	db TAUROS
	db SPEAROW
	db $00

.list_retreat
	ai_retreat KANGASKHAN, -1
	ai_retreat CHANSEY,      -1
	ai_retreat TAUROS,     -1
	db $00

.list_energy
	ai_energy MAGNEMITE_LV13, 3, +1
	ai_energy MANKEY,       3, +1
	ai_energy PRIMEAPE,      4, +1
	ai_energy SLOWPOKE_LV18,         2, +0
	ai_energy GENGAR,            3, +0
	ai_energy HITMONLEE,     3, +1
	ai_energy SPEAROW,           2, -1
	ai_energy CLEFAIRY,          3, +0
	ai_energy DODUO,       3, +1
	ai_energy KANGASKHAN,      3, -1
	ai_energy TAUROS,          2, -1
	db $00

.list_prize
	db ENERGY_SEARCH
	db ENERGY_REMOVAL
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
