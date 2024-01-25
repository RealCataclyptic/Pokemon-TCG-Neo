AIActionTable_GoGoRainDance:
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
	db MANTINE
	db SUICUNE
	db ARTICUNO
	db FOSSIL_EGG
	db POLIWAG
	db $00

.list_bench
	db POLIWAG
	db FOSSIL_EGG
	db MANTINE
	db SUICUNE
	db ARTICUNO
	db $00

.list_retreat
	ai_retreat KABUTOPS,  -3
	ai_retreat ARTICUNO, -1
	ai_retreat SUICUNE,    -2
	db $00

.list_energy
	ai_energy POLIWAG, 2, +0
	ai_energy POLIWHIRL, 2, +0
	ai_energy POLITOED, 3, -2
	ai_energy FOSSIL_EGG,   2, +0
	ai_energy MANTINE,   2, +2
	ai_energy SUICUNE,   3, +1
	ai_energy ARTICUNO,    4, +0
	ai_energy KABUTO,    3, +3
	ai_energy KABUTOPS,    4, +4
	ai_energy AERODACTYL,    1, +1
	db $00

.list_prize
	db FOSSIL_EGG
	db POLITOED
	db PROFESSOR_ELM
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
