MACRO ai_trainer_card_logic
	db \1 ; AI_TRAINER_CARD_PHASE_* constant
	db \2 ; ID of trainer card
	dw \3 ; function for AI decision to play card
	dw \4 ; function for AI playing the card
ENDM

AITrainerCardLogic: ; 20000 (8:4000)
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_07, POTION,                  AIDecide_Potion1,                        AIPlay_Potion
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_10, POTION,                  AIDecide_Potion2,                        AIPlay_Potion
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_08, HYPER_POTION,            AIDecide_SuperPotion1,                   AIPlay_SuperPotion
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_11, HYPER_POTION,            AIDecide_SuperPotion2,                   AIPlay_SuperPotion
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_13, CRYSTAL_SHARD,           AIDecide_Defender1,                      AIPlay_Defender
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_14, CRYSTAL_SHARD,           AIDecide_Defender2,                      AIPlay_Defender
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_13, STRENGTH_CHARM,          AIDecide_Pluspower1,                     AIPlay_Pluspower
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_14, STRENGTH_CHARM,          AIDecide_Pluspower2,                     AIPlay_Pluspower
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_09, SWITCH,                  AIDecide_Switch,                         AIPlay_Switch
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_07, POKEMON_REVERSAL,        AIDecide_GustOfWind,                     AIPlay_GustOfWind
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_10, POKEMON_REVERSAL,        AIDecide_GustOfWind,                     AIPlay_GustOfWind
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_04, MAIL_FROM_BILL,          AIDecide_Bill,                           AIPlay_Bill
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_05, ENERGY_REMOVAL2,         AIDecide_EnergyRemoval,                  AIPlay_EnergyRemoval
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_05, MASTER_BALL,   		 AIDecide_SuperEnergyRemoval,             AIPlay_SuperEnergyRemoval
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_07, STAR_PIECE,       	 AIDecide_PokemonBreeder,                 AIPlay_PokemonBreeder
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_15, PROFESSOR_ELM,           AIDecide_ProfessorOak,                   AIPlay_ProfessorOak
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_10, ENERGY_ARK,      	 AIDecide_EnergyRetrieval,                AIPlay_EnergyRetrieval
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_11, SUPER_ENERGY_RETRIEVAL,  AIDecide_SuperEnergyRetrieval,           AIPlay_SuperEnergyRetrieval
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_06, POKEMON_NURSE,           AIDecide_PokemonCenter,                  AIPlay_PokemonCenter
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_07, TEAM_ROCKETS_EVIL_DEEDS, AIDecide_ImposterProfessorOak,           AIPlay_ImposterProfessorOak
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_12, ENERGY_SEARCH,           AIDecide_EnergySearch,                   AIPlay_EnergySearch
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_03, NEW_POKEDEX,             AIDecide_Pokedex,                        AIPlay_Pokedex
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_07, FULL_HEAL,               AIDecide_FullHeal,                       AIPlay_FullHeal
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_10, FOREST_GUARDIAN,         AIDecide_MrFuji,                         AIPlay_MrFuji
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_10, SUPER_SCOOP_UP,          AIDecide_ScoopUp,                        AIPlay_ScoopUp
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_02, BILLS_MAINTENANCE,       AIDecide_Maintenance,                    AIPlay_Maintenance
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_03, OLD_ROD,                 AIDecide_Recycle,                        AIPlay_Recycle
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_13, SEER,                    AIDecide_Lass,                           AIPlay_Lass
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_04, RUIN_WALL,               AIDecide_ItemFinder,                     AIPlay_ItemFinder
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_01, ARCADE_GAME,             AIDecide_Gambler,                        AIPlay_Gambler
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_05, MIRACLE_BERRY,           AIDecide_Revive,                         AIPlay_Revive
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_13, POKEMON_FLUTE_CHANNEL,   AIDecide_PokemonFlute,                   AIPlay_PokemonFlute
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_05, POKE_DOLL,         	 AIDecide_ClefairyDollOrMysteriousFossil, AIPlay_ClefairyDollOrMysteriousFossil
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_05, FOSSIL_EGG,    		 AIDecide_ClefairyDollOrMysteriousFossil, AIPlay_ClefairyDollOrMysteriousFossil
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_02, POKE_BALL,               AIDecide_Pokeball,                       AIPlay_Pokeball
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_02, POKEGEAR,        	 AIDecide_ComputerSearch,                 AIPlay_ComputerSearch
	ai_trainer_card_logic AI_TRAINER_CARD_PHASE_02, POKEMON_FAN_CLUB,        AIDecide_PokemonTrader,                  AIPlay_PokemonTrader
	db $ff
