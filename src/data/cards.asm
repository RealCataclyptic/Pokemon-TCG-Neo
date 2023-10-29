; TODO: Make card data structures more compact and rearrange the fields for
; convenience once the meaning of all fields is figured out.

; Cataclyptic notes: On Chikorita1, I have provided an explanation for how this game processes cards, since that will likely be what you all will want to hack.
; The Effect Commands section has added notes for what each of the effects do. I have NOT modified any Effect Functions, but there are some notes there.

CardPointers: ; 30c5c (c:4c5c)
	dw NULL
	dw GrassEnergyCard
	dw FireEnergyCard
	dw WaterEnergyCard
	dw LightningEnergyCard
	dw FightingEnergyCard
	dw PsychicEnergyCard
	dw DoubleColorlessEnergyCard
	dw Chikorita1Card ; This is how your card is defined in the list. Also needs to be defined in Constants>Card Constants.
	dw Chikorita2Card
	dw Bayleef1Card
	dw Bayleef2Card
	dw Meganium1Card
	dw Meganium2Card
	dw LedybaCard
	dw LedianCard
	dw SpinarakCard
	dw AriadosCard
	dw ZubatCard
	dw GolbatCard
	dw CrobatCard
	dw OddishCard
	dw GloomCard
	dw VileplumeCard
	dw BellossomCard
	dw HoppipCard
	dw SkiploomCard
	dw JumpluffCard
	dw SunkernCard
	dw SunfloraCard
	dw YanmaCard
	dw PinceoCard
	dw ForretressCard
	dw ScytherCard
	dw ScizorCard
	dw HeracrossCard
	dw CelebiSCard
	dw MagbyCard
	dw MagmarCard
	dw Cyndaquil1Card
	dw Cyndaquil2Card
	dw Quilava1Card
	dw Quilava2Card
	dw Typhlosion1Card
	dw Typhlosion2Card
	dw SlugmaCard
	dw MagcargoCard
	dw Houndour1Card
	dw Houndour2Card
	dw HoundoomCard
	dw Entei1Card
	dw Entei2Card
	dw HoohCard
	dw GrowlitheCard
	dw ArcanineCard
	dw FlareonCard
	dw CharmanderCard
	dw CharmeleonCard
	dw CharizardSCard
	dw OmanyteCard
	dw OmastarCard
	dw KabutoCard
	dw KabutopsCard
	dw VaporeonCard
	dw Totodile1Card
	dw Totodile2Card
	dw Croconaw1Card
	dw Croconaw2Card
	dw Feraligatr1Card
	dw Feraligatr2Card
	dw Marill1Card
	dw Marill2Card
	dw Azumarill1Card
	dw Azumarill2Card
	dw PoliwagCard
	dw PoliwhirlCard
	dw PolitoedCard
	dw WooperCard
	dw QuagsireCard
	dw QwilfishCard
	dw SneaselCard
	dw RemoraidCard
	dw OctilleryCard
	dw MantineCard
	dw HorseaCard
	dw SeadraCard
	dw KingdraCard
	dw SuicuneCard
	dw MagikarpSCard
	dw GyaradosSCard
	dw JolteonCard
	dw Chinchou1Card
	dw Chinchou2Card
	dw Lanturn1Card
	dw Lanturn2Card
	dw PichuCard
	dw PikachuCard
	dw RaichuCard
	dw Mareep1Card
	dw Mareep2Card
	dw Flaaffy1Card
	dw Flaaffy2Card
	dw Ampharos1Card
	dw Ampharos2Card
	dw ElekidCard
	dw ElectabuzzCard
	dw RaikouCard
	dw RaichuSCard
	dw PoliwrathCard
	dw AerodactylCard
	dw SudowoodoCard
	dw GligarCard
	dw OnixCard
	dw SteelixCard
	dw ShuckleCard
	dw SwinubCard
	dw PiloswineCard
	dw CorsolaCard
	dw Phanpy1Card
	dw Phanpy2Card
	dw Donphan1Card
	dw Donphan2Card
	dw TyrogueCard
	dw HitmonleeCard
	dw HitmonchanCard
	dw HitmontopCard
	dw LarvitarCard
	dw PupitarCard
	dw TyranitarCard
	dw KabutopsSCard
	dw SteelixSCard
	dw TyranitarSCard
	dw GastlyCard
	dw HaunterCard
	dw GengarCard
	dw MewtwoCard
	dw MewCard
	dw NatuCard
	dw XatuCard
	dw Espeon1Card
	dw Espeon2Card
	dw UmbreonCard
	dw MurkrowCard
	dw SlowpokeCard
	dw SlowbroCard
	dw SlowkingCard
	dw MisdreavusCard
	dw UnownACard
	dw UnownJCard
	dw WobbuffetCard
	dw GirafarigCard
	dw SmoochumCard
	dw JynxCard
	dw CelebiCard
	dw MewtwoSCard
	dw MewSCard
	dw DratiniCard
	dw DragonairCard
	dw DragoniteCard
	dw SentretCard
	dw FurretCard
	dw HoothootCard
	dw NoctowlCard
	dw CleffaCard
	dw ClefairyCard
	dw ClefableCard
	dw IgglybuffCard
	dw JigglypuffCard
	dw WigglytuffCard
	dw Togepi1Card
	dw Togepi2Card
	dw Togetic1Card
	dw Togetic2Card
	dw AipomCard
	dw EeveeCard
	dw DunsparceCard
	dw SnubbullCard
	dw GranbullCard
	dw TeddiursaCard
	dw UrsaringCard
	dw DelibirdCard
	dw SkarmoryCard
	dw PorygonCard
	dw Porygon2Card
	dw StantlerCard
	dw SmeargleCard
	dw MiltankCard
	dw ChanseyCard
	dw BlisseyCard
	dw LugiaCard
	dw NoctowlSCard
	dw CharizardCCard
	dw LugiaCCard
	dw HoohCCard
	dw CelebiCCard
	dw ShadowLugiaCard
	dw ProfessorElmCard
	dw TeamRocketsEvilDeedsCard
	dw MailFromBillCard
	dw ForestGuardianCard
	dw SeerCard
	dw PokemonFanClubCard
	dw StarPieceCard
	dw PokeDollCard
	dw FossilEggCard
	dw EnergyArkCard
	dw SuperEnergyRetrievalCard
	dw EnergySearchCard
	dw EnergyRemoval2Card
	dw MasterBallCard
	dw SwitchCard
	dw PokemonNurseCard
	dw PokeBallCard
	dw SuperScoopUpCard
	dw PokegearCard
	dw NewPokedexCard
	dw StrengthCharmCard
	dw CrystalShardCard
	dw RuinWallCard
	dw PokemonReversalCard
	dw HyperDevolutionSprayCard
	dw PotionCard
	dw HyperPotionCard
	dw FullHealCard
	dw MiracleBerryCard
	dw BillsMaintenanceCard
	dw PokemonFluteChannelCard
	dw ArcadeGameCard
	dw OldRodCard
	dw NULL ; This signifies the end of the card list. Also, put a blank line underneath the last card or the make program, will freak out. 

Chikorita1Card: ; 30e28 (c:4e28) Section beginning the card, initially defined up above. 
	db TYPE_PKMN_GRASS ; type of card it is. 
	gfx Chikorita1CardGfx ; gfx for the card, found in src > GFX > cardname. Also defined in root > gfx if you rename any of the files.
	tx ChikoritaName ; name of the card, found in src> Texts> Texts 9-13 somewhere.
	db CIRCLE ; rarity of the card, can be CIRCLE, DIAMOND, STAR or PROMOSTAR. Note that PROMOSTAR does not have an icon associated with it.
	db COLOSSEUM | NONE ; The set in which this card appears. Set card numbers are defined in Constants > Menu constants, DEF NUM_CARDS [set].
	db CHIKORITA1 ; Reiteration of the identity of the card, found in Constants > Card Constants, and used in Decks too.
	db 50 ; hp of the card. 120 max, 10 min.
	db BASIC ; Stage. Can be BASIC, STAGE1, or STAGE2. There exists another stage in Card data constants, but I think it's used for Pokemon Breeder so don't mess with it?
	dw NONE ; The name of the preevolution. In none, write dw NONE. if there is one, write tx [PokemonName].

	; attack 1
	energy COLORLESS, 1 ; Energies required. Write in ENERGY, #, ENERGY, # until done. 5 energies max before you bleed into attack text.
	tx GrowlName ; name of the attack, found somehwere in src> Texts
	tx ReduceDamageBy10Desc ; text description of what the attack does, also found somehwere in Texts
	dw NONE ; description (cont) ; A continued description of above for effects that are longer than normal.
	db 0 ; Amount of damage this attack does. 120 max?
	db DAMAGE_NORMAL ; category of damage. Can be normal for normal, X for multiplicative, PLUS for added damage and Residual, which applies the effect with no damage.
	dw ReduceDamageBy10EffectCommands ; effect commands, found in src > Engine > Duel > Effect commands. Each effect command corresponds to an effect function. 
	db NONE ; These flags are for damage proccessing and AI handling. Use the examples already made to find out which flags you need.
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3 
	db 10 ; Genuinely no sure what this one does, I guess it corresponds to damage modifiers? EG this one is a 10 for the 10 reduced damage?
	db ATK_ANIM_SUPERSONIC ; The animation this attack uses. Found in src > Data > Duel > Animations > Attack Animations

	; Second attack, same format as the first. If no second attack, you essentially put nones in here. See Hoppip for an example of this.
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx PoisonPowderName ; name
	tx MayInflictPoisonDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictPoisonEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE ; animation

	db 1 ; retreat cost, min 0, max 4.
	db WR_FIRE ; weakness of the poke. Can put anything except colorless.
	db NONE ; resistance of the poke. Can put anything except colorless. 
	tx LeafName ; pokedex category, found somewhere in Texts. 
	db 152 ; Pokedex number, shows up on the card screen.
	db 0 ; No idea what this one is. A space between data sets?
	db 12 ; level of the pokemon, shown in card screen and card menu.
	db 2, 11 ; length in feet and inches
	dw 10 * 14 ; weight in pounds and ounces
	tx Chikorita1Description ; description of the poke, found in texts
	db 16 ; No idea what this one is either. Leave it alone. 

Chikorita2Card: ; 30e69 (c:4e69)
	db TYPE_PKMN_GRASS ; type
	gfx Chikorita2CardGfx ; gfx
	tx ChikoritaName ; name
	db CIRCLE	 ; rarity
	db COLOSSEUM | NONE ; sets
	db CHIKORITA2
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx SleepPowderName ; name
	tx MayInflictSleepDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictSleepEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE ; animation

	; attack 2
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx RazorLeafName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WHIP ; animation

	db 1 ; retreat cost
	db WR_FIRE ; weakness
	db WR_WATER ; resistance
	tx LeafName ; category
	db 152 ; Pokedex number
	db 0
	db 15 ; level
	db 2, 11 ; length
	dw 14 * 10 ; weight
	tx Chikorita2Description ; description
	db 16

Bayleef1Card: ; 30eaa (c:4eaa)
	db TYPE_PKMN_GRASS ; type
	gfx Bayleef1CardGfx ; gfx
	tx BayleefName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db BAYLEEF1
	db 70 ; hp
	db STAGE1 ; stage
	tx ChikoritaName ; pre-evo name

	; attack 1
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx PoisonPowderName ; name
	tx MayInflictPoisonDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictPoisonEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE ; animation

	; attack 2
	energy GRASS, 2, COLORLESS, 1 ; energies
	tx RazorLeafName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WHIP ; animation

	db 1 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx LeafName ; category
	db 153 ; Pokedex number
	db 0
	db 29 ; level
	db 3, 11 ; length
	dw 35 * 10 ; weight
	tx Bayleef1Description ; description
	db 0

Bayleef2Card: ; 30eeb (c:4eeb)
	db TYPE_PKMN_GRASS ; type
	gfx Bayleef2CardGfx ; gfx
	tx BayleefName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db BAYLEEF2
	db 80 ; hp
	db STAGE1 ; stage
	tx ChikoritaName ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx AbsorbName ; name
	tx HealHalfDamageDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw HealHalfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_DRAIN ; animation

	; attack 2
	energy GRASS, 3 ; energies
	tx SlamName ; name
	tx DoubleAttackX30Description ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_X ; category
	dw CF30X2EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 2 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx LeafName ; category
	db 153 ; Pokedex number
	db 0
	db 26 ; level
	db 3, 11 ; length
	dw 35 * 10 ; weight
	tx Bayleef2Description ; description
	db 0

Meganium1Card: ; 30f2c (c:4f2c)
	db TYPE_PKMN_GRASS ; type
	gfx Meganium1CardGfx ; gfx
	tx MeganiumName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db MEGANIUM1
	db 100 ; hp
	db STAGE2 ; stage
	tx BayleefName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx EnergyTransName ; name
	tx EnergyTransDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw EnergyTransEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy GRASS, 4 ; energies
	tx HerbalScentName ; name
	tx InflictSleepDescription ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw InflictSleepEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PETAL_DANCE ; animation

	db 2 ; retreat cost
	db WR_FIRE ; weakness
	db WR_WATER ; resistance
	tx HerbName ; category
	db 154 ; Pokedex number
	db 0
	db 52 ; level
	db 5, 11 ; length
	dw 221 * 10 ; weight
	tx Meganium1Description ; description
	db 0

Meganium2Card: ; 30f6d (c:4f6d)
	db TYPE_PKMN_GRASS ; type
	gfx Meganium2CardGfx ; gfx
	tx MeganiumName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db MEGANIUM2
	db 120 ; hp
	db STAGE2 ; stage
	tx BayleefName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx AromatherapyName ; name
	tx AromatherapyDescription ; description
	tx AromatherapyDescriptionCont ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw AromatherapyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SOLAR_POWER ; animation

	; attack 2
	energy GRASS, 2, COLORLESS, 2 ; energies
	tx BodySlamName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 2 ; retreat cost
	db WR_FIRE ; weakness
	db WR_WATER ; resistance
	tx HerbName ; category
	db 154 ; Pokedex number
	db 0
	db 55 ; level
	db 5, 11 ; length
	dw 221 * 10 ; weight
	tx Meganium2Description ; description
	db 16

LedybaCard: ; 30fae (c:4fae)
	db TYPE_PKMN_GRASS ; type
	gfx LedybaCardGfx ; gfx
	tx LedybaName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db LEDYBA
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx SupersonicName ; name
	tx MayInflictConfusionDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictConfusionEffectCommands ; effect commands
	db INFLICT_CONFUSION ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SUPERSONIC ; animation

	; attack 2
	energy GRASS, 2 ; energies
	tx CometPunchName ; name
	tx QuadrupleAttackX10Description ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_X ; category
	dw CF10X4EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PUNCH ; animation

	db 0 ; retreat cost
	db WR_FIRE ; weakness
	db WR_FIGHTING ; resistance
	tx FiveStarName ; category
	db 165 ; Pokedex number
	db 0
	db 8 ; level
	db 3, 0 ; length
	dw 23 * 10 ; weight
	tx LedybaDescription ; description
	db 0

LedianCard: ; 30fef (c:4fef)
	db TYPE_PKMN_GRASS ; type
	gfx LedianCardGfx ; gfx
	tx LedianName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db LEDIAN
	db 60 ; hp
	db STAGE1 ; stage
	tx LedybaName ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx LightScreenName ; name
	tx OppHalfDamageDesc ; description
	tx OppHalfDamageDescCont ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw HalveDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BARRIER ; animation

	; attack 2
	energy GRASS, 2, COLORLESS, 1 ; energies
	tx CometPunchName ; name
	tx QuadrupleAttackX20Description ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_X ; category
	dw CF20X4EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PUNCH ; animation

	db 0 ; retreat cost
	db WR_FIRE ; weakness
	db WR_FIGHTING ; resistance
	tx FiveStarName ; category
	db 166 ; Pokedex number
	db 0
	db 27 ; level
	db 4, 7 ; length
	dw 78 * 10 ; weight
	tx LedianDescription ; description
	db 19

SpinarakCard: ; 31030 (c:5030)
	db TYPE_PKMN_GRASS ; type
	gfx SpinarakCardGfx ; gfx
	tx SpinarakName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db SPINARAK
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx PoisonStingName ; name
	tx MayInflictPoisonDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictPoisonEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NEEDLES ; animation

	; attack 2
	energy GRASS, 1 ; energies
	tx StringShotName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_STRING_SHOT ; animation

	db 1 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx StringSpitName ; category
	db 167 ; Pokedex number
	db 0
	db 10 ; level
	db 1, 8 ; length
	dw 18 * 10 ; weight
	tx SpinarakDescription ; description
	db 16

AriadosCard: ; 31071 (c:5071)
	db TYPE_PKMN_GRASS ; type
	gfx AriadosCardGfx ; gfx
	tx AriadosName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db ARIADOS
	db 60 ; hp
	db STAGE1 ; stage
	tx SpinarakName ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx ToxicWebName ; name
	tx SwitchOppActiveThenPSNDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw SwitchAndPoisonEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db SWITCH_OPPONENT_POKEMON ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_CAT_PUNCH ; animation

	; attack 2
	energy GRASS, 2 ; energies
	tx PoisonStingName ; name
	tx InflictPoisonDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictPoisonEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NEEDLES ; animation

	db 1 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx LongLegName ; category
	db 168 ; Pokedex number
	db 0
	db 23 ; level
	db 3, 7 ; length
	dw 74 * 10 ; weight
	tx AriadosDescription ; description
	db 0

ZubatCard: ; 310b2 (c:50b2)
	db TYPE_PKMN_GRASS ; type
	gfx ZubatCardGfx ; gfx
	tx ZubatName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db ZUBAT
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx BiteName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx PoisonFangName ; name
	tx InflictPoisonDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw InflictPoisonEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POISON_FANG ; animation

	db 0 ; retreat cost
	db WR_PSYCHIC ; weakness
	db WR_FIGHTING ; resistance
	tx BatName ; category
	db 41 ; Pokedex number
	db 0
	db 11 ; level
	db 2, 7 ; length
	dw 16 * 10 ; weight
	tx ZubattDescription ; description
	db 19

GolbatCard: ; 310f3 (c:50f3)
	db TYPE_PKMN_GRASS ; type
	gfx GolbatCardGfx ; gfx
	tx GolbatName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db GOLBAT
	db 60 ; hp
	db STAGE1 ; stage
	tx ZubatName ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx BiteName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx LeechLifeName ; name
	tx HealEqualToDamageDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw HealEqualToDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_DRAIN ; animation

	db 0 ; retreat cost
	db WR_PSYCHIC ; weakness
	db WR_FIGHTING ; resistance
	tx BatName ; category
	db 42 ; Pokedex number
	db 0
	db 27 ; level
	db 5, 3 ; length
	dw 121 * 10 ; weight
	tx GolbatDescription ; description
	db 0

CrobatCard: ; 31134 (c:5134)
	db TYPE_PKMN_GRASS ; type
	gfx CrobatCardGfx ; gfx
	tx CrobatName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db CROBAT
	db 80 ; hp
	db STAGE2 ; stage
	tx GolbatName ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx SurpriseBiteName ; name
	tx Do20ToABenchDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Do20ToABenchEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy GRASS, 2, COLORLESS, 1 ; energies
	tx ToxicName ; name
	tx ToxicDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw ToxicEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_TOXIC ; animation

	db 0 ; retreat cost
	db WR_PSYCHIC ; weakness
	db WR_FIGHTING ; resistance
	tx BatName ; category
	db 169 ; Pokedex number
	db 0
	db 42 ; level
	db 5, 11 ; length
	dw 165 * 10 ; weight
	tx CrobatDescription ; description
	db 19

OddishCard: ; 31175 (c:5175)
	db TYPE_PKMN_GRASS ; type
	gfx OddishCardGfx ; gfx
	tx OddishName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db ODDISH
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx SleepPowderName ; name
	tx InflictSleepDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw InflictSleepEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE ; animation

	db 1 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx WeedName ; category
	db 43 ; Pokedex number
	db 0
	db 13 ; level
	db 1, 8 ; length
	dw 12 * 10 ; weight
	tx OddishDescription ; description
	db 16

GloomCard: ; 311b6 (c:51b6)
	db TYPE_PKMN_GRASS ; type
	gfx GloomCardGfx ; gfx
	tx GloomName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db GLOOM
	db 70 ; hp
	db STAGE1 ; stage
	tx OddishName ; pre-evo name

	; attack 1
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx FoulStenchName ; name
	tx IfHeadsCFNAndPSNDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayConfuseAndPoisonEffectCommands ; effect commands
	db INFLICT_POISON | INFLICT_CONFUSION ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE ; animation

	; attack 2
	energy GRASS, 2 ; energies
	tx MegaDrainName ; name
	tx HealHalfDamageDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw HealHalfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_DRAIN ; animation

	db 1 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx WeedName ; category
	db 44 ; Pokedex number
	db 0
	db 28 ; level
	db 2, 7 ; length
	dw 19 * 10 ; weight
	tx GloomDescription ; description
	db 0

VileplumeCard: ; 311f7 (c:51f7)
	db TYPE_PKMN_GRASS ; type
	gfx VileplumeCardGfx ; gfx
	tx VileplumeName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db VILEPLUME
	db 90 ; hp
	db STAGE2 ; stage
	tx GloomName ; pre-evo name

	; attack 1
	energy GRASS, 2 ; energies
	tx PoisonPowderName ; name
	tx InflictPoisonDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw InflictPoisonEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POWDER_HIT_POISON ; animation

	; attack 2
	energy GRASS, 3 ; energies
	tx PetalDanceName ; name
	tx TripleAttackX40AndCFNDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_X ; category
	dw Do40x3ThenSelfConfuseEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PETAL_DANCE ; animation

	db 2 ; retreat cost
	db WR_FIRE ; weakness
	db WR_WATER ; resistance
	tx FlowerName ; category
	db 45 ; Pokedex number
	db 0
	db 33 ; level
	db 3, 11 ; length
	dw 41 * 10 ; weight
	tx VileplumeDescription ; description
	db 19

BellossomCard: ; 31238 (c:5238)
	db TYPE_PKMN_GRASS ; type
	gfx BellossomCardGfx ; gfx
	tx BellossomName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db BELLOSSOM
	db 90 ; hp
	db STAGE2 ; stage
	tx GloomName ; pre-evo name

	; attack 1
	energy GRASS, 2 ; energies
	tx MegaDrainName ; name
	tx HealHalfDamageDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw HealHalfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_DRAIN ; animation

	; attack 2
	energy GRASS, 2, COLORLESS, 1 ; energies
	tx FlowerDanceName ; name
	tx Do10MorePerYourBenchedDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw Do10MorePerSelfBenchEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PETAL_DANCE ; animation

	db 2 ; retreat cost
	db WR_FIRE ; weakness
	db WR_WATER ; resistance
	tx FlowerName ; category
	db 182 ; Pokedex number
	db 0
	db 35 ; level
	db 1, 4 ; length
	dw 12 * 10 ; weight
	tx BellossomDescription ; description
	db 16

HoppipCard: ; 31279 (c:5279)
	db TYPE_PKMN_GRASS ; type
	gfx HoppipCardGfx ; gfx
	tx HoppipName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db HOPPIP
	db 30 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 0 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx CottonweedName ; category
	db 187 ; Pokedex number
	db 0
	db 5 ; level
	db 1, 4 ; length
	dw 1 * 10 ; weight
	tx HoppipDescription ; description
	db 0

SkiploomCard: ; 312ba (c:52ba)
	db TYPE_PKMN_GRASS ; type
	gfx SkiploomCardGfx ; gfx
	tx SkiploomName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db SKIPLOOM
	db 60 ; hp
	db STAGE1 ; stage
	tx HoppipName ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx PoisonPowderName ; name
	tx MayInflictPoisonDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictPoisonEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE ; animation

	; attack 2
	energy GRASS, 1 ; energies
	tx StunDarkDescentName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE ; animation

	db 0 ; retreat cost
	db WR_FIRE ; weakness
	db WR_FIGHTING ; resistance
	tx CottonweedName ; category
	db 188 ; Pokedex number
	db 0
	db 19 ; level
	db 2, 0 ; length
	dw 2 * 10 ; weight
	tx SkiploomDescription ; description
	db 16

JumpluffCard: ; 312fb (c:52fb)
	db TYPE_PKMN_GRASS ; type
	gfx JumpluffCardGfx ; gfx
	tx JumpluffName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db JUMPLUFF
	db 80 ; hp
	db STAGE2 ; stage
	tx SkiploomName ; pre-evo name

	; attack 2
	energy GRASS, 1, ; energies
	tx SleepPowderName ; name
	tx InflictSleepDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw InflictSleepEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE ; animation

	; attack 2
	energy GRASS, 2, ; energies
	tx LeechSeedName ; name
	tx HealEqualToDamageDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw HealEqualToDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_DRAIN ; animation

	db 0 ; retreat cost
	db WR_FIRE ; weakness
	db WR_FIGHTING ; resistance
	tx CottonweedName ; category
	db 189 ; Pokedex number
	db 0
	db 30 ; level
	db 2, 7 ; length
	dw 6 * 10 ; weight
	tx JumpluffDescription ; description
	db 0

SunkernCard: ; 3133c (c:533c)
	db TYPE_PKMN_GRASS ; type
	gfx SunkernCardGfx ; gfx
	tx SunkernName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db SUNKERN
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy GRASS, 2 ; energies
	tx AbsorbName ; name
	tx HealHalfDamageDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw HealHalfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_DRAIN ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx SeedName ; category
	db 191 ; Pokedex number
	db 0
	db 6 ; level
	db 1, 0 ; length
	dw 4 * 10 ; weight
	tx SunkernDescription ; description
	db 16

SunfloraCard: ; 3137d (c:537d)
	db TYPE_PKMN_GRASS ; type
	gfx SunfloraCardGfx ; gfx
	tx SunfloraName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db SUNFLORA
	db 70 ; hp
	db STAGE1 ; stage
	tx SunkernName ; pre-evo name

	; attack 1
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx EnergyGrowthName ; name
	tx SearchEnergyAndAttachDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw SearchAndAttachEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy GRASS, 3 ; energies
	tx SolarBeamName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BEAM ; animation

	db 1 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx SunName ; category
	db 192 ; Pokedex number
	db 0
	db 22 ; level
	db 2, 7 ; length
	dw 19 * 10 ; weight
	tx SunfloraDescription ; description
	db 16

YanmaCard: ; 313be (c:53be)
	db TYPE_PKMN_GRASS ; type
	gfx YanmaCardGfx ; gfx
	tx YanmaName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db YANMA
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx AgilityName ; name
	tx MayGetImmunityDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayGetImmunityEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	; attack 1
	energy GRASS, 1, COLORLESS, 2 ; energies
	tx SonicboomName ; name
	tx DontApplyWRDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw DontApplyWREffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_TEAR ; animation

	db 0 ; retreat cost
	db WR_FIRE ; weakness
	db WR_FIGHTING ; resistance
	tx ClearWingName ; category
	db 193 ; Pokedex number
	db 0
	db 29 ; level
	db 3, 11 ; length
	dw 84 * 10 ; weight
	tx YanmaDescription ; description
	db 0

PinceoCard: ; 313ff (c:53ff)
	db TYPE_PKMN_GRASS ; type
	gfx PinceoCardGfx ; gfx
	tx PinceoName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db PINECO
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx SelfdestructName ; name
	tx Do10toAllBenchand40ToSelfDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw Do10ToAllBenchAnd40ToSelfEffectCommands ; effect commands
	db HIGH_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 60
	db ATK_ANIM_BIG_SELFDESTRUCTION ; animation

	db 2 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx BagwormName ; category
	db 204 ; Pokedex number
	db 0
	db 8 ; level
	db 2, 0 ; length
	dw 16 * 10 ; weight
	tx PinecoDescription ; description
	db 16

ForretressCard: ; 31440 (c:5440)
	db TYPE_PKMN_GRASS ; type
	gfx ForretressCardGfx ; gfx
	tx ForretressName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db FORRETRESS
	db 70 ; hp
	db STAGE1 ; stage
	tx PinceoName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx IroncladName ; name
	tx IroncladDesc ; description
	tx IroncladDescCont ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw IroncladEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy GRASS, 2 ; energies
	tx PinMissileName ; name
	tx TripleAttackX20Description ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_X ; category
	dw CF20X3EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_MULTIPLE_SLASH ; animation

	db 3 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx BagwormName ; category
	db 205 ; Pokedex number
	db 0
	db 38 ; level
	db 3, 11 ; length
	dw 277 * 10 ; weight
	tx ForretressDescription ; description
	db 0

ScytherCard: ; 31481 (c:5481)
	db TYPE_PKMN_GRASS ; type
	gfx ScytherCardGfx ; gfx
	tx ScytherName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db SCYTHER
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx UTurnName ; name
	tx CanSwitchSelfAfterDamageDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw CanSwitchSelfAfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	; attack 2
	energy GRASS, 1, COLORLESS, 2 ; energies
	tx SlashName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SLASH ; animation


	db 0 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx MantisName ; category
	db 123 ; Pokedex number
	db 0
	db 20 ; level
	db 4, 11 ; length
	dw 123 * 10 ; weight
	tx ScytherDescription ; description
	db 19

ScizorCard: ; 314c2 (c:54c2)
	db TYPE_PKMN_GRASS ; type
	gfx ScizorCardGfx ; gfx
	tx ScizorName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db SCIZOR
	db 80 ; hp
	db STAGE1 ; stage
	tx ScytherName ; pre-evo name

	; attack 1
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx SlashName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SLASH ; animation

	; attack 2
	energy GRASS, 2, COLORLESS, 1 ; energies
	tx FuryCutterName ; name
	tx CF10X9Desc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_X ; category
	dw CF10X9EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_MULTIPLE_SLASH ; animation

	db 1 ; retreat cost
	db WR_FIRE ; weakness
	db WR_GRASS ; resistance
	tx PincerName ; category
	db 212 ; Pokedex number
	db 0
	db 33 ; level
	db 5, 11 ; length
	dw 260 * 10 ; weight
	tx ScizorDescription ; description
	db 0

HeracrossCard: ; 31503 (c:5503)
	db TYPE_PKMN_GRASS ; type
	gfx HeracrossCardGfx ; gfx
	tx HeracrossName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db HERACROSS
	db 70 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx FocusEnergyName ; name
	tx HeracrossDoubleDamageDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw HeracrossDoubleDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy GRASS, 2, COLORLESS, 2 ; energies
	tx MegahornName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DRILL ; animation

	db 3 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx SinglehornName ; category
	db 214 ; Pokedex number
	db 0
	db 40 ; level
	db 4, 11 ; length
	dw 119 * 10 ; weight
	tx HeracrossDescription ; description
	db 19

CelebiSCard: ; 31544 (c:5544)
	db TYPE_PKMN_GRASS ; type
	gfx CelebiSCardGfx ; gfx
	tx CelebiName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db CELEBI_S
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx AbsorbName ; name
	tx Heal1DamageifSuccessDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw Heal1DamageifSuccessEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_DRAIN ; animation

	; attack 2
	energy GRASS, 1, PSYCHIC, 1 ; energies
	tx MysticalLeafName ; name
	tx HeadsPSNTailsCFNDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw HeadsPSNTailsCFNEffectCommands ; effect commands
	db INFLICT_POISON | INFLICT_CONFUSION ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PETAL_DANCE ; animation

	db 1 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx TimeTravelName ; category
	db 251 ; Pokedex number
	db 0
	db 53 ; level
	db 2, 0 ; length
	dw 11 * 10 ; weight
	tx CelebiSDescription ; description
	db 16

MagbyCard: ; 31585 (c:5585)
	db TYPE_PKMN_FIRE ; type
	gfx MagbyCardGfx ; gfx
	tx MagbyName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db MAGBY
	db 30 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx SmokescreenName ; name
	tx DPMayDoNothingDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw SmokescreenEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DARK_GAS ; animation

	; attack 2
	energy FIRE, 1 ; energies
	tx FlareName ; name
	tx Retrieve2DiscardedEnergyDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Retrieve2DiscardedEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 10
	db ATK_ANIM_ENERGY_CONVERSION ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db NONE ; resistance
	tx LiveCoalName ; category
	db 240 ; Pokedex number
	db 0
	db 5 ; level
	db 2, 4 ; length
	dw 47 * 10 ; weight
	tx MagbyDescription ; description
	db 0

MagmarCard: ; 315c6 (c:55c6)
	db TYPE_PKMN_FIRE ; type
	gfx MagmarCardGfx ; gfx
	tx MagmarName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db MAGMAR
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIRE, 1 ; energies
	tx SmokescreenName ; name
	tx DPMayDoNothingDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw SmokescreenEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DARK_GAS ; animation

	; attack 1
	energy FIRE, 1, COLORLESS, 1 ; energies
	tx FirePunchName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_FIRE_PUNCH ; animation

	db 2 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx SpitfireName ; category
	db 126 ; Pokedex number
	db 0
	db 21 ; level
	db 4, 3 ; length
	dw 98 * 10 ; weight
	tx MagmarDescription ; description
	db 19

Cyndaquil1Card: ; 31607 (c:5607)
	db TYPE_PKMN_FIRE ; type
	gfx Cyndaquil1CardGfx ; gfx
	tx CyndaquilName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db CYNDAQUIL1
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIRE, 1 ; energies
	tx BurnName ; name
	tx Mill1CardIfSuccessDesc; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw Mill1OppCardEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SMALL_FLAME ; animation

	; attack 2
	energy FIRE, 1, COLORLESS, 1 ; energies
	tx SwiftName ; name
	tx DontApplyWRDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw DontApplyWREffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_CONFUSE_RAY ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx FireMouseName ; category
	db 155 ; Pokedex number
	db 0
	db 14 ; level
	db 1, 8 ; length
	dw 17 * 10 ; weight
	tx Cyndaquil1Description ; description
	db 0

Cyndaquil2Card: ; 31648 (c:5648)
	db TYPE_PKMN_FIRE ; type
	gfx Cyndaquil2CardGfx ; gfx
	tx CyndaquilName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db CYNDAQUIL2
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy FIRE, 1, COLORLESS, 1 ; energies
	tx EmberName ; name
	tx Discard1FDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw Discard1FireEffectCommands ; effect commands
	db NONE ; flags 1
	db DISCARD_ENERGY ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_SMALL_FLAME ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx FireMouseName ; category
	db 155 ; Pokedex number
	db 0
	db 12 ; level
	db 1, 8 ; length
	dw 17 * 10 ; weight
	tx Cyndaquil2Description ; description
	db 18

Quilava1Card: ; 31689 (c:5689)
	db TYPE_PKMN_FIRE ; type
	gfx Quilava1CardGfx ; gfx
	tx QuilavaName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db QUILAVA1
	db 70 ; hp
	db STAGE1 ; stage
	tx CyndaquilName ; pre-evo name

	; attack 1
	energy FIRE, 2 ; energies
	tx EmberName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_SMALL_FLAME ; animation

	; attack 2
	energy FIRE, 2, COLORLESS, 1 ; energies
	tx FireSpinName ; name
	tx DamageAndDo10ToABenchDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw DamageAndDo10ToABenchEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_FIRE_SPIN ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx VolcanoName ; category
	db 156 ; Pokedex number
	db 0
	db 21 ; level
	db 2, 11 ; length
	dw 42 * 10 ; weight
	tx Quilava1Description ; description
	db 0

Quilava2Card: ; 316ca (c:56ca)
	db TYPE_PKMN_FIRE ; type
	gfx Quilava2CardGfx ; gfx
	tx QuilavaName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db QUILAVA2
	db 60 ; hp
	db STAGE1 ; stage
	tx CyndaquilName ; pre-evo name

	; attack 1
	energy FIRE, 1 ; energies
	tx BurnName ; name
	tx Mill3IfSuccessDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw Mill3OppCardsEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SMALL_FLAME ; animation

	; attack 2
	energy FIRE, 3 ; energies
	tx FlameWheelName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_FIRE_SPIN ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx VolcanoName ; category
	db 156 ; Pokedex number
	db 0
	db 28 ; level
	db 2, 11 ; length
	dw 42 * 10 ; weight
	tx Quilava2Description ; description
	db 16

Typhlosion1Card: ; 3170b (c:570b)
	db TYPE_PKMN_FIRE ; type
	gfx Typhlosion1CardGfx ; gfx
	tx TyphlosionName ; name
	db STAR ; rarity
	db COLOSSEUM| NONE ; sets
	db TYPHLOSION1
	db 100 ; hp
	db STAGE2 ; stage
	tx QuilavaName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx FireBoostName ; name
	tx FireBoostDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw Get4FireFromDeckEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_FIREGIVER ; animation

	; attack 2
	energy FIRE, 4 ; energies
	tx EruptionName ; name
	tx Minus10PerSelfDamageDesc ; description
	dw NONE ; description (cont)
	db 100 ; damage
	db DAMAGE_MINUS ; category
	dw Do10LessPerSelfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_7 ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_FLAME ; animation

	db 2 ; retreat cost
	db WR_WATER ; weakness
	db WR_GRASS ; resistance
	tx VolcanoName ; category
	db 157 ; Pokedex number
	db 0
	db 58 ; level
	db 5, 7 ; length
	dw 175 * 10 ; weight
	tx Typhlosion1Description ; description
	db 0

Typhlosion2Card: ; 3174c (c:574c)
	db TYPE_PKMN_FIRE ; type
	gfx Typhlosion2CardGfx ; gfx
	tx TyphlosionName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db TYPHLOSION2
	db 90 ; hp
	db STAGE2 ; stage
	tx QuilavaName ; pre-evo name

	; attack 1
	energy FIRE, 1 ; energies
	tx BurnName ; name
	tx Mill3IfSuccessDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw Mill3OppCardsEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SMALL_FLAME ; animation

	; attack 2
	energy FIRE, 2 ; energies
	tx FuriousFlamesName ; name
	tx Discard2FThenPlus10PerSelfDamageDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_PLUS ; category
	dw Discard2FThenPlus10PerSelfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db DISCARD_ENERGY ; flags 2
	db BOOST_IF_TAKEN_DAMAGE ; flags 3
	db 6
	db ATK_ANIM_FIRE_SPIN ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db WR_GRASS ; resistance
	tx VolcanoName ; category
	db 157 ; Pokedex number
	db 0
	db 49 ; level
	db 5, 7 ; length
	dw 175 * 10 ; weight
	tx Typhlosion2Description ; description
	db 0

SlugmaCard: ; 3178d (c:578d)
	db TYPE_PKMN_FIRE ; type
	gfx SlugmaCardGfx ; gfx
	tx SlugmaName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db SLUGMA
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIRE, 2 ; energies
	tx EmberName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SMALL_FLAME ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 2 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx LavaName ; category
	db 218 ; Pokedex number
	db 0
	db 15 ; level
	db 2, 4 ; length
	dw 77 * 10 ; weight
	tx SlugmaDescription ; description
	db 0

MagcargoCard: ; 317ce (c:57ce)
	db TYPE_PKMN_FIRE ; type
	gfx MagcargoCardGfx ; gfx
	tx MagcargoName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db MAGCARGO
	db 80 ; hp
	db STAGE1 ; stage
	tx SlugmaName ; pre-evo name

	; attack 1
	energy FIRE, 1 ; energies
	tx FlareName ; name
	tx Retrieve2DiscardedEnergyDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Retrieve2DiscardedEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 10
	db ATK_ANIM_ENERGY_CONVERSION ; animation

	; attack 2
	energy FIRE, 2, COLORLESS, 1 ; energies
	tx FireSpinName ; name
	tx Do20ToABenchDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw Do20ToABenchEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_FIRE_SPIN ; animation

	db 3 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx LavaName ; category
	db 219 ; Pokedex number
	db 0
	db 33 ; level
	db 2, 7 ; length
	dw 121 * 10 ; weight
	tx MagcargoDescription ; description
	db 0

Houndour1Card: ; 3180f (c:580f)
	db TYPE_PKMN_FIRE ; type
	gfx Houndour1CardGfx ; gfx
	tx HoundourName ; name
	db CIRCLE; rarity
	db EVOLUTION | NONE ; sets
	db HOUNDOUR1
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIRE, 1 ; energies
	tx SmogName ; name
	tx MayInflictPoisonDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictPoisonEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SMOG ; animation

	; attack 2
	energy FIRE, 1, COLORLESS, 1 ; energies
	tx EmberName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SMALL_FLAME ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx DarkName ; category
	db 228 ; Pokedex number
	db 0
	db 16 ; level
	db 2, 0 ; length
	dw 23 * 10 ; weight
	tx Houndour1Description ; description
	db 0

Houndour2Card: ; 31850 (c:5850)
	db TYPE_PKMN_FIRE ; type
	gfx Houndour2CardGfx ; gfx
	tx HoundourName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db HOUNDOUR2
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx BiteName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 1
	energy FIRE, 1, COLORLESS, 1 ; energies
	tx ThreatenName ; name
	tx NoTrainersDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NoOppTrainersEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_DARK_MIND ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db WR_PSYCHIC ; resistance
	tx DarkName ; category
	db 228 ; Pokedex number
	db 0
	db 22 ; level
	db 2, 0 ; length
	dw 23 * 10 ; weight
	tx Houndour2Description ; description
	db 21

HoundoomCard: ; 31891 (c:5891)
	db TYPE_PKMN_FIRE ; type
	gfx HoundoomCardGfx ; gfx
	tx HoundoomName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db HOUNDOOM
	db 70 ; hp
	db STAGE1 ; stage
	tx HoundourName ; pre-evo name

	; attack 1
	energy FIRE, 1, COLORLESS, 1 ; energies
	tx BurnName ; name
	tx Mill3IfSuccessDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw Mill3OppCardsEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SMALL_FLAME ; animation

	; attack 2
	energy FIRE, 2, COLORLESS, 1 ; energies
	tx MidnightBlazeName ; name
	tx Do10MorePerOppDamageDesc ; description
	dw NONE ; description (cont)
	db 30 ;damage
	db DAMAGE_PLUS ; category
	dw Do10MorePerOppDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_FIRE_SPIN ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db WR_PSYCHIC ; resistance
	tx DarkName ; category
	db 229 ; Pokedex number
	db 0
	db 44 ; level
	db 4, 7 ; length
	dw 77 * 10 ; weight
	tx HoundoomDescription ; description
	db 18

Entei1Card: ; 318d2 (c:58d2)
	db TYPE_PKMN_FIRE ; type
	gfx Entei1CardGfx ; gfx
	tx EnteiName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db ENTEI1
	db 70 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx EnergyBurnName ; name
	tx EnergyBurnDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw AllEnergyIsFireEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy FIRE, 3 ; energies
	tx FireSpinName ; name
	tx Discard2FDescription ; description
	dw NONE ; description (cont)
	db 60 ; damage
	db DAMAGE_NORMAL ; category
	dw Discard2FireEffectCommands ; effect commands
	db NONE ; flags 1
	db DISCARD_ENERGY ; flags 2
	db NONE ; flags 3
	db 6
	db ATK_ANIM_FIRE_SPIN ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx VolcanoName ; category
	db 244 ; Pokedex number
	db 0
	db 45 ; level
	db 6, 11 ; length
	dw 436 * 10 ; weight
	tx Entei1Description ; description
	db 0

Entei2Card: ; 31913 (c:5913)
	db TYPE_PKMN_FIRE ; type
	gfx Entei2CardGfx ; gfx
	tx EnteiName ; name
	db PROMOSTAR ; rarity
	db PROMOTIONAL | NONE ; sets
	db ENTEI2
	db 70 ; hp
	db BASIC ; stage
	dw NONE; pre-evo name

	; attack 1
	energy 0 ; energies
	tx StepInName ; name
	tx StepInDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw StepInEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy FIRE, 3 ; energies
	tx ProtectiveFlameName ; name
	tx MayGetImmunityDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw Entei2MayGetImmunityEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_FLAME ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx VolcanoName ; category
	db 244 ; Pokedex number
	db 0
	db 60 ; level
	db 6, 11 ; length
	dw 436 * 10 ; weight
	tx Entei2Description ; description
	db 18

HoohCard: ; 31954 (c:5954)
	db TYPE_PKMN_FIRE ; type
	gfx HoohCardGfx ; gfx
	tx HoohName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db HOOH
	db 80 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIRE, 3 ; energies
	tx SacredFireName ; name
	tx Do30toaBenchDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Do30ToABenchEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy FIRE, 5 ; energies
	tx DiveBombName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 80 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DIVE_BOMB ; animation

	db 3 ; retreat cost
	db WR_WATER ; weakness
	db WR_FIGHTING ; resistance
	tx RainbowName ; category
	db 250 ; Pokedex number
	db 0
	db 77 ; level
	db 12, 6 ; length
	dw 438 * 10 ; weight
	tx HoohDescription ; description
	db 0

GrowlitheCard: ; 31995 (c:5995)
	db TYPE_PKMN_FIRE ; type
	gfx GrowlitheCardGfx ; gfx
	tx GrowlitheName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db GROWLITHE
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RoarName ; name
	tx SwitchAfterDamageDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw SwitchOppAfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db SWITCH_OPPONENT_POKEMON ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SUPERSONIC ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx BiteName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx PuppyName ; category
	db 58 ; Pokedex number
	db 0
	db 15 ; level
	db 2, 4 ; length
	dw 42 * 10 ; weight
	tx GrowlitheDescription ; description
	db 16

ArcanineCard: ; 319d6 (c:59d6)
	db TYPE_PKMN_FIRE ; type
	gfx ArcanineCardGfx ; gfx
	tx ArcanineName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db ARCANINE
	db 90 ; hp
	db STAGE1 ; stage
	tx GrowlitheName ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx ExtremespeedName ; name
	tx CanSwitchDPBeforeDamageDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw CanSwitchOppBeforeDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db SWITCH_OPPONENT_POKEMON ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK; animation

	; attack 1
	energy FIRE, 1, COLORLESS, 2; energies
	tx FlameTailName ; name
	tx CFHPlus30DamageDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_PLUS ; category
	dw MayDo30MoreEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_FLAME ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx LegendaryName ; category
	db 59 ; Pokedex number
	db 0
	db 40 ; level
	db 6, 3 ; length
	dw 342 * 10 ; weight
	tx ArcanineDescription ; description
	db 0

FlareonCard: ; 31a17 (c:5a17)
	db TYPE_PKMN_FIRE ; type
	gfx FlareonCardGfx ; gfx
	tx FlareonName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db FLAREON
	db 80 ; hp
	db STAGE1 ; stage
	tx EeveeName ; pre-evo name

	; attack 1
	energy FIRE, 1 ; energies
	tx FlareName ; name
	tx Retrieve2DiscardedEnergyDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Retrieve2DiscardedEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 10
	db ATK_ANIM_ENERGY_CONVERSION ; animation

	; attack 2
	energy FIRE, 2, COLORLESS, 1 ; energies
	tx FlamethrowerName ; name
	tx CharmeleonsFlamethrowerDescription ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw Discard1FireEffectCommands ; effect commands
	db NONE ; flags 1
	db DISCARD_ENERGY ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_BIG_FLAME ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx FlameName ; category
	db 136 ; Pokedex number
	db 0
	db 34 ; level
	db 2, 11 ; length
	dw 55 * 10 ; weight
	tx FlareonDescription ; description
	db 0

CharmanderCard: ; 31a58 (c:5a58)
	db TYPE_PKMN_FIRE ; type
	gfx CharmanderCardGfx ; gfx
	tx CharmanderName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db CHARMANDER
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx GrowlName ; name
	tx ReduceDamageBy10Desc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw ReduceDamageBy10EffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_SUPERSONIC ; animation

	; attack 2
	energy FIRE, 1, COLORLESS, 1 ; energies
	tx EmberName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_SMALL_FLAME ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx LizardName ; category
	db 4 ; Pokedex number
	db 0
	db 15 ; level
	db 2, 0 ; length
	dw 19 * 10 ; weight
	tx CharmanderDescription ; description
	db 0

CharmeleonCard: ; 31a99 (c:5a99)
	db TYPE_PKMN_FIRE ; type
	gfx CharmeleonCardGfx ; gfx
	tx CharmeleonName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db CHARMELEON
	db 70 ; hp
	db STAGE1 ; stage
	tx CharmanderName ; pre-evo name

	; attack 1
	energy FIRE, 1, COLORLESS, 1 ; energies
	tx SmokescreenName ; name
	tx OpponentAttackMayDoNothingDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw SmokescreenEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DARK_GAS ; animation

	; attack 2
	energy FIRE, 1, COLORLESS, 2 ; energies
	tx FlameTailName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_FLAME ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx FlameName ; category
	db 5 ; Pokedex number
	db 0
	db 28 ; level
	db 3, 7 ; length
	dw 42 * 10 ; weight
	tx CharmeleonDescription ; description
	db 16

CharizardSCard: ; 31ada (c:5ada)
	db TYPE_PKMN_FIRE ; type
	gfx CharizardSCardGfx ; gfx
	tx CharizardName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db CHARIZARD_S
	db 120 ; hp
	db STAGE2 ; stage
	tx CharmeleonName ; pre-evo name

	; attack 1
	energy COLORLESS, 3 ; energies
	tx SlashName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SLASH ; animation

	; attack 2
	energy FIRE, 1, LIGHTNING, 1, COLORLESS, 2 ; energies
	tx SearingFlameName ; name
	tx Do40ToSelfDesc ; description
	dw NONE ; description (cont)
	db 100 ; damage
	db DAMAGE_NORMAL ; category
	dw Do40ToSelfEffectCommands ; effect commands
	db LOW_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 40
	db ATK_ANIM_FIRE_SPIN ; animation

	db 3 ; retreat cost
	db WR_WATER ; weakness
	db WR_GRASS ; resistance
	tx FlameName ; category
	db 6 ; Pokedex number
	db 0
	db 80 ; level
	db 5, 7 ; length
	dw 199 * 10 ; weight
	tx CharizardSDescription ; description
	db 0

OmanyteCard: ; 31b1b (c:5b1b)
	db TYPE_PKMN_WATER ; type
	gfx OmanyteCardGfx ; gfx
	tx OmanyteName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db OMANYTE
	db 70 ; hp
	db STAGE1 ; stage
	tx FossilEggName ; pre-evo name

	; attack 1
	energy WATER, 1 ; energies
	tx WrapName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 1
	energy WATER, 1, COLORLESS, 1 ; energies
	tx WaterGunName ; name
	tx Do10MorePerWaterEnergyMax20Desc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw WEWaterBoostEffectCommands ; effect commands
	db NONE ; flags 1
	db ATTACHED_ENERGY_BOOST ; flags 2
	db NONE ; flags 3
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx SpiralName ; category
	db 138 ; Pokedex number
	db 0
	db 21 ; level
	db 1, 4 ; length
	dw 16 * 10 ; weight
	tx OmanyteDescription ; description
	db 0

OmastarCard: ; 31b5c (c:5b5c)
	db TYPE_PKMN_WATER ; type
	gfx OmastarCardGfx ; gfx
	tx OmastarName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db OMASTAR
	db 90 ; hp
	db STAGE2 ; stage
	tx OmanyteName ; pre-evo name

	; attack 1
	energy WATER, 1, COLORLESS, 1 ; energies
	tx AncientpowerName ; name
	tx CantUse1AttackDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw OppCantUse1AttackEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_AMNESIA ; animation

	; attack 2
	energy WATER, 2, COLORLESS, 1 ; energies
	tx HydroPumpName ; name
	tx Do10MorePerWaterEnergyMax20Desc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_PLUS ; category
	dw WWEWaterBoostEffectCommands ; effect commands
	db NONE ; flags 1
	db ATTACHED_ENERGY_BOOST ; flags 2
	db NONE ; flags 3
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_HYDRO_PUMP ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx SpiralName ; category
	db 139 ; Pokedex number
	db 0
	db 37 ; level
	db 3, 3 ; length
	dw 77 * 10 ; weight
	tx OmastarDescription ; description
	db 3

KabutoCard: ; 31b9d (c:5b9d)
	db TYPE_PKMN_WATER ; type
	gfx KabutoCardGfx ; gfx
	tx KabutoName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db KABUTO
	db 70 ; hp
	db STAGE1 ; stage
	tx FossilEggName ; pre-evo name

	; attack 1
	energy WATER, 1 ; energies
	tx WaterGunName ; name
	tx Do10MorePerWaterEnergyMax20Desc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw WWaterBoostEffectCommands ; effect commands
	db NONE ; flags 1
	db ATTACHED_ENERGY_BOOST ; flags 2
	db NONE ; flags 3
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN ; animation

	; attack 2
	energy WATER, 1, COLORLESS, 1 ; energies
	tx ScratchName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SLASH ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx ShellfishName ; category
	db 140 ; Pokedex number
	db 0
	db 18 ; level
	db 1, 8 ; length
	dw 25 * 10 ; weight
	tx KabutoDescription ; description
	db 0

KabutopsCard: ; 31bde (c:5bde)
	db TYPE_PKMN_WATER ; type
	gfx KabutopsCardGfx ; gfx
	tx KabutopsName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db KABUTOPS
	db 90 ; hp
	db STAGE1 ; stage
	tx KabutoName ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx SlashName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SLASH ; animation

	; attack 2
	energy WATER, 1 ; energies
	tx HydrocutterName ; name
	tx CF30PerSelfEnergyDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_X ; category
	dw CF30PerSelfEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db ATTACHED_ENERGY_BOOST ; flags 2
	db NONE ; flags 3
	db MAX_ENERGY_BOOST_IS_NOT_LIMITED
	db ATK_ANIM_MULTIPLE_SLASH ; animation

	db 2 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx ShellfishName ; category
	db 141 ; Pokedex number
	db 0
	db 46 ; level
	db 4, 3 ; length
	dw 89 * 10 ; weight
	tx KabotopsDescription ; description
	db 0

VaporeonCard: ; 31c1f (c:5c1f)
	db TYPE_PKMN_WATER ; type
	gfx VaporeonCardGfx ; gfx
	tx VaporeonName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db VAPOREON
	db 90 ; hp
	db STAGE1 ; stage
	tx EeveeName ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx SandAttackName ; name
	tx OpponentAttackMayDoNothingDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw SmokescreenEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DARK_GAS ; animation

	; attack 2
	energy WATER, 2 ; energies
	tx SurfName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WATER_JETS ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx BubbleJetName ; category
	db 134 ; Pokedex number
	db 0
	db 29 ; level
	db 3, 3 ; length
	dw 63 * 10 ; weight
	tx VaporeonDescription ; description
	db 0

Totodile1Card: ; 31c60 (c:5c60)
	db TYPE_PKMN_WATER ; type
	gfx Totodile1CardGfx ; gfx
	tx TotodileName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db TOTODILE1
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx BiteName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy WATER, 1, COLORLESS, 1 ; energies
	tx RageName ; name
	tx Do10MorePerSelfDamageDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw Do10MorePerSelfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db BOOST_IF_TAKEN_DAMAGE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx BigJawName ; category
	db 158 ; Pokedex number
	db 0
	db 14 ; level
	db 2, 0 ; length
	dw 21 * 10 ; weight
	tx Totodile1Description ; description
	db 0

Totodile2Card: ; 31ca1 (c:5ca1)
	db TYPE_PKMN_WATER ; type
	gfx Totodile2CardGfx ; gfx
	tx TotodileName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db TOTODILE2
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy WATER, 1 ; energies
	tx WaterGunName ; name
	tx Do10MorePerWaterEnergyMax20Desc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw WWaterBoostEffectCommands ; effect commands
	db NONE ; flags 1
	db ATTACHED_ENERGY_BOOST ; flags 2
	db NONE ; flags 3
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx BigJawName ; category
	db 158 ; Pokedex number
	db 0
	db 10 ; level
	db 2, 0 ; length
	dw 21 * 10 ; weight
	tx Totodile2Description ; description
	db 21

Croconaw1Card: ; 31ce2 (c:5ce2)
	db TYPE_PKMN_WATER ; type
	gfx Croconaw1CardGfx ; gfx
	tx CroconawName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db CROCONAW1
	db 70 ; hp
	db STAGE1 ; stage
	tx TotodileName ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx BiteName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy WATER, 2, COLORLESS, 1 ; energies
	tx ClampName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 2 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx BigJawName ; category
	db 159 ; Pokedex number
	db 0
	db 26 ; level
	db 3, 7 ; length
	dw 55 * 10 ; weight
	tx Croconaw1Description ; description
	db 18

Croconaw2Card: ; 31d23 (c:5d23)
	db TYPE_PKMN_WATER ; type
	gfx Croconaw2CardGfx ; gfx
	tx CroconawName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db CROCONAW2
	db 70 ; hp
	db STAGE1 ; stage
	tx TotodileName ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx PounceName ; name
	tx PounceDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw ReduceDamageBy10EffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy WATER, 2, COLORLESS, 1 ; energies
	tx TakeDownName ; name
	tx Do20toSelfDesc ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw Do20ToSelfEffectCommands ; effect commands
	db LOW_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 20
	db ATK_ANIM_HIT_RECOIL ; animation

	db 2 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx BigJawName ; category
	db 159 ; Pokedex number
	db 0
	db 29 ; level
	db 3, 7 ; length
	dw 55 * 10 ; weight
	tx Croconaw2Description ; description
	db 0

Feraligatr1Card: ; 31d64 (c:5d64)
	db TYPE_PKMN_WATER ; type
	gfx Feraligatr1CardGfx ; gfx
	tx FeraligatrName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db FERALIGATR1
	db 100 ; hp
	db STAGE2 ; stage
	tx CroconawName ; pre-evo name

	; attack 1
	energy WATER, 1, COLORLESS, 1 ; energies
	tx ClampName ; name
	tx PounceDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw ReduceDamageBy10EffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy WATER, 3, COLORLESS, 1 ; energies
	tx RampageName ; name
	tx Do10MorePerSelfDamageDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw Do10MorePerSelfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db BOOST_IF_TAKEN_DAMAGE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 3 ; retreat cost
	db WR_GRASS ; weakness
	db WR_FIRE ; resistance
	tx BigJawName ; category
	db 160 ; Pokedex number
	db 0
	db 58 ; level
	db 7, 7 ; length
	dw 195 * 10 ; weight
	tx Feraligatr1Description ; description
	db 19

Feraligatr2Card: ; 31da5 (c:5da5)
	db TYPE_PKMN_WATER ; type
	gfx Feraligatr2CardGfx ; gfx
	tx FeraligatrName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db FERALIGATR2
	db 90 ; hp
	db STAGE2 ; stage
	tx CroconawName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx ScareName ; name
	tx ScareDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw NoPokePowersEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy WATER, 2, COLORLESS, 1 ; energies
	tx WhirlpoolName ; name
	tx Discard1EnergyFromTargetDescription ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw Discard1EnergyFromTargetEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_WHIRLPOOL ; animation

	db 3 ; retreat cost
	db WR_GRASS ; weakness
	db WR_FIRE ; resistance
	tx BigJawName ; category
	db 160 ; Pokedex number
	db 0
	db 55 ; level
	db 7, 7 ; length
	dw 195 * 10 ; weight
	tx Feraligatr2Description ; description
	db 3

Marill1Card: ; 31de6 (c:5de6)
	db TYPE_PKMN_WATER ; type
	gfx Marill1CardGfx ; gfx
	tx MarillName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db MARILL1
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx CurlUpName ; name
	tx PreventDamageButNotEffectsDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw MayPreventDamageOnlyEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	; attack 2
	energy WATER, 2 ; energies
	tx BubbleName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BUBBLES ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx AquamouseName ; category
	db 183 ; Pokedex number
	db 0
	db 13 ; level
	db 1, 4 ; length
	dw 18 * 10 ; weight
	tx Marill1Description ; description
	db 19

Marill2Card: ; 31e27 (c:5e27)
	db TYPE_PKMN_WATER ; type
	gfx Marill2CardGfx ; gfx
	tx MarillName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db MARILL2
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy WATER, 1 ; energies
	tx BubbleName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BUBBLES ; animation

	; attack 2
	energy WATER, 1 ; energies
	tx WaterGunName ; name
	tx Do10MorePerWaterEnergyMax20Desc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw WWaterBoostEffectCommands ; effect commands
	db NONE ; flags 1
	db ATTACHED_ENERGY_BOOST ; flags 2
	db NONE ; flags 3
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx AquamouseName ; category
	db 183 ; Pokedex number
	db 0
	db 14 ; level
	db 1, 4 ; length
	dw 18 * 10 ; weight
	tx Marill2Description ; description
	db 16

Azumarill1Card: ; 31e68 (c:5e68)
	db TYPE_PKMN_WATER ; type
	gfx Azumarill1CardGfx ; gfx
	tx AzumarillName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db AZUMARILL1
	db 80 ; hp
	db STAGE1 ; stage
	tx MarillName ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy WATER, 3 ; energies
	tx BubbleShowerName ; name
	tx MayDo10toOppsBenchandPRZDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayDo10ToOppBenchAndPRZEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BUBBLES ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db WR_FIRE ; resistance
	tx AquarabbitName ; category
	db 184 ; Pokedex number
	db 0
	db 38 ; level
	db 2, 7 ; length
	dw 63 * 10 ; weight
	tx Azumarill1Description ; description
	db 0

Azumarill2Card: ; 31ea9 (c:5ea9)
	db TYPE_PKMN_WATER ; type
	gfx Azumarill2CardGfx ; gfx
	tx AzumarillName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db AZUMARILL2
	db 80 ; hp
	db STAGE1 ; stage
	tx MarillName ; pre-evo name

	; attack 1
	energy WATER, 1, COLORLESS, 1 ; energies
	tx AmnesiaName ; name
	tx CantUse1AttackDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw OppCantUse1AttackEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_AMNESIA ; animation

	; attack 2
	energy WATER, 1, COLORLESS, 2 ; energies
	tx AquaJetName ; name
	tx CanSwitchSelfAfterDamageDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw CanSwitchSelfAfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_WATER_JETS ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db WR_FIRE ; resistance
	tx AquarabbitName ; category
	db 184 ; Pokedex number
	db 0
	db 31 ; level
	db 2, 7 ; length
	dw 63 * 10 ; weight
	tx Azumarill2Description ; description
	db 19

PoliwagCard: ; 31eea (c:5eea)
	db TYPE_PKMN_WATER ; type
	gfx PoliwagCardGfx ; gfx
	tx PoliwagName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db POLIWAG
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy WATER, 1 ; energies
	tx HypnosisName ; name
	tx InflictSleepDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw InflictSleepEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HYPNOSIS ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx TadpoleName ; category
	db 60 ; Pokedex number
	db 0
	db 9 ; level
	db 2, 0 ; length
	dw 27 * 10 ; weight
	tx PoliwagDescription ; description
	db 0

PoliwhirlCard: ; 31f2b (c:5f2b)
	db TYPE_PKMN_WATER ; type
	gfx PoliwhirlCardGfx ; gfx
	tx PoliwhirlName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db POLIWHIRL
	db 70 ; hp
	db STAGE1 ; stage
	tx PoliwagName ; pre-evo name

	; attack 1
	energy WATER, 1 ; energies
	tx BubbleName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BUBBLES ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx MegaPunchName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx TadpoleName ; category
	db 61 ; Pokedex number
	db 0
	db 29 ; level
	db 3, 3 ; length
	dw 44 * 10 ; weight
	tx PoliwhirlDescription ; description
	db 19

PolitoedCard: ; 31f6c (c:5f6c)
	db TYPE_PKMN_WATER ; type
	gfx PolitoedCardGfx ; gfx
	tx PolitoedName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db POLITOED
	db 100 ; hp
	db STAGE2 ; stage
	tx PoliwhirlName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RainDanceName ; name
	tx RainDanceDescription ; description
	tx RainDanceDescriptionCont ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw RainDanceEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 1
	energy WATER, 3 ; energies
	tx SurfName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WATER_JETS ; animation

	db 2 ; retreat cost
	db WR_GRASS ; weakness
	db WR_FIRE ; resistance
	tx FrogName ; category
	db 186 ; Pokedex number
	db 0
	db 50 ; level
	db 3, 7 ; length
	dw 74 * 10 ; weight
	tx PolitoedDescription ; description
	db 0

WooperCard: ; 31fad (c:5fad)
	db TYPE_PKMN_WATER ; type
	gfx WooperCardGfx ; gfx
	tx WooperName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db WOOPER
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx SandAttackName ; name
	tx OpponentAttackMayDoNothingDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw SmokescreenEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DARK_GAS ; animation

	; attack 1
	energy COLORLESS, 2 ; energies
	tx HeadbuttName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx WaterFishName ; category
	db 194 ; Pokedex number
	db 0
	db 15 ; level
	db 1, 4 ; length
	dw 18 * 10 ; weight
	tx WooperDescription ; description
	db 19

QuagsireCard: ; 31fee (c:5fee)
	db TYPE_PKMN_WATER ; type
	gfx QuagsireCardGfx ; gfx
	tx QuagsireName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db QUAGSIRE
	db 80 ; hp
	db STAGE1 ; stage
	tx WooperName ; pre-evo name

	; attack 1
	energy WATER, 1, COLORLESS, 1 ; energies
	tx SurfName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WATER_JETS ; animation

	; attack 2
	energy FIGHTING, 2, COLORLESS, 1 ; energies
	tx EarthquakeName ; name
	tx Do10ToOwnBenchDesc ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw Do10ToOwnBenchEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 2 ; retreat cost
	db WR_GRASS ; weakness
	db WR_LIGHTNING ; resistance
	tx WaterFishName ; category
	db 195 ; Pokedex number
	db 0
	db 33 ; level
	db 4, 7 ; length
	dw 165 * 10 ; weight
	tx QuagsireDescription ; description
	db 0

QwilfishCard: ; 3202f (c:602f)
	db TYPE_PKMN_WATER ; type
	gfx QwilfishCardGfx ; gfx
	tx QwilfishName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db QWILFISH
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy WATER, 1 ; energies
	tx PoisonStingName ; name
	tx MayInflictPoisonDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictPoisonEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NEEDLES ; animation

	; attack 2
	energy WATER, 2 ; energies
	tx StunNeedleName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NEEDLES ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx BalloonName ; category
	db 211 ; Pokedex number
	db 0
	db 18 ; level
	db 1, 8 ; length
	dw 8 * 10 ; weight
	tx QwilfishDescription ; description
	db 16

SneaselCard: ; 32070 (c:6070)
	db TYPE_PKMN_WATER ; type
	gfx SneaselCardGfx ; gfx
	tx SneaselName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db SNEASEL
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx FurySwipesName ; name
	tx TripleAttackX10Description ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_X ; category
	dw CF10X3EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_MULTIPLE_SLASH ; animation

	; attack 2
	energy WATER, 2, COLORLESS, 1 ; energies
	tx BeatUpName ; name
	tx Do10MorePerYourBenchedDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw Do10MorePerSelfBenchEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx SharpClawName ; category
	db 215 ; Pokedex number
	db 0
	db 37 ; level
	db 2, 11 ; length
	dw 62 * 10 ; weight
	tx SneaselDescription ; description
	db 0

RemoraidCard: ; 320b1 (c:60b1)
	db TYPE_PKMN_WATER ; type
	gfx RemoraidCardGfx ; gfx
	tx RemoraidName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db REMORAID
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy WATER, 2 ; energies
	tx SnipeName ; name
	tx Do20ToABenchDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Do20ToOppBenchOnlyEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_NONE ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 0 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx JetName ; category
	db 223 ; Pokedex number
	db 0
	db 18 ; level
	db 2, 0 ; length
	dw 26 * 10 ; weight
	tx RemoraidDescription ; description
	db 19

OctilleryCard: ; 320f2 (c:60f2)
	db TYPE_PKMN_WATER ; type
	gfx OctilleryCardGfx ; gfx
	tx OctilleryName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db OCTILLERY
	db 90 ; hp
	db STAGE1 ; stage
	tx RemoraidName ; pre-evo name

	; attack 1
	energy WATER, 1 ; energies
	tx SmokescreenName ; name
	tx OpponentAttackMayDoNothingDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw SmokescreenEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DARK_GAS ; animation

	; attack 2
	energy WATER, 3 ; energies
	tx HydroPumpName ; name
	tx Do10MorePerWaterEnergyMax20Desc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_PLUS ; category
	dw WWWWaterBoostEffectCommands ; effect commands
	db NONE ; flags 1
	db ATTACHED_ENERGY_BOOST ; flags 2
	db NONE ; flags 3
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_HYDRO_PUMP ; animation

	db 2 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx JetName ; category
	db 224 ; Pokedex number
	db 0
	db 46 ; level
	db 2, 11 ; length
	dw 63 * 10 ; weight
	tx OctilleryDescription ; description
	db 0

MantineCard: ; 32133 (c:6133)
	db TYPE_PKMN_WATER ; type
	gfx MantineCardGfx ; gfx
	tx MantineName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db MANTINE
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name
	
	; attack 1
	energy WATER, 1 ; energies
	tx BubbleName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BUBBLES ; animation

	; attack 2
	energy WATER, 2 ; energies
	tx AgilityName ; name
	tx MayGetImmunityDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayGetImmunityEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db WR_FIGHTING ; resistance
	tx KiteName ; category
	db 226 ; Pokedex number
	db 0
	db 20 ; level
	db 6, 11 ; length
	dw 485 * 10 ; weight
	tx MantineDescription ; description
	db 21

HorseaCard: ; 32174 (c:6174)
	db TYPE_PKMN_WATER ; type
	gfx HorseaCardGfx ; gfx
	tx HorseaName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db HORSEA
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy WATER, 1 ; energies
	tx WaterGunName ; name
	tx Do10MorePerWaterEnergyMax20Desc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw WWaterBoostEffectCommands ; effect commands
	db NONE ; flags 1
	db ATTACHED_ENERGY_BOOST ; flags 2
	db NONE ; flags 3
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN ; animation

	; attack 2
	energy WATER, 2 ; energies
	tx AquaJetName ; name
	tx CanSwitchSelfAfterDamageDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw CanSwitchSelfAfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_WATER_JETS ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx DragonName ; category
	db 116 ; Pokedex number
	db 0
	db 17 ; level
	db 1, 4 ; length
	dw 17 * 10 ; weight
	tx HorseaDescription ; description
	db 0

SeadraCard: ; 321b5 (c:61b5)
	db TYPE_PKMN_WATER ; type
	gfx SeadraCardGfx ; gfx
	tx SeadraName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db SEADRA
	db 70 ; hp
	db STAGE1 ; stage
	tx HorseaName ; pre-evo name

	; attack 1
	energy WATER, 2 ; energies
	tx SnipeName ; name
	tx Do20ToABenchDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Do20ToOppBenchOnlyEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_NONE ; animation

	; attack 2
	energy WATER, 2, COLORLESS, 1 ; energies
	tx WaterGunName ; name
	tx Do10MorePerWaterEnergyMax20Desc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_PLUS ; category
	dw WWEWaterBoostEffectCommands ; effect commands
	db NONE ; flags 1
	db ATTACHED_ENERGY_BOOST ; flags 2
	db NONE ; flags 3
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx DragonName ; category
	db 117 ; Pokedex number
	db 0
	db 34 ; level
	db 3, 11 ; length
	dw 55 * 10 ; weight
	tx SeadraDescription ; description
	db 19

KingdraCard: ; 321f6 (c:61f6)
	db TYPE_PKMN_WATER ; type
	gfx KingdraCardGfx ; gfx
	tx KingdraName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db KINGDRA
	db 100 ; hp
	db STAGE2 ; stage
	tx SeadraName ; pre-evo name

	; attack 1
	energy WATER, 2 ; energies
	tx DragonTornadoName ; name
	tx CanSwitchDPBeforeDamageDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw CanSwitchOppBeforeDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db SWITCH_OPPONENT_POKEMON ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WHIRLWIND ; animation

	; attack 1
	energy WATER, 4 ; energies
	tx WhirlpoolName ; name
	tx Discard1EnergyFromTargetDescription ; description
	dw NONE ; description (cont)
	db 60 ; damage
	db DAMAGE_NORMAL ; category
	dw Discard1EnergyFromTargetEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_WHIRLPOOL ; animation

	db 2 ; retreat cost
	db NONE ; weakness
	db WR_FIRE ; resistance
	tx DragonName ; category
	db 230 ; Pokedex number
	db 0
	db 59 ; level
	db 5, 11 ; length
	dw 335 * 10 ; weight
	tx KingdraDescription ; description
	db 0

SuicuneCard: ; 32237 (c:6237)
	db TYPE_PKMN_WATER ; type
	gfx SuicuneCardGfx ; gfx
	tx SuicuneName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db NOCTOWL_S
	db 70 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx PureBodyName ; name
	tx PureBodyDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw PokepowerNoStatusEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy WATER, 3 ; energies
	tx AuroraBeamName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BEAM ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE; resistance
	tx AuroraName ; category
	db 245 ; Pokedex number
	db 0
	db 47 ; level
	db 6, 7 ; length
	dw 412 * 10 ; weight
	tx SuicuneDescription ; description
	db 0

MagikarpSCard: ; 32278 (c:6278)
	db TYPE_PKMN_WATER ; type
	gfx MagikarpSCardGfx ; gfx
	tx MagikarpName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db MAGIKARP_S
	db 30 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIRE, 1 ; energies
	tx GoldScaleName ; name
	tx MailFromBillDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Draw2EffectCommands ; effect commands
	db DRAW_CARD ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy WATER, 1 ; energies
	tx FlailName ; name
	tx Do10XPerSelfDamageDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_X ; category
	dw Do10XPerSelfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db BOOST_IF_TAKEN_DAMAGE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 0 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx FishName ; category
	db 129 ; Pokedex number
	db 0
	db 19 ; level
	db 2, 11 ; length
	dw 22 * 10 ; weight
	tx MagikarpSDescription ; description
	db 0

GyaradosSCard: ; 322b9 (c:62b9)
	db TYPE_PKMN_WATER ; type
	gfx GyaradosSCardGfx ; gfx
	tx GyaradosName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db GYARADOS_S
	db 100 ; hp
	db STAGE1 ; stage
	tx MagikarpName ; pre-evo name

	; attack 2
	energy WATER, 1, FIRE, 1, COLORLESS, 1 ; energies
	tx RampageName ; name
	tx Do10PerSelfDamageThenMayConfuse ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_PLUS ; category
	dw Do10PerSelfDamageThenMayConfuseEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db BOOST_IF_TAKEN_DAMAGE ; flags 3
	db 0
	db ATK_ANIM_RAMPAGE ; animation

	; attack 2
	energy WATER, 2, FIRE, 2 ; energies
	tx DevastateName ; name
	tx Do20ToAllBench50ToSelfDesc ; description
	dw NONE ; description (cont)
	db 80 ; damage
	db DAMAGE_NORMAL ; category
	dw Do20ToAllBenchAnd50ToSelfEffectCommands ; effect commands
	db HIGH_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 50
	db ATK_ANIM_DRAGON_RAGE ; animation

	db 3 ; retreat cost
	db WR_LIGHTNING ; weakness
	db WR_FIGHTING ; resistance
	tx AtrociousName ; category
	db 130 ; Pokedex number
	db 0
	db 79 ; level
	db 21, 4 ; length
	dw 518 * 10 ; weight
	tx GyaradosSDescription ; description
	db 0

JolteonCard: ; 322fa (c:62fa)
	db TYPE_PKMN_LIGHTNING ; type
	gfx JolteonCardGfx ; gfx
	tx JolteonName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db JOLTEON
	db 70 ; hp
	db STAGE1 ; stage
	tx EeveeName ; pre-evo name

	; attack 1
	energy LIGHTNING, 1 ; energies
	tx EnergyBoostName ; name
	tx SearchEnergyAndAttachDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw SearchAndAttachEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy LIGHTNING, 2 ; energies
	tx StunNeedleName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NEEDLES ; animation

	db 0 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx LightningName ; category
	db 135 ; Pokedex number
	db 0
	db 32 ; level
	db 2, 7 ; length
	dw 54 * 10 ; weight
	tx JolteonDescription ; description
	db 0

Chinchou1Card: ; 3233b (c:633b)
	db TYPE_PKMN_LIGHTNING ; type
	gfx Chinchou1CardGfx ; gfx
	tx ChinchouName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db CHINCHOU1
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy LIGHTNING, 1 ; energies
	tx ThundershockName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERSHOCK ; animation

	; attack 2
	energy LIGHTNING, 1, COLORLESS, 1 ; energies
	tx SparkName ; name
	tx Do10To1BenchDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw DamageAndDo10ToABenchEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_THUNDER_WHOLE_SCREEN ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx AnglerName ; category
	db 170 ; Pokedex number
	db 0
	db 25 ; level
	db 1, 8 ; length
	dw 26 * 10 ; weight
	tx Chinchou1Description ; description
	db 0

Chinchou2Card: ; 3237c (c:637c)
	db TYPE_PKMN_LIGHTNING ; type
	gfx Chinchou2CardGfx ; gfx
	tx ChinchouName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db CHINCHOU2
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx CurlUpName ; name
	tx PreventDamageButNotEffectsDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw MayPreventDamageOnlyEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	; attack 2
	energy LIGHTNING, 1, COLORLESS, 1 ; energies
	tx ThundershockName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERSHOCK ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx AnglerName ; category
	db 170 ; Pokedex number
	db 0
	db 22 ; level
	db 1, 8 ; length
	dw 26 * 10 ; weight
	tx Chinchou2Description ; description
	db 17

Lanturn1Card: ; 323bd (c:63bd)
	db TYPE_PKMN_LIGHTNING ; type
	gfx Lanturn1CardGfx ; gfx
	tx LanturnName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db LANTURN1
	db 90 ; hp
	db STAGE1 ; stage
	tx ChinchouName ; pre-evo name

	; attack 1
	energy WATER, 1, COLORLESS, 1 ; energies
	tx WaterGunName ; name
	tx Do10MorePerWaterEnergyMax20Desc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw WEWaterBoostEffectCommands ; effect commands
	db NONE ; flags 1
	db ATTACHED_ENERGY_BOOST ; flags 2
	db NONE ; flags 3
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN ; animation

	; attack 2
	energy LIGHTNING, 1, COLORLESS, 2 ; energies
	tx ThunderWaveName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MagnetonThunderWaveEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDER_WAVE ; animation

	db 2 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx LightName ; category
	db 171 ; Pokedex number
	db 0
	db 32 ; level
	db 3, 11 ; length
	dw 49 * 10 ; weight
	tx Lanturn1Description ; description
	db 0

Lanturn2Card: ; 323fe (c:63fe)
	db TYPE_PKMN_LIGHTNING ; type
	gfx Lanturn2CardGfx ; gfx
	tx LanturnName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db LANTURN2
	db 90 ; hp
	db STAGE1 ; stage
	tx ChinchouName ; pre-evo name

	; attack 2
	energy LIGHTNING, 1, COLORLESS, 1 ; energies
	tx IonStormName ; name
	tx Do10ToAllOppBenchDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw Do10ToAllOppBenchedEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_MAGNETIC_STORM ; animation

	; attack 2
	energy LIGHTNING, 2, COLORLESS, 1 ; energies
	tx ThunderName ; name
	tx MayDo20ToSelfDesc ; description
	dw NONE ; description (cont)
	db 60 ; damage
	db DAMAGE_NORMAL ; category
	dw CFT20ToSelfEffectCommands ; effect commands
	db LOW_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERSHOCK ; animation

	db 2 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE; resistance
	tx LightName ; category
	db 172 ; Pokedex number
	db 0
	db 43 ; level
	db 3, 11 ; length
	dw 39 * 10 ; weight
	tx Lanturn2Description ; description
	db 0

PichuCard: ; 3243f (c:643f)
	db TYPE_PKMN_LIGHTNING ; type
	gfx PichuCardGfx ; gfx
	tx PichuName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db PICHU
	db 30 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx CutenessName ; name
	tx CutenessDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw CutenessEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy LIGHTNING, 1 ; energies
	tx ThunderJoltName ; name
	tx MayDo10ToSelfDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw CFT10ToSelfEffectCommands ; effect commands
	db LOW_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERSHOCK ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db NONE ; resistance
	tx TinyMouseName ; category
	db 172 ; Pokedex number
	db 0
	db 5 ; level
	db 1, 0 ; length
	dw 4 * 10 ; weight
	tx PichuDescription ; description
	db 0

PikachuCard: ; 32480 (c:6480)
	db TYPE_PKMN_LIGHTNING ; type
	gfx PikachuCardGfx ; gfx
	tx PikachuName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db PIKACHU
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx QuickAttackName ; name
	tx MayDo10Plus20Desc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw MayDo10Plus20EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	; attack 2
	energy LIGHTNING, 2 ; energies
	tx AgilityName ; name
	tx MayGetImmunityDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayGetImmunityEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx MouseName ; category
	db 25 ; Pokedex number
	db 0
	db 17 ; level
	db 1, 4 ; length
	dw 13 * 10 ; weight
	tx PikachuDescription ; description
	db 19

RaichuCard: ; 324c1 (c:64c1)
	db TYPE_PKMN_LIGHTNING ; type
	gfx RaichuCardGfx ; gfx
	tx RaichuName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db RAICHU
	db 70 ; hp
	db STAGE1 ; stage
	tx PikachuName ; pre-evo name

	; attack 1
	energy LIGHTNING, 2 ; energies
	tx ThundershockName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERSHOCK ; animation

	; attack 2
	energy LIGHTNING, 3 ; energies
	tx BigThunderName ; name
	tx Do70ToaRandomDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Do70ToARandomEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_BIG_THUNDER ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx MouseName ; category
	db 26 ; Pokedex number
	db 0
	db 36 ; level
	db 2, 7 ; length
	dw 66 * 10 ; weight
	tx RaichuDescription ; description
	db 16

Mareep1Card: ; 32502 (c:6502)
	db TYPE_PKMN_LIGHTNING ; type
	gfx Mareep1CardGfx ; gfx
	tx MareepName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db MAREEP1
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx GrowlName ; name
	tx ReduceDamageBy10Desc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw ReduceDamageBy10EffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_SUPERSONIC ; animation

	; attack 2
	energy LIGHTNING, 2 ; energies
	tx ThundershockName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERSHOCK ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx WoolName ; category
	db 179 ; Pokedex number
	db 0
	db 14 ; level
	db 2, 0 ; length
	dw 17 * 10 ; weight
	tx Mareep1Description ; description
	db 16

Mareep2Card: ; 32543 (c:6543)
	db TYPE_PKMN_LIGHTNING ; type
	gfx Mareep2CardGfx ; gfx
	tx MareepName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db MAREEP2
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy LIGHTNING, 1, COLORLESS, 1 ; energies
	tx ThunderJoltName ; name
	tx MayDo10ToSelfDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw CFT10ToSelfEffectCommands ; effect commands
	db LOW_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERSHOCK ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx WoolName ; category
	db 179 ; Pokedex number
	db 0
	db 11 ; level
	db 2, 0 ; length
	dw 17 * 10 ; weight
	tx Mareep2Description ; description
	db 16

Flaaffy1Card: ; 32584 (c:6584)
	db TYPE_PKMN_LIGHTNING ; type
	gfx Flaaffy1CardGfx ; gfx
	tx FlaaffyName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db FLAAFFY1
	db 70 ; hp
	db STAGE1 ; stage
	tx MareepName ; pre-evo name

	; attack 1
	energy LIGHTNING, 1 ; energies
	tx SparkName ; name
	tx Do10To1BenchDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw DamageAndDo10ToABenchEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_THUNDER_WHOLE_SCREEN ; animation

	; attack 2
	energy LIGHTNING, 2 ; energies
	tx ThunderpunchName ; name
	tx MayDoPlus10or10ToSelfDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_PLUS ; category
	dw MayDoPlus10Or10ToSelfEffectCommands ; effect commands
	db LOW_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERPUNCH ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx WoolName ; category
	db 180 ; Pokedex number
	db 0
	db 21 ; level
	db 2, 7 ; length
	dw 29 * 10 ; weight
	tx Flaaffy1Description ; description
	db 3

Flaaffy2Card: ; 325c5 (c:65c5)
	db TYPE_PKMN_LIGHTNING ; type
	gfx Flaaffy2CardGfx ; gfx
	tx FlaaffyName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db FLAAFFY2
	db 60 ; hp
	db STAGE1 ; stage
	tx MareepName ; pre-evo name

	; attack 1
	energy LIGHTNING, 1 ; energies
	tx ThreatenName ; name
	tx NoTrainersDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NoOppTrainersEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_DARK_MIND ; animation

	; attack 2
	energy LIGHTNING, 1, COLORLESS, 1 ; energies
	tx ThunderWaveName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDER_WAVE ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx WoolName ; category
	db 180 ; Pokedex number
	db 0
	db 29 ; level
	db 2, 7 ; length
	dw 29 * 10 ; weight
	tx Flaaffy2Description ; description
	db 0

Ampharos1Card: ; 32606 (c:6606)
	db TYPE_PKMN_LIGHTNING ; type
	gfx Ampharos1CardGfx ; gfx
	tx AmpharosName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db AMPHAROS1
	db 90 ; hp
	db STAGE2 ; stage
	tx FlaaffyName ; pre-evo name

	; attack 1
	energy LIGHTNING, 1 ; energies
	tx ChargeName ; name
	tx EnergyAbsorptionDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Get2DiscardEnergyAttachToSelfEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 1
	energy LIGHTNING, 3, COLORLESS, 1 ; energies
	tx GigashockName ; name
	tx Do10To3BenchedDesc ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw Do10To3BenchedEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_THUNDER_WHOLE_SCREEN ; animation

	db 2 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx LightName ; category
	db 181 ; Pokedex number
	db 0
	db 48 ; level
	db 4, 7 ; length
	dw 135 * 10 ; weight
	tx Ampharos1Description ; description
	db 0

Ampharos2Card: ; 32647 (c:6647)
	db TYPE_PKMN_LIGHTNING ; type
	gfx Ampharos2CardGfx ; gfx
	tx AmpharosName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db AMPHAROS2
	db 80 ; hp
	db STAGE2 ; stage
	tx FlaaffyName ; pre-evo name

	; attack 2
	energy LIGHTNING, 2, ; energies
	tx IonStormName ; name
	tx Do10ToAllOppBenchDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw Do10ToAllOppBenchedEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_MAGNETIC_STORM ; animation

	; attack 2
	energy LIGHTNING, 3, COLORLESS, 1 ; energies
	tx GigavoltName ; name
	tx CFHPlus20orTPARDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_PLUS ; category
	dw MayDo20MoreOrPRZEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BLIZZARD ; animation

	db 2 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx LightName ; category
	db 181 ; Pokedex number
	db 0
	db 45 ; level
	db 4, 7 ; length
	dw 135 * 10 ; weight
	tx Ampharos2Description ; description
	db 0

ElekidCard: ; 32688 (c:6688)
	db TYPE_PKMN_LIGHTNING ; type
	gfx ElekidCardGfx ; gfx
	tx ElekidName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db ELEKID
	db 30 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy LIGHTNING, 1 ; energies
	tx ThundershockName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERSHOCK ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db NONE ; resistance
	tx ElectricName ; category
	db 239 ; Pokedex number
	db 0
	db 5 ; level
	db 2, 0 ; length
	dw 52 * 10 ; weight
	tx ElekidDescription ; description
	db 0

ElectabuzzCard: ; 326c9 (c:66c9)
	db TYPE_PKMN_LIGHTNING ; type
	gfx ElectabuzzCardGfx ; gfx
	tx ElectabuzzName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db ELECTABUZZ
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx SwiftName ; name
	tx DontApplyWRDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw DontApplyWREffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_CONFUSE_RAY ; animation

	; attack 2
	energy LIGHTNING, 2 ; energies
	tx ThunderpunchName ; name
	tx MayDoPlus10or10ToSelfDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_PLUS ; category
	dw MayDoPlus10Or10ToSelfEffectCommands ; effect commands
	db LOW_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERPUNCH ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx ElectricName ; category
	db 125 ; Pokedex number
	db 0
	db 32 ; level
	db 3, 7 ; length
	dw 66 * 10 ; weight
	tx ElectabuzzDescription ; description
	db 19

RaikouCard: ; 3270a (c:670a)
	db TYPE_PKMN_LIGHTNING ; type
	gfx RaikouCardGfx ; gfx
	tx RaikouName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db RAIKOU
	db 70 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx LightningBurstName ; name
	tx LightningBurstDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw ETB30ToARandomEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PEAL_OF_THUNDER ; animation

	; attack 2
	energy LIGHTNING, 3, ; energies
	tx ThunderName ; name
	tx MayDo30ToSelfDesc ; description
	dw NONE ; description (cont)
	db 60 ; damage
	db DAMAGE_NORMAL ; category
	dw CFT30ToSelfEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDER ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx ThunderName ; category
	db 243 ; Pokedex number
	db 0
	db 45 ; level
	db 6, 3 ; length
	dw 392 * 10 ; weight
	tx RaikouDescription ; description
	db 19

RaichuSCard: ; 3274b (c:674b)
	db TYPE_PKMN_LIGHTNING ; type
	gfx RaichuSCardGfx ; gfx
	tx RaichuName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db RAICHU_S
	db 90 ; hp
	db STAGE1 ; stage
	tx PikachuName ; pre-evo name

	; attack 1
	energy LIGHTNING, 1, WATER, 1 ; energies
	tx SparkName ; name
	tx Do10To1BenchDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw DamageAndDo10ToABenchEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_THUNDER_WHOLE_SCREEN ; animation

	; attack 2
	energy LIGHTNING, 2, WATER, 2 ; energies
	tx ThundersquallName ; name
	tx MayDo20ToEachOppsBenchDesc ; description
	dw NONE ; description (cont)
	db 60 ; damage
	db DAMAGE_NORMAL ; category
	dw MayDo20ToEachOppBenchEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_THUNDERSTORM ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx MysticName ; category
	db 26 ; Pokedex number
	db 0
	db 67 ; level
	db 2, 7 ; length
	dw 66 * 10 ; weight
	tx RaichuSDescription ; description
	db 0

PoliwrathCard: ; 3278c (c:678c)
	db TYPE_PKMN_FIGHTING ; type
	gfx PoliwrathCardGfx ; gfx
	tx PoliwrathName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db POLIWRATH
	db 110 ; hp
	db STAGE2 ; stage
	tx PoliwhirlName ; pre-evo name

	; attack 2
	energy FIGHTING, 1, COLORLESS, 1 ; energies
	tx MegaPunchName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy FIGHTING, 2, COLORLESS, 2 ; energies
	tx SubmissionName ; name
	tx Do20ToSelfDesc ; description
	dw NONE ; description (cont)
	db 70 ; damage
	db DAMAGE_NORMAL ; category
	dw Do20ToSelfEffectCommands ; effect commands
	db LOW_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 20
	db ATK_ANIM_HIT_RECOIL ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx TadpoleName ; category
	db 62 ; Pokedex number
	db 0
	db 37 ; level
	db 4, 3 ; length
	dw 119 * 10 ; weight
	tx PoliwrathDescription ; description
	db 0

AerodactylCard: ; 327cd (c:67cd)
	db TYPE_PKMN_FIGHTING ; type
	gfx AerodactylCardGfx ; gfx
	tx AerodactylName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db AERODACTYL
	db 60 ; hp
	db STAGE1 ; stage
	tx FossilEggName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx PrehistoricPowerName ; name
	tx PrehistoricPowerDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw NoMoreEvosBothPlayersEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 1
	energy FIGHTING, 1, COLORLESS, 1 ; energies
	tx RisingLungeName ; name
	tx MayDo20Plus20Desc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw MayDo20Plus20EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db WR_FIGHTING ; resistance
	tx FossilName ; category
	db 142 ; Pokedex number
	db 0
	db 33 ; level
	db 5, 11 ; length
	dw 130 * 10 ; weight
	tx AerodactylDescription ; description
	db 21

SudowoodoCard: ; 3280e (c:680e)
	db TYPE_PKMN_FIGHTING ; type
	gfx SudowoodoCardGfx ; gfx
	tx SudowoodoName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db SUDOWOODO
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIGHTING, 1 ; energies
	tx FlailName ; name
	tx Do10XPerSelfDamageDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_X ; category
	dw Do10XPerSelfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db BOOST_IF_TAKEN_DAMAGE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	; attack 2
	energy FIGHTING, 1, COLORLESS, 1 ; energies
	tx RockThrowName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_ROCK_THROW ; animation

	db 3 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx ImitationName ; category
	db 185 ; Pokedex number
	db 0
	db 20 ; level
	db 3, 11 ; length
	dw 84 * 10 ; weight
	tx SudowoodoDescription ; description
	db 0

GligarCard: ; 3284f (c:684f)
	db TYPE_PKMN_FIGHTING ; type
	gfx GligarCardGfx ; gfx
	tx GligarName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db GLIGAR
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIGHTING, 1 ; energies
	tx PoisonStingName ; name
	tx MayInflictPoisonDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictPoisonEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NEEDLES ; animation

	; attack 2
	energy FIGHTING, 1, COLORLESS, 2 ; energies
	tx FlyName ; name
	tx MayPreventAllDamageOrNothingDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayGetImmunityOrDoNothingEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	db 0 ; retreat cost
	db WR_WATER ; weakness
	db WR_FIGHTING ; resistance
	tx FlyScorpionName ; category
	db 207 ; Pokedex number
	db 0
	db 14 ; level
	db 3, 7 ; length
	dw 143 * 10 ; weight
	tx GligarDescription ; description
	db 0

OnixCard: ; 32890 (c:6890)
	db TYPE_PKMN_FIGHTING ; type
	gfx OnixCardGfx ; gfx
	tx OnixName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db ONIX
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx LeerName ; name
	tx LeerDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw CFHOppCantAttackEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	; attack 2
	energy FIGHTING, 2 ; energies
	tx RageName ; name
	tx Do10MorePerSelfDamageDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw Do10MorePerSelfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db BOOST_IF_TAKEN_DAMAGE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 2 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx RockSnakeName ; category
	db 95 ; Pokedex number
	db 0
	db 19 ; level
	db 28, 10 ; length
	dw 463 * 10 ; weight
	tx OnixDescription ; description
	db 0

SteelixCard: ; 328d1 (c:68d1)
	db TYPE_PKMN_FIGHTING ; type
	gfx SteelixCardGfx ; gfx
	tx SteelixName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db STEELIX
	db 110 ; hp
	db STAGE1 ; stage
	tx OnixName ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy FIGHTING, 2, COLORLESS, 2 ; energies
	tx IronTailName ; name
	tx ReduceDamageby20Desc ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw ReduceBy20AfterAttackEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 4 ; retreat cost
	db WR_FIRE ; weakness
	db WR_GRASS ; resistance
	tx IronSnakeName ; category
	db 208 ; Pokedex number
	db 0
	db 53 ; level
	db 30, 2 ; length
	dw 882 * 10 ; weight
	tx SteelixDescription ; description
	db 0

ShuckleCard: ; 32912 (c:6912)
	db TYPE_PKMN_FIGHTING ; type
	gfx ShuckleCardGfx ; gfx
	tx ShuckleName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db SHUCKLE
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx WithdrawName ; name
	tx PreventDamageButNotEffectsDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw MayPreventDamageOnlyEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	; attack 2
	energy FIGHTING, 2 ; energies
	tx WrapName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx MoldName ; category
	db 213 ; Pokedex number
	db 0
	db 17 ; level
	db 2, 0 ; length
	dw 45 * 10 ; weight
	tx ShuckleDescription ; description
	db 0

SwinubCard: ; 32953 (c:6953)
	db TYPE_PKMN_FIGHTING ; type
	gfx SwinubCardGfx ; gfx
	tx SwinubName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db SWINUB
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy FIGHTING, 1, COLORLESS, 1 ; energies
	tx TakeDownName ; name
	tx Do20toSelfDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw Do20ToSelfEffectCommands ; effect commands
	db LOW_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 20
	db ATK_ANIM_HIT_RECOIL ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db WR_LIGHTNING ; resistance
	tx PigName ; category
	db 220 ; Pokedex number
	db 0
	db 16 ; level
	db 1, 4 ; length
	dw 14 * 10 ; weight
	tx SwinubDescription ; description
	db 0

PiloswineCard: ; 32994 (c:6994)
	db TYPE_PKMN_FIGHTING ; type
	gfx PiloswineCardGfx ; gfx
	tx PiloswineName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db PILOSWINE
	db 80 ; hp
	db STAGE1 ; stage
	tx SwinubName ; pre-evo name

	; attack 2
	energy FIGHTING, 2 ; energies
	tx RamName; name
	tx SwitchAfterDamageDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw SwitchOppAfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db SWITCH_OPPONENT_POKEMON ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy FIGHTING, 3, COLORLESS, 1 ; energies
	tx EarthquakeName ; name
	tx Do10ToOwnBenchDesc ; description
	dw NONE ; description (cont)
	db 70 ; damage
	db DAMAGE_NORMAL ; category
	dw Do10ToOwnBenchEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 3 ; retreat cost
	db WR_GRASS ; weakness
	db WR_LIGHTNING ; resistance
	tx SwineName ; category
	db 221 ; Pokedex number
	db 0
	db 40 ; level
	db 3, 7 ; length
	dw 123 * 10 ; weight
	tx PiloswineDescription ; description
	db 0

CorsolaCard: ; 329d5 (c:69d5)
	db TYPE_PKMN_FIGHTING ; type
	gfx CorsolaCardGfx ; gfx
	tx CorsolaName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db CORSOLA
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy WATER, 1 ; energies
	tx RecoverName ; name
	tx Discard1WHealAllDamageDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Discard1WHealAllDamageCommands ; effect commands
	db NONE ; flags 1
	db DISCARD_ENERGY ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_RECOVER ; animation

	; attack 2
	energy FIGHTING, 1, COLORLESS, 1 ; energies
	tx SpikeCannonName ; name
	tx DoubleAttackX30Description ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_X ; category
	dw CF30X2DamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NEEDLES ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx CoralName ; category
	db 222 ; Pokedex number
	db 0
	db 25 ; level
	db 2, 0 ; length
	dw 11 * 10 ; weight
	tx CorsolaDescription ; description
	db 0

Phanpy1Card: ; 32a16 (c:6a16)
	db TYPE_PKMN_FIGHTING ; type
	gfx Phanpy1CardGfx ; gfx
	tx PhanpyName ; name
	db CIRCLE; rarity
	db COLOSSEUM | NONE ; sets
	db PHANPY1
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy FIGHTING, 1, COLORLESS, 1 ; energies
	tx RamName; name
	tx SwitchAfterDamageDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw SwitchOppAfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db SWITCH_OPPONENT_POKEMON ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db WR_LIGHTNING ; resistance
	tx LongNoseName ; category
	db 231 ; Pokedex number
	db 0
	db 9 ; level
	db 1, 8 ; length
	dw 74 * 10 ; weight
	tx Phanpy1Description ; description
	db 0

Phanpy2Card: ; 32a57 (c:6a57)
	db TYPE_PKMN_FIGHTING ; type
	gfx Phanpy2CardGfx ; gfx
	tx PhanpyName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db PHANPY2
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIGHTING, 1 ; energies
	tx SandAttackName ; name
	tx OpponentAttackMayDoNothingDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw SmokescreenEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DARK_GAS ; animation

	; attack 2
	energy COLORLESS, 1 ; energies
	tx FlailName ; name
	tx Do10XPerSelfDamageDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_X ; category
	dw Do10XPerSelfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db BOOST_IF_TAKEN_DAMAGE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db WR_LIGHTNING ; resistance
	tx LongNoseName ; category
	db 231 ; Pokedex number
	db 0
	db 14 ; level
	db 1, 8 ; length
	dw 74 * 10 ; weight
	tx Phanpy2Description ; description
	db 19

Donphan1Card: ; 32a98 (c:6a98)
	db TYPE_PKMN_FIGHTING ; type
	gfx Donphan1CardGfx ; gfx
	tx DonphanName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db DONPHAN1
	db 80 ; hp
	db STAGE1 ; stage
	tx PhanpyName ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx FlailName ; name
	tx Do10XPerSelfDamageDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_X ; category
	dw Do10XPerSelfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db BOOST_IF_TAKEN_DAMAGE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	; attack 2
	energy FIGHTING, 1, COLORLESS, 2 ; energies
	tx RapidSpinName ; name
	tx CanSwitchSelfAfterDamageDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw CanSwitchSelfAfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 3 ; retreat cost
	db WR_GRASS ; weakness
	db WR_LIGHTNING ; resistance
	tx ArmorName ; category
	db 232 ; Pokedex number
	db 0
	db 35 ; level
	db 3, 7 ; length
	dw 264 * 10 ; weight
	tx Donphan1Description ; description
	db 0

Donphan2Card: ; 32ad9 (c:6ad9)
	db TYPE_PKMN_FIGHTING ; type
	gfx Donphan2CardGfx ; gfx
	tx DonphanName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db DONPHAN2
	db 80 ; hp
	db STAGE1 ; stage
	tx PhanpyName ; pre-evo name

	; attack 1
	energy FIGHTING, 2, COLORLESS, 1 ; energies
	tx ThrashName ; name
	tx IfNoKOThenReturntoHandDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw IfNoKOReturnToHandEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_7 ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_MULTIPLE_SLASH  ; animation

	; attack 1
	energy FIGHTING, 4 ; energies
	tx GreatTuskName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 60 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 3 ; retreat cost
	db WR_GRASS ; weakness
	db WR_LIGHTNING ; resistance
	tx ArmorName ; category
	db 232 ; Pokedex number
	db 0
	db 41 ; level
	db 3, 7 ; length
	dw 264 * 10 ; weight
	tx Donphan2Description ; description
	db 19

TyrogueCard: ; 32b1a (c:6b1a)
	db TYPE_PKMN_FIGHTING ; type
	gfx TyrogueCardGfx ; gfx
	tx TyrogueName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db TYROGUE
	db 30 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIGHTING, 1 ; energies
	tx CallforFriendName ; name
	tx SearchForTandPutOnBenchDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw SearchForTPutOnBenchEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 1
	energy FIGHTING, 1 ; energies
	tx SmashKickName ; name
	tx MayDoNothingDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw AttackMayDoNothingEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db NONE ; resistance
	tx ScuffleName ; category
	db 236 ; Pokedex number
	db 0
	db 5 ; level
	db 2, 4 ; length
	dw 46 * 10 ; weight
	tx TyrogueDescription ; description
	db 0

HitmonleeCard: ; 32b5b (c:6b5b)
	db TYPE_PKMN_FIGHTING ; type
	gfx HitmonleeCardGfx ; gfx
	tx HitmonleeName ; name
	db DIAMOND; rarity
	db MYSTERY | NONE ; sets
	db HITMONLEE
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIGHTING, 1 ; energies
	tx SmashKickName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy FIGHTING, 2, COLORLESS, 1 ; energies
	tx HighJumpKickName ; name
	tx MayDo30ToSelfDesc ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw CFT30ToSelfEffectCommands ; effect commands
	db LOW_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PUNCH ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx KickingName ; category
	db 106 ; Pokedex number
	db 0
	db 26 ; level
	db 4, 11 ; length
	dw 109 * 10 ; weight
	tx HitmonleeDescription ; description
	db 17

HitmonchanCard: ; 32b9c (c:6b9c)
	db TYPE_PKMN_FIGHTING ; type
	gfx HitmonchanCardGfx ; gfx
	tx HitmonchanName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db HITMONCHAN
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIGHTING, 1 ; energies
	tx JabName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PUNCH ; animation

	; attack 2
	energy FIGHTING, 2, COLORLESS, 1 ; energies
	tx SpecialPunch ; name
	tx DontApplyWRDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw DontApplyWREffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PUNCH ; animation

	db 3 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx PunchingName ; category
	db 107 ; Pokedex number
	db 0
	db 30 ; level
	db 4, 7 ; length
	dw 110 * 10 ; weight
	tx HitmonchanDescription ; description
	db 0

HitmontopCard: ; 32bdd (c:6bdd)
	db TYPE_PKMN_FIGHTING ; type
	gfx HitmontopCardGfx ; gfx
	tx HitmontopName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db HITMONTOP
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx CurlUpName ; name
	tx PreventDamageButNotEffectsDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw MayPreventDamageOnlyEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	; attack 2
	energy FIGHTING, 3 ; energies
	tx TripleKickName ; name
	tx TripleAttackX30Description ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_X ; category
	dw CF30X3EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx HandstandName ; category
	db 237 ; Pokedex number
	db 0
	db 33 ; level
	db 4, 7 ; length
	dw 106 * 10 ; weight
	tx HitmontopDescription ; description
	db 21

LarvitarCard: ; 32c1e (c:6c1e)
	db TYPE_PKMN_FIGHTING ; type
	gfx LarvitarCardGfx ; gfx
	tx LarvitarName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db LARVITAR
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx LeerName ; name
	tx LeerDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw CFHOppCantAttackEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	; attack 1
	energy FIGHTING, 1, COLORLESS, 1 ; energies
	tx RockThrowName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_ROCK_THROW ; animation

	db 1 ; retreat cost
	db WR_GRASS ; weakness
	db WR_LIGHTNING ; resistance
	tx RockSkinName ; category
	db 246 ; Pokedex number
	db 0
	db 19 ; level
	db 2, 0 ; length
	dw 158 * 10 ; weight
	tx LarvitarDescription ; description
	db 16

PupitarCard: ; 32c5f (c:6c5f)
	db TYPE_PKMN_FIGHTING ; type
	gfx PupitarCardGfx ; gfx
	tx PupitarName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db PUPITAR
	db 70 ; hp
	db STAGE1 ; stage
	tx LarvitarName ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy FIGHTING, 2 ; energies
	tx SandstormName ; name
	tx Do10ToAllOppBenchDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw Do10ToAllOppBenchedEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SMOG ; animation

	db 2 ; retreat cost
	db WR_GRASS ; weakness
	db WR_LIGHTNING ; resistance
	tx HardShellName ; category
	db 247 ; Pokedex number
	db 0
	db 37 ; level
	db 3, 11 ; length
	dw 287 * 10 ; weight
	tx PupitarDescription ; description
	db 0

TyranitarCard: ; 32ca0 (c:6ca0)
	db TYPE_PKMN_FIGHTING ; type
	gfx TyranitarCardGfx ; gfx
	tx TyranitarName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db TYRANITAR
	db 100 ; hp
	db STAGE2 ; stage
	tx PupitarName ; pre-evo name

	; attack 2
	energy FIGHTING, 2, COLORLESS, 1 ; energies
	tx HyperBeamName ; name
	tx Discard1EnergyFromTargetDescription ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw Discard1EnergyFromTargetEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_HYPER_BEAM ; animation

	; attack 2
	energy FIGHTING, 2, COLORLESS, 2; energies
	tx TrampleName ; name
	tx MayDo20ToEachOppsBenchDesc ; description
	dw NONE ; description (cont)
	db 60 ; damage
	db DAMAGE_NORMAL ; category
	dw MayDo20ToEachOppBenchEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_BIG_HIT ; animation

	db 4 ; retreat cost
	db WR_GRASS ; weakness
	db WR_PSYCHIC ; resistance
	tx ArmorName ; category
	db 248 ; Pokedex number
	db 0
	db 75 ; level
	db 6, 7 ; length
	dw 445 * 10 ; weight
	tx TyranitarDescription ; description
	db 19

KabutopsSCard: ; 32ce1 (c:6ce1)
	db TYPE_PKMN_FIGHTING ; type
	gfx KabutopsSCardGfx ; gfx
	tx KabutopsName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db KABUTOPS_S
	db 90 ; hp
	db STAGE2 ; stage
	tx KabutoName ; pre-evo name

	; attack 1
	energy FIGHTING, 1, WATER, 1, COLORLESS, 1 ; energies
	tx DrainingSlashName ; name
	tx Heal20IfSuccessDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw Heal20IfSuccessEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_SLASH ; animation

	; attack 2
	energy FIGHTING, 2, WATER, 2 ; energies
	tx SharpSickleName ; name
	tx CFHPlus30DamageDesc ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_PLUS ; category
	dw MayDo30MoreEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_TEAR ; animation

	db 2 ; retreat cost
	db WR_GRASS ; weakness
	db NONE ; resistance
	tx ShellfishName ; category
	db 141 ; Pokedex number
	db 0
	db 70 ; level
	db 4, 3 ; length
	dw 89 * 10 ; weight
	tx KabutopsSDescription ; description
	db 16

SteelixSCard: ; 32d22 (c:6d22)
	db TYPE_PKMN_FIGHTING ; type
	gfx SteelixSCardGfx ; gfx
	tx SteelixName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db STEELIX_S
	db 100 ; hp
	db STAGE1 ; stage
	tx OnixName ; pre-evo name

	; attack 2
	energy FIGHTING, 1, LIGHTNING, 1 ; energies
	tx SandstormName ; name
	tx Do10ToAllOppBenchDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw Do10ToAllOppBenchedEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DARK_GAS ; animation

	; attack 2
	energy FIGHTING, 2, LIGHTNING, 2 ; energies
	tx TectonicRiftName ; name
	tx Mill5CardsIfSuccessDesc ; description
	dw NONE ; description (cont)
	db 70 ; damage
	db DAMAGE_NORMAL ; category
	dw OppMill5IfSuccessEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 4 ; retreat cost
	db WR_FIRE ; weakness
	db WR_GRASS ; resistance
	tx IronSnakeName ; category
	db 208 ; Pokedex number
	db 0
	db 63 ; level
	db 30, 2 ; length
	dw 882 * 10 ; weight
	tx SteelixSDescription ; description
	db 0

TyranitarSCard: ; 32d63 (c:6d63)
	db TYPE_PKMN_FIGHTING ; type
	gfx TyranitarSCardGfx ; gfx
	tx TyranitarName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db TYRANITAR_S
	db 100 ; hp
	db STAGE2 ; stage
	tx PupitarName ; pre-evo name

	; attack 1
	energy FIGHTING, 1, FIRE, 1 ; energies
	tx MountainCrushName ; name
	tx Mill2PerHeadsDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw CFXMill2PerHeadsEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_MULTIPLE_SLASH  ; animation

	; attack 2
	energy FIGHTING, 2, FIRE, 2 ; energies
	tx HyperBeamName ; name
	tx Discard1EnergyFromTargetDescription ; description
	dw NONE ; description (cont)
	db 70 ; damage
	db DAMAGE_NORMAL ; category
	dw Discard1EnergyFromTargetEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_HYPER_BEAM ; animation

	db 4 ; retreat cost
	db NONE ; weakness
	db WR_PSYCHIC ; resistance
	tx ArmorName ; category
	db 249 ; Pokedex number
	db 0
	db 81 ; level
	db 6, 7 ; length
	dw 445 * 10 ; weight
	tx TyranitarSDescription ; description
	db 0

GastlyCard: ; 32da4 (c:6da4)
	db TYPE_PKMN_PSYCHIC ; type
	gfx GastlyCardGfx ; gfx
	tx GastlyName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db GASTLY
	db 30 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 2
	energy PSYCHIC, 1 ; energies
	tx NightmareName ; name
	tx InflictSleepDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw InflictSleepAfterDamageEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NIGHTMARE ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db WR_FIGHTING ; resistance
	tx GasName ; category
	db 92 ; Pokedex number
	db 0
	db 16 ; level
	db 4, 3 ; length
	dw 0 * 10 ; weight
	tx GastlyDescription ; description
	db 19

HaunterCard: ; 32de5 (c:6de5)
	db TYPE_PKMN_PSYCHIC ; type
	gfx HaunterCardGfx ; gfx
	tx HaunterName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db HAUNTER
	db 60 ; hp
	db STAGE1 ; stage
	tx GastlyName ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx ThreatenName ; name
	tx NoTrainersDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NoOppTrainersEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_DARK_MIND ; animation

	; attack 1
	energy PSYCHIC, 1, COLORLESS, 1 ; energies
	tx ConfuseRayName ; name
	tx MayInflictConfusionDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictConfusionEffectCommands ; effect commands
	db INFLICT_CONFUSION ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_CONFUSE_RAY ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db WR_FIGHTING ; resistance
	tx GasName ; category
	db 93 ; Pokedex number
	db 0
	db 28 ; level
	db 5, 3 ; length
	dw 0 * 10 ; weight
	tx HaunterDescription ; description
	db 0

GengarCard: ; 32e26 (c:6e26)
	db TYPE_PKMN_PSYCHIC ; type
	gfx GengarCardGfx ; gfx
	tx GengarName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db GENGAR
	db 80 ; hp
	db STAGE2 ; stage
	tx HaunterName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx CurseName ; name
	tx CurseDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw CurseEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy PSYCHIC, 2, COLORLESS, 1 ; energies
	tx PullInName ; name
	tx CanSwitchDPThenSLPDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw CanSwitchOppBeforeDamageAndSLPEffectCommands ; effect commands
	db INFLICT_SLEEP; flags 1
	db SWITCH_OPPONENT_POKEMON ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_IMAKUNI_CONFUSION ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db WR_FIGHTING ; resistance
	tx ShadowName ; category
	db 94 ; Pokedex number
	db 0
	db 49 ; level
	db 4, 11 ; length
	dw 89 * 10 ; weight
	tx GengarDescription ; description
	db 0

MewtwoCard: ; 32e67 (c:6e67)
	db TYPE_PKMN_PSYCHIC ; type
	gfx MewtwoCardGfx ; gfx
	tx MewtwoName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db MEWTWO
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx SwiftName ; name
	tx DontApplyWRDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw DontApplyWREffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_CONFUSE_RAY ; animation

	; attack 1
	energy PSYCHIC, 2, COLORLESS, 1 ; energies
	tx PsychicName ; name
	tx Do10MorePerOppEenergyDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw Do10MorePerOppEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx GeneticName ; category
	db 150 ; Pokedex number
	db 0
	db 42 ; level
	db 6, 7 ; length
	dw 269 * 10 ; weight
	tx MewtwoDescription ; description
	db 0

MewCard: ; 32ea8 (c:6ea8)
	db TYPE_PKMN_PSYCHIC ; type
	gfx MewCardGfx ; gfx
	tx MewName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db MEW
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx DevolutionBeamName ; name
	tx DevolutionBeamDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw DevolutionBeamEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	; attack 2
	energy PSYCHIC, 2 ; energies
	tx PsywaveName ; name
	tx DamageAndDo10ToABenchDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw DamageAndDo10ToABenchEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx NewSpeciesName ; category
	db 151 ; Pokedex number
	db 0
	db 38 ; level
	db 1, 4 ; length
	dw 9 * 10 ; weight
	tx MewDescription ; description
	db 0

NatuCard: ; 32ee9 (c:6ee9)
	db TYPE_PKMN_PSYCHIC ; type
	gfx NatuCardGfx ; gfx
	tx NatuName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db NATU
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx PeckName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy PSYCHIC, 2 ; energies
	tx PsywaveName ; name
	tx Do20ToABenchDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Do20ToOppBenchOnlyEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_NONE ; animation

	db 0 ; retreat cost
	db WR_PSYCHIC ; weakness
	db WR_FIGHTING ; resistance
	tx LittleBirdName ; category
	db 177 ; Pokedex number
	db 0
	db 23 ; level
	db 0, 8 ; length
	dw 4 * 10 ; weight
	tx NatuDescription ; description
	db 16

XatuCard: ; 32f2a (c:6f2a)
	db TYPE_PKMN_PSYCHIC ; type
	gfx XatuCardGfx ; gfx
	tx XatuName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db XATU
	db 90 ; hp
	db STAGE1 ; stage
	tx NatuName ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx ProphecyName ; name
	tx ProphecyDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw ProphecyEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_5 ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 1
	energy PSYCHIC, 2, COLORLESS, 1 ; energies
	tx ConfuseRayName ; name
	tx MayInflictConfusionDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictConfusionEffectCommands ; effect commands
	db INFLICT_CONFUSION ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_CONFUSE_RAY ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db WR_FIGHTING ; resistance
	tx MysticName ; category
	db 178 ; Pokedex number
	db 0
	db 39 ; level
	db 4, 11 ; length
	dw 33 * 10 ; weight
	tx XatuDescription ; description
	db 0

Espeon1Card: ; 32f6b (c:6f6b)
	db TYPE_PKMN_PSYCHIC ; type
	gfx Espeon1CardGfx ; gfx
	tx EspeonName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db ESPEON1
	db 70 ; hp
	db STAGE1 ; stage
	tx EeveeName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx PrecognitionName ; name
	tx PrecognitionDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw PrecognitionEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 1
	energy PSYCHIC, 2, COLORLESS, 1 ; energies
	tx PsychicName ; name
	tx Do10MorePerOppEenergyDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_PLUS ; category
	dw Do10MorePerOppEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 0 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx SunName ; category
	db 196 ; Pokedex number
	db 0
	db 43 ; level
	db 2, 11 ; length
	dw 58 * 10 ; weight
	tx Espeon1Description ; description
	db 19

Espeon2Card: ; 32fac (c:6fac)
	db TYPE_PKMN_PSYCHIC ; type
	gfx Espeon2CardGfx ; gfx
	tx EspeonName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db ESPEON2
	db 60 ; hp
	db STAGE1 ; stage
	tx EeveeName ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx PsychicName ; name
	tx Do10MorePerOppEenergyDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw Do10MorePerOppEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	; attack 2
	energy PSYCHIC, 2, COLORLESS, 1 ; energies
	tx PsylinkBlastName ; name
	tx PsylinkBlastDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw PsylinkBlastEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 0 ; retreat cost
	db WR_PSYCHIC ; weakness
	db WR_FIGHTING ; resistance
	tx SunName ; category
	db 196 ; Pokedex number
	db 0
	db 47 ; level
	db 2, 11 ; length
	dw 58 * 10 ; weight
	tx Espeon2Description ; description
	db 0

UmbreonCard: ; 32fed (c:6fed)
	db TYPE_PKMN_PSYCHIC ; type
	gfx UmbreonCardGfx ; gfx
	tx UmbreonName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db UMBREON
	db 80 ; hp
	db STAGE1 ; stage
	tx EeveeName ; pre-evo name

	; attack 1
	energy PSYCHIC, 1, COLORLESS, 1 ; energies
	tx ThreatenName ; name
	tx NoTrainersDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NoOppTrainersEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_DARK_MIND ; animation

	; attack 2
	energy PSYCHIC, 2, COLORLESS, 1 ; energies
	tx FeintAttackName ; name
	tx CanSwitchDPBeforeDamageDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw CanSwitchOppBeforeDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db SWITCH_OPPONENT_POKEMON ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DARK_MIND ; animation

	db 1 ; retreat cost
	db NONE ; weakness
	db WR_PSYCHIC ; resistance
	tx MoonlightName ; category
	db 197 ; Pokedex number
	db 0
	db 38 ; level
	db 3, 3 ; length
	dw 59 * 10 ; weight
	tx UmbreonDescription ; description
	db 1

MurkrowCard: ; 3302e (c:702e)
	db TYPE_PKMN_PSYCHIC ; type
	gfx MurkrowCardGfx ; gfx
	tx MurkrowName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db MURKROW
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx ThreatenName ; name
	tx NoTrainersDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NoOppTrainersEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_DARK_MIND ; animation

	; attack 1
	energy COLORLESS, 2 ; energies
	tx PeckName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db WR_PSYCHIC ; resistance
	tx DarknessName ; category
	db 198 ; Pokedex number
	db 0
	db 20 ; level
	db 1, 8 ; length
	dw 5 * 10 ; weight
	tx MurkrowDescription ; description
	db 16

SlowpokeCard: ; 3306f (c:706f)
	db TYPE_PKMN_PSYCHIC ; type
	gfx SlowpokeCardGfx ; gfx
	tx SlowpokeName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db SLOWPOKE
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx NapName ; name
	tx Heal1DamageDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw SelfHeal10EffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_RECOVER ; animation

	; attack 1
	energy COLORLESS, 2 ; energies
	tx BiteName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx DopeyName ; category
	db 79 ; Pokedex number
	db 0
	db 19 ; level
	db 3, 11 ; length
	dw 79 * 10 ; weight
	tx SlowpokeDescription ; description
	db 16

SlowbroCard: ; 330b0 (c:70b0)
	db TYPE_PKMN_PSYCHIC ; type
	gfx SlowbroCardGfx ; gfx
	tx SlowbroName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db SLOWBRO
	db 80 ; hp
	db STAGE1 ; stage
	tx SlowpokeName ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx BarrierName ; name
	tx ReduceDamageby20Desc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw ReduceBy20AfterAttackEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BARRIER ; animation

	; attack 2
	energy PSYCHIC, 2 ; energies
	tx AmnesiaName ; name
	tx OppCantDo1AttackDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw OppCantUse1AttackEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_BONEMERANG ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx HermitcrabName ; category
	db 80 ; Pokedex number
	db 0
	db 37 ; level
	db 5, 3 ; length
	dw 173 * 10 ; weight
	tx SlowbroDescription ; description
	db 0

SlowkingCard: ; 330f1 (c:70f1)
	db TYPE_PKMN_PSYCHIC ; type
	gfx SlowkingCardGfx ; gfx
	tx SlowkingName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db SLOWKING
	db 90 ; hp
	db STAGE1 ; stage
	tx SlowpokeName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx DamageSwapName ; name
	tx DamageSwapDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw DamageSwapEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy PSYCHIC, 2, COLORLESS, 1 ; energies
	tx PsyshockName ; name
	tx CFHPARorTCFN ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayParalyzeOrConfuseEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 3 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RoyalName ; category
	db 199 ; Pokedex number
	db 0
	db 45 ; level
	db 6, 7 ; length
	dw 175 * 10 ; weight
	tx SlowkingDescription ; description
	db 19

MisdreavusCard: ; 33132 (c:7132)
	db TYPE_PKMN_PSYCHIC ; type
	gfx MisdreavusCardGfx ; gfx
	tx MisdreavusName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db MISDREAVUS
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 2
	energy PSYCHIC, 1 ; energies
	tx NightEyesName ; name
	tx InflictSleepDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw InflictSleepAfterDamageEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NIGHTMARE ; animation

	; attack 2
	energy PSYCHIC, 2, COLORLESS, 1 ; energies
	tx PainSplitName ; name
	tx PainSplitDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw PainSplitEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SELFDESTRUCT ; animation

	db 1 ; retreat cost
	db NONE ; weakness
	db WR_FIGHTING ; resistance
	tx ScreechName ; category
	db 200 ; Pokedex number
	db 0
	db 34 ; level
	db 2, 4 ; length
	dw 2 * 10 ; weight
	tx MisdreavusDescription ; description
	db 16

UnownACard: ; 33173 (c:7173)
	db TYPE_PKMN_PSYCHIC ; type
	gfx UnownACardGfx ; gfx
	tx UnownAName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db UNOWN_A
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx ScavengeName ; name
	tx GetTrainerCardDiscard1PDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw ScavengeEffectCommands ; effect commands
	db NONE ; flags 1
	db DISCARD_ENERGY ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx HiddenPowerName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx SymbolName ; category
	db 201 ; Pokedex number
	db 0
	db 10 ; level
	db 1, 8 ; length
	dw 11 * 10 ; weight
	tx UnownADescription ; description
	db 1

UnownJCard: ; 331b4 (c:71b4)
	db TYPE_PKMN_PSYCHIC ; type
	gfx UnownJCardGfx ; gfx
	tx UnownJName ; name
	db PROMOSTAR ; rarity
	db PROMOTIONAL | NONE ; sets
	db UNOWN_J
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx SymbolSwarmName ; name
	tx SearchForUnownDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw SearchForUnownEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy PSYCHIC, 2 ; energies
	tx UnknownSpellName ; name
	tx Do20PerUnownADesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_X ; category
	dw Do20PerUnownAEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx SymbolName ; category
	db 201 ; Pokedex number
	db 0
	db 25 ; level
	db 1, 8 ; length
	dw 11 * 10 ; weight
	tx UnownJDescription ; description
	db 16

WobbuffetCard: ; 331f5 (c:71f5)
	db TYPE_PKMN_PSYCHIC ; type
	gfx WobbuffetCardGfx ; gfx
	tx WobbuffetName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db WOBBUFFET
	db 90 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx WobblingName ; name
	tx WobblingDescription ; description
	tx WobblingDescriptionCont ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw WobblingEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy PSYCHIC, 1 ; energies
	tx CounterName ; name
	tx CounterDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw CounterLastAttackEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_MIRROR_MOVE ; animation

	db 3 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx PatientName ; category
	db 202 ; Pokedex number
	db 0
	db 30 ; level
	db 4, 3 ; length
	dw 62 * 10 ; weight
	tx WobbuffetDescription ; description
	db 19

GirafarigCard: ; 33236 (c:7236)
	db TYPE_PKMN_PSYCHIC ; type
	gfx GirafarigCardGfx ; gfx
	tx GirafarigName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db GIRAFARIG
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx AgilityName ; name
	tx MayGetImmunityDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayGetImmunityEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	; attack 1
	energy PSYCHIC, 2 ; energies
	tx ConfuseRayName ; name
	tx MayInflictConfusionDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictConfusionEffectCommands ; effect commands
	db INFLICT_CONFUSION ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_CONFUSE_RAY ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx LongNeckName ; category
	db 203 ; Pokedex number
	db 0
	db 23 ; level
	db 4, 11 ; length
	dw 91 * 10 ; weight
	tx GirafarigDescription ; description
	db 16

SmoochumCard: ; 33277 (c:7277)
	db TYPE_PKMN_PSYCHIC ; type
	gfx SmoochumCardGfx ; gfx
	tx SmoochumName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db SMOOCHUM
	db 30 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 2
	energy PSYCHIC, 1 ; energies
	tx PsykissName ; name
	tx Discard1EnergyFromTargetDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Discard1EnergyFromTargetEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_LURE ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db NONE ; resistance
	tx KissName ; category
	db 238 ; Pokedex number
	db 0
	db 5 ; level
	db 1, 4 ; length
	dw 13 * 10 ; weight
	tx SmoochumDescription ; description
	db 16

JynxCard: ; 332b8 (c:72b8)
	db TYPE_PKMN_PSYCHIC ; type
	gfx JynxCardGfx ; gfx
	tx JynxName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db JYNX
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx ConfuseRayName ; name
	tx MayInflictConfusionDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictConfusionEffectCommands ; effect commands
	db INFLICT_CONFUSION ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_CONFUSE_RAY ; animation

	; attack 2
	energy PSYCHIC, 1, COLORLESS, 1 ; energies
	tx MeditateName ; name
	tx Do10MorePerOppDamageDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw Do10MorePerOppDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx HumanShapeName ; category
	db 124 ; Pokedex number
	db 0
	db 30 ; level
	db 4, 7 ; length
	dw 89 * 10 ; weight
	tx JynxDescription ; description
	db 1

CelebiCard: ; 332f9 (c:72f9)
	db TYPE_PKMN_PSYCHIC ; type
	gfx CelebiCardGfx ; gfx
	tx CelebiName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db CELEBI
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx TimeWarpName ; name
	tx TimeWarpDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw TimeWarpEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy PSYCHIC, 1, COLORLESS, 1 ; energies
	tx PsywaveName ; name
	tx DamageAndDo10ToABenchDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw DamageAndDo10ToABenchEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx TimeTravelName ; category
	db 251 ; Pokedex number
	db 0
	db 36 ; level
	db 2, 0 ; length
	dw 11 * 10 ; weight
	tx CelebiDescription ; description
	db 19

MewtwoSCard: ; 3333a (c:733a)
	db TYPE_PKMN_PSYCHIC ; type
	gfx MewtwoSCardGfx ; gfx
	tx MewtwoName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db MEWTWO_S
	db 70 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy PSYCHIC, 1, FIRE, 1 ; energies
	tx BarrierName ; name
	tx ReduceDamageby20Desc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw ReduceBy20AfterAttackEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BARRIER ; animation

	; attack 2
	energy PSYCHIC, 2, FIRE, 1 ; energies
	tx PsyburnName ; name
	tx Do20MorePerOppEnergyDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw Do20MorePerOppEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 3 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx GeneticName ; category
	db 150 ; Pokedex number
	db 0
	db 70 ; level
	db 6, 7 ; length
	dw 269 * 10 ; weight
	tx MewtwoSDescription ; description
	db 0

MewSCard: ; 3337b (c:737b)
	db TYPE_PKMN_PSYCHIC ; type
	gfx MewSCardGfx ; gfx
	tx MewName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db MEW_S
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx MythicalShieldName ; name
	tx MythicalShieldDescription ; description
	tx MythicalShieldDescriptionCont ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw MythicalShieldEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy PSYCHIC, 1, WATER, 1 ; energies
	tx MysteryAttackName ; name
	tx MysteryAttackDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw MysteryAttackEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT_EFFECT ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx NewSpeciesName ; category
	db 151 ; Pokedex number
	db 0
	db 66 ; level
	db 1, 4 ; length
	dw 9 * 10 ; weight
	tx MewSDescription ; description
	db 3

DratiniCard: ; 33c5e (c:7c5e)
	db TYPE_PKMN_COLORLESS ; type
	gfx DratiniCardGfx ; gfx
	tx DratiniName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db DRATINI
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx DragonSmashName ; name
	tx MayDoNothingDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw AttackMayDoNothingEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db NONE ; weakness
	db NONE ; resistance
	tx DragonName ; category
	db 147 ; Pokedex number
	db 0
	db 17 ; level
	db 5, 11 ; length
	dw 7 * 10 ; weight
	tx DratiniDescription ; description
	db 18

DragonairCard: ; 333bc (c:73bc)
	db TYPE_PKMN_COLORLESS ; type
	gfx DragonairCardGfx ; gfx
	tx DragonairName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db DRAGONAIR
	db 80 ; hp
	db STAGE1 ; stage
	tx DratiniName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx HealingLightName ; name
	tx HealingLightDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw HealingLightEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy LIGHTNING, 1, COLORLESS, 1 ; energies
	tx AgilityName ; name
	tx MayGetImmunityDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayGetImmunityEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	db 2 ; retreat cost
	db NONE ; weakness
	db NONE ; resistance
	tx DragonName ; category
	db 148 ; Pokedex number
	db 0
	db 37 ; level
	db 13, 1 ; length
	dw 36 * 10 ; weight
	tx DragonairDescription ; description
	db 0

DragoniteCard: ; 333fd (c:73fd)
	db TYPE_PKMN_COLORLESS ; type
	gfx DragoniteCardGfx ; gfx
	tx DragoniteName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db DRAGONITE
	db 120 ; hp
	db STAGE2 ; stage
	tx DragonairName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx TailwindName ; name
	tx TailwindDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw ReduceRCBy1EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 1
	energy LIGHTNING, 1, WATER, 1, COLORLESS, 1 ; energies
	tx DragonTailName ; name
	tx DoubleAttackX40Description ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_X ; category
	dw CF40X2EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 2 ; retreat cost
	db NONE ; weakness
	db WR_FIGHTING ; resistance
	tx DragonName ; category
	db 149 ; Pokedex number
	db 0
	db 64 ; level
	db 7, 3 ; length
	dw 463 * 10 ; weight
	tx DragoniteDescription ; description
	db 0

SentretCard: ; 3343e (c:743e)
	db TYPE_PKMN_COLORLESS ; type
	gfx SentretCardGfx ; gfx
	tx SentretName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db SENTRET
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx FetchName ; name
	tx Draw1CardDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Draw1CardEffectCommands ; effect commands
	db DRAW_CARD ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 0 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx ScoutName ; category
	db 161 ; Pokedex number
	db 0
	db 14 ; level
	db 2, 7 ; length
	dw 13 * 10 ; weight
	tx SentretDescription ; description
	db 0

FurretCard: ; 3347f (c:747f)
	db TYPE_PKMN_COLORLESS ; type
	gfx FurretCardGfx ; gfx
	tx FurretName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db FURRET
	db 60 ; hp
	db STAGE1 ; stage
	tx SentretName ; pre-evo name

	; attack 2
	energy COLORLESS, 1 ; energies
	tx QuickAttackName ; name
	tx MayDo20Plus10Description ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw MayDo20Plus10EffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_QUICK_ATTACK ; animation

	; attack 2
	energy COLORLESS, 3 ; energies
	tx SlamName ; name
	tx DoubleAttackX30Description ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_X ; category
	dw CF30X2EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 0 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx LongBodyName ; category
	db 162 ; Pokedex number
	db 0
	db 30 ; level
	db 5, 11 ; length
	dw 71 * 10 ; weight
	tx FurretDescription ; description
	db 0

HoothootCard: ; 334c0 (c:74c0)
	db TYPE_PKMN_COLORLESS ; type
	gfx HoothootCardGfx ; gfx
	tx HoothootName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db HOOTHOOT
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx HypnosisName ; name
	tx InflictSleepDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw InflictSleepEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HYPNOSIS ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx PeckName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 0 ; retreat cost
	db WR_LIGHTNING ; weakness
	db WR_FIGHTING ; resistance
	tx OwlName ; category
	db 163 ; Pokedex number
	db 0
	db 8 ; level
	db 2, 4 ; length
	dw 46 * 10 ; weight
	tx HoothootDescription ; description
	db 3

NoctowlCard: ; 33501 (c:7501)
	db TYPE_PKMN_COLORLESS ; type
	gfx NoctowlCardGfx ; gfx
	tx NoctowlName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db NOCTOWL
	db 70 ; hp
	db STAGE1 ; stage
	tx HoothootName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx GazeName ; name
	tx GazeDescription ; description
	tx GazeDescriptionCont ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw GazeEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_5 ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy COLORLESS, 3 ; energies
	tx WingAttackName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 0 ; retreat cost
	db WR_LIGHTNING ; weakness
	db WR_FIGHTING ; resistance
	tx OwlName ; category
	db 164 ; Pokedex number
	db 0
	db 31 ; level
	db 5, 3 ; length
	dw 90 * 10 ; weight
	tx NoctowlDescription ; description
	db 0

CleffaCard: ; 33542 (c:7542)
	db TYPE_PKMN_COLORLESS ; type
	gfx CleffaCardGfx ; gfx
	tx CleffaName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db CLEFFA
	db 30 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx EeekName ; name
	tx ProfessorElmDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw DiscardHandDraw6Commands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SING ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db NONE ; resistance
	tx StarshapeName ; category
	db 173 ; Pokedex number
	db 0
	db 5 ; level
	db 1, 0 ; length
	dw 6 * 10 ; weight
	tx CleffaDescription ; description
	db 8

ClefairyCard: ; 33583 (c:7583)
	db TYPE_PKMN_COLORLESS ; type
	gfx ClefairyCardGfx ; gfx
	tx ClefairyName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db CLEFAIRY
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx SingName ; name
	tx InflictSleepDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw InflictSleepEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_LULLABY ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx DoubleSlapName ; name
	tx Do20x2Description ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_X ; category
	dw CF20X2EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx FairyName ; category
	db 35 ; Pokedex number
	db 0
	db 18 ; level
	db 2, 0 ; length
	dw 16 * 10 ; weight
	tx ClefairyDescription ; description
	db 18

ClefableCard: ; 335c4 (c:75c4)
	db TYPE_PKMN_COLORLESS ; type
	gfx ClefableCardGfx ; gfx
	tx ClefableName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db CLEFABLE
	db 80 ; hp
	db STAGE1 ; stage
	tx ClefairyName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx MoonlightName ; name
	tx MoonlightDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw MoonlightEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy COLORLESS, 3 ; energies
	tx BodySlamName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx FairyName ; category
	db 36 ; Pokedex number
	db 0
	db 36 ; level
	db 4, 3 ; length
	dw 88 * 10 ; weight
	tx ClefableDescription ; description
	db 16

IgglybuffCard: ; 33605 (c:7605)
	db TYPE_PKMN_COLORLESS ; type
	gfx IgglybuffCardGfx ; gfx
	tx IgglybuffName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db IGGLYBUFF
	db 30 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 2
	energy COLORLESS, 1 ; energies
	tx ExpandName ; name
	tx ExpandDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw ReduceDamageBy10AfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_EXPAND ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db NONE ; resistance
	tx BalloonName ; category
	db 174 ; Pokedex number
	db 0
	db 5 ; level
	db 1, 0 ; length
	dw 2 * 10 ; weight
	tx IgglybuffDescription ; description
	db 0

JigglypuffCard: ; 33646 (c:7646)
	db TYPE_PKMN_COLORLESS ; type
	gfx JigglypuffCardGfx ; gfx
	tx JigglypuffName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db JIGGLYPUFF
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx NapName ; name
	tx Heal1DamageDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw SelfHeal10EffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_RECOVER ; animation

	; attack 1
	energy COLORLESS, 2 ; energies
	tx LullabyName ; name
	tx InflictSleepDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw InflictSleepEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_LULLABY ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx BalloonName ; category
	db 39 ; Pokedex number
	db 0
	db 12 ; level
	db 1, 8 ; length
	dw 12 * 10 ; weight
	tx JigglypuffDescription ; description
	db 0

WigglytuffCard: ; 33687 (c:7687)
	db TYPE_PKMN_COLORLESS ; type
	gfx WigglytuffCardGfx ; gfx
	tx WigglytuffName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db WIGGLYTUFF
	db 90 ; hp
	db STAGE1 ; stage
	tx JigglypuffName ; pre-evo name

	; attack 2
	energy COLORLESS, 1 ; energies
	tx FriendshipSongName ; name
	tx WailDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw WailEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_LULLABY ; animation

	; attack 2
	energy COLORLESS, 3 ; energies
	tx ExpandName ; name
	tx ExpandDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw ReduceDamageBy10AfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_EXPAND ; animation

	db 2 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx BalloonName ; category
	db 40 ; Pokedex number
	db 0
	db 29 ; level
	db 3, 3 ; length
	dw 26 * 10 ; weight
	tx WigglytuffDescription ; description
	db 19

Togepi1Card: ; 336c8 (c:76c8)
	db TYPE_PKMN_COLORLESS ; type
	gfx Togepi1CardGfx ; gfx
	tx TogepiName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db TOGEPI1
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx SnivelName ; name
	tx ReduceBy20Descr ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw ReduceDamageBy20EffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_CRY ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx SpikeBallName ; category
	db 175 ; Pokedex number
	db 0
	db 12 ; level
	db 1, 0 ; length
	dw 3 * 10 ; weight
	tx Togepi1Description ; description
	db 3

Togepi2Card: ; 33709 (c:7709)
	db TYPE_PKMN_COLORLESS ; type
	gfx Togepi2CardGfx ; gfx
	tx TogepiName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db TOGEPI2
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx EnergyBoostName ; name
	tx SearchEnergyAndAttachDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw SearchAndAttachEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy COLORLESS, 1 ; energies
	tx PoundName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx SpikeBallName ; category
	db 175 ; Pokedex number
	db 0
	db 14 ; level
	db 1, 0 ; length
	dw 3 * 10 ; weight
	tx Togepi2Description ; description
	db 19

Togetic1Card: ; 3374a (c:774a)
	db TYPE_PKMN_COLORLESS ; type
	gfx Togetic1CardGfx ; gfx
	tx TogeticName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db TOGETIC1
	db 70 ; hp
	db STAGE1 ; stage
	tx TogepiName ; pre-evo name

	; attack 2
	energy COLORLESS, 1 ; energies
	tx MetronomeName ; name
	tx CopyOppAttackDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw CopyOppAttackEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	; attack 1
	energy COLORLESS, 3 ; energies
	tx FlyName ; name
	tx MayGetImmunityDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayGetImmunityEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	db 0 ; retreat cost
	db NONE ; weakness
	db WR_FIGHTING ; resistance
	tx HappinessName ; category
	db 176 ; Pokedex number
	db 0
	db 33 ; level
	db 2, 0 ; length
	dw 7 * 10 ; weight
	tx Togetic1Description ; description
	db 0

Togetic2Card: ; 3378b (c:778b)
	db TYPE_PKMN_COLORLESS ; type
	gfx Togetic2CardGfx ; gfx
	tx TogeticName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db TOGETIC2
	db 90 ; hp
	db STAGE1 ; stage
	tx TogepiName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx AltruismName ; name
	tx AltruismDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw AltruismEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx SweetKissName ; name
	tx MailFromBillDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw Draw2EffectCommands ; effect commands
	db DRAW_CARD ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_SEISMIC_TOSS ; animation

	db 1 ; retreat cost
	db NONE ; weakness
	db WR_FIGHTING ; resistance
	tx HappinessName ; category
	db 176 ; Pokedex number
	db 0
	db 36 ; level
	db 2, 0 ; length
	dw 7 * 10 ; weight
	tx Togetic2Description ; description
	db 18

AipomCard: ; 337cc (c:77cc)
	db TYPE_PKMN_COLORLESS ; type
	gfx AipomCardGfx ; gfx
	tx AipomName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db AIPOM
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx FetchName ; name
	tx Draw1CardDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Draw1CardEffectCommands ; effect commands
	db DRAW_CARD ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx TailGrabName ; name
	tx MayDraw1CardDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayDraw1CardEffectCommands ; effect commands
	db DRAW_CARD ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 0 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx TailGrabName ; category
	db 190 ; Pokedex number
	db 0
	db 16 ; level
	db 2, 7 ; length
	dw 25 * 10 ; weight
	tx AipomDescription ; description
	db 0

EeveeCard: ; 3380d (c:780d)
	db TYPE_PKMN_COLORLESS ; type
	gfx EeveeCardGfx ; gfx
	tx EeveeName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db EEVEE
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx TailWagName ; name
	tx TailWagDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw OppMayNotAttackEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx QuickAttackName ; name
	tx MayDo20Plus10Description ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw MayDo20Plus10EffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_QUICK_ATTACK ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx EvolutionName ; category
	db 133 ; Pokedex number
	db 0
	db 15 ; level
	db 1, 0 ; length
	dw 14 * 10 ; weight
	tx EeveeDescription ; description
	db 16

DunsparceCard: ; 3384e (c:784e)
	db TYPE_PKMN_COLORLESS ; type
	gfx DunsparceCardGfx ; gfx
	tx DunsparceName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db DUNSPARCE
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx GazeName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DARK_MIND ; animation

	; attack 2
	energy COLORLESS, 3 ; energies
	tx FlyName ; name
	tx MayPreventAllDamageOrNothingDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayGetImmunityOrDoNothingEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	db 0 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx LandSnakeName ; category
	db 206 ; Pokedex number
	db 0
	db 21 ; level
	db 4, 11 ; length
	dw 31 * 10 ; weight
	tx DunsparceDescription ; description
	db 16

SnubbullCard: ; 3388f (c:788f)
	db TYPE_PKMN_COLORLESS ; type
	gfx SnubbullCardGfx ; gfx
	tx SnubbullName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db SNUBBULL
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RoarName ; name
	tx SwitchAfterDamageDesc ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw SwitchOppAfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db SWITCH_OPPONENT_POKEMON ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WHIRLWIND ; animation

	; attack 1
	energy COLORLESS, 2 ; energies
	tx LickName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GOO ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx FairyName ; category
	db 209 ; Pokedex number
	db 0
	db 14 ; level
	db 2, 0 ; length
	dw 17 * 10 ; weight
	tx SnubbullDescription ; description
	db 16

GranbullCard: ; 338d0 (c:78d0)
	db TYPE_PKMN_COLORLESS ; type
	gfx GranbullCardGfx ; gfx
	tx GranbullName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db GRANBULL
	db 70 ; hp
	db STAGE1 ; stage
	tx SnubbullName ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx RoarName ; name
	tx SwitchAfterDamageDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw SwitchOppAfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db SWITCH_OPPONENT_POKEMON ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WHIRLWIND ; animation

	; attack 2
	energy COLORLESS, 3 ; energies
	tx RampageName ; name
	tx Do10PerSelfDamageThenMayConfuse ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_PLUS ; category
	dw Do10PerSelfDamageThenMayConfuseEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db BOOST_IF_TAKEN_DAMAGE ; flags 3
	db 0
	db ATK_ANIM_RAMPAGE ; animation

	db 2 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx FairyName ; category
	db 210 ; Pokedex number
	db 0
	db 40 ; level
	db 4, 7 ; length
	dw 26 * 10 ; weight
	tx GranbullDescription ; description
	db 0

TeddiursaCard: ; 33911 (c:7911)
	db TYPE_PKMN_COLORLESS ; type
	gfx TeddiursaCardGfx ; gfx
	tx TeddiursaName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db TEDDIURSA
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx NapName ; name
	tx Heal1DamageDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw SelfHeal10EffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_RECOVER ; animation

	; attack 1
	energy COLORLESS, 1 ; energies
	tx FurySwipesName ; name
	tx TripleAttackX10Description ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_X ; category
	dw CF10X3EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_MULTIPLE_SLASH ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx LittleBearName ; category
	db 216 ; Pokedex number
	db 0
	db 10 ; level
	db 2, 0 ; length
	dw 19 * 10 ; weight
	tx TeddiursaDescription ; description
	db 16

UrsaringCard: ; 33952 (c:7952)
	db TYPE_PKMN_COLORLESS ; type
	gfx UrsaringCardGfx ; gfx
	tx UrsaringName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db URSARING
	db 90 ; hp
	db STAGE1 ; stage
	tx TeddiursaName ; pre-evo name

	; attack 1
	energy COLORLESS, 3 ; energies
	tx BodySlamName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	; attack 2
	energy COLORLESS, 4 ; energies
	tx SlamName ; name
	tx DoubleAttackX40Description ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_X ; category
	dw CF40X2EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 3 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx HibernatorName ; category
	db 217 ; Pokedex number
	db 0
	db 42 ; level
	db 5, 11 ; length
	dw 277 * 10 ; weight
	tx UrsaringDescription ; description
	db 16

DelibirdCard: ; 33993 (c:7993)
	db TYPE_PKMN_COLORLESS ; type
	gfx DelibirdCardGfx ; gfx
	tx DeliBirdName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db DELIBIRD
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 2
	energy COLORLESS, 3 ; energies
	tx SurprisePresentName ; name
	tx Do30ToARandomDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Do30ToARandomOppEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_WHIRLWIND_ZIGZAG ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db WR_FIGHTING ; resistance
	tx DeliveryName ; category
	db 225 ; Pokedex number
	db 0
	db 25 ; level
	db 2, 11 ; length
	dw 35 * 10 ; weight
	tx DelibirdDescription ; description
	db 0

SkarmoryCard: ; 339d4 (c:79d4)
	db TYPE_PKMN_COLORLESS ; type
	gfx SkarmoryCardGfx ; gfx
	tx SkarmoryName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db SKARMORY
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx PeckName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy COLORLESS, 3 ; energies
	tx SteelWingName ; name
	tx ExpandDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw ReduceDamageBy10AfterDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 10
	db ATK_ANIM_HIT ; animation

	db 2 ; retreat cost
	db WR_FIRE ; weakness
	db WR_GRASS ; resistance
	tx ArmorBirdName ; category
	db 227 ; Pokedex number
	db 0
	db 27 ; level
	db 5, 7 ; length
	dw 111 * 10 ; weight
	tx SkarmoryDescription ; description
	db 3

PorygonCard: ; 33a15 (c:7a15)
	db TYPE_PKMN_COLORLESS ; type
	gfx PorygonCardGfx ; gfx
	tx PorygonName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db PORYGON
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx DataSortName ; name
	tx Draw1CardDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Draw1CardEffectCommands ; effect commands
	db DRAW_CARD ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 1
	energy COLORLESS, 2 ; energies
	tx TackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx VirtualName ; category
	db 137 ; Pokedex number
	db 0
	db 18 ; level
	db 2, 7 ; length
	dw 80 * 10 ; weight
	tx PorygonDescription ; description
	db 19

Porygon2Card: ; 33a56 (c:7a56)
	db TYPE_PKMN_COLORLESS ; type
	gfx Porygon2CardGfx ; gfx
	tx Porygon2Name ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db PORYGON_2
	db 80 ; hp
	db STAGE1 ; stage
	tx PorygonName ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx Conversion2Name ; name
	tx Conversion2Description ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Conversion2EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 1
	energy COLORLESS, 3 ; energies
	tx DataDistortionName ; name
	tx MayChangeWeaknessDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw MayChangeWeaknessEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_STRETCH_KICK ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx VirtualName ; category
	db 223 ; Pokedex number
	db 0
	db 40 ; level
	db 2, 0 ; length
	dw 71 * 10 ; weight
	tx Porygon2Description ; description
	db 1

StantlerCard: ; 33a97 (c:7a97)
	db TYPE_PKMN_COLORLESS ; type
	gfx StantlerCardGfx ; gfx
	tx StantlerName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db STANTLER
	db 60 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx ConfuseRayName ; name
	tx MayInflictConfusionDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictConfusionEffectCommands ; effect commands
	db INFLICT_CONFUSION ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_CONFUSE_RAY ; animation

	; attack 2
	energy COLORLESS, 3 ; energies
	tx StompName ; name
	tx MayDo20Plus20Desc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw MayDo10Plus20EffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_HIT ; animation

	db 2 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx BigHornName ; category
	db 234 ; Pokedex number
	db 0
	db 18 ; level
	db 4, 7 ; length
	dw 157 * 10 ; weight
	tx StantlerDescription ; description
	db 0

SmeargleCard: ; 33ad8 (c:7ad8)
	db TYPE_PKMN_COLORLESS ; type
	gfx SmeargleCardGfx ; gfx
	tx SmeargleName ; name
	db STAR ; rarity
	db COLOSSEUM | NONE ; sets
	db SMEARGLE
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx SketchName ; name
	tx SketchDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw CopyOppAttackEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx PainterName ; category
	db 235 ; Pokedex number
	db 0
	db 22 ; level
	db 3, 11 ; length
	dw 127 * 10 ; weight
	tx SmeargleDescription ; description
	db 8

MiltankCard: ; 33b19 (c:7b19)
	db TYPE_PKMN_COLORLESS ; type
	gfx MiltankCardGfx ; gfx
	tx MiltankName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db MILTANK
	db 70 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx MilkDrinkName ; name
	tx Heal2DamageDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Heal20DamageEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_RECOVER ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx BodySlamName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 2 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx MilkCowName ; category
	db 241 ; Pokedex number
	db 0
	db 25 ; level
	db 3, 11 ; length
	dw 166 * 10 ; weight
	tx MiltankDescription ; description
	db 0

ChanseyCard: ; 33b5a (c:7b5a)
	db TYPE_PKMN_COLORLESS ; type
	gfx ChanseyCardGfx ; gfx
	tx ChanseyName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db CHANSEY
	db 80 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx PoundName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy COLORLESS, 3 ; energies
	tx DoubleEdgeName ; name
	tx Do20toSelfDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw Do20ToSelfEffectCommands ; effect commands
	db LOW_RECOIL ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 20
	db ATK_ANIM_HIT_RECOIL ; animation

	db 2 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx EggName ; category
	db 113 ; Pokedex number
	db 0
	db 24 ; level
	db 3, 7 ; length
	dw 76 * 10 ; weight
	tx ChanseyDescription ; description
	db 0

BlisseyCard: ; 33b9b (c:7b9b)
	db TYPE_PKMN_COLORLESS ; type
	gfx BlisseyCardGfx ; gfx
	tx BlisseyName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db BLISSEY
	db 120 ; hp
	db STAGE1 ; stage
	tx ChanseyName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx SoftboiledName ; name
	tx SoftboiledDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw ETBHeal30AllSelfEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HEALING_WIND ; animation

	; attack 2
	energy COLORLESS, 4 ; energies
	tx BodySlamName ; name
	tx MayInflictParalysisDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MayInflictParalysisEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 2 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx HappinessName ; category
	db 242 ; Pokedex number
	db 0
	db 41 ; level
	db 4, 11 ; length
	dw 103 * 10 ; weight
	tx BlisseyDescription ; description
	db 0

LugiaCard: ; 33bdc (c:7bdc)
	db TYPE_PKMN_COLORLESS ; type
	gfx LugiaCardGfx ; gfx
	tx LugiaName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db LUGIA
	db 80 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx EnergyAbsorptionName ; name
	tx EnergyAbsorptionDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Get2DiscardEnergyAttachToSelfEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy FIRE, 1, WATER, 1, LIGHTNING, 1 ; energies
	tx ElementalBlastName ; name
	tx DiscardAllEnergyDesc ; description
	dw NONE ; description (cont)
	db 60 ; damage
	db DAMAGE_NORMAL ; category
	dw DiscardAllEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db DISCARD_ENERGY ; flags 2
	db NONE ; flags 3
	db 9
	db ATK_ANIM_HYPER_BEAM ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db WR_FIGHTING ; resistance
	tx DivingName ; category
	db 249 ; Pokedex number
	db 0
	db 67 ; level
	db 17, 1 ; length
	dw 476 * 10 ; weight
	tx LugiaDescription ; description
	db 17

NoctowlSCard: ; 33c1d (c:7c1d)
	db TYPE_PKMN_COLORLESS ; type
	gfx NoctowlSCardGfx ; gfx
	tx NoctowlName ; name
	db STAR ; rarity
	db MYSTERY | NONE ; sets
	db NOCTOWL_S
	db 70 ; hp
	db STAGE1 ; stage
	tx HoothootName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx ShinyFeatherName ; name
	tx ShinyFeatherDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw ShinyFeatherEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation


	; attack 2
	energy PSYCHIC, 1, LIGHTNING, 1, COLORLESS, 1 ; energies
	tx PiercingGazeName ; name
	tx CFHPARorTCFN ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw MayParalyzeOrConfuseEffectCommands ; effect commands
	db NONE ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db WR_FIGHTING ; resistance
	tx OwlName ; category
	db 164 ; Pokedex number
	db 0
	db 50 ; level
	db 5, 3 ; length
	dw 89 * 10 ; weight
	tx NoctowlSDescription ; description
	db 0


CharizardCCard: ; 33c9f (c:7c9f)
	db TYPE_PKMN_COLORLESS ; type
	gfx CharizardCCardGfx ; gfx
	tx CharizardName ; name
	db PROMOSTAR ; rarity
	db PROMOTIONAL | NONE ; sets
	db CHARIZARD_C
	db 110 ; hp
	db STAGE2 ; stage
	tx CharmeleonName ; pre-evo name

	; attack 1
	energy FIRE, 1, LIGHTNING, 1 ; energies
	tx ScorchName ; name
	tx Do30toaBenchDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw Do30ToABenchEffectCommands ; effect commands
	db DAMAGE_TO_OPPONENT_BENCH ; flags 1
	db FLAG_2_BIT_6 ; flags 2
	db NONE ; flags 3
	db 3
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy FIRE, 2, LIGHTNING, 2 ; energies
	tx BlastBurnName ; name
	tx SelfDoubleDamageDesc ; description
	dw NONE ; description (cont)
	db 100 ; damage
	db DAMAGE_NORMAL ; category
	dw SelfDoubleDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db NULLIFY_OR_WEAKEN_ATTACK ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_FIRE_SPIN ; animation

	db 3 ; retreat cost
	db NONE ; weakness
	db WR_GRASS ; resistance
	tx FlameName ; category
	db 6 ; Pokedex number
	db 0
	db 99 ; level
	db 5, 7 ; length
	dw 199 * 10 ; weight
	tx CharizardCDescription ; description
	db 18

LugiaCCard: ; 33ce0 (c:7ce0)
	db TYPE_PKMN_COLORLESS ; type
	gfx LugiaCCardGfx ; gfx
	tx LugiaName ; name
	db PROMOSTAR ; rarity
	db PROMOTIONAL | NONE ; sets
	db LUGIA_C
	db 70 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy PSYCHIC, 1, WATER, 1 ; energies
	tx WhirlwindName ; name
	tx CanSwitchDPBeforeDamageDesc ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw CanSwitchOppBeforeDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db SWITCH_OPPONENT_POKEMON ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WHIRLWIND ; animation

	; attack 2
	energy PSYCHIC, 2, WATER, 1 ; energies
	tx AeroblastName ; name
	tx AeroblastDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_PLUS ; category
	dw MayDoPlusCF20x2EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HYPER_BEAM ; animation

	db 3 ; retreat cost
	db NONE ; weakness
	db WR_FIGHTING ; resistance
	tx DivingName ; category
	db 249 ; Pokedex number
	db 0
	db 99 ; level
	db 17, 1 ; length
	dw 476 * 10 ; weight
	tx LugiaCDescription ; description
	db 16

HoohCCard: ; 33d21 (c:7d21)
	db TYPE_PKMN_COLORLESS ; type
	gfx HoohCCardGfx ; gfx
	tx HoohName ; name
	db PROMOSTAR ; rarity
	db PROMOTIONAL | NONE ; sets
	db HOOH_C
	db 70 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy LIGHTNING, 1, FIRE, 1 ; energies
	tx HolyFlameName ; name
	tx Heal1DamageifSuccessDesc ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw Heal1DamageifSuccessEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 1
	db ATK_ANIM_SMALL_FLAME ; animation

	; attack 2
	energy FIRE, 2, FIGHTING, 2 ; energies
	tx SacredFireName ; name
	tx Do10ToAllOppBenchDesc ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw Do10ToAllOppBenchedEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 80
	db ATK_ANIM_FIRE_SPIN ; animation

	db 3 ; retreat cost
	db NONE ; weakness
	db WR_GRASS ; resistance
	tx RainbowName ; category
	db 250 ; Pokedex number
	db 0
	db 99 ; level
	db 12, 6 ; length
	dw 438 * 10 ; weight
	tx HoohCDescription ; description
	db 0

CelebiCCard: ; 33d62 (c:7d62)
	db TYPE_PKMN_COLORLESS ; type
	gfx CelebiCCardGfx ; gfx
	tx CelebiName ; name
	db PROMOSTAR ; rarity
	db PROMOTIONAL | NONE ; sets
	db CELEBI_C
	db 70 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx EnergyGrowthName ; name
	tx SearchEnergyAndAttachDesc ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db RESIDUAL ; category
	dw SearchAndAttachEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db SPECIAL_AI_HANDLING ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy GRASS, 2, PSYCHIC, 1 ; energies
	tx MegaDrainName ; name
	tx HealHalfDamageDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw HealHalfDamageEffectCommands ; effect commands
	db NONE ; flags 1
	db HEAL_USER ; flags 2
	db NONE ; flags 3
	db 2
	db ATK_ANIM_DRAIN ; animation

	db 2 ; retreat cost
	db NONE ; weakness
	db WR_WATER ; resistance
	tx TimeTravelName ; category
	db 251 ; Pokedex number
	db 0
	db 99 ; level
	db 2, 0 ; length
	dw 11 * 10 ; weight
	tx CelebiCDescription ; description
	db 0

ShadowLugiaCard: ; 33e4b (c:7e4b)
	db TYPE_PKMN_PSYCHIC ; type
	gfx ShadowLugiaCardGfx ; gfx
	tx ShadowLugiaName ; name
	db PROMOSTAR ; rarity
	db PROMOTIONAL | NONE ; sets
	db SHADOW_LUGIA
	db 80 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx DarkDescentName ; name
	tx DarkDescentDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw ETB10ToOppBenchEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICKFREEZE ; animation

	; attack 2
	energy PSYCHIC, 1, FIGHTING, 2 ; energies
	tx ShadowBlastName ; name
	tx Do20morePerSelfPsychicEnergyDesc ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_PLUS ; category
	dw Do20MorePerSelfPEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db ATTACHED_ENERGY_BOOST ; flags 2
	db NONE ; flags 3
	db MAX_ENERGY_BOOST_IS_NOT_LIMITED
	db ATK_ANIM_POT_SMASH ; animation

	db 3 ; retreat cost
	db NONE ; weakness
	db WR_FIGHTING ; resistance
	tx DivingName ; category
	db 249 ; Pokedex number
	db 0
	db 99 ; level
	db 17, 1 ; length
	dw 476 * 10 ; weight
	tx ShadowLugiaDescription ; description
	db 17

GrassEnergyCard: ; 33da3 (c:7da3)
	db TYPE_ENERGY_GRASS ; type
	gfx GrassEnergyCardGfx ; gfx
	tx GrassEnergyName ; name
	db CIRCLE ; rarity
	db ENERGY | NONE ; sets
	db GRASS_ENERGY
	dw GrassEnergyEffectCommands ; effect commands
	tx GrassEnergyDescription ; description
	dw NONE ; description (cont)

FireEnergyCard: ; 33db1 (c:7db1)
	db TYPE_ENERGY_FIRE ; type
	gfx FireEnergyCardGfx ; gfx
	tx FireEnergyName ; name
	db CIRCLE ; rarity
	db ENERGY | NONE ; sets
	db FIRE_ENERGY
	dw FireEnergyEffectCommands ; effect commands
	tx FireEnergyDescription ; description
	dw NONE ; description (cont)

WaterEnergyCard: ; 33dbf (c:7dbf)
	db TYPE_ENERGY_WATER ; type
	gfx WaterEnergyCardGfx ; gfx
	tx WaterEnergyName ; name
	db CIRCLE ; rarity
	db ENERGY | NONE ; sets
	db WATER_ENERGY
	dw WaterEnergyEffectCommands ; effect commands
	tx WaterEnergyDescription ; description
	dw NONE ; description (cont)

LightningEnergyCard: ; 33dcd (c:7dcd)
	db TYPE_ENERGY_LIGHTNING ; type
	gfx LightningEnergyCardGfx ; gfx
	tx LightningEnergyName ; name
	db CIRCLE ; rarity
	db ENERGY | NONE ; sets
	db LIGHTNING_ENERGY
	dw LightningEnergyEffectCommands ; effect commands
	tx LightningEnergyDescription ; description
	dw NONE ; description (cont)

FightingEnergyCard: ; 33ddb (c:7ddb)
	db TYPE_ENERGY_FIGHTING ; type
	gfx FightingEnergyCardGfx ; gfx
	tx FightingEnergyName ; name
	db CIRCLE ; rarity
	db ENERGY | NONE ; sets
	db FIGHTING_ENERGY
	dw FightingEnergyEffectCommands ; effect commands
	tx FightingEnergyDescription ; description
	dw NONE ; description (cont)

PsychicEnergyCard: ; 33de9 (c:7de9)
	db TYPE_ENERGY_PSYCHIC ; type
	gfx PsychicEnergyCardGfx ; gfx
	tx PsychicEnergyName ; name
	db CIRCLE ; rarity
	db ENERGY | NONE ; sets
	db PSYCHIC_ENERGY
	dw PsychicEnergyEffectCommands ; effect commands
	tx PsychicEnergyDescription ; description
	dw NONE ; description (cont)

DoubleColorlessEnergyCard: ; 33df7 (c:7df7)
	db TYPE_ENERGY_DOUBLE_COLORLESS ; type
	gfx DoubleColorlessEnergyCardGfx ; gfx
	tx DoubleColorlessEnergyName ; name
	db DIAMOND ; rarity
	db ENERGY | NONE ; sets
	db DOUBLE_COLORLESS_ENERGY
	dw DoubleColorlessEnergyEffectCommands ; effect commands
	tx DoubleColorlessEnergyDescription ; description
	dw NONE ; description (cont)

ProfessorElmCard: ; 33e05 (c:7e05)
	db TYPE_TRAINER ; type
	gfx ProfessorElmCardGfx ; gfx
	tx ProfessorElmName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db PROFESSOR_ELM
	dw ProfessorOakEffectCommands ; effect commands
	tx ProfessorElmDescription ; description
	dw NONE ; description (cont)

TeamRocketsEvilDeedsCard: ; 33e13 (c:7e13)
	db TYPE_TRAINER ; type
	gfx TeamRocketsEvilDeedsCardGfx ; gfx
	tx TeamRocketsEvilDeedsName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db TEAM_ROCKETS_EVIL_DEEDS
	dw ImposterProfessorOakEffectCommands ; effect commands
	tx TeamRocketsEvilDeedsDesc ; description
	dw NONE ; description (cont)

MailFromBillCard: ; 33e21 (c:7e21)
	db TYPE_TRAINER ; type
	gfx MailFromBillCardGfx ; gfx
	tx MailFromBillName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db MAIL_FROM_BILL
	dw BillEffectCommands ; effect commands
	tx MailFromBillDescription ; description
	dw NONE ; description (cont)

ForestGuardianCard: ; 33e2f (c:7e2f)
	db TYPE_TRAINER ; type
	gfx ForestGuardianCardGfx ; gfx
	tx ForestGuardianName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db FOREST_GUARDIAN
	dw MrFujiEffectCommands ; effect commands
	tx ForestGuardianDescription ; description
	dw NONE ; description (cont)

SeerCard: ; 33e3d (c:7e3d)
	db TYPE_TRAINER ; type
	gfx SeerCardGfx ; gfx
	tx SeerName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db SEER
	dw LassEffectCommands ; effect commands
	tx SeerDescription ; description
	dw NONE ; description (cont)


PokemonFanClubCard: ; 33e59 (c:7e59)
	db TYPE_TRAINER ; type
	gfx PokemonFanClubCardGfx ; gfx
	tx PokemonFanClubName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db POKEMON_FAN_CLUB
	dw PokemonTraderEffectCommands ; effect commands
	tx PokemonFanClubDescription ; description
	dw NONE ; description (cont)

StarPieceCard: ; 33e67 (c:7e67)
	db TYPE_TRAINER ; type
	gfx StarPieceCardGfx ; gfx
	tx StarPieceName ; name
	db DIAMOND ; rarity
	db MYSTERY | NONE ; sets
	db STAR_PIECE
	dw PokemonBreederEffectCommands ; effect commands
	tx StarPieceDescription ; description
	dw NONE ; description (cont)

PokeDollCard: ; 33e75 (c:7e75)
	db TYPE_TRAINER ; type
	gfx PokeDollCardGfx ; gfx
	tx PokeDollName ; name
	db DIAMOND ; rarity
	db COLOSSEUM | NONE ; sets
	db POKE_DOLL
	dw ClefairyDollEffectCommands ; effect commands
	tx PokeDollDescription ; description
	tx PokeDollDescriptionCont ; description (cont)

FossilEggCard: ; 33e83 (c:7e83)
	db TYPE_TRAINER ; type
	gfx FossilEggCardGfx ; gfx
	tx FossilEggName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db FOSSIL_EGG
	dw MysteriousFossilEffectCommands ; effect commands
	tx FossilEggDescription ; description
	tx FossilEggDescriptionCont ; description (cont)

EnergyArkCard: ; 33e91 (c:7e91)
	db TYPE_TRAINER ; type
	gfx EnergyArkCardGfx ; gfx
	tx EnergyArkName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db ENERGY_ARK
	dw EnergyRetrievalEffectCommands ; effect commands
	tx EnergyArkDescription ; description
	dw NONE ; description (cont)

SuperEnergyRetrievalCard: ; 33e9f (c:7e9f)
	db TYPE_TRAINER ; type
	gfx SuperEnergyRetrievalCardGfx ; gfx
	tx SuperEnergyRetrievalName ; name
	db STAR ; rarity
	db EVOLUTION | NONE ; sets
	db SUPER_ENERGY_RETRIEVAL
	dw SuperEnergyRetrievalEffectCommands ; effect commands
	tx SuperEnergyRetrievalDescription ; description
	dw NONE ; description (cont)

EnergySearchCard: ; 33ead (c:7ead)
	db TYPE_TRAINER ; type
	gfx EnergySearchCardGfx ; gfx
	tx EnergySearchName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db ENERGY_SEARCH
	dw EnergySearchEffectCommands ; effect commands
	tx EnergySearchDescription ; description
	dw NONE ; description (cont)

EnergyRemoval2Card: ; 33ebb (c:7ebb)
	db TYPE_TRAINER ; type
	gfx EnergyRemoval2CardGfx ; gfx
	tx EnergyRemoval2Name ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db ENERGY_REMOVAL2
	dw EnergyRemovalEffectCommands ; effect commands
	tx EnergyRemoval2Description ; description
	dw NONE ; description (cont)

MasterBallCard: ; 33ec9 (c:7ec9)
	db TYPE_TRAINER ; type
	gfx MasterBallCardGfx ; gfx
	tx MasterBallName ; name
	db PROMOSTAR ; rarity
	db PROMOTIONAL | NONE ; sets
	db MASTER_BALL
	dw SuperEnergyRemovalEffectCommands ; effect commands
	tx MasterBallDescription ; description
	dw NONE ; description (cont)

SwitchCard: ; 33ed7 (c:7ed7)
	db TYPE_TRAINER ; type
	gfx SwitchCardGfx ; gfx
	tx SwitchName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db SWITCH
	dw SwitchEffectCommands ; effect commands
	tx SwitchDescription ; description
	dw NONE ; description (cont)

PokemonNurseCard: ; 33ee5 (c:7ee5)
	db TYPE_TRAINER ; type
	gfx PokemonNurseCardGfx ; gfx
	tx PokemonNurseName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db POKEMON_NURSE
	dw PokemonCenterEffectCommands ; effect commands
	tx PokemonNurseDescription ; description
	dw NONE ; description (cont)

PokeBallCard: ; 33ef3 (c:7ef3)
	db TYPE_TRAINER ; type
	gfx PokeBallCardGfx ; gfx
	tx PokeBallName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db POKE_BALL
	dw PokeBallEffectCommands ; effect commands
	tx PokeBallDescription ; description
	dw NONE ; description (cont)

SuperScoopUpCard: ; 33f01 (c:7f01)
	db TYPE_TRAINER ; type
	gfx SuperScoopUpCardGfx ; gfx
	tx SuperScoopUpName ; name
	db DIAMOND ; rarity
	db EVOLUTION | NONE ; sets
	db SUPER_SCOOP_UP
	dw ScoopUpEffectCommands ; effect commands
	tx SuperScoopUpDescription ; description
	dw NONE ; description (cont)

PokegearCard: ; 33f0f (c:7f0f)
	db TYPE_TRAINER ; type
	gfx PokegearCardGfx ; gfx
	tx PokegearName ; name
	db STAR ; rarity
	db LABORATORY | NONE ; sets
	db POKEGEAR
	dw ComputerSearchEffectCommands ; effect commands
	tx PokegearDescription ; description
	dw NONE ; description (cont)

NewPokedexCard: ; 33f1d (c:7f1d)
	db TYPE_TRAINER ; type
	gfx NewPokedexCardGfx ; gfx
	tx NewPokedexName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db NEW_POKEDEX
	dw PokedexEffectCommands ; effect commands
	tx NewPokedexDescription ; description
	dw NONE ; description (cont)

StrengthCharmCard: ; 33f2b (c:7f2b)
	db TYPE_TRAINER ; type
	gfx StrengthCharmCardGfx ; gfx
	tx StrengthCharmName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db STRENGTH_CHARM
	dw PlusPowerEffectCommands ; effect commands
	tx StrengthCharmDescription ; description
	dw NONE ; description (cont)

CrystalShardCard: ; 33f39 (c:7f39)
	db TYPE_TRAINER ; type
	gfx CrystalShardCardGfx ; gfx
	tx CrystalShardName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db CRYSTAL_SHARD
	dw DefenderEffectCommands ; effect commands
	tx CrystalShardDescription ; description
	dw NONE ; description (cont)

RuinWallCard: ; 33f47 (c:7f47)
	db TYPE_TRAINER ; type
	gfx RuinWallCardGfx ; gfx
	tx RuinWallName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db RUIN_WALL
	dw ItemFinderEffectCommands ; effect commands
	tx RuinWallDescription ; description
	dw NONE ; description (cont)

PokemonReversalCard: ; 33f55 (c:7f55)
	db TYPE_TRAINER ; type
	gfx PokemonReversalCardGfx ; gfx
	tx PokemonReversalName ; name
	db CIRCLE ; rarity
	db MYSTERY | NONE ; sets
	db POKEMON_REVERSAL
	dw GustOfWindEffectCommands ; effect commands
	tx PokemonReversalDescription ; description
	dw NONE ; description (cont)

HyperDevolutionSprayCard: ; 33f63 (c:7f63)
	db TYPE_TRAINER ; type
	gfx HyperDevolutionSprayCardGfx ; gfx
	tx HyperDevolutionSprayName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db HYPER_DEVOLUTION_SPRAY
	dw DevolutionSprayEffectCommands ; effect commands
	tx HyperDevolutionSprayDescription ; description
	tx HyperDevolutionSprayDescriptionCont ; description (cont)

PotionCard: ; 33f71 (c:7f71)
	db TYPE_TRAINER ; type
	gfx PotionCardGfx ; gfx
	tx PotionName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db POTION
	dw PotionEffectCommands ; effect commands
	tx PotionDescription ; description
	dw NONE ; description (cont)

HyperPotionCard: ; 33f7f (c:7f7f)
	db TYPE_TRAINER ; type
	gfx HyperPotionCardGfx ; gfx
	tx HyperPotionName ; name
	db DIAMOND ; rarity
	db LABORATORY | NONE ; sets
	db HYPER_POTION
	dw SuperPotionEffectCommands ; effect commands
	tx HyperPotionDescription ; description
	dw NONE ; description (cont)

FullHealCard: ; 33f8d (c:7f8d)
	db TYPE_TRAINER ; type
	gfx FullHealCardGfx ; gfx
	tx FullHealName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db FULL_HEAL
	dw FullHealEffectCommands ; effect commands
	tx FullHealDescription ; description
	dw NONE ; description (cont)

MiracleBerryCard: ; 33f9b (c:7f9b)
	db TYPE_TRAINER ; type
	gfx MiracleBerryCardGfx ; gfx
	tx MiracleBerryName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db MIRACLE_BERRY
	dw ReviveEffectCommands ; effect commands
	tx MiracleBerryDescription ; description
	dw NONE ; description (cont)

BillsMaintenanceCard: ; 33fa9 (c:7fa9)
	db TYPE_TRAINER ; type
	gfx BillsMaintenanceCardGfx ; gfx
	tx BillsMaintenanceName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db BILLS_MAINTENANCE
	dw MaintenanceEffectCommands ; effect commands
	tx BillsMaintenanceDescription ; description
	dw NONE ; description (cont)

PokemonFluteChannelCard: ; 33fb7 (c:7fb7)
	db TYPE_TRAINER ; type
	gfx PokemonFluteChannelCardGfx ; gfx
	tx PokemonFluteChannelName ; name
	db CIRCLE ; rarity
	db EVOLUTION | NONE ; sets
	db POKEMON_FLUTE_CHANNEL
	dw PokemonFluteEffectCommands ; effect commands
	tx PokemonFluteChannelDescription ; description
	dw NONE ; description (cont)

ArcadeGameCard: ; 33fc5 (c:7fc5)
	db TYPE_TRAINER ; type
	gfx ArcadeGameCardGfx ; gfx
	tx ArcadeGameName ; name
	db CIRCLE ; rarity
	db COLOSSEUM | NONE ; sets
	db ARCADE_GAME
	dw GamblerEffectCommands ; effect commands
	tx ArcadeGameDescription ; description
	dw NONE ; description (cont)

OldRodCard: ; 33fd3 (c:7fd3)
	db TYPE_TRAINER ; type
	gfx OldRodCardGfx ; gfx
	tx OldRodName ; name
	db CIRCLE ; rarity
	db LABORATORY | NONE ; sets
	db OLD_ROD
	dw RecycleEffectCommands ; effect commands
	tx OldRodDescription ; description
	dw NONE ; description (cont)
