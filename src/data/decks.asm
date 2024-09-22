DeckPointers::
	table_width 2, DeckPointers
	dw UnnamedDeck
	dw UnnamedDeck2
	dw SamsPracticeDeck
	dw PracticePlayerDeck
	dw SamsPracticeDeck
	dw CharmanderAndFriendsDeck ; 'Cyndaquil Starter Deck'
	dw CharmanderExtraDeck ; ^^^ Extra
	dw SquirtleAndFriendsDeck ; 'Totodile Starter Deck'
	dw SquirtleExtraDeck ; ^^^ Extra
	dw BulbasaurAndFriendsDeck ; 'Chikorita Starter Deck'
	dw BulbasaurExtraDeck ; ^^^ Extra
	dw LightningAndFireDeck
	dw WaterAndFightingDeck
	dw GrassAndPsychicDeck
	dw LegendaryMoltresDeck ; 'Legendary Ho-oh'. 
	dw LegendaryZapdosDeck ; 'Legendary Celebi'.
	dw LegendaryArticunoDeck ; 'Legendary Lugia'
	dw LegendaryDragoniteDeck ; 'Legendary Charizard'
	dw FirstStrikeDeck
	dw RockCrusherDeck
	dw GoGoRainDanceDeck
	dw ZappingSelfdestructDeck ; 'Supercharged'.
	dw FlowerPowerDeck
	dw StrangePsyshockDeck
	dw WondersofScienceDeck ; 'Revolutionary Theory'. 
	dw FireChargeDeck ; 'Burn To Ash'.
	dw ImRonaldDeck
	dw PowerfulRonaldDeck
	dw InvincibleRonaldDeck
	dw LegendaryRonaldDeck
	dw MusclesforBrainsDeck
	dw HeatedBattleDeck ; 'War and Peace'.
	dw LovetoBattleDeck
	dw ExcavationDeck
	dw BlisteringPokemonDeck
	dw HardPokemonDeck
	dw WaterfrontPokemonDeck ; 'Deep-Sea Diving'
	dw LonelyFriendsDeck ; 		Switcheroo
	dw SoundoftheWavesDeck
	dw PikachuDeck ; 'Pikachu (?)'
	dw BoomBoomSelfdestructDeck ; 'Bench Storm'
	dw PowerGeneratorDeck ; 'Dragon Ball'
	dw EtceteraDeck ; 'Ancient Jungle'
	dw FlowerGardenDeck ; 'Overgrowth'
	dw KaleidoscopeDeck
	dw GhostDeck ; 'Phobia'
	dw NapTimeDeck ; 'Sweet Nightmares'
	dw StrangePowerDeck ; 'Sun and Moon'
	dw FlyinPokemonDeck ; 'Aerodynamics'
	dw LovelyNidoranDeck ; 'Entomology'
	dw PoisonDeck ; 'Toxicology'
	dw AngerDeck
	dw FlamethrowerDeck ; 'Destruction'.
	dw ReshuffleDeck ; 'Plasma'.
	dw ImakuniDeck
	dw NULL
	assert_table_length NUM_VALID_DECKS + 1

UnnamedDeck:
	deck_list_start
	card_item PSYCHIC_ENERGY,	20
	card_item SLOWKING,	4
	card_item TOGETIC2,	4
	card_item HOOTHOOT,	4
	card_item JIGGLYPUFF,	4
	card_item CLEFAIRY,	4
	card_item SHADOW_LUGIA,	2
	card_item ARCADE_GAME,	2
	card_item PROFESSOR_ELM,	2
	card_item ENERGY_REMOVAL2,	2
	card_item ENERGY_ARK,	4
	card_item STAR_PIECE,	4
	card_item SUPER_SCOOP_UP,	4
	deck_list_end

UnnamedDeck2:
	deck_list_start
	card_item PSYCHIC_ENERGY,	20
	card_item SLOWKING,		4
	card_item TOGETIC2,		4
	card_item HOOTHOOT,		4
	card_item JIGGLYPUFF,		4
	card_item CLEFAIRY,		4
	card_item SHADOW_LUGIA,		2
	card_item ARCADE_GAME,		2
	card_item PROFESSOR_ELM,	2
	card_item ENERGY_REMOVAL2,	2
	card_item ENERGY_ARK,		4
	card_item STAR_PIECE,		4
	card_item SUPER_SCOOP_UP,	4
	deck_list_end


	dw $4544
	dw $4d52
	dw $4c5b
	dw $4156
	dw $4a51
	dw $4753
	dw $4648
	dw $4e4b
	dw $5e55
	dw $5949

PracticePlayerDeck:
	deck_list_start
	card_item WATER_ENERGY,		2
	card_item PSYCHIC_ENERGY,	1
	card_item HORSEA,		1
	card_item SEADRA,		1
	card_item FULL_HEAL,		1
	card_item MANTINE,		1
	card_item WATER_ENERGY,		5
	card_item CELEBI,		1
	card_item POTION,		1
	card_item HORSEA,		1
	card_item KINGDRA,		1
	card_item WATER_ENERGY,		1
	card_item MAIL_FROM_BILL,	1
	card_item PSYCHIC_ENERGY,	1
	card_item DRATINI,		1
	card_item TOTODILE2,		1
	card_item WATER_ENERGY,		1
	card_item TOTODILE2,		1
	card_item WATER_ENERGY,		1
	card_item PSYCHIC_ENERGY,	1
	card_item CROCONAW1,		1
	card_item MAIL_FROM_BILL,	1
	card_item WATER_ENERGY,		1
	card_item CROCONAW2,		1
	card_item WATER_ENERGY,		1
	card_item PSYCHIC_ENERGY,	1
	card_item WATER_ENERGY,		1
	card_item PSYCHIC_ENERGY,	1
	card_item WIGGLYTUFF,		1
	card_item MURKROW,		1
	card_item PSYCHIC_ENERGY,	1
	card_item MEWTWO_S,		1
	card_item WATER_ENERGY,		1
	card_item PSYCHIC_ENERGY,	1
	card_item POLIWHIRL,		1
	card_item PSYCHIC_ENERGY,	1
	card_item SLOWPOKE,		1
	card_item POTION,		1
	card_item PSYCHIC_ENERGY,	1
	card_item CELEBI,		1
	card_item PSYCHIC_ENERGY,	1
	card_item WIGGLYTUFF,		1
	card_item MANTINE,		1
	card_item POLIWHIRL,		1
	card_item POLIWRATH,		1
	card_item MANTINE,		1
	card_item SEADRA,		1
	card_item GYARADOS_S,		1
	card_item MURKROW,		1
	card_item CELEBI,		1
	card_item MEWTWO_S,		1
	card_item WIGGLYTUFF,		1
	card_item TOGEPI1,		1
	card_item TOGEPI1,		1
	card_item SLOWBRO,		1
	deck_list_end
	tx PracticePlayerDeckName

SamsPracticeDeck:
	deck_list_start
	card_item LIGHTNING_ENERGY,	2
	card_item FIRE_ENERGY,	2
	card_item HOUNDOUR2,	1
	card_item TOGEPI1,	1
	card_item PUPITAR,	1
	card_item FIGHTING_ENERGY,	2
	card_item PUPITAR,	1
	card_item WIGGLYTUFF,	1
	card_item FIGHTING_ENERGY,	2
	card_item HITMONTOP,	1
	card_item FIGHTING_ENERGY,	1
	card_item TOGEPI1,	1
	card_item LIGHTNING_ENERGY,	1
	card_item HITMONTOP,	1
	card_item MAIL_FROM_BILL,	1
	card_item FIGHTING_ENERGY,	1
	card_item DONPHAN2,	1
	card_item TYROGUE,	1
	card_item FIGHTING_ENERGY,	1
	card_item LARVITAR,	1
	card_item LIGHTNING_ENERGY,	1
	card_item LIGHTNING_ENERGY,	1
	card_item POKEMON_REVERSAL,	1
	card_item SWINUB,	1
	card_item LIGHTNING_ENERGY,	1
	card_item STEELIX,	1
	card_item FIGHTING_ENERGY,	1
	card_item CHANSEY,	1
	card_item LIGHTNING_ENERGY,	1
	card_item PROFESSOR_ELM,	1
	card_item FIGHTING_ENERGY,	1
	card_item BLISSEY,	1
	card_item FIGHTING_ENERGY,	1
	card_item DOUBLE_COLORLESS_ENERGY,	1
	card_item PIKACHU,	1
	card_item LIGHTNING_ENERGY,	1
	card_item PIKACHU,	1
	card_item LIGHTNING_ENERGY,	1
	card_item POTION,	1
	card_item LIGHTNING_ENERGY,	1
	card_item RAICHU,	1
	card_item LIGHTNING_ENERGY,	1
	card_item AMPHAROS2,	1
	card_item ELEKID,	1
	card_item LIGHTNING_ENERGY,	1
	card_item SWINUB,	1
	card_item DONPHAN2,	1
	card_item HITMONTOP,	1
	card_item LARVITAR,		1
	card_item TYRANITAR_S,	1
	card_item NATU,	1
	card_item NATU,	1
	card_item XATU,	1
	card_item WIGGLYTUFF,	1
	card_item BLISSEY,	1
	card_item BLISSEY,	1
	deck_list_end
	tx SamsPracticeDeckName

CharmanderAndFriendsDeck: ; = Cyndaquil Starter Deck.
	deck_list_start
	card_item FIRE_ENERGY, 12
	card_item PSYCHIC_ENERGY, 12
	card_item CYNDAQUIL1, 2
	card_item CYNDAQUIL2, 2
	card_item QUILAVA2, 2
	card_item TYPHLOSION1, 1
	card_item PONYTA, 1
	card_item CHARMANDER, 2
	card_item FLAREON, 1
	card_item EEVEE, 3
	card_item NATU, 2
	card_item XATU, 2
	card_item MURKROW, 2
	card_item ESPEON1, 1
	card_item PORYGON, 2
	card_item PORYGON_2, 1
	card_item PROFESSOR_ELM, 2
	card_item MAIL_FROM_BILL, 2
	card_item SWITCH, 1
	card_item ENERGY_SEARCH, 1		   
	card_item POKEGEAR, 1
	card_item STRENGTH_CHARM, 1
	card_item POTION, 2
	card_item FULL_HEAL, 2
	deck_list_end
	tx CharmanderAndFriendsDeckName

CharmanderExtraDeck: ; = Cyndaquil extras. Given to player at beginning.
	deck_list_start
	card_item GRASS_ENERGY, 4
	card_item WATER_ENERGY, 4
	card_item FIGHTING_ENERGY, 4
	card_item LEDYBA, 2
	card_item SPINARAK, 1
	card_item ZUBAT, 1
	card_item POLIWAG, 2
	card_item POLIWHIRL, 1
	card_item WOOPER, 2
	card_item QUAGSIRE, 1
	card_item SNORLAX, 2
	card_item PIKACHU, 1
	card_item MAREEP1, 1
	card_item SUDOWOODO, 	2
	card_item FULL_HEAL, 	2
	card_item GRASS_ENERGY, 30 ; irrelevant
	deck_list_end
	tx CharmanderExtraDeckName

SquirtleAndFriendsDeck: ; = Totodile Starter Deck. Given to player at beginning.
	deck_list_start
	card_item WATER_ENERGY, 	12
	card_item LIGHTNING_ENERGY, 	12
	card_item TOTODILE1, 		2
	card_item TOTODILE2, 		2
	card_item CROCONAW1, 		2
	card_item FERALIGATR1, 		1
	card_item MARILL2, 		2
	card_item QWILFISH, 		1
	card_item JOLTEON, 		2
	card_item EEVEE, 		2
	card_item CHINCHOU1, 		2
	card_item LANTURN1, 		1
	card_item PICHU, 		1
	card_item MAREEP1, 		2
	card_item FLAAFFY2, 		2
	card_item TEDDIURSA, 		2
	card_item URSARING, 		1
	card_item PROFESSOR_ELM, 	2
	card_item MAIL_FROM_BILL, 	1
	card_item SWITCH, 		2
	card_item POKE_BALL, 		1
	card_item SUPER_SCOOP_UP, 	1
	card_item RUIN_WALL, 		1
	card_item POTION, 		2
	card_item FULL_HEAL, 		1
	deck_list_end
	tx SquirtleAndFriendsDeckName

SquirtleExtraDeck: ; = Totodile extras. Given to player at beginning.
	deck_list_start
	card_item GRASS_ENERGY, 3
	card_item FIRE_ENERGY, 4
	card_item PSYCHIC_ENERGY, 4
	card_item GASTLY, 2
	card_item SLUGMA, 1 
	card_item MAGBY, 1
	card_item MAGMAR, 1
	card_item PINECO, 1
	card_item RHYHORN, 1
	card_item GLOOM, 1
	card_item ZUBAT, 2
	card_item SUNKERN, 1
	card_item UNOWN_A, 1
	card_item GIRAFARIG, 2
	card_item CLEFAIRY, 2
	card_item ENERGY_SEARCH, 1
	card_item MAIL_FROM_BILL, 1
	card_item NEW_POKEDEX, 1			   
	card_item GRASS_ENERGY, 30 ; irrelevant
	deck_list_end
	tx SquirtleExtraDeckName

BulbasaurAndFriendsDeck: ; = Chikorita Starter Deck. Given to player at beginning.
	deck_list_start
	card_item GRASS_ENERGY, 12
	card_item FIGHTING_ENERGY, 12
	card_item CHIKORITA1, 2
	card_item CHIKORITA2, 2
	card_item BAYLEEF1, 2
	card_item MEGANIUM1, 1
	card_item HOPPIP, 2
	card_item SKIPLOOM, 2
	card_item SCYTHER, 1
	card_item MACHOP, 1
	card_item ONIX, 1
	card_item PHANPY2, 2
	card_item DONPHAN2, 1
	card_item SWINUB, 2
	card_item TOGEPI1, 2
	card_item STANTLER, 2		  
	card_item SKARMORY, 1			  
	card_item PROFESSOR_ELM, 2
	card_item MAIL_FROM_BILL, 2				  
	card_item SWITCH, 1
	card_item POKE_BALL, 1
	card_item STRENGTH_CHARM, 2
	card_item CRYSTAL_SHARD, 1
	card_item FULL_HEAL, 2
	card_item ENERGY_SEARCH, 1
	deck_list_end
	tx BulbasaurAndFriendsDeckName

BulbasaurExtraDeck: ; = Chikorita extras. Given to player at beginning.
	deck_list_start
	card_item LIGHTNING_ENERGY, 4
	card_item PSYCHIC_ENERGY, 4
	card_item WATER_ENERGY, 3
	card_item PIKACHU, 2
	card_item PIKACHU2, 1
	card_item ELEKID, 1
	card_item ELECTABUZZ, 1
	card_item SLOWPOKE, 2
	card_item SLOWBRO, 1
	card_item JYNX, 1
	card_item GIRAFARIG, 2
	card_item SMOOCHUM, 1
	card_item OMANYTE, 1
	card_item POLIWAG, 1
	card_item ARCADE_GAME, 1
	card_item MAIL_FROM_BILL, 1
	card_item POTION, 2
	card_item POKEMON_REVERSAL, 1
	card_item GRASS_ENERGY, 30 ; irrelevant
	deck_list_end
	tx BulbasaurExtraDeckName

LightningAndFireDeck: ; Used by Mason Laboratory's Aaron.
	deck_list_start
	card_item FIRE_ENERGY, 10
	card_item LIGHTNING_ENERGY, 10
	card_item DOUBLE_COLORLESS_ENERGY, 2
	card_item CYNDAQUIL1, 2
	card_item CYNDAQUIL2, 2
	card_item QUILAVA1, 2
	card_item CHARMANDER, 1
	card_item SLUGMA, 2
	card_item MAGCARGO, 1
	card_item MAGBY, 1
	card_item MAGMAR, 1
	card_item PICHU, 2
	card_item PIKACHU, 3
	card_item RAICHU, 1					  
	card_item CHINCHOU2, 3
	card_item LANTURN1, 1
	card_item LANTURN2, 1
	card_item SENTRET, 2
	card_item FURRET, 1
	card_item PROFESSOR_ELM, 1
	card_item MAIL_FROM_BILL, 2				  
	card_item ENERGY_SEARCH, 2
	card_item SWITCH, 2
	card_item STRENGTH_CHARM, 2
	card_item CRYSTAL_SHARD, 2
	card_item POTION, 1
	deck_list_end
	tx LightningAndFireDeckName

WaterAndFightingDeck: ; Used by Mason Laboratory's Aaron.
	deck_list_start
	card_item WATER_ENERGY, 12
	card_item FIGHTING_ENERGY, 10
	card_item DOUBLE_COLORLESS_ENERGY, 2
	card_item HORSEA, 3
	card_item SEADRA, 1
	card_item QWILFISH, 2
	card_item SNEASEL, 1
	card_item WOOPER, 2
	card_item QUAGSIRE, 1
	card_item MARILL1, 2
	card_item MARILL2, 1
	card_item PHANPY1, 2
	card_item DONPHAN1, 1
	card_item TYROGUE, 3
	card_item LARVITAR, 2
	card_item PUPITAR, 1
	card_item HITMONTOP, 1
	card_item CORSOLA, 2
	card_item HITMONLEE, 1
	card_item PROFESSOR_ELM, 1				  
	card_item MAIL_FROM_BILL, 2
	card_item ENERGY_SEARCH, 2
	card_item POTION, 3
	card_item FULL_HEAL, 2
	deck_list_end
	tx WaterAndFightingDeckName

GrassAndPsychicDeck: ; Used by Mason Laboratory's Aaron.
	deck_list_start
	card_item GRASS_ENERGY, 12
	card_item PSYCHIC_ENERGY, 12
	card_item CHIKORITA1, 2
	card_item CHIKORITA2, 2
	card_item LEDYBA, 3
	card_item LEDIAN, 3
	card_item SPINARAK, 2
	card_item ARIADOS, 1
	card_item YANMA, 1
	card_item NATU, 3
	card_item XATU, 2
	card_item MURKROW, 3
	card_item SLOWPOKE, 2
	card_item SLOWBRO, 1
	card_item DELIBIRD, 1
	card_item MAIL_FROM_BILL, 2		 
	card_item ENERGY_SEARCH, 2
	card_item POKEMON_REVERSAL, 2
	card_item POTION, 2
	card_item FULL_HEAL, 2 
	deck_list_end
	tx GrassAndPsychicDeckName

LegendaryMoltresDeck: ; = Legendary Hooh. Used by Grand Master Courtney.
	deck_list_start
	card_item FIRE_ENERGY, 8
	card_item LIGHTNING_ENERGY, 10
	card_item HOOH_C, 3
	card_item VOLTORB, 2
	card_item ELECTRODE, 2
	card_item GROWLITHE, 3
	card_item ARCANINE, 2
	card_item MAGNEMITE, 2
	card_item MAGNETON, 1
	card_item SENTRET, 1
	card_item PROFESSOR_ELM, 3
	card_item POKEMON_REVERSAL, 3
	card_item MAIL_FROM_BILL, 4
	card_item SEER, 2
	card_item ENERGY_SEARCH, 4
	card_item SWITCH, 3
	card_item MASTER_BALL, 3
	card_item STRENGTH_CHARM, 2
	card_item FULL_HEAL, 2
	deck_list_end
	tx LegendaryMoltresDeckName
	
LegendaryZapdosDeck: ; = Legendary Celebi. Used by Grand Master Steve.
	deck_list_start
	card_item GRASS_ENERGY, 12
	card_item PSYCHIC_ENERGY, 6
	card_item CELEBI_C, 4
	card_item CHIKORITA2, 4
	card_item BAYLEEF1, 3
	card_item MEGANIUM2, 3
	card_item MEWTWO, 2
	card_item SNORLAX, 2
	card_item CHANSEY, 2
	card_item BLISSEY, 2
	card_item PROFESSOR_ELM, 3
	card_item MAIL_FROM_BILL, 4
	card_item POTION, 3
	card_item HYPER_POTION, 3
	card_item FULL_HEAL, 1
	card_item ENERGY_REMOVAL2, 3
	card_item MASTER_BALL, 3
	deck_list_end
	tx LegendaryZapdosDeckName

LegendaryArticunoDeck: ; = Legendary Lugia. Used by Grand Master Jack.
	deck_list_start
	card_item WATER_ENERGY, 12
	card_item LIGHTNING_ENERGY, 6
	card_item LUGIA_C, 4
	card_item POLIWAG, 3
	card_item POLIWHIRL, 3
	card_item POLITOED, 2
	card_item PIKACHU2, 3
	card_item RAICHU_S, 2
	card_item SUICUNE, 2
	card_item ARTICUNO, 2
	card_item SWITCH, 2
	card_item PROFESSOR_ELM, 3
	card_item POKEMON_REVERSAL, 2
	card_item TEAM_ROCKETS_EVIL_DEEDS, 4
	card_item ENERGY_SEARCH, 3
	card_item MASTER_BALL, 4
	card_item ENERGY_REMOVAL2, 3
	deck_list_end
	tx LegendaryArticunoDeckName

LegendaryDragoniteDeck: ; = Legendary Charizard. Used by Grand Master Rod.
	deck_list_start
	card_item FIRE_ENERGY, 9
	card_item FIGHTING_ENERGY, 6
	card_item DOUBLE_COLORLESS_ENERGY, 2
	card_item CHARMANDER, 4
	card_item CHARMELEON, 3
	card_item CHARIZARD_C, 2
	card_item MOLTRES, 1
	card_item PONYTA, 3
	card_item RAPIDASH, 2
	card_item GLIGAR, 2
	card_item RHYHORN, 3
	card_item RHYDON, 2
	card_item SKARMORY, 2
	card_item PROFESSOR_ELM, 4
	card_item MAIL_FROM_BILL, 4
	card_item ENERGY_SEARCH, 4
	card_item MASTER_BALL, 4
	card_item SUPER_ENERGY_RETRIEVAL, 1
	card_item SWITCH, 2
	deck_list_end
	tx LegendaryDragoniteDeckName

FirstStrikeDeck: ; Used by Fighting Club leader Mitch.
	deck_list_start
	card_item FIGHTING_ENERGY, 15
	card_item DOUBLE_COLORLESS_ENERGY, 4
	card_item WOOPER, 3
	card_item QUAGSIRE, 2
	card_item HITMONTOP, 2
	card_item MACHOP, 4
	card_item MACHOKE, 3
	card_item MACHAMP, 3
	card_item STANTLER, 1
	card_item MILTANK, 3
	card_item PROFESSOR_ELM, 4
	card_item POKEMON_FAN_CLUB, 2
	card_item POTION, 2
	card_item STRENGTH_CHARM, 4
	card_item SWITCH, 2
	card_item POKEMON_REVERSAL, 3
	card_item MAIL_FROM_BILL, 3
	deck_list_end
	tx FirstStrikeDeckName

RockCrusherDeck: ; Used by Rock Club leader Gene.
	deck_list_start
	card_item FIGHTING_ENERGY,	16
	card_item DOUBLE_COLORLESS_ENERGY, 4
	card_item ONIX, 4
	card_item STEELIX, 3
	card_item LARVITAR, 4
	card_item PUPITAR, 3
	card_item TYRANITAR, 3
	card_item SKARMORY, 2
	card_item SUDOWOODO, 2
	card_item PROFESSOR_ELM, 3
	card_item POKEMON_FAN_CLUB, 4
	card_item MAIL_FROM_BILL, 3
	card_item SWITCH, 3
	card_item FULL_HEAL, 3
	card_item RUIN_WALL, 3
	deck_list_end
	tx RockCrusherDeckName

GoGoRainDanceDeck: ; Used by Water Club leader Amy.
	deck_list_start
	card_item WATER_ENERGY, 19
	card_item POLIWAG, 4
	card_item POLIWHIRL, 3
	card_item POLITOED, 3
	card_item KABUTO, 3
	card_item KABUTOPS, 3
	card_item SUICUNE, 2
	card_item MANTINE, 2
	card_item AERODACTYL, 2
	card_item ARTICUNO, 1
	card_item PROFESSOR_ELM, 4
	card_item MAIL_FROM_BILL, 2
	card_item STAR_PIECE, 2
	card_item ENERGY_ARK, 1					 
	card_item SUPER_ENERGY_RETRIEVAL, 2
	card_item POKEMON_FAN_CLUB, 3
	card_item FOSSIL_EGG, 4
	deck_list_end
	tx GoGoRainDanceDeckName

ZappingSelfdestructDeck: ; = Supercharged deck. Used by Lightning Club leader Isaac.
	deck_list_start
	card_item LIGHTNING_ENERGY, 16
	card_item MAREEP1, 4
	card_item FLAAFFY1, 3
	card_item AMPHAROS1, 2
	card_item AMPHAROS2, 1
	card_item ZAPDOS, 2
	card_item HOOTHOOT, 3
	card_item NOCTOWL, 2
	card_item VOLTORB, 3
	card_item ELECTRODE, 2
	card_item PROFESSOR_ELM, 3
	card_item MAIL_FROM_BILL, 4
	card_item SWITCH, 2
	card_item POTION, 4
	card_item STRENGTH_CHARM, 2
	card_item CRYSTAL_SHARD, 1
	card_item POKEMON_REVERSAL, 4
	card_item ENERGY_ARK, 2
	deck_list_end
	tx ZappingSelfdestructDeckName

FlowerPowerDeck: ; Used by Grass Club leader Nikki.
	deck_list_start
	card_item GRASS_ENERGY,		18
	card_item ODDISH, 		4
	card_item GLOOM, 		3
	card_item BELLOSSOM, 		4
	card_item HOPPIP, 		3
	card_item SKIPLOOM, 		2
	card_item JUMPLUFF, 		2
	card_item YANMA, 		2
	card_item SUNKERN, 		2
	card_item SUNFLORA, 		2
	card_item SNORLAX, 		2
	card_item AIPOM, 		1
	card_item PROFESSOR_ELM, 	3
	card_item MAIL_FROM_BILL, 	3
	card_item STAR_PIECE, 		3
	card_item SWITCH, 		2
	card_item POKEMON_FAN_CLUB, 	4
	deck_list_end
	tx FlowerPowerDeckName

StrangePsyshockDeck: ; Used by Psychic Club leader Murray.
	deck_list_start
	card_item PSYCHIC_ENERGY, 9
	card_item WATER_ENERGY, 9
	card_item SLOWPOKE, 3
	card_item SLOWKING, 3
	card_item MEW_S, 2
	card_item SNUBBULL, 2
	card_item GRANBULL, 2
	card_item TOTODILE1, 3
	card_item CROCONAW2, 2
	card_item FERALIGATR1, 2
	card_item MISDREAVUS, 2
	card_item SNORLAX, 2
	card_item SUICUNE, 1
	card_item PROFESSOR_ELM, 2
	card_item ENERGY_SEARCH, 2
	card_item POKEMON_FAN_CLUB, 3
	card_item HYPER_POTION, 2
	card_item ENERGY_REMOVAL2, 4
	card_item SUPER_SCOOP_UP, 2
	card_item SWITCH, 3
	deck_list_end
	tx StrangePsyshockDeckName

WondersofScienceDeck: ; = Revolutionary Theory. Used by Science Club leader Rick.
	deck_list_start
	card_item GRASS_ENERGY, 12
	card_item FIRE_ENERGY, 6
	card_item ZUBAT, 4
	card_item GOLBAT, 3
	card_item CROBAT, 1
	card_item BULBASAUR, 3
	card_item IVYSAUR, 2
	card_item VENUSAUR, 2
	card_item CROBAT_S, 1
	card_item VULPIX, 2
	card_item NINETALES, 2
	card_item MAGMAR, 2
	card_item STAR_PIECE, 1
	card_item TEAM_ROCKETS_EVIL_DEEDS, 3
	card_item PROFESSOR_ELM, 4
	card_item POKEMON_FAN_CLUB, 2
	card_item MAIL_FROM_BILL, 3
	card_item ENERGY_SEARCH, 3				 
	card_item SWITCH, 1
	card_item POKEGEAR, 3
	deck_list_end
	tx WondersofScienceDeckName

FireChargeDeck: ; = Burn To Ash. Used by Fire Club leader Ken.
	deck_list_start
	card_item FIRE_ENERGY, 18
	card_item CYNDAQUIL1, 4
	card_item QUILAVA2, 3
	card_item TYPHLOSION2, 3
	card_item MOLTRES, 4
	card_item MAGMAR, 2
	card_item HOUNDOUR1, 2
	card_item HOUNDOOM, 2
	card_item PROFESSOR_ELM, 3
	card_item FULL_HEAL, 2
	card_item MAIL_FROM_BILL, 3
	card_item ENERGY_ARK, 2
	card_item POKEMON_FAN_CLUB, 3				  
	card_item POKEGEAR, 3
	card_item HYPER_POTION, 2					  
	card_item STRENGTH_CHARM, 4
	deck_list_end
	tx FireChargeDeckName

ImRonaldDeck: ; The first deck used against you by Rival Ronald.
	deck_list_start		
	card_item PSYCHIC_ENERGY, 14		   
	card_item FIGHTING_ENERGY, 13
	card_item GASTLY, 3
	card_item HAUNTER, 2
	card_item JYNX, 3
	card_item ESPEON2, 1
	card_item EEVEE, 3
	card_item DELIBIRD, 2
	card_item MACHOP, 2
	card_item MACHOKE, 1
	card_item ABRA, 2
	card_item PROFESSOR_ELM, 3			   
	card_item ENERGY_ARK, 1			   
	card_item SWITCH, 4			   
	card_item STRENGTH_CHARM, 4
	card_item POKEMON_REVERSAL, 2
	deck_list_end
	tx ImRonaldDeckName

PowerfulRonaldDeck: ; The second deck used against you by Rival Ronald.
	deck_list_start
	card_item LIGHTNING_ENERGY, 8
	card_item FIGHTING_ENERGY, 9
	card_item PSYCHIC_ENERGY, 8
	card_item ELECTABUZZ, 3
	card_item HITMONLEE, 2
	card_item HITMONCHAN, 2
	card_item MISDREAVUS, 1
	card_item JYNX, 2
	card_item MAGNETON, 1
	card_item TOGEPI1, 2
	card_item TOGETIC2, 1
	card_item ZAPDOS, 2
	card_item MILTANK, 2
	card_item MAGNEMITE, 3
	card_item PROFESSOR_ELM, 2
	card_item ENERGY_ARK, 2
	card_item SUPER_ENERGY_RETRIEVAL, 1
	card_item ENERGY_REMOVAL2, 2				 
	card_item POKEMON_FAN_CLUB, 3
	card_item STRENGTH_CHARM, 2
	card_item POKEMON_REVERSAL, 2
	deck_list_end
	tx PowerfulRonaldDeckName

InvincibleRonaldDeck: ; The deck Rival Ronald uses against you during Challenge Cup matches.
	deck_list_start
	card_item GRASS_ENERGY, 11
	card_item FIRE_ENERGY, 10
	card_item SUNKERN, 4
	card_item SUNFLORA, 2
	card_item PINECO, 3
	card_item FORRETRESS, 2
	card_item MAGMAR, 3
	card_item CYNDAQUIL1, 2
	card_item CYNDAQUIL2, 2
	card_item QUILAVA2, 3
	card_item TYPHLOSION2, 2
	card_item AIPOM, 2
	card_item PROFESSOR_ELM, 2
	card_item MAIL_FROM_BILL, 4
	card_item ENERGY_REMOVAL2, 2				 
	card_item POKEMON_REVERSAL, 3				 
	card_item STRENGTH_CHARM, 3
	deck_list_end
	tx InvincibleRonaldDeckName

LegendaryRonaldDeck: ; The final deck used against you by Rival Ronald.
	deck_list_start
	card_item PSYCHIC_ENERGY, 12
	card_item FIGHTING_ENERGY, 7
	card_item SHADOW_LUGIA, 4
	card_item PHANPY2, 2
	card_item DONPHAN1, 2
	card_item MURKROW, 2
	card_item MEWTWO, 1
	card_item HITMONLEE, 2
	card_item EEVEE, 3
	card_item UMBREON, 2
	card_item PROFESSOR_ELM, 3				  
	card_item MAIL_FROM_BILL, 4
	card_item ENERGY_SEARCH, 4
	card_item SWITCH, 2
	card_item POKEGEAR, 2
	card_item MASTER_BALL, 3
	card_item POTION, 2
	card_item STRENGTH_CHARM, 3
	deck_list_end
	tx LegendaryRonaldDeckName

MusclesforBrainsDeck: ; Used by Fighting Club member Chris.
	deck_list_start
	card_item FIGHTING_ENERGY, 22
	card_item DOUBLE_COLORLESS_ENERGY, 2
	card_item TYROGUE, 1
	card_item MACHOP, 3
	card_item MACHOKE, 3
	card_item MACHAMP, 2
	card_item GLIGAR, 4
	card_item DUNSPARCE, 3
	card_item SNUBBULL, 4
	card_item GRANBULL, 3
	card_item PROFESSOR_ELM, 1
	card_item MAIL_FROM_BILL, 3
	card_item STRENGTH_CHARM, 3
	card_item POKEMON_REVERSAL, 2
	card_item POTION, 1
	card_item HYPER_POTION, 1  
	card_item FULL_HEAL, 2					  
	deck_list_end
	tx MusclesforBrainsDeckName

HeatedBattleDeck: ; = War and Peace. Used by Fighting Club member Michael.
	deck_list_start
	card_item FIGHTING_ENERGY, 21
	card_item DOUBLE_COLORLESS_ENERGY, 4
	card_item POLIWAG, 2
	card_item POLIWHIRL, 2
	card_item POLIWRATH, 1
	card_item GLIGAR, 3
	card_item PHANPY1, 3
	card_item DONPHAN2, 3
	card_item TYROGUE, 3
	card_item TOGEPI1, 3
	card_item TOGETIC2, 2
	card_item HYPER_POTION, 2
	card_item STRENGTH_CHARM, 3
	card_item CRYSTAL_SHARD, 2
	card_item POTION, 4
	card_item FULL_HEAL, 2
	deck_list_end
	tx HeatedBattleDeckName

LovetoBattleDeck: ; Used by Fighting Club member Jessica.
	deck_list_start
	card_item FIGHTING_ENERGY, 20
	card_item TYROGUE, 3
	card_item PHANPY1, 4
	card_item HITMONLEE, 3
	card_item HITMONCHAN, 2
	card_item SNUBBULL, 3
	card_item GRANBULL, 2
	card_item AIPOM, 2
	card_item IGGLYBUFF, 1
	card_item JIGGLYPUFF, 1
	card_item PROFESSOR_ELM, 2
	card_item MAIL_FROM_BILL, 4
	card_item STRENGTH_CHARM, 4
	card_item CRYSTAL_SHARD, 4
	card_item POTION, 3
	card_item FULL_HEAL, 2
	deck_list_end
	tx LovetoBattleDeckName

ExcavationDeck: 		; Used by Rock Club member Ryan.
	deck_list_start
	card_item FIGHTING_ENERGY, 12
	card_item WATER_ENERGY, 11
	card_item OMANYTE, 4
	card_item OMASTAR, 3
	card_item KABUTO, 4
	card_item KABUTOPS, 2
	card_item GLIGAR, 2
	card_item RHYHORN, 3
	card_item AERODACTYL, 2
	card_item PHANPY2, 4
	card_item DONPHAN1, 1
	card_item PROFESSOR_ELM, 2
	card_item MAIL_FROM_BILL, 2
	card_item RUIN_WALL, 2
	card_item ENERGY_SEARCH, 2
	card_item FOSSIL_EGG, 4
	deck_list_end
	tx ExcavationDeckName

BlisteringPokemonDeck: 		; Used by Rock Club member Andrew.
	deck_list_start
	card_item LIGHTNING_ENERGY, 6
	card_item FIGHTING_ENERGY, 11				 
	card_item DOUBLE_COLORLESS_ENERGY, 2
	card_item VOLTORB, 2
	card_item SUDOWOODO, 4
	card_item ONIX, 4
	card_item STEELIX_S, 3
	card_item PHANPY1, 2
	card_item LARVITAR, 3
	card_item SENTRET, 3
	card_item FURRET, 2
	card_item PROFESSOR_ELM, 2
	card_item MAIL_FROM_BILL, 3
	card_item ENERGY_ARK, 3
	card_item FOREST_GUARDIAN, 2
	card_item SWITCH, 3
	card_item CRYSTAL_SHARD, 3
	card_item POKEMON_REVERSAL, 2
	deck_list_end
	tx BlisteringPokemonDeckName

HardPokemonDeck: 		; Used by Rock Club member Matthew.
	deck_list_start
	card_item FIGHTING_ENERGY, 22
	card_item RHYHORN, 4
	card_item RHYDON, 3
	card_item ONIX, 2
	card_item CORSOLA, 3
	card_item SUDOWOODO, 4
	card_item LARVITAR, 3
	card_item PUPITAR, 2
	card_item PROFESSOR_ELM, 3
	card_item MAIL_FROM_BILL, 3
	card_item POKE_BALL, 2
	card_item CRYSTAL_SHARD, 4		  
	card_item POKEMON_REVERSAL, 3
	card_item POTION, 2
	deck_list_end
	tx HardPokemonDeckName

WaterfrontPokemonDeck: 		; = Deep-Sea Diving, used by Water Club member Sara.
	deck_list_start
	card_item WATER_ENERGY, 15
	card_item LIGHTNING_ENERGY, 5
	card_item CHINCHOU2, 3
	card_item LANTURN1, 2
	card_item REMORAID, 3			   
	card_item OCTILLERY, 2			   
	card_item HORSEA, 4			   
	card_item SEADRA, 3			   
	card_item KINGDRA, 3
	card_item MANTINE, 2
	card_item SWITCH, 2
	card_item NEW_POKEDEX, 2
	card_item ENERGY_SEARCH, 3
	card_item PROFESSOR_ELM, 2			   
	card_item MAIL_FROM_BILL, 4		   
	card_item POKEMON_REVERSAL, 3			   
	card_item POTION, 2
	deck_list_end
	tx WaterfrontPokemonDeckName

LonelyFriendsDeck: 		; Switcheroo Deck, Used by Water Club Member Amanda.
	deck_list_start
	card_item GRASS_ENERGY, 5
	card_item WATER_ENERGY, 12
	card_item DOUBLE_COLORLESS_ENERGY, 4
	card_item SCYTHER, 4
	card_item SQUIRTLE, 4
	card_item WARTORTLE, 4
	card_item MARILL1, 3
	card_item AZUMARILL2, 2
	card_item SNEASEL, 3
	card_item PROFESSOR_ELM, 2				 
	card_item MAIL_FROM_BILL, 2
	card_item POKE_DOLL, 4
	card_item HORSEA, 4
	card_item SWITCH, 2
	card_item POTION, 4
	card_item HYPER_POTION, 1
	deck_list_end
	tx LonelyFriendsDeckName

SoundoftheWavesDeck: 			; Used by Water Club Member Joshua.
	deck_list_start
	card_item WATER_ENERGY, 20
	card_item TOTODILE2, 2
	card_item CROCONAW1, 1
	card_item MARILL1, 3
	card_item AZUMARILL1, 2
	card_item SQUIRTLE, 4
	card_item WARTORTLE, 2
	card_item BLASTOISE, 2
	card_item MANTINE, 3
	card_item JIGGLYPUFF, 3
	card_item TOGEPI1, 2
	card_item PROFESSOR_ELM, 4
	card_item MAIL_FROM_BILL, 3
	card_item ENERGY_REMOVAL2, 3
	card_item STRENGTH_CHARM, 3
	card_item FULL_HEAL, 3
	deck_list_end
	tx SoundoftheWavesDeckName

PikachuDeck: 			; = Pikachu (?) deck. Used by Lightning Club member Jennifer.
	deck_list_start
	card_item WATER_ENERGY, 7
	card_item LIGHTNING_ENERGY, 16
	card_item PICHU, 3
	card_item PIKACHU, 2
	card_item PIKACHU2, 2
	card_item RAICHU, 1
	card_item RAICHU2, 1
	card_item RAICHU_S, 1					  
	card_item MARILL1, 4
	card_item AZUMARILL2, 3
	card_item PROFESSOR_ELM, 3
	card_item MAIL_FROM_BILL, 4					  
	card_item SWITCH, 4
	card_item POKE_BALL, 4					  
	card_item POTION, 2
	card_item HYPER_POTION, 2
	card_item FULL_HEAL, 1
	deck_list_end
	tx PikachuDeckName

BoomBoomSelfdestructDeck: 			; = Bench Storm. Used by Lightning club member Nicholas.
	deck_list_start
	card_item LIGHTNING_ENERGY, 18
	card_item MAGNEMITE, 4
	card_item MAGNETON, 3
	card_item DELIBIRD, 2
	card_item CHINCHOU1, 4
	card_item LANTURN2, 3
	card_item RAIKOU, 4
	card_item ZAPDOS, 3
	card_item PROFESSOR_ELM, 2
	card_item POTION, 2
	card_item FULL_HEAL, 3
	card_item MAIL_FROM_BILL, 4
	card_item POKEMON_REVERSAL, 2
	card_item PROFESSOR_ELM, 2
	card_item CRYSTAL_SHARD, 4
	deck_list_end
	tx BoomBoomSelfdestructDeckName

PowerGeneratorDeck: 			; Dragon Ball Deck, Used by Lightning club member Brandon.
	deck_list_start
	card_item LIGHTNING_ENERGY, 15
	card_item DOUBLE_COLORLESS_ENERGY, 4
	card_item DRATINI, 3
	card_item DRAGONAIR, 3
	card_item DRAGONITE, 2
	card_item VOLTORB, 4
	card_item ELECTRODE, 3
	card_item ELEKID, 2
	card_item POKE_BALL, 4
	card_item JOLTEON, 2
	card_item EEVEE, 4
	card_item PROFESSOR_ELM, 2
	card_item NEW_POKEDEX, 3		   
	card_item MAIL_FROM_BILL, 3			   
	card_item SWITCH, 2
	card_item STRENGTH_CHARM, 4
	deck_list_end
	tx PowerGeneratorDeckName

EtceteraDeck: 				; = Ancient Jungle, used by Grass Club member Brittany.
	deck_list_start
	card_item GRASS_ENERGY, 7
	card_item FIGHTING_ENERGY, 9
	card_item DOUBLE_COLORLESS_ENERGY, 4
	card_item KABUTO, 3
	card_item AERODACTYL, 1
	card_item KABUTOPS_S, 3
	card_item HERACROSS, 1
	card_item GLIGAR, 2
	card_item YANMA, 2
	card_item SUDOWOODO, 2
	card_item SWITCH, 1
	card_item ENERGY_REMOVAL2, 3
	card_item FOSSIL_EGG, 4
	card_item PROFESSOR_ELM, 4		  
	card_item MAIL_FROM_BILL, 4			  
	card_item POKE_BALL, 3
	card_item STRENGTH_CHARM, 3			  
	card_item CRYSTAL_SHARD, 4
	deck_list_end
	tx EtceteraDeckName

FlowerGardenDeck: 			; = Overgrowth, used by Grass Club member Kristin.
	deck_list_start
	card_item GRASS_ENERGY, 18
	card_item SUNKERN, 4
	card_item SUNFLORA, 3
	card_item CHIKORITA1, 4
	card_item BAYLEEF2, 3
	card_item MEGANIUM1, 3
	card_item BULBASAUR, 3
	card_item IVYSAUR, 2
	card_item VENUSAUR, 2
	card_item HOPPIP, 2
	card_item PROFESSOR_ELM, 2
	card_item MAIL_FROM_BILL, 3
	card_item STAR_PIECE, 2
	card_item POKE_BALL, 4					  
	card_item SWITCH, 2
	card_item POTION, 2
	card_item FULL_HEAL, 1
	deck_list_end
	tx FlowerGardenDeckName

KaleidoscopeDeck: 			; Used by Grass Club member Heather.
	deck_list_start
	card_item GRASS_ENERGY, 10
	card_item PSYCHIC_ENERGY, 12					  
	card_item CHIKORITA2, 4
	card_item BAYLEEF1, 3
	card_item MEGANIUM2, 2
	card_item ESPEON1, 2
	card_item EEVEE, 4
	card_item ESPEON2, 2
	card_item SMOOCHUM, 2
	card_item CELEBI_S, 1					  
	card_item SLOWPOKE, 2
	card_item SLOWBRO, 2
	card_item SEER, 4
	card_item MAIL_FROM_BILL, 4
	card_item PROFESSOR_ELM, 2					  
	card_item SWITCH, 4
	deck_list_end
	tx KaleidoscopeDeckName

GhostDeck: 				; = Phobia, used by Psychic Club member Robert.
	deck_list_start							  
	card_item PSYCHIC_ENERGY, 15				  
	card_item DOUBLE_COLORLESS_ENERGY, 4
	card_item GASTLY, 4
	card_item HAUNTER, 3
	card_item GENGAR, 3
	card_item MURKROW, 2
	card_item MISDREAVUS, 4
	card_item TEDDIURSA, 3
	card_item URSARING, 2
	card_item EEVEE, 3
	card_item UMBREON, 2
	card_item PROFESSOR_ELM, 2
	card_item MAIL_FROM_BILL, 4
	card_item POKEMON_REVERSAL, 4					  
	card_item TEAM_ROCKETS_EVIL_DEEDS, 2
	card_item FULL_HEAL, 3				
	deck_list_end
	tx GhostDeckName

NapTimeDeck: 				; = Sweet Nightmares, used by Psychic Club member Daniel.
	deck_list_start							  
	card_item PSYCHIC_ENERGY, 14				  
	card_item GRASS_ENERGY, 6
	card_item GASTLY, 4
	card_item HAUNTER, 3
	card_item GENGAR, 3
	card_item MISDREAVUS, 4
	card_item HOOTHOOT, 3
	card_item NOCTOWL, 1
	card_item BULBASAUR, 2
	card_item CHIKORITA2, 2
	card_item PROFESSOR_ELM, 2
	card_item MAIL_FROM_BILL, 4
	card_item TEAM_ROCKETS_EVIL_DEEDS, 2
	card_item ENERGY_REMOVAL2, 4
	card_item POKEMON_REVERSAL, 1					  
	card_item POTION, 2
	card_item FULL_HEAL, 3				
	deck_list_end
	tx NapTimeDeckName

StrangePowerDeck: 			; = Sun and Moon. Used by Psychic Club member Stephanie.
	deck_list_start
	card_item PSYCHIC_ENERGY, 19
	card_item DOUBLE_COLORLESS_ENERGY, 4
	card_item EEVEE, 4
	card_item ESPEON1, 1
	card_item ESPEON2, 1
	card_item UMBREON, 2
	card_item NATU, 4
	card_item XATU, 3
	card_item CLEFFA, 2
	card_item TEDDIURSA, 3
	card_item URSARING, 2
	card_item HOOTHOOT, 2
	card_item NOCTOWL, 1
	card_item POKEMON_FAN_CLUB, 4
	card_item ENERGY_ARK, 2
	card_item STRENGTH_CHARM, 2
	card_item RUIN_WALL, 1
	card_item POKEMON_REVERSAL, 2
	card_item FULL_HEAL, 1
	deck_list_end
	tx StrangePowerDeckName

FlyinPokemonDeck: 			; = Aerodynamics. Used by Science club member Joseph.
	deck_list_start
	card_item GRASS_ENERGY, 13
	card_item WATER_ENERGY, 4
	card_item DOUBLE_COLORLESS_ENERGY, 4
	card_item HOPPIP, 3
	card_item SKIPLOOM, 3
	card_item JUMPLUFF, 2
	card_item TOGEPI1, 3
	card_item TOGETIC2, 2
	card_item YANMA, 1
	card_item MANTINE, 2
	card_item ARTICUNO, 2
	card_item HOOTHOOT, 4
	card_item NOCTOWL, 3
	card_item PROFESSOR_ELM, 2
	card_item TEAM_ROCKETS_EVIL_DEEDS, 3
	card_item MAIL_FROM_BILL, 3
	card_item POTION, 4
	card_item FULL_HEAL, 2
	deck_list_end
	tx FlyinPokemonDeckName

LovelyNidoranDeck: 			; = Entomology. Used by Science Club member David.
	deck_list_start
	card_item GRASS_ENERGY, 18
	card_item SCYTHER, 4
	card_item SCIZOR, 2
	card_item LEDYBA, 2
	card_item LEDIAN, 2
	card_item PINECO, 3
	card_item FORRETRESS, 2
	card_item YANMA, 1
	card_item SPINARAK, 2
	card_item ARIADOS, 1
	card_item HERACROSS, 4
	card_item DUNSPARCE, 2
	card_item PROFESSOR_ELM, 3
	card_item MAIL_FROM_BILL, 3
	card_item BILLS_MAINTENANCE, 4
	card_item SEER, 2
	card_item SWITCH, 2
	card_item POKE_BALL, 2
	card_item ARCADE_GAME, 1
	deck_list_end
	tx LovelyNidoranDeckName

PoisonDeck: 				; = Toxicology. Used by Science Club member Erik.
	deck_list_start
	card_item GRASS_ENERGY, 20
	card_item BULBASAUR, 4
	card_item IVYSAUR, 2
	card_item ZUBAT, 4
	card_item GOLBAT, 3
	card_item CROBAT, 2
	card_item ODDISH, 3
	card_item GLOOM, 4
	card_item VILEPLUME, 3
	card_item ENERGY_REMOVAL2, 2
	card_item PROFESSOR_ELM, 3
	card_item TEAM_ROCKETS_EVIL_DEEDS, 2					 
	card_item STAR_PIECE, 2
	card_item POTION, 2
	card_item FULL_HEAL, 2
	card_item ARCADE_GAME, 2
	deck_list_end
	tx PoisonDeckName

AngerDeck: 				; Used by Fire Club Member John.
	deck_list_start
	card_item FIRE_ENERGY, 14
	card_item WATER_ENERGY, 8
	card_item MAGIKARP_S, 4
	card_item GYARADOS_S, 3
	card_item TOTODILE1, 2
	card_item SNUBBULL, 4
	card_item GRANBULL, 3
	card_item ENTEI1, 2
	card_item MAGBY, 3
	card_item PROFESSOR_ELM, 2
	card_item MAIL_FROM_BILL, 3
	card_item ENERGY_ARK, 2					  
	card_item SWITCH, 2
	card_item STRENGTH_CHARM, 4					  
	card_item CRYSTAL_SHARD, 2
	card_item POKEMON_REVERSAL, 2
	deck_list_end
	tx AngerDeckName

FlamethrowerDeck: 		; = Destruction, used by Fire Club member Adam.
	deck_list_start
	card_item FIRE_ENERGY, 13
	card_item FIGHTING_ENERGY, 8
	card_item SLUGMA, 2
	card_item MAGCARGO, 1
	card_item LARVITAR, 4
	card_item PUPITAR, 3
	card_item TYRANITAR_S, 3
	card_item PHANPY2, 4
	card_item DONPHAN2, 2
	card_item CYNDAQUIL1, 3
	card_item QUILAVA2, 2
	card_item MAIL_FROM_BILL, 4					  
	card_item ENERGY_ARK, 3					  
	card_item SUPER_ENERGY_RETRIEVAL, 1
	card_item SWITCH, 2
	card_item STRENGTH_CHARM, 1
	card_item POKEMON_REVERSAL, 4
	deck_list_end
	tx FlamethrowerDeckName

ReshuffleDeck: 			; = Plasma. Used by Fire Club member Jonathan.
	deck_list_start
	card_item FIRE_ENERGY, 15
	card_item LIGHTNING_ENERGY, 7
	card_item GROWLITHE, 4
	card_item ARCANINE, 3
	card_item MAGMAR, 3
	card_item MAGBY, 1
	card_item PIKACHU, 4
	card_item RAICHU2, 3
	card_item ZAPDOS, 2
	card_item ELEKID, 1
	card_item PICHU, 1
	card_item VOLTORB, 2
	card_item ELECTRODE, 1
	card_item PROFESSOR_ELM, 2
	card_item MAIL_FROM_BILL, 3
	card_item ENERGY_ARK, 2				  
	card_item ENERGY_REMOVAL2, 1
	card_item ARCADE_GAME, 1
	card_item SWITCH, 2
	card_item POKEMON_NURSE, 1
	card_item POTION, 1
	deck_list_end
	tx ReshuffleDeckName

ImakuniDeck: 			; Used by Strange Life Form Imakuni.
	deck_list_start
	card_item FIGHTING_ENERGY, 10
	card_item WATER_ENERGY, 16
	card_item JIGGLYPUFF, 3
	card_item WIGGLYTUFF, 2
	card_item DUNSPARCE, 2
	card_item SUDOWOODO, 3
	card_item WOOPER, 4
	card_item QUAGSIRE, 3
	card_item CORSOLA, 3
	card_item DELIBIRD, 3
	card_item SNORLAX, 2
	card_item BILLS_MAINTENANCE, 3		 
	card_item PROFESSOR_ELM, 2
	card_item ARCADE_GAME, 4
	deck_list_end
	tx ImakuniDeckName
