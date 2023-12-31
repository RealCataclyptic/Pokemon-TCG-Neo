DeckPointers: ; 30000 (c:4000)
	dw UnnamedDeck
	dw UnnamedDeck2
	dw SamsPracticeDeck
	dw PracticePlayerDeck
	dw SamsPracticeDeck
	dw CharmanderAndFriendsDeck ; 'Cyndaquil Starter Deck'
	dw CharmanderExtraDeck ; ^^ Extra
	dw SquirtleAndFriendsDeck ; 'Totodile Starter Deck'
	dw SquirtleExtraDeck ; ^^ Extra
	dw BulbasaurAndFriendsDeck ; 'Chikorita Starter Deck'
	dw BulbasaurExtraDeck ; ^^ Extra
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
	dw FireChargeDeck ; 'Overheat'.
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
	dw WaterfrontPokemonDeck
	dw LonelyFriendsDeck
	dw SoundoftheWavesDeck
	dw PikachuDeck ; 'Pikachu (?)'
	dw BoomBoomSelfdestructDeck ; 'Bench Storm'
	dw PowerGeneratorDeck
	dw EtceteraDeck
	dw FlowerGardenDeck
	dw KaleidoscopeDeck
	dw GhostDeck
	dw NapTimeDeck
	dw StrangePowerDeck ; 'Sun and Moon'
	dw FlyinPokemonDeck ; 'Aerodynamics'
	dw LovelyNidoranDeck ; 'Entomology'
	dw PoisonDeck ; 'Toxicology'
	dw AngerDeck
	dw FlamethrowerDeck ; 'Burn it Down!'.
	dw ReshuffleDeck ; 'Plasma'.
	dw ImakuniDeck
	dw NULL

UnnamedDeck: ; 30070 (c:4070)
	db 20, PSYCHIC_ENERGY
	db 4, SLOWKING
	db 4, TOGETIC2
	db 4, HOOTHOOT
	db 2, JIGGLYPUFF
	db 2, CLEFABLE
	db 4, CLEFAIRY
	db 2, SHADOW_LUGIA
	db 2, ARCADE_GAME
	db 2, PROFESSOR_ELM
	db 2, ENERGY_REMOVAL2
	db 2, ENERGY_ARK
	db 2, ENERGY_SEARCH
	db 2, STAR_PIECE
	db 2, TEAM_ROCKETS_EVIL_DEEDS
	db 1, SUPER_SCOOP_UP
	db 1, HYPER_DEVOLUTION_SPRAY
	db 1, POTION
	db 1, HYPER_POTION
	db 0 ; end

; 30097 (c:4097)
	db 8, LIGHTNING_ENERGY
	db 8, GRASS_ENERGY
	db 4, PHANPY1
	db 4, RAIKOU
	db 4, GLIGAR
	db 4, SHUCKLE
	db 4, AERODACTYL
	db 4, BLISSEY
	db 4, SLUGMA
	db 4, CHIKORITA2
	db 4, CHIKORITA1
	db 4, BAYLEEF1
	db 4, STAR_PIECE
	db 0 ; end

; 300b2 (c:40b2)
	db 24, FIRE_ENERGY
	db 4, JIGGLYPUFF
	db 4, HOUNDOUR2
	db 4, CLEFAIRY
	db 4, WOBBUFFET
	db 4, BLISSEY
	db 4, CHANSEY
	db 2, ENERGY_SEARCH
	db 2, ARCADE_GAME
	db 2, RUIN_WALL
	db 2, TEAM_ROCKETS_EVIL_DEEDS
	db 2, STAR_PIECE
	db 2, SUPER_SCOOP_UP
	db 1, POTION
	db 1, HYPER_POTION
	db 4, STAR_PIECE
	db 0 ; end

; 300d3 (c:40d3)
	db 4, PSYCHIC_ENERGY
	db 4, FIGHTING_ENERGY
	db 4, LEDIAN
	db 4, GASTLY
	db 4, GENGAR
	db 4, CHARIZARD_C
	db 4, LUGIA_C
	db 4, HOOH_C
	db 4, TEDDIURSA
	db 4, BLISSEY
	db 4, CLEFAIRY
	db 4, CLEFABLE
	db 4, JIGGLYPUFF
	db 4, DUNSPARCE
	db 4, STAR_PIECE
	db 0 ; end

; 300f2 (c:40f2)
	db 10, PSYCHIC_ENERGY
	db 12, LIGHTNING_ENERGY
	db 2, UNOWN_J
	db 2, WOBBUFFET
	db 2, SMOOCHUM
	db 1, GIRAFARIG
	db 2, JYNX
	db 2, STEELIX
	db 2, ONIX
	db 2, PIKACHU
	db 2, RAICHU
	db 1, AMPHAROS2
	db 2, ELEKID
	db 2, PHANPY1
	db 2, FLAAFFY1
	db 4, CHARIZARD_C
	db 3, LUGIA_C
	db 2, HOOH_C
	db 1, PROFESSOR_ELM
	db 2, STAR_PIECE
	db 2, MAIL_FROM_BILL
	db 0 ; end

; 3011d (c:411d)
	db 10, PSYCHIC_ENERGY
	db 10, LIGHTNING_ENERGY
	db 4, HITMONLEE
	db 4, SLOWKING
	db 4, UNOWN_A
	db 4, MURKROW
	db 4, SLOWPOKE
	db 4, SLOWBRO
	db 4, WOBBUFFET
	db 4, GIRAFARIG
	db 4, JYNX
	db 4, STAR_PIECE
	db 0 ; end

; 30136 (c:4136)
	db 24, FIRE_ENERGY
	db 4, JIGGLYPUFF
	db 4, HOUNDOUR2
	db 4, CLEFAIRY
	db 4, WOBBUFFET
	db 4, GIRAFARIG
	db 4, WIGGLYTUFF
	db 4, TOGEPI1
	db 4, STAR_PIECE
	db 2, SUPER_SCOOP_UP
	db 1, POTION
	db 1, HYPER_POTION
	db 0 ; end

; 3014f (c:414f)
	db 20, PSYCHIC_ENERGY
	db 4, SLOWKING
	db 4, UNOWN_A
	db 4, TOGETIC2
	db 4, TOGEPI2
	db 4, LUGIA
	db 4, WOBBUFFET
	db 4, GIRAFARIG
	db 4, JYNX
	db 4, CLEFFA
	db 4, STAR_PIECE
	db 0 ; end

; 30166 (c:4166)
	db 24, PSYCHIC_ENERGY
	db 4, SLOWKING
	db 4, UNOWN_A
	db 4, TOGETIC2
	db 4, CLEFFA
	db 4, CELEBI
	db 4, TOGEPI2
	db 4, LUGIA
	db 4, SCYTHER
	db 4, SCIZOR
	db 0 ; end

; 3017b (c:417b)
	db 24, PSYCHIC_ENERGY
	db 4, SLOWKING
	db 4, TOGETIC2
	db 4, CLEFFA
	db 4, CELEBI
	db 4, MEWTWO_S
	db 4, WIGGLYTUFF
	db 4, LUGIA
	db 4, STAR_PIECE
	db 2, SUPER_SCOOP_UP
	db 1, POTION
	db 1, HYPER_POTION
	db 0 ; end

; 30194 (c:4194)
	db 24, PSYCHIC_ENERGY
	db 4, PUPITAR
	db 4, LARVITAR
	db 4, HITMONTOP
	db 4, WOBBUFFET
	db 4, GIRAFARIG
	db 4, WIGGLYTUFF
	db 4, STAR_PIECE
	db 2, CRYSTAL_SHARD
	db 2, POKEMON_REVERSAL
	db 2, SUPER_SCOOP_UP
	db 1, POTION
	db 1, HYPER_POTION
	db 0 ; end

; 301af (c:41af)
	db 12, LIGHTNING_ENERGY
	db 4, GLIGAR
	db 4, ONIX
	db 4, ELECTABUZZ
	db 4, BLISSEY
	db 4, PILOSWINE
	db 4, SWINUB
	db 4, FLAAFFY1
	db 4, MAREEP1
	db 4, MAREEP2
	db 4, PIKACHU
	db 4, RAICHU
	db 4, AMPHAROS2
	db 0 ; end

; 301ca (c:41ca)
	db 24, FIGHTING_ENERGY
	db 4, MEW
	db 4, DONPHAN2
	db 4, HITMONTOP
	db 4, URSARING
	db 4, WIGGLYTUFF
	db 4, PORYGON
	db 2, NEW_POKEDEX
	db 2, STRENGTH_CHARM
	db 2, CRYSTAL_SHARD
	db 2, POKEMON_REVERSAL
	db 2, SUPER_SCOOP_UP
	db 1, POTION
	db 1, HYPER_POTION
	db 0 ; end

UnnamedDeck2: ; 301e7 (c:41e7)
	db 4, FIRE_ENERGY
	db 20, GRASS_ENERGY
	db 2, MILTANK
	db 4, SUNKERN
	db 2, SUNFLORA
	db 2, YANMA
	db 4, CHIKORITA1
	db 3, BAYLEEF1
	db 4, HOUNDOUR2
	db 3, HOUNDOOM
	db 2, ENTEI1
	db 2, STAR_PIECE
	db 2, SMEARGLE
	db 2, ENERGY_ARK
	db 2, PROFESSOR_ELM
	db 2, POKEMON_REVERSAL
	db 2, DOUBLE_COLORLESS_ENERGY
	db 0 ; end

; 3020a (c:420a)
	db 4, FIRE_ENERGY
	db 20, GRASS_ENERGY
	db 4, MILTANK
	db 4, CHIKORITA1
	db 3, BAYLEEF1
	db 2, BAYLEEF2
	db 4, HOUNDOUR2
	db 3, HOUNDOOM
	db 2, ENTEI1
	db 3, STAR_PIECE
	db 3, POKEMON_FAN_CLUB
	db 2, ENERGY_ARK
	db 2, PROFESSOR_ELM
	db 2, POKEMON_REVERSAL
	db 2, DOUBLE_COLORLESS_ENERGY
	db 0 ; end

; 30229 (c:4229)
	db 4, PSYCHIC_ENERGY
	db 4, FIGHTING_ENERGY
	db 4, NOCTOWL
	db 4, GASTLY
	db 4, GENGAR
	db 4, CHARIZARD_C
	db 4, LUGIA_C
	db 4, HOOH_C
	db 4, TEDDIURSA
	db 4, BLISSEY
	db 4, CLEFAIRY
	db 4, CLEFABLE
	db 4, IGGLYBUFF
	db 4, DUNSPARCE
	db 4, STAR_PIECE
	db 0 ; end

; 30248 (c:4248)
	db 24, GRASS_ENERGY
	db 4, TOGETIC2
	db 4, AIPOM
	db 4, MEGANIUM1
	db 4, FOSSIL_EGG
	db 4, MAGCARGO
	db 4, PINECO
	db 4, SNUBBULL
	db 4, LEDIAN
	db 4, UMBREON
	db 0 ; end

; 3025d (c:425d)
	db 8, LIGHTNING_ENERGY
	db 8, GRASS_ENERGY
	db 4, PHANPY1
	db 4, RAIKOU
	db 4, SUDOWOODO
	db 4, SHUCKLE
	db 4, AERODACTYL
	db 4, BLISSEY
	db 4, SLUGMA
	db 4, CHIKORITA2
	db 4, CHIKORITA1
	db 4, BAYLEEF1
	db 4, STAR_PIECE
	db 0 ; end

; 30278 (c:4278)
	db 24, FIRE_ENERGY
	db 4, KABUTO
	db 4, GROWLITHE
	db 4, TOTODILE1
	db 4, BLISSEY
	db 4, HOUNDOUR2
	db 4, ENTEI2
	db 4, PICHU
	db 4, JOLTEON
	db 4, STAR_PIECE
	db 0 ; end

; 3028d (c:428d)
	db 20, GRASS_ENERGY
	db 4, MEGANIUM1
	db 4, FOSSIL_EGG
	db 4, STAR_PIECE
	db 4, FERALIGATR1
	db 4, SNUBBULL
	db 4, LEDIAN
	db 4, UMBREON
	db 4, CHIKORITA1
	db 4, BAYLEEF1
	db 4, BAYLEEF2
	db 0 ; end

; 302a4 (c:42a4)
	db 24, GRASS_ENERGY
	db 4, STRENGTH_CHARM
	db 4, MAIL_FROM_BILL
	db 4, POKEMON_NURSE
	db 4, MEGANIUM1
	db 4, VILEPLUME
	db 4, MAGCARGO
	db 4, PINECO
	db 4, SNUBBULL
	db 4, LEDIAN
	db 0 ; end

; 302b9 (c:42b9)
	db 24, WATER_ENERGY
	db 4, CROCONAW2
	db 4, TOTODILE2
	db 4, REMORAID
	db 4, FERALIGATR1
	db 4, MARILL1
	db 4, FOSSIL_EGG
	db 4, AZUMARILL2
	db 4, UMBREON
	db 4, STAR_PIECE
	db 0 ; end

; 302ce (c:42ce)
	db 24, WATER_ENERGY
	db 4, CROCONAW2
	db 4, CROCONAW1
	db 4, TOTODILE2
	db 4, FERALIGATR1
	db 4, FERALIGATR2
	db 4, MARILL1
	db 4, FOSSIL_EGG
	db 4, UMBREON
	db 4, POTION
	db 0 ; end

; 302e3 (c:42e3)
	db 24, GRASS_ENERGY
	db 4, HOUNDOUR1
	db 4, SKIPLOOM
	db 4, JUMPLUFF
	db 4, PORYGON
	db 4, PORYGON_2
	db 4, SNUBBULL
	db 4, POKEMON_NURSE
	db 3, STRENGTH_CHARM
	db 2, PROFESSOR_ELM
	db 3, MAIL_FROM_BILL
	db 0 ; end

; 302fa (c:42fa)
	db 12, LIGHTNING_ENERGY
	db 4, GLIGAR
	db 4, ONIX
	db 4, ELECTABUZZ
	db 4, BLISSEY
	db 4, PILOSWINE
	db 4, SWINUB
	db 4, FLAAFFY1
	db 4, MAREEP1
	db 4, MAREEP2
	db 4, PIKACHU
	db 4, RAICHU
	db 4, AMPHAROS2
	db 0 ; end

; 30315 (c:4315)
	db 4, ELEKID
	db 4, RAICHU_S
	db 4, POLIWRATH
	db 24, WATER_ENERGY
	db 4, HORSEA
	db 4, LANTURN1
	db 4, CHINCHOU2
	db 4, CROCONAW1
	db 4, CROCONAW2
	db 4, MAGIKARP_S
	db 4, SNEASEL
	db 4, QWILFISH
	db 4, SUICUNE
	db 0 ; end

; 30330 (c:4330)
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

PracticePlayerDeck: ; 30344 (c:4344)
	db 2, WATER_ENERGY
	db 1, PSYCHIC_ENERGY
	db 1, HORSEA
	db 1, SEADRA
	db 1, FULL_HEAL
	db 1, MANTINE
	db 5, WATER_ENERGY
	db 1, CELEBI
	db 1, POTION
	db 1, HORSEA
	db 1, KINGDRA
	db 1, WATER_ENERGY
	db 1, MAIL_FROM_BILL
	db 1, PSYCHIC_ENERGY
	db 1, DRATINI
	db 1, TOTODILE2
	db 1, WATER_ENERGY
	db 1, TOTODILE2
	db 1, WATER_ENERGY
	db 1, PSYCHIC_ENERGY
	db 1, CROCONAW1
	db 1, MAIL_FROM_BILL
	db 1, WATER_ENERGY
	db 1, CROCONAW2
	db 1, WATER_ENERGY
	db 1, PSYCHIC_ENERGY
	db 1, WATER_ENERGY
	db 1, PSYCHIC_ENERGY
	db 1, WIGGLYTUFF
	db 1, MURKROW
	db 1, PSYCHIC_ENERGY
	db 1, MEWTWO_S
	db 1, WATER_ENERGY
	db 1, PSYCHIC_ENERGY
	db 1, POLIWHIRL
	db 1, PSYCHIC_ENERGY
	db 1, SLOWPOKE
	db 1, POTION
	db 1, PSYCHIC_ENERGY
	db 1, CELEBI
	db 1, PSYCHIC_ENERGY
	db 1, WIGGLYTUFF
	db 1, MANTINE
	db 1, POLIWHIRL
	db 1, POLIWRATH
	db 1, MANTINE
	db 1, SEADRA
	db 1, GYARADOS_S
	db 1, MURKROW
	db 1, CELEBI
	db 1, MEWTWO_S
	db 1, WIGGLYTUFF
	db 1, TOGEPI1
	db 1, TOGEPI1
	db 1, SLOWBRO
	db 0 ; end
	tx PracticePlayerDeckName

SamsPracticeDeck: ; 303b5 (c:43b5)
	db 2, LIGHTNING_ENERGY
	db 2, FIRE_ENERGY
	db 1, HOUNDOUR2
	db 1, TOGEPI1
	db 1, PUPITAR
	db 2, FIGHTING_ENERGY
	db 1, PUPITAR
	db 1, WIGGLYTUFF
	db 2, FIGHTING_ENERGY
	db 1, HITMONTOP
	db 1, FIGHTING_ENERGY
	db 1, TOGEPI1
	db 1, LIGHTNING_ENERGY
	db 1, HITMONTOP
	db 1, MAIL_FROM_BILL
	db 1, FIGHTING_ENERGY
	db 1, DONPHAN2
	db 1, TYROGUE
	db 1, FIGHTING_ENERGY
	db 1, LARVITAR
	db 1, LIGHTNING_ENERGY
	db 1, LIGHTNING_ENERGY
	db 1, POKEMON_REVERSAL
	db 1, SWINUB
	db 1, LIGHTNING_ENERGY
	db 1, STEELIX
	db 1, FIGHTING_ENERGY
	db 1, MEW
	db 1, LIGHTNING_ENERGY
	db 1, PROFESSOR_ELM
	db 1, FIGHTING_ENERGY
	db 1, BLISSEY
	db 1, FIGHTING_ENERGY
	db 1, DOUBLE_COLORLESS_ENERGY
	db 1, PIKACHU
	db 1, LIGHTNING_ENERGY
	db 1, PIKACHU
	db 1, LIGHTNING_ENERGY
	db 1, POTION
	db 1, LIGHTNING_ENERGY
	db 1, RAICHU
	db 1, LIGHTNING_ENERGY
	db 1, AMPHAROS2
	db 1, ELEKID
	db 1, LIGHTNING_ENERGY
	db 1, SWINUB
	db 1, DONPHAN2
	db 1, HITMONTOP
	db 1, LARVITAR
	db 1, TYRANITAR_S
	db 1, NATU
	db 1, NATU
	db 1, XATU
	db 1, WIGGLYTUFF
	db 1, BLISSEY
	db 1, BLISSEY
	db 0 ; end
	tx SamsPracticeDeckName

CharmanderAndFriendsDeck: ; 30428 (c:4428) ; = Cyndaquil Starter Deck. Given to player at beginning.
	db 12, FIRE_ENERGY
	db 12, PSYCHIC_ENERGY
	db 2, CYNDAQUIL1
	db 2, CYNDAQUIL2
	db 2, QUILAVA2
	db 1, TYPHLOSION1
	db 2, SLUGMA
	db 1, HOUNDOUR1
	db 2, GROWLITHE
	db 1, FLAREON
	db 2, EEVEE
	db 2, NATU
	db 2, XATU
	db 1, MURKROW
	db 1, SLOWPOKE
	db 1, ESPEON1
	db 2, SENTRET
	db 1, PORYGON
	db 1, PROFESSOR_ELM
	db 2, MAIL_FROM_BILL
	db 1, SWITCH
	db 1, ENERGY_SEARCH
	db 1, POKEGEAR
	db 1, STRENGTH_CHARM
	db 2, POTION
	db 2, FULL_HEAL
	db 0 ; end
	tx CharmanderAndFriendsDeckName

CharmanderExtraDeck: ; 30465 (c:4465) ; = Cyndaquil extras. Given to player at beginning.
	db 4, GRASS_ENERGY
	db 4, WATER_ENERGY
	db 4, FIGHTING_ENERGY
	db 2, LEDYBA
	db 1, SPINARAK
	db 1, ZUBAT
	db 2, POLIWAG
	db 1, POLIWHIRL
	db 2, WOOPER
	db 1, QUAGSIRE
	db 2, CHINCHOU1
	db 1, PIKACHU
	db 1, MAREEP1
	db 30, GRASS_ENERGY ; irrelevant
	db 0 ; end
	tx CharmanderExtraDeckName

SquirtleAndFriendsDeck: ; 3048c (c:448c) ; = Totodile Starter Deck. Given to player at beginning.
	db 12, WATER_ENERGY
	db 12, LIGHTNING_ENERGY
	db 2, TOTODILE1
	db 2, TOTODILE2
	db 2, CROCONAW1
	db 1, FERALIGATR1
	db 1, MARILL1
	db 1, MARILL2
	db 1, WOOPER
	db 2, HORSEA
	db 1, QWILFISH
	db 1, JOLTEON
	db 2, EEVEE
	db 2, CHINCHOU1
	db 1, LANTURN1
	db 1, PICHU
	db 1, MAREEP2
	db 2, MAREEP1
	db 1, FLAAFFY2
	db 2, TEDDIURSA
	db 1, URSARING
	db 1, PROFESSOR_ELM
	db 1, MAIL_FROM_BILL
	db 1, SWITCH
	db 1, POKE_BALL
	db 1, SUPER_SCOOP_UP
	db 1, RUIN_WALL
	db 2, POTION
	db 1, FULL_HEAL
	db 0 ; end
	tx SquirtleAndFriendsDeckName

SquirtleExtraDeck: ; 304cf (c:44cf) ; = Totodile extras. Given to player at beginning.
	db 3, GRASS_ENERGY
	db 4, FIRE_ENERGY
	db 4, PSYCHIC_ENERGY
	db 2, GASTLY
	db 1, SLUGMA
	db 1, MAGBY
	db 1, MAGMAR
	db 1, PINECO
	db 1, ODDISH
	db 1, GLOOM
	db 2, ZUBAT
	db 1, SUNKERN
	db 1, UNOWN_A
	db 2, GIRAFARIG
	db 2, CLEFAIRY
	db 1, ENERGY_SEARCH
	db 1, MAIL_FROM_BILL
	db 1, NEW_POKEDEX
	db 30, GRASS_ENERGY ; irrelevant
	db 0 ; end
	tx SquirtleExtraDeckName

BulbasaurAndFriendsDeck: ; 304fa (c:44fa) ; = Chikorita Starter Deck. Given to player at beginning.
	db 12, GRASS_ENERGY
	db 12, FIGHTING_ENERGY
	db 2, CHIKORITA1
	db 2, CHIKORITA2
	db 2, BAYLEEF1
	db 1, MEGANIUM1
	db 2, HOPPIP
	db 2, SKIPLOOM
	db 1, SUNKERN
	db 1, SCYTHER
	db 1, SUDOWOODO
	db 1, ONIX
	db 2, PHANPY2
	db 1, DONPHAN2
	db 2, SWINUB
	db 1, TOGEPI1
	db 1, TOGEPI2
	db 1, AIPOM
	db 1, STANTLER
	db 2, JIGGLYPUFF
	db 1, SKARMORY
	db 1, PROFESSOR_ELM
	db 1, SWITCH
	db 1, POKE_BALL
	db 2, STRENGTH_CHARM
	db 1, CRYSTAL_SHARD
	db 2, FULL_HEAL
	db 1, MIRACLE_BERRY
	db 0 ; end
	tx BulbasaurAndFriendsDeckName

BulbasaurExtraDeck: ; 3053b (c:453b)  ; = Chikorita extras. Given to player at beginning.
	db 4, LIGHTNING_ENERGY
	db 4, PSYCHIC_ENERGY
	db 3, WATER_ENERGY
	db 2, PIKACHU
	db 1, MAREEP1
	db 1, ELEKID
	db 1, ELECTABUZZ
	db 2, SLOWPOKE
	db 1, SLOWBRO
	db 1, JYNX
	db 2, GIRAFARIG
	db 1, SMOOCHUM
	db 1, OMANYTE
	db 1, POLIWAG
	db 1, ARCADE_GAME
	db 1, MAIL_FROM_BILL
	db 2, POTION
	db 1, POKEMON_REVERSAL
	db 30, GRASS_ENERGY ; irrelevant
	db 0 ; end
	tx BulbasaurExtraDeckName

LightningAndFireDeck: ; 30564 (c:4564) ; Used by Mason Laboratory's Aaron.
	db 10, FIRE_ENERGY
	db 10, LIGHTNING_ENERGY
	db 2, DOUBLE_COLORLESS_ENERGY
	db 2, CYNDAQUIL1
	db 2, CYNDAQUIL2
	db 2, QUILAVA1
	db 1, CHARMANDER
	db 2, SLUGMA
	db 1, MAGCARGO
	db 1, MAGBY
	db 1, MAGMAR
	db 2, PICHU
	db 3, PIKACHU
	db 1, RAICHU
	db 3, CHINCHOU2
	db 1, LANTURN1
	db 1, LANTURN2
	db 2, SENTRET
	db 1, FURRET
	db 1, PROFESSOR_ELM
	db 2, MAIL_FROM_BILL
	db 2, ENERGY_SEARCH
	db 2, SWITCH
	db 2, STRENGTH_CHARM
	db 2, CRYSTAL_SHARD
	db 1, POTION
	db 0 ; end
	tx LightningAndFireDeckName

WaterAndFightingDeck: ; 305a1 (c:45a1) ; Used by Mason Laboratory's Aaron.
	db 12, WATER_ENERGY
	db 10, FIGHTING_ENERGY
	db 2, DOUBLE_COLORLESS_ENERGY
	db 3, HORSEA
	db 1, SEADRA
	db 2, QWILFISH
	db 1, SNEASEL
	db 2, WOOPER
	db 1, QUAGSIRE
	db 2, MARILL1
	db 1, MARILL2
	db 2, PHANPY1
	db 1, DONPHAN1
	db 3, TYROGUE
	db 2, LARVITAR
	db 1, PUPITAR
	db 1, HITMONTOP
	db 2, CORSOLA
	db 1, HITMONLEE
	db 1, PROFESSOR_ELM
	db 2, MAIL_FROM_BILL
	db 2, ENERGY_SEARCH
	db 3, POTION
	db 2, FULL_HEAL
	db 0 ; end
	tx WaterAndFightingDeckName

GrassAndPsychicDeck: ; 305d6 (c:45d6) ; Used by Mason Laboratory's Aaron.
	db 12, GRASS_ENERGY
	db 12, PSYCHIC_ENERGY
	db 2, CHIKORITA1
	db 2, CHIKORITA2
	db 3, LEDYBA
	db 3, LEDIAN
	db 2, SPINARAK
	db 1, ARIADOS
	db 1, YANMA
	db 3, NATU
	db 2, XATU
	db 3, MURKROW
	db 2, SLOWPOKE
	db 1, SLOWBRO
	db 1, DELIBIRD
	db 2, MAIL_FROM_BILL
	db 2, ENERGY_SEARCH
	db 2, POKEMON_REVERSAL
	db 2, POTION
	db 2, FULL_HEAL
	db 0 ; end
	tx GrassAndPsychicDeckName

LegendaryMoltresDeck: ; 30609 (c:4609) ; = Legendary Hooh. Used by Grand Master Courtney.
	db 7, FIRE_ENERGY
	db 13, FIGHTING_ENERGY
	db 4, HOOH_C
	db 2, ENTEI1
	db 2, ENTEI2
	db 3, HITMONCHAN
	db 1, MAGMAR
	db 3, AERODACTYL
	db 2, HITMONLEE
	db 2, HITMONTOP
	db 2, PROFESSOR_ELM
	db 4, MAIL_FROM_BILL
	db 2, SEER
	db 4, FOSSIL_EGG
	db 3, SWITCH
	db 3, MASTER_BALL
	db 3, STRENGTH_CHARM
	db 0 ; end
	tx LegendaryMoltresDeckName

LegendaryZapdosDeck: ; 30630 (c:4630) ; = Legendary Celebi. Used by Grand Master Steve.
	db 10, GRASS_ENERGY
	db 8, PSYCHIC_ENERGY
	db 2, DOUBLE_COLORLESS_ENERGY
	db 4, CELEBI_C
	db 4, CHIKORITA1
	db 3, BAYLEEF1
	db 2, MEGANIUM2
	db 3, MEWTWO
	db 2, MISDREAVUS
	db 3, CHANSEY
	db 2, BLISSEY
	db 3, PROFESSOR_ELM
	db 4, MAIL_FROM_BILL
	db 3, POTION
	db 4, ENERGY_REMOVAL2
	db 3, MASTER_BALL
	db 0 ; end
	tx LegendaryZapdosDeckName

LegendaryArticunoDeck: ; 30651 (c:4651) ; = Legendary Lugia. Used by Grand Master Jack.
	db 13, WATER_ENERGY
	db 7, LIGHTNING_ENERGY
	db 4, LUGIA_C
	db 3, POLIWAG
	db 3, POLIWHIRL
	db 2, POLITOED
	db 3, PIKACHU
	db 2, RAICHU_S
	db 2, SUICUNE
	db 2, REMORAID
	db 1, OCTILLERY
	db 3, PROFESSOR_ELM
	db 3, SUPER_ENERGY_RETRIEVAL
	db 4, TEAM_ROCKETS_EVIL_DEEDS
	db 1, SEER
	db 4, MASTER_BALL
	db 3, ENERGY_REMOVAL2
	db 0 ; end
	tx LegendaryArticunoDeckName

LegendaryDragoniteDeck: ; 30670 (c:4670) ; = Legendary Charizard. Used by Grand Master Rod.
	db 10, FIRE_ENERGY
	db 8, LIGHTNING_ENERGY
	db 2, DOUBLE_COLORLESS_ENERGY
	db 2, CHARIZARD_C
	db 4, CHARMANDER
	db 3, CHARMELEON
	db 1, CHARIZARD_S
	db 2, ENTEI1
	db 2, HOUNDOUR2
	db 1, HOUNDOOM
	db 3, MAREEP2
	db 3, FLAAFFY2
	db 2, AMPHAROS2
	db 2, TEDDIURSA
	db 1, URSARING
	db 4, PROFESSOR_ELM
	db 2, STAR_PIECE
	db 4, MASTER_BALL
	db 2, SUPER_ENERGY_RETRIEVAL
	db 2, POKEGEAR
	db 0 ; end
	tx LegendaryDragoniteDeckName

FirstStrikeDeck: ; 30699 (c:4699) ; Used by Fighting Club leader Mitch.
	db 19, FIGHTING_ENERGY
	db 4, HITMONLEE
	db 4, HITMONCHAN
	db 4, HITMONTOP
	db 3, AERODACTYL
	db 2, STANTLER
	db 3, SKARMORY
	db 4, FOSSIL_EGG
	db 2, POKEMON_FAN_CLUB
	db 2, POTION
	db 4, STRENGTH_CHARM
	db 2, SWITCH
	db 3, POKEMON_REVERSAL
	db 4, MAIL_FROM_BILL
	db 0 ; end
	tx FirstStrikeDeckName

RockCrusherDeck: ; 306b8 (c:46b8) ; Used by Rock Club leader Gene.
	db 20, FIGHTING_ENERGY
	db 4, ONIX
	db 3, STEELIX
	db 4, LARVITAR
	db 2, PUPITAR
	db 2, TYRANITAR
	db 2, PHANPY2
	db 1, DONPHAN1
	db 2, AIPOM
	db 3, PROFESSOR_ELM
	db 3, POKEMON_FAN_CLUB
	db 4, ENERGY_REMOVAL2
	db 4, SWITCH
	db 3, CRYSTAL_SHARD
	db 3, RUIN_WALL
	db 0 ; end
	tx RockCrusherDeckName

GoGoRainDanceDeck: ; 306dd (c:46dd) ; ; Used by Water Club leader Amy.
	db 19, WATER_ENERGY
	db 4, POLIWAG
	db 3, POLIWHIRL
	db 3, POLITOED
	db 4, KABUTO
	db 3, KABUTOPS
	db 2, HORSEA
	db 2, SEADRA
	db 1, KINGDRA
	db 2, SNEASEL
	db 3, PROFESSOR_ELM
	db 3, STAR_PIECE
	db 1, ENERGY_ARK
	db 2, SUPER_ENERGY_RETRIEVAL
	db 4, POKEMON_FAN_CLUB
	db 4, FOSSIL_EGG
	db 0 ; end
	tx GoGoRainDanceDeckName

ZappingSelfdestructDeck: ; 30704 (c:4704) ; = Supercharged deck. Used by Lightning Club leader Isaac.
	db 18, LIGHTNING_ENERGY
	db 4, MAREEP1
	db 3, FLAAFFY1
	db 2, AMPHAROS1
	db 1, AMPHAROS2
	db 3, ELECTABUZZ
	db 4, TOGEPI2
	db 2, TOGETIC2
	db 3, CHINCHOU1
	db 2, LANTURN2
	db 3, PROFESSOR_ELM
	db 4, MAIL_FROM_BILL
	db 2, SWITCH
	db 2, STRENGTH_CHARM
	db 1, CRYSTAL_SHARD
	db 4, POKEMON_REVERSAL
	db 2, ENERGY_ARK
	db 0 ; end
	tx ZappingSelfdestructDeckName

FlowerPowerDeck: ; 30725 (c:4725) ; Used by Grass Club leader Nikki.
	db 18, GRASS_ENERGY
	db 4, ODDISH
	db 3, GLOOM
	db 3, BELLOSSOM
	db 4, CHIKORITA2
	db 2, BAYLEEF2
	db 2, MEGANIUM1
	db 2, JIGGLYPUFF
	db 2, WIGGLYTUFF
	db 1, HERACROSS
	db 3, HOPPIP
	db 2, SKIPLOOM
	db 1, JUMPLUFF
	db 3, PROFESSOR_ELM
	db 2, MAIL_FROM_BILL
	db 3, STAR_PIECE
	db 1, SWITCH
	db 4, POKEMON_FAN_CLUB
	db 0 ; end
	tx FlowerPowerDeckName

StrangePsyshockDeck: ; 30748 (c:4748) ; Used by Psychic Club leader Murray.
	db 17, PSYCHIC_ENERGY
	db 3, SLOWPOKE
	db 3, SLOWKING
	db 2, MISDREAVUS
	db 3, CHANSEY
	db 2, BLISSEY
	db 1, WOBBUFFET
	db 3, GASTLY
	db 2, HAUNTER
	db 2, GENGAR
	db 2, PROFESSOR_ELM
	db 3, POKEMON_FAN_CLUB
	db 2, HYPER_POTION
	db 3, ENERGY_REMOVAL2
	db 3, POKEMON_REVERSAL
	db 4, SUPER_SCOOP_UP
	db 4, SWITCH
	db 1, POKEMON_NURSE
	db 0 ; end
	tx StrangePsyshockDeckName

WondersofScienceDeck: ; 30769 (c:4769) ; = Revolutionary Theory. Used by Science Club leader Rick.
	db 13, GRASS_ENERGY
	db 7, PSYCHIC_ENERGY
	db 4, ZUBAT
	db 3, GOLBAT
	db 2, CROBAT
	db 3, YANMA
	db 4, MEWTWO
	db 2, CELEBI_S
	db 2, SMEARGLE
	db 3, PORYGON
	db 2, PORYGON_2
	db 1, TEAM_ROCKETS_EVIL_DEEDS
	db 2, PROFESSOR_ELM
	db 2, POKEMON_FAN_CLUB
	db 2, MAIL_FROM_BILL
	db 2, ENERGY_SEARCH
	db 2, SWITCH
	db 4, POKEGEAR
	db 0 ; end
	tx WondersofScienceDeckName

FireChargeDeck: ; 30792 (c:4792) ; = Overheat. Used by Fire Club leader Ken.
	db 19, FIRE_ENERGY
	db 4, CYNDAQUIL1
	db 3, QUILAVA1
	db 2, TYPHLOSION1
	db 3, HOUNDOUR1
	db 2, ENTEI2
	db 2, CHANSEY
	db 1, BLISSEY
	db 1, HOOH
	db 2, MAGMAR
	db 3, PROFESSOR_ELM
	db 3, MAIL_FROM_BILL
	db 2, ENERGY_ARK
	db 3, POKEMON_FAN_CLUB
	db 4, POKEGEAR
	db 2, HYPER_POTION
	db 4, POTION
	db 0 ; end
	tx FireChargeDeckName

ImRonaldDeck: ; 307bd (c:47bd) ; The first deck used against you by Rival Ronald.
	db 14, PSYCHIC_ENERGY
	db 13, FIGHTING_ENERGY
	db 3, GASTLY
	db 2, HAUNTER
	db 3, MEW
	db 1, ESPEON2
	db 3, EEVEE
	db 2, DELIBIRD
	db 2, HITMONCHAN
	db 1, HITMONTOP
	db 2, SHUCKLE
	db 3, PROFESSOR_ELM
	db 1, ENERGY_ARK
	db 4, SWITCH
	db 4, STRENGTH_CHARM
	db 2, POKEMON_REVERSAL
	db 0 ; end
	tx ImRonaldDeckName

PowerfulRonaldDeck: ; 307ea (c:47ea) ; The second deck used against you by Rival Ronald.
	db 7, LIGHTNING_ENERGY
	db 9, FIGHTING_ENERGY
	db 7, PSYCHIC_ENERGY
	db 3, DOUBLE_COLORLESS_ENERGY
	db 3, ELECTABUZZ
	db 2, HITMONLEE
	db 2, HITMONCHAN
	db 1, MISDREAVUS
	db 2, JYNX
	db 1, MEWTWO
	db 2, TOGEPI1
	db 1, TOGETIC1
	db 2, SKARMORY
	db 2, MILTANK
	db 3, SMEARGLE
	db 2, ENERGY_ARK
	db 1, SUPER_ENERGY_RETRIEVAL
	db 2, ENERGY_REMOVAL2
	db 4, POKEMON_FAN_CLUB
	db 2, STRENGTH_CHARM
	db 2, POKEMON_REVERSAL
	db 0 ; end
	tx PowerfulRonaldDeckName

InvincibleRonaldDeck: ; 3081d (c:481d) ; The deck Rival Ronald uses against you during Challenge Cup matches.
	db 11, GRASS_ENERGY
	db 10, FIRE_ENERGY
	db 4, SUNKERN
	db 2, SUNFLORA
	db 3, PINECO
	db 2, FORRETRESS
	db 3, MAGMAR
	db 2, CYNDAQUIL1
	db 2, CYNDAQUIL2
	db 3, QUILAVA2
	db 2, TYPHLOSION2
	db 2, AIPOM
	db 2, PROFESSOR_ELM
	db 4, MAIL_FROM_BILL
	db 2, ENERGY_REMOVAL2
	db 3, POKEMON_REVERSAL
	db 3, STRENGTH_CHARM
	db 0 ; end
	tx InvincibleRonaldDeckName

LegendaryRonaldDeck: ; 30848 (c:4848) ; The final deck used against you by Rival Ronald.
	db 11, PSYCHIC_ENERGY	
	db 9, FIGHTING_ENERGY
	db 4, SHADOW_LUGIA
	db 3, MEWTWO
	db 2, MILTANK
	db 2, EEVEE
	db 1, ESPEON2
	db 1, UMBREON
	db 2, HITMONLEE
	db 3, LARVITAR
	db 2, PUPITAR
	db 1, TYRANITAR
	db 4, PROFESSOR_ELM
	db 4, MAIL_FROM_BILL
	db 2, SWITCH
	db 2, POKEGEAR
	db 3, MASTER_BALL
	db 4, STRENGTH_CHARM
	db 0 ; end
	tx LegendaryRonaldDeckName

MusclesforBrainsDeck: ; 30873 (c:4873) ; Used by Fighting Club member Chris.
	db 26, FIGHTING_ENERGY
	db 2, DOUBLE_COLORLESS_ENERGY
	db 1, TYROGUE
	db 3, HITMONLEE
	db 3, HITMONCHAN
	db 2, HITMONTOP
	db 4, GLIGAR
	db 3, DUNSPARCE
	db 4, SNUBBULL
	db 2, GRANBULL
	db 1, MAIL_FROM_BILL
	db 3, STRENGTH_CHARM
	db 2, POKEMON_REVERSAL
	db 1, POTION
	db 1, HYPER_POTION
	db 1, FULL_HEAL
	db 1, MIRACLE_BERRY
	db 0 ; end
	tx MusclesforBrainsDeckName

HeatedBattleDeck: ; 308a2 (c:48a2) ; = War and Peace. Used by Fighting Club member Michael.
	db 21, FIGHTING_ENERGY
	db 4, DOUBLE_COLORLESS_ENERGY
	db 2, POLIWAG
	db 2, POLIWHIRL
	db 1, POLIWRATH
	db 3, GLIGAR
	db 3, PHANPY1
	db 3, DONPHAN2
	db 3, TYROGUE
	db 3, TOGEPI1
	db 2, TOGETIC2
	db 2, HYPER_POTION
	db 3, STRENGTH_CHARM
	db 2, CRYSTAL_SHARD
	db 4, POTION
	db 2, FULL_HEAL
	db 0 ; end
	tx HeatedBattleDeckName

LovetoBattleDeck: ; 308c5 (c:48c5) ; Used by Fightning Club member Jessica.
	db 26, FIGHTING_ENERGY
	db 3, TYROGUE
	db 4, PHANPY1
	db 3, HITMONLEE
	db 2, HITMONCHAN
	db 3, SNUBBULL
	db 2, GRANBULL
	db 2, AIPOM
	db 1, IGGLYBUFF
	db 1, JIGGLYPUFF
	db 4, STRENGTH_CHARM
	db 4, CRYSTAL_SHARD
	db 3, POTION
	db 2, FULL_HEAL
	db 0 ; end
	tx LovetoBattleDeckName

ExcavationDeck: ; 308e6 (c:48e6) ; Used by Rock Club member Ryan.
	db 12, FIGHTING_ENERGY
	db 11, WATER_ENERGY
	db 4, OMANYTE
	db 3, OMASTAR
	db 4, KABUTO
	db 2, KABUTOPS
	db 2, GLIGAR
	db 3, SWINUB
	db 2, AERODACTYL
	db 4, PHANPY2
	db 1, DONPHAN1
	db 2, PROFESSOR_ELM
	db 2, MAIL_FROM_BILL
	db 2, RUIN_WALL
	db 2, STAR_PIECE
	db 4, FOSSIL_EGG
	db 0 ; end
	tx ExcavationDeckName

BlisteringPokemonDeck: ; 3090d (c:490d) ; Used by Rock Club member Andrew.
	db 6, LIGHTNING_ENERGY
	db 11, FIGHTING_ENERGY
	db 2, DOUBLE_COLORLESS_ENERGY
	db 2, CHINCHOU1
	db 4, SUDOWOODO
	db 4, ONIX
	db 3, STEELIX_S
	db 2, PHANPY1
	db 3, LARVITAR
	db 3, SENTRET
	db 2, FURRET
	db 2, PROFESSOR_ELM
	db 3, MAIL_FROM_BILL
	db 3, ENERGY_ARK
	db 2, FOREST_GUARDIAN
	db 3, SWITCH
	db 3, CRYSTAL_SHARD
	db 2, POKEMON_REVERSAL
	db 0 ; end
	tx BlisteringPokemonDeckName

HardPokemonDeck: ; 30938 (c:4938) ; Used by Rock Club member Matthew.
	db 25, FIGHTING_ENERGY
	db 4, ONIX
	db 3, STEELIX
	db 2, GLIGAR
	db 3, CORSOLA
	db 4, SUDOWOODO
	db 3, LARVITAR
	db 2, PUPITAR
	db 3, MAIL_FROM_BILL
	db 2, POKE_BALL
	db 4, CRYSTAL_SHARD
	db 3, POKEMON_REVERSAL
	db 2, POTION
	db 0 ; end
	tx HardPokemonDeckName

WaterfrontPokemonDeck: ; 30959 (c:4959) ; Used by Water Club member Sara.
	db 18, WATER_ENERGY
	db 7, PSYCHIC_ENERGY
	db 4, REMORAID
	db 4, OCTILLERY
	db 1, WOOPER
	db 4, MARILL1
	db 4, AZUMARILL2
	db 3, SLOWPOKE
	db 2, SLOWBRO
	db 2, AIPOM
	db 3, MURKROW
	db 3, MAIL_FROM_BILL
	db 3, POKEMON_REVERSAL
	db 2, POTION
	db 0 ; end
	tx WaterfrontPokemonDeckName

LonelyFriendsDeck: ; 30990 (c:4990) ; Used by Water Club Member Amanda.
	db 8, GRASS_ENERGY
	db 9, WATER_ENERGY
	db 4, DOUBLE_COLORLESS_ENERGY
	db 4, SCYTHER
	db 4, TOTODILE2
	db 2, OMANYTE
	db 1, OMASTAR
	db 1, MARILL1
	db 4, SNEASEL
	db 4, HOPPIP
	db 2, PROFESSOR_ELM
	db 2, MAIL_FROM_BILL
	db 4, POKE_DOLL
	db 4, FOSSIL_EGG
	db 2, SUPER_SCOOP_UP
	db 4, POTION
	db 1, HYPER_POTION
	db 0 ; end
	tx LonelyFriendsDeckName

SoundoftheWavesDeck: ; 309b7 (c:49b7) ; Used by Water Club Member Joshua.
	db 24, WATER_ENERGY
	db 2, HORSEA
	db 1, SEADRA
	db 3, REMORAID
	db 3, POLIWAG
	db 2, POLIWHIRL
	db 2, MARILL1
	db 2, MARILL2
	db 2, AZUMARILL1
	db 1, AZUMARILL2
	db 3, MANTINE
	db 2, SUICUNE
	db 2, OCTILLERY
	db 3, MAIL_FROM_BILL
	db 3, ENERGY_REMOVAL2
	db 3, STRENGTH_CHARM
	db 2, FULL_HEAL
	db 0 ; end
	tx SoundoftheWavesDeckName

PikachuDeck: ; 309dc (c:49dc) ; = Pikachu (?) deck. Used by Lightning Club member Jennifer.
	db 7, WATER_ENERGY
	db 16, LIGHTNING_ENERGY
	db 3, PICHU
	db 4, PIKACHU
	db 2, RAICHU
	db 2, RAICHU_S
	db 4, MARILL1
	db 3, AZUMARILL2
	db 4, MAIL_FROM_BILL
	db 4, SWITCH
	db 4, POKE_BALL
	db 4, POTION
	db 2, HYPER_POTION
	db 1, FULL_HEAL
	db 0 ; end
	tx PikachuDeckName

BoomBoomSelfdestructDeck: ; 30a01 (c:4a01) ; = Bench Storm. Used by Lightning club member Nicholas.
	db 8, GRASS_ENERGY
	db 14, LIGHTNING_ENERGY
	db 8, FIGHTING_ENERGY
	db 4, SPINARAK
	db 3, ARIADOS
	db 4, MAREEP1
	db 2, FLAAFFY1
	db 2, AMPHAROS2
	db 4, SWINUB
	db 3, PILOSWINE
	db 2, POKEMON_REVERSAL
	db 2, PROFESSOR_ELM
	db 4, CRYSTAL_SHARD
	db 0 ; end
	tx BoomBoomSelfdestructDeckName

PowerGeneratorDeck: ; 30a20 (c:4a20) ; Used by Lightning club member Brandon.
	db 15, LIGHTNING_ENERGY
	db 10, WATER_ENERGY
	db 2, CHINCHOU1
	db 2, CHINCHOU2
	db 2, LANTURN1
	db 1, LANTURN2
	db 3, MAREEP1
	db 3, ELECTABUZZ
	db 3, ELEKID
	db 3, JOLTEON
	db 4, EEVEE
	db 2, TEAM_ROCKETS_EVIL_DEEDS
	db 2, MAIL_FROM_BILL
	db 4, SWITCH
	db 4, CRYSTAL_SHARD
	db 0 ; end
	tx PowerGeneratorDeckName

EtceteraDeck: ; 30a4b (c:4a4b) ; Used by Grass Club member Brittany.
	db 20, GRASS_ENERGY
	db 2, CHIKORITA1
	db 2, LEDYBA
	db 1, LEDIAN
	db 3, JIGGLYPUFF
	db 2, WIGGLYTUFF
	db 1, CLEFAIRY
	db 2, SMEARGLE
	db 1, HOPPIP
	db 1, YANMA
	db 3, SCYTHER
	db 2, SCIZOR
	db 4, MASTER_BALL
	db 4, MAIL_FROM_BILL
	db 4, PROFESSOR_ELM
	db 3, POKE_BALL
	db 3, STRENGTH_CHARM
	db 2, CRYSTAL_SHARD
	db 0 ; end
	tx EtceteraDeckName

FlowerGardenDeck: ; 30a7e (c:4a7e) ; Used by Grass Club member Kristin.
	db 20, GRASS_ENERGY
	db 4, SUNKERN
	db 2, SUNFLORA
	db 4, HOPPIP
	db 3, SKIPLOOM
	db 2, JUMPLUFF
	db 3, CHIKORITA1
	db 2, BAYLEEF2
	db 1, MEGANIUM1
	db 2, CHANSEY
	db 1, BLISSEY
	db 2, PROFESSOR_ELM
	db 2, MAIL_FROM_BILL
	db 3, STAR_PIECE
	db 2, POKE_BALL
	db 2, SWITCH
	db 4, POTION
	db 1, FULL_HEAL
	db 0 ; end
	tx FlowerGardenDeckName

KaleidoscopeDeck: ; 30aa9 (c:4aa9) ; Used by Grass Club member Heather.
	db 10, GRASS_ENERGY
	db 12, PSYCHIC_ENERGY
	db 4, CHIKORITA2
	db 3, BAYLEEF1
	db 2, MEGANIUM2
	db 2, ESPEON1
	db 4, EEVEE
	db 2, ESPEON2
	db 2, SMOOCHUM
	db 1, CELEBI_S
	db 2, SLOWPOKE
	db 2, SLOWBRO
	db 4, SEER
	db 4, MAIL_FROM_BILL
	db 2, PROFESSOR_ELM
	db 4, SWITCH
	db 0 ; end
	tx KaleidoscopeDeckName

GhostDeck: ; 30ad6 (c:4ad6) ; Used by Psychic Club member Robert.
	db 21, PSYCHIC_ENERGY
	db 3, DOUBLE_COLORLESS_ENERGY
	db 4, GASTLY
	db 3, HAUNTER
	db 3, GENGAR
	db 2, SMOOCHUM
	db 4, MISDREAVUS
	db 3, CHANSEY
	db 3, NATU
	db 2, PROFESSOR_ELM
	db 4, MAIL_FROM_BILL
	db 2, STAR_PIECE
	db 1, POKEMON_REVERSAL
	db 2, POTION
	db 1, FULL_HEAL
	db 2, OLD_ROD
	db 0 ; end
	tx GhostDeckName

NapTimeDeck: ; 30aff (c:4aff) ; Used by Psychic Club member Daniel.
	db 18, PSYCHIC_ENERGY
	db 8, GRASS_ENERGY
	db 4, SLOWPOKE
	db 4, GASTLY
	db 4, MISDREAVUS
	db 2, CHIKORITA2
	db 4, HOPPIP
	db 3, SKIPLOOM
	db 2, JUMPLUFF
	db 2, MAIL_FROM_BILL
	db 2, SWITCH
	db 3, STRENGTH_CHARM
	db 4, POKEMON_REVERSAL
	db 0 ; end
	tx NapTimeDeckName

StrangePowerDeck: ; 30b1e (c:4b1e) ; = Sun and Moon. Used by Psychic Club member Stephanie.
	db 19, PSYCHIC_ENERGY
	db 4, DOUBLE_COLORLESS_ENERGY
	db 4, EEVEE
	db 1, ESPEON1
	db 1, ESPEON2
	db 2, UMBREON
	db 4, NATU
	db 3, XATU
	db 2, CLEFFA
	db 3, TEDDIURSA
	db 2, URSARING
	db 2, HOOTHOOT
	db 1, NOCTOWL
	db 4, POKEMON_FAN_CLUB
	db 2, ENERGY_ARK
	db 2, STRENGTH_CHARM
	db 1, RUIN_WALL
	db 2, POKEMON_REVERSAL
	db 1, FULL_HEAL
	db 0 ; end
	tx StrangePowerDeckName

FlyinPokemonDeck: ; 30b49 (c:4b49) ; = Aerodynamics. Used by Science club member Joseph.
	db 21, GRASS_ENERGY
	db 4, DOUBLE_COLORLESS_ENERGY
	db 4, HOPPIP
	db 3, SKIPLOOM
	db 2, JUMPLUFF
	db 4, TOGEPI1
	db 2, TOGETIC1
	db 1, YANMA
	db 2, DUNSPARCE
	db 4, HOOTHOOT
	db 3, NOCTOWL
	db 3, TEAM_ROCKETS_EVIL_DEEDS
	db 3, MAIL_FROM_BILL
	db 4, POTION
	db 0 ; end
	tx FlyinPokemonDeckName

LovelyNidoranDeck: ; 30b6c (c:4b6c) ; = Entomology. Used by Science Club member David.
	db 20, GRASS_ENERGY
	db 4, SCYTHER
	db 2, SCIZOR
	db 2, LEDYBA
	db 3, PINECO
	db 2, FORRETRESS
	db 1, YANMA
	db 2, SPINARAK
	db 1, ARIADOS
	db 4, HERACROSS
	db 2, DUNSPARCE
	db 2, LEDIAN
	db 3, PROFESSOR_ELM
	db 2, MAIL_FROM_BILL
	db 4, BILLS_MAINTENANCE
	db 2, SEER
	db 1, SWITCH
	db 2, POKE_BALL
	db 1, ARCADE_GAME
	db 0 ; end
	tx LovelyNidoranDeckName

PoisonDeck: ; 30b99 (c:4b99) ; = Toxicology. Used by Science Club member Erik.
	db 23, GRASS_ENERGY
	db 4, SPINARAK
	db 2, ARIADOS
	db 4, ZUBAT
	db 3, GOLBAT
	db 2, CROBAT
	db 3, ODDISH
	db 4, HOPPIP
	db 3, GLOOM
	db 2, ENERGY_REMOVAL2
	db 1, PROFESSOR_ELM
	db 2, TEAM_ROCKETS_EVIL_DEEDS
	db 1, STAR_PIECE
	db 2, POTION
	db 2, FULL_HEAL
	db 2, ARCADE_GAME
	db 0 ; end
	tx PoisonDeckName

AngerDeck: ; 30bbe (c:4bbe) ; Used by Fire Club Member John.
	db 22, FIRE_ENERGY
	db 4, CYNDAQUIL2
	db 3, QUILAVA2
	db 2, TYPHLOSION2
	db 4, SNUBBULL
	db 3, GRANBULL
	db 2, ENTEI1
	db 3, MAGBY
	db 2, PROFESSOR_ELM
	db 3, MAIL_FROM_BILL
	db 2, ENERGY_ARK
	db 2, SWITCH
	db 4, STRENGTH_CHARM
	db 2, CRYSTAL_SHARD
	db 2, POKEMON_REVERSAL
	db 0 ; end
	tx AngerDeckName

FlamethrowerDeck: ; 30be5 (c:4be5) ; = Burn it Down! Used by Fire Club member Adam.
	db 15, FIRE_ENERGY
	db 6, FIGHTING_ENERGY
	db 2, SLUGMA
	db 1, MAGCARGO
	db 4, LARVITAR
	db 3, PUPITAR
	db 3, TYRANITAR_S
	db 4, GROWLITHE
	db 2, ARCANINE
	db 3, CYNDAQUIL1
	db 2, QUILAVA2
	db 4, MAIL_FROM_BILL
	db 3, ENERGY_ARK
	db 1, SUPER_ENERGY_RETRIEVAL
	db 2, SWITCH
	db 1, STRENGTH_CHARM
	db 4, POKEMON_REVERSAL
	db 0 ; end
	tx FlamethrowerDeckName

ReshuffleDeck: ; 30c0e (c:4c0e) ; = Plasma. Used by Fire Club member Jonathan.
	db 15, FIRE_ENERGY
	db 7, LIGHTNING_ENERGY
	db 4, CHARMANDER
	db 3, CHARMELEON
	db 2, CHARIZARD_S
	db 1, MAGMAR
	db 2, MAGBY
	db 4, MAREEP1
	db 3, FLAAFFY2
	db 2, IGGLYBUFF
	db 1, ELEKID
	db 1, PICHU
	db 2, PORYGON
	db 1, PORYGON_2
	db 3, MAIL_FROM_BILL
	db 2, ENERGY_ARK
	db 1, ENERGY_REMOVAL2
	db 1, ARCADE_GAME
	db 2, SWITCH
	db 1, POKEMON_NURSE
	db 2, POTION
	db 0 ; end
	tx ReshuffleDeckName

ImakuniDeck: ; 30c3d (c:4c3d) ; Used by Strange Life Form Imakuni.
	db 10, FIGHTING_ENERGY
	db 16, WATER_ENERGY
	db 3, JIGGLYPUFF
	db 2, WIGGLYTUFF
	db 2, DUNSPARCE
	db 3, SUDOWOODO
	db 4, WOOPER
	db 3, QUAGSIRE
	db 4, CORSOLA
	db 4, DELIBIRD
	db 3, BILLS_MAINTENANCE
	db 2, POKEMON_FLUTE_CHANNEL
	db 4, ARCADE_GAME
	db 0 ; end
	tx ImakuniDeckName
