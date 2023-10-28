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
	db MAGMAR
	db HOOH
	db CHANSEY
	db CYNDAQUIL1
	db HOUNDOUR1
	db ENTEI2
	db $00

.list_bench
	db MAGMAR
	db CYNDAQUIL1
	db HOUNDOUR1
	db ENTEI2
	db HOOH
	db CHANSEY
	db $00

.list_retreat
	ai_retreat HOOH, -1
	ai_retreat MILTANK,         -1
	ai_retreat TYPHLOSION1,       -1
	db $00

.list_energy
	ai_energy CYNDAQUIL1,       2, +0
	ai_energy QUILAVA1,   3, +1
	ai_energy TYPHLOSION1,     4, +3
	ai_energy HOUNDOUR1, 2, -1
	ai_energy HOUNDOOM, 3, +0
	ai_energy ENTEI2,      3, +0
	ai_energy CHANSEY,         4, -2
	ai_energy BLISSEY,         4, -2
	ai_energy HOOH,          5, +1
	ai_energy MAGMAR,          2, +2
	db $00

.list_prize
	db POKE_BALL
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
