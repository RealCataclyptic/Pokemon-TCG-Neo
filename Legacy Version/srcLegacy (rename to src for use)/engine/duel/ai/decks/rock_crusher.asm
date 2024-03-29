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
	db SUDOWOODO
	db SKARMORY
	db ONIX
	db LARVITAR
	db $00

.list_bench
	db LARVITAR
	db ONIX
	db SUDOWOODO
	db SKARMORY
	db $00

.list_retreat
	ai_retreat STEELIX, -5
	ai_retreat TYRANITAR, -5
	ai_retreat SUDOWOODO, -2
	db $00

.list_energy
	ai_energy ONIX,  2, +1
	ai_energy STEELIX,  3, +5
	ai_energy LARVITAR,  2, +0
	ai_energy PUPITAR, 2, +3
	ai_energy TYRANITAR,    4, +4
	ai_energy SUDOWOODO,     2, +1
	ai_energy SKARMORY,  3, +1
	db $00

.list_prize
	db PROFESSOR_ELM
	db STEELIX
	db $00

.store_list_pointers
	store_list_pointer wAICardListAvoidPrize, .list_prize
	store_list_pointer wAICardListArenaPriority, .list_arena
	store_list_pointer wAICardListBenchPriority, .list_bench
	store_list_pointer wAICardListPlayFromHandPriority, .list_bench
	; missing store_list_pointer wAICardListRetreatBonus, .list_retreat
	store_list_pointer wAICardListEnergyBonus, .list_energy
	ret
