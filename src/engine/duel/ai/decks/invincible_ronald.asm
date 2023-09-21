AIActionTable_InvincibleRonald:
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
	db ODDISH
	db PARAS
	db MUK
	db EXEGGCUTE
	db GRIMER
	db $00

.list_bench
	db ODDISH
	db JIGGLYPUFF_LV12
	db PARAS
	db MUK
	db EXEGGCUTE
	db GRIMER
	db $00

.list_retreat
	ai_retreat GRIMER, 0
	db $00

.list_energy
	ai_energy ODDISH,         1, -1
	ai_energy GLOOM,            3, -1
	ai_energy PARAS,        2, -1
	ai_energy PARASECT,    3, +1
	ai_energy MUK,        2, +0
	ai_energy EXEGGCUTE,       2, +0
	ai_energy KOFFING,        3, +1
	ai_energy TANGELA_LV8,     4, +1
	ai_energy CLEFABLE, 	2, +0
	db $00

.list_prize
	db TANGELA_LV8
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
