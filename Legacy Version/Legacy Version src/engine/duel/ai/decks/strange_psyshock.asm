AIActionTable_StrangePsyshock:
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
	db SNORLAX
	db MISDREAVUS
	db TOTODILE1
	db CELEBI
	db CHANSEY
	db SLOWPOKE
	db $00

.list_bench
	db SLOWPOKE
	db CELEBI
	db CHANSEY
	db TOTODILE1
	db MISDREAVUS
	db SNORLAX
	db $00

.list_retreat
	ai_retreat SNORLAX,       -3
	ai_retreat MISDREAVUS,    -1
	db $00

.list_energy
	ai_energy SLOWPOKE,       2, +0
	ai_energy SLOWKING,    3, +0
	ai_energy MISDREAVUS,   3, +1
	ai_energy CELEBI,    2, -1
	ai_energy CHANSEY,    3, +0
	ai_energy BLISSEY,    4, +1
	ai_energy SNORLAX, 	3, +1
	ai_energy TOTODILE1,	2, +2
	ai_energy CROCONAW2,	3, +2
	ai_energy FERALIGATR2,	3, +5
	db $00

.list_prize
	db PROFESSOR_ELM
	db FERALIGATR2
	db TOTODILE1
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
