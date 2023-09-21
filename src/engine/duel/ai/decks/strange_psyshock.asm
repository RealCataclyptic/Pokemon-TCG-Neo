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
	db SLOWPOKE_LV18
	db GASTLY_LV17
	db EEVEE
	db DROWZEE
	db KADABRA
	db $00

.list_bench
	db KADABRA
	db EEVEE
	db GASTLY_LV17
	db SLOWPOKE_LV18
	db DROWZEE
	db $00

.list_retreat
	ai_retreat GASTLY_LV17,       -3
	ai_retreat CHANSEY,    -3
	ai_retreat DROWZEE, -1
	ai_retreat SLOWPOKE_LV18,    -1
	db $00

.list_energy
	ai_energy KADABRA,       2, +1
	ai_energy SLOWPOKE_LV9,    3, +2
	ai_energy SLOWPOKE_LV18,   2, +1
	ai_energy EEVEE,    4, -2
	ai_energy DITTO,    3, -1
	ai_energy GASTLY_LV17, 1, +1
	ai_energy CHANSEY,    3, +3
	ai_energy DROWZEE,	2, +0
	db $00

.list_prize
	db PROFESSOR_OAK
	db SCOOP_UP
	db SLOWPOKE_LV9
	db KADABRA
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
