EffectCommands::
; Each attack has a two-byte effect pointer (attack's 7th param) that points to one of these structures.
; Similarly, trainer cards have a two-byte pointer (7th param) to one of these structures, which determines the card's function.
; Energy cards also point to one of these, but their data is just $00.
;	db EFFECTCMDTYPE_* ($01 - $0a)
;	dw Function
;	...
;	db $00

; Commands are associated to a time or a scope (EFFECTCMDTYPE_*) that determines when their function is executed during the turn.
; - EFFECTCMDTYPE_INITIAL_EFFECT_1: Executed right after attack or trainer card is used. Bypasses Smokescreen and Sand Attack effects.
; - EFFECTCMDTYPE_INITIAL_EFFECT_2: Executed right after attack, Pokemon Power, or trainer card is used.
; - EFFECTCMDTYPE_DISCARD_ENERGY: For attacks or trainer cards that require putting one or more attached energy cards into the discard pile.
; - EFFECTCMDTYPE_REQUIRE_SELECTION: For attacks, Pokemon Powers, or trainer cards requiring the user to select a card (from e.g. play area screen or card list).
; - EFFECTCMDTYPE_BEFORE_DAMAGE: Effect command of an attack executed prior to the damage step. For trainer card or Pokemon Power, usually the main effect.
; - EFFECTCMDTYPE_AFTER_DAMAGE: Effect command executed after the damage step.
; - EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN: For attacks that may result in the defending Pokemon being switched out. Called only for AI-executed attacks.
; - EFFECTCMDTYPE_PKMN_POWER_TRIGGER: Pokemon Power effects that trigger the moment the Pokemon card is played.
; - EFFECTCMDTYPE_AI: Used for AI scoring.
; - EFFECTCMDTYPE_AI_SELECTION: When AI is required to select a card

; Attacks that have an EFFECTCMDTYPE_REQUIRE_SELECTION also must have either an EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN or an
; EFFECTCMDTYPE_AI_SELECTION (for anything not involving switching the defending Pokemon), to handle selections involving the AI.

; Similar attack effects of different Pokemon cards all point to a different command list,
; even though in some cases their commands and function pointers match.

; Function name examples
;	PoisonEffect                     ; generic effect shared by multiple attacks.
;	Paralysis50PercentEffect         ;
;	KakunaStiffenEffect              ; unique effect from an attack known by multiple cards.
;	MetapodStiffenEffect             ;
;	AcidEffect                       ; unique effect from an attack known by a single card
;	FoulOdorEffect                   ;
;	SpitPoison_Poison50PercentEffect ; unique effect made of more than one command.
;	SpitPoison_AIEffect              ;

TimeLoopEffectCommands: ;Discards a Psychic then applies the MrFuji effect.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MrFuji_BenchCheck
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, MrFuji_PlayerSelection
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, KadabraRecover_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, KadabraRecover_DiscardEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MrFuji_ReturnToDeckEffect
	db  $00


EkansWrapEffectCommands:
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

MayDoPlusCF20x2EffectCommands: 	;Specific to doing 20+20.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, TerrorStrike_SwitchDefendingPokemon
	dbw EFFECTCMDTYPE_AI, TerrorStrike_50PercentSelectSwitchPokemon
	db  $00

InflictPoisonEffectCommands: 	;Always inflicts poison.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoisonEffect
	dbw EFFECTCMDTYPE_AI, PoisonFang_AIEffect
	db  $00 

MayInflictPoisonEffectCommands:		;Inflicts poison on coin flip.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Poison50PercentEffect
	dbw EFFECTCMDTYPE_AI, WeepinbellPoisonPowder_AIEffect
	db  $00

ETBCFPRZEffectCommands: 		;ETB, 50% paralysis chance. Same as base quickfreeze.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, Quickfreeze_Paralysis50PercentEffect
	db  $00

Draw2EffectCommands:		; Pokemon Effect for drawing 2, only if damage was dealt
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, AttackDraw2Effect
	db  $00

PinsirIronGripEffectCommands: ; Energy Trans as an attack lol. Unused because AI c an't use it. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, EnergyTrans_CheckPlayArea
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EnergyTrans_TransferEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EnergyTrans_AIEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergyTrans_PrintProcedure
	db  $00

RandomStatusEffectCommands:		;Inflicts a random status, but requires damage to be set in effect functions.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RandomStatusEffect
	dbw EFFECTCMDTYPE_AI, RandomStatusEffect_AI
	db  $00

CF10X4EffectCommands:		; Flip coins 4x then 10 per heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, AcidEffect
	dbw EFFECTCMDTYPE_AI, GloomPoisonPowder_AIEffect
	db  $00

ShuffleHandThenDraw7EffectCommands:		;Shuffles hand into deck, then draws 7.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FoulOdorEffect
	db  $00

DracoMeteorEffectCommands: ;Discards 2 energies then targets 1 poke on the field, does 80 to it. Ai doesn't understand it because can't add a second AI_Selection code.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FireSpin_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, FireSpin_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, FireSpin_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, AnyTargetEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DracoMeteorDamageEffect ; in functions, contains a special animation effect found in: DealDamageToPlayAreaPokemon_DracoAnim.
	dbw EFFECTCMDTYPE_AI_SELECTION, FireSpin_AISelectEffect
	db  $00

DiscardHandDraw6Commands:		;Pokemon Effect for Professor Oak effect.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ProfessorOakEffect
	db  $00

HealEqualToDamageEffectCommands:		;Heals damage from self equal to damage dealt.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, GolbatLeechLifeEffect
	db  $00

ETBOppMills5EffectCommands:			;When this poke enters the field, mill 5 from the opponent's deck. Unused. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, KakunaStiffenEffect
	db  $00

Mill1OppCardEffectCommands:			; Mills 1 card from Opp's deck if attack does non-zero damage.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SpitPoison_AIEffect
	db  $00

HeracrossDoubleDamageEffectCommands:		;Specific to Heracross. Attacks from Heracross deal x2 damage next turn.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SwordsDanceEffect
	db  $00

CanSwitchOppBeforeDamageEffectCommands: 	;Gives player the option to switch Opp before or after dealing damage. Brute force coded so need B to exit.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ElectrodeSonicboom_UnaffectedByColorEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, ElectrodeSonicboom_NullEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, NinetalesLure_AISelectEffect
	db  $00

Do10MorePerInjuredPokesEffectCommands:		;Does +10 per injured pokemon on your side of the field.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ZubatLeechLifeEffect
	dbw EFFECTCMDTYPE_AI, BeedrillPoisonSting_AIEffect
	db  $00

CF20X2EffectCommands:		; Flip 2 coins, deal 20 per heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Twineedle_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, Twineedle_AIEffect
	db  $00

SwitchOppEffectCommands:		; Switches the opponent's active. Same as base Lure.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Lure_CheckBench
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Lure_SwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Lure_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Lure_AISelectEffect
	db  $00

SLPAndHealEffectCommands:		;Heals a certain amount, then forces user to sleep.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SLPHealEffect
	db  $00

MayDo20ToEachOppBenchEffectCommands:		;Flips coin per opp's bench, deal 20 on heads. Modified Thunderstorm code.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ExeggcuteLeechSeedEffect
	db  $00

HeadsPSNTailsCFNEffectCommands:		; Poison on heads, confusion on tails. Same as base Foul Odor effect.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FoulGas_PoisonOrConfusionEffect
	dbw EFFECTCMDTYPE_AI, FoulGas_AIEffect
	db  $00

MayPreventDamageOnlyEffectCommands:		;Prevents damage next turn, but not effects.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MetapodStiffenEffect
	db  $00

ETBNoOppTrainersEffectCommands:		; Upon entering the field, Opp can't use trainers next turn.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, HeadacheEffect
	db  $00

MoreDamageifHPLowEffectCommands:		;Boosts damage by X if HP is 30 or less. Unused in my hack.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BoostDamageifLowHPEffect
	dbw EFFECTCMDTYPE_AI, BoostDamageifLowHPAIEffect
	db  $00

NoRetreatEffectCommands:		;Adds an effect to make the DFP unable to retreat. No CF. Actually works on the AI in this hack, see Engine>Duel>AI>Retreat.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NewAcidEffect
	db  $00

CanSwitchSelfAfterDamageEffectCommands:		; Gives player the option to switch self after dealing damage. Brute force coded, so B needed to exit. AI will switch randomly.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Teleport_SwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Teleport_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Teleport_AISelectEffect
	db  $00

CF30PerSelfEnergyEffectCommands:		;Damage dealt per coinflip heads, uses variables instead of numbers. See effect functions for those elements.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BigEggsplosion_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, BigEggsplosion_AIEffect
	db  $00

CFT20ToSelfEffectCommands:		; Tails = 20 to self.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Thrash_ModifierEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Thrash_RecoilEffect
	db  $00

ToxicEffectCommands:			;Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Toxic_DoublePoisonEffect
	dbw EFFECTCMDTYPE_AI, Toxic_AIEffect
	db  $00

Do20PerUnownAEffectCommands:		;Boyfriends effect coded to Unown A instead.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BoyfriendsEffect
	db  $00

CF10X3EffectCommands:			; Flip 3 coins, 10 per heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NidoranFFurySwipes_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, NidoranFFurySwipes_AIEffect
	db  $00

MoonlightEffectCommands:		; Energy Search on a pokepower. Stupid thing should work 100% of the time now. AI doesn't understand this.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergySearch_DeckCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, NidoranFCallForFamily_CheckDeckAndPlayArea
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EnergySearch_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergySearch_PlayerSelection
	db  $00

AttackMayDoNothingEffectCommands:		;Tails = do nothing.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, HornHazard_NoDamage50PercentEffect
	dbw EFFECTCMDTYPE_AI, HornHazard_AIEffect
	db  $00

MayInflictConfusionEffectCommands:		;Confusion on coinflip heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NidorinaSupersonicEffect
	db  $00

MayDo10MoreAndConfuseEffectCommands:		; If heads, +10 damage and confusion. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NidorinaDoubleKick_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, NidorinaDoubleKick_AIEffect
	db  $00

Do10XPerYouAndOppEnergiesEffectCommands:		;Does 10x per your and opponent's energy.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NidorinoDoubleKick_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, NidorinoDoubleKick_AIEffect
	db  $00

MayPRZandPSNEffectCommands:		; CFH, poison and paralysis
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MayPSNAndPRZEffect
	dbw EFFECTCMDTYPE_AI, WeepinbellPoisonPowder_AIEffect
	db  $00

Do10MorePerOppRCEffectCommands:		;Does 10 damage for each * in the DFP's retreat cost in addition to a set number of damage.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ButterfreeMegaDrainEffect
	dbw EFFECTCMDTYPE_AI, ButterfreeMegaDrainEffect
	db  $00

InflictSleepEffectCommands:		;Always inflicts sleep.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SleepEffect
	db  $00

MorePARifHPLowEffectCommands:		;Flip a coin for paralysis. But ff HP 30 or less, flip 2 coins for paralysis instead.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SpecialParalysisEffect
	db  $00

LessDamageifDFPInjuredEffectCommands:		;Does 20 less damage if the DFP already has damage counters on it. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, LessDamageifDFPDamagedEffect
	dbw EFFECTCMDTYPE_AI, WeedlePoisonSting_AIEffect
	db  $00

CrossAttackEffectCommands:		; Does 40x2 CF damage, but if all tails, confuses and poisons instead.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CrossAttackEffect
	dbw EFFECTCMDTYPE_AI, CrossAttack_AIEffect
	db  $00

Heal1DamageifSuccessEffectCommands:		; Heals 10 damage if opp dealt nonzero damage from this attack.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, BulbasaurLeechSeedEffect
	db  $00

EnergyTransEffectCommands:		;Same as base, but does lightning energy instead.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, EnergyTrans_CheckPlayArea
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EnergyTrans_TransferEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EnergyTrans_AIEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergyTrans_PrintProcedure
	db  $00

AnyTarget10PerEnergyEffectCommands:		; Target any pkmn, deal 10 to it for every energy attached to it. 
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, AnyTargetEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Deal10DamageToTargetPerEnergy_DamageEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, AnyTargetAIEffect
	db  $00

ReduceBy20AfterAttackEffectCommands:		;Reduces damage by 20. Damage reduction is found in substatus.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, GrimerMinimizeEffect
	db  $00

NoPokePowersEffectCommands:		; All pokepowers stop working. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ToxicGasEffect
	db  $00

FinalBlowActualEffectCommands:		;Is now Heracross's Final Blow Pokepower
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FinalBlowEffect
	dbw EFFECTCMDTYPE_AI, FinalBlowAIEffect
	db  $00

MayDo20MoreOrPRZEffectCommands:		; 20 more damage on heads, paralysis if tails. Modified Thunderpunch effect.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BellsproutCallForFamily_PutInPlayAreaEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, BellsproutCallForFamily_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI, BellsproutCallForFamily_AISelectEffect
	db  $00

WeezingSmogEffectCommands:		; Free, was an experiment for... something. Is now a base Stretch Kick clone?
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PikachuLv16GrowlEffect
	db  $00

Do20ToAllBenchAnd50ToSelfEffectCommands:	; 20 damage to all player's benches, 50 damage to self.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, WeezingSelfdestructEffect
	db  $00

Do40AnyTargetEffectCommands:		;Does 40 damage to any target.
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, AnyTargetEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FeintAttackDamageEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, AnyTargetAIEffect
	dbw EFFECTCMDTYPE_AI, FeintAttackAIEffect
	db  $00

MayConfuseAndPoisonEffectCommands:		; Heads = Confuses and poisons opp. Same as base Venom Powder.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, VenomPowder_PoisonConfusion50PercentEffect
	dbw EFFECTCMDTYPE_AI, VenomPowder_AIEffect
	db  $00

MayParalyzeOrConfuseEffectCommands:		;Paralyzes on heads, confuses on tails. Modified code from Foul Odor.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PRZorCFNEffect
	db  $00

CanDo30ButRecoilEffectCommands:		;Yes/No: Do 30 more damage in exchange for 30 recoil damage
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FlareonDamageEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PlayerYesNoFlareonEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FlareonRecoilEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, FlareonFB_AISelectEffect
	dbw EFFECTCMDTYPE_AI, FlareonFB_AIEffect 
	db  $00

HealingLightEffectCommands:		; Pokepower that heals 10 damage per turn. Modified Heal nwithout the coinflip. AI does NOT understand this code.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Heal_OncePerTurnCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Heal_RemoveDamageEffect
	db  $00

Do40x3ThenSelfConfuseEffectCommands:		; Flips 3 coins, 40 damager per heads, then guarenteed confusion. Same as base Petal Dance. Unused this game.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PetalDance_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, PetalDance_AIEffect
	db  $00

TangelaStunSporeEffectCommands:		; Does extra damage if a T energy is attached, also mills 3 cards from opp.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ExtraDamageIfTEnergiesEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ExtraEffectIfTEnergiesEffect
	dbw EFFECTCMDTYPE_AI, ExtraDamageIfTEnergiesAIEffect
	db  $00

DiscardLorFforStuffEffectCommands:		; Must discard a F or L energy. If F, +20 damage. If L, heal 20 HP.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, HoohMoreDamageEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, HoohRecoverEffect
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PlayerForLSelectionHoohCEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Hooh_AISelectEffect
	dbw EFFECTCMDTYPE_AI, HoohAIDamageEffect
	db  $00

AromatherapyEffectCommands:		; Modified base Solar Power that only Full Heals your side.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, SolarPower_CheckUse
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SolarPower_RemoveStatusEffect
	db  $00

FloodlightEffectCommands:	;
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FloodlightCheckEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE,Paralysis50PercentEffect
	dbw EFFECTCMDTYPE_AI, FloodlightEffect
	db  $00

WEWaterBoostEffectCommands:	; Water energy boost effect for an attack costing 1 Water and 1 any other energy.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, OmastarWaterGunEffect
	dbw EFFECTCMDTYPE_AI, OmastarWaterGunEffect
	db  $00

CF30X2DamageEffectCommands:	; Flip 2 coins, 30 per heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, OmastarSpikeCannon_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, OmastarSpikeCannon_AIEffect
	db  $00

PrecognitionEffectCommands:	; Same as base Clairvoyance effect.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ClairvoyanceEffect
	db  $00

WWaterBoostEffectCommands:	; Water energy boost effect for an attack costing 1 Water energy.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, OmanyteWaterGunEffect
	dbw EFFECTCMDTYPE_AI, OmanyteWaterGunEffect
	db  $00

MayDo10ToOppBenchAndPRZEffectCommands:		; Heads = Deal 10 to all bench and then Paralysis. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, WartortleWithdrawEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, BubbleShowerBenchEffect
	db  $00

RainDanceEffectCommands:		;Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RainDanceEffect
	db  $00

WWWWaterBoostEffectCommands:		; Water energy boost effect for an attack costing 3 Water energy.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, HydroPumpEffect
	dbw EFFECTCMDTYPE_AI, HydroPumpEffect
	db  $00

GyaradosBubblebeamEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

UltrabrokenEffectCommands:		;Is now an ultra broken attack command used to help me with testing
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, KinglerFlail_HPCheck
	db  $00

SearchFossilEggEffectCommandswnEffectCommands:		; Searched for Unown A or Unown J. Modified NidoranF code. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, KrabbyCallForFamily_CheckDeckAndPlayArea
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, KrabbyCallForFamily_PutInPlayAreaEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, KrabbyCallForFamily_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, KrabbyCallForFamily_AISelectEffect
	db  $00

Do10XPerSelfDamageEffectCommands:	; Does 10 damage for every 10 damage on you.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MagikarpFlail_HPCheck
	dbw EFFECTCMDTYPE_AI, MagikarpFlail_AIEffect
	db  $00

NoOppTrainersEffectCommands:		; Opponent can't play trainers next turn. Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, HeadacheEffect
	db  $00

CFCFNOrNoTrainersEffectCommands:		;free, was an experiment
	db  $00

GolduckPsyshockEffectCommands:		;
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FossilEggSearch_CheckDeckAndPlayArea
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FossilEggSearch_PutInPlayAreaEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, FossilEggSearch_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, FossilEggSearch_AISelectEffect
	db  $00

GolduckHyperBeamEffectCommands:		;Free, deleted to make more space
	db  $00

Do20MorePerSelfPEnergyEffectCommands: 	
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SeadraWaterGunEffect
	dbw EFFECTCMDTYPE_AI, SeadraWaterGunEffect
	db  $00
; Does 20 more damage for each additional psychic energy, for an attack that costs 1 psychic energy and 2 any other energy. Capped at 80. Modified Water boost code.

Entei2MayGetImmunityEffectCommands: 	; Agility effect specific to Entei2, because it needs an additional animation (see in functions).
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SeadraAgilityEffect
	db  $00

CanOnlyUseAttackOnceEffectCommands:		;Makes it so that this attack can only be used once per copy of the pokemon card.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ShellderSupersonicEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, HideInShellEffect
	db  $00

NoLimitExtraWEffectCommands:		;Does +10 per extra W energy attached to the active. WWE only. No limit on damage added.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BlastoiseHydroPumpEffect
	dbw EFFECTCMDTYPE_AI, BlastoiseHydroPumpEffect
	db  $00

WWEWaterBoostEffectCommands:		; Water energy boost effect for an attack costing 2 Water energy and 1 of any energy.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, VaporeonWaterGunEffect
	dbw EFFECTCMDTYPE_AI, VaporeonWaterGunEffect
	db  $00

DewgongIceBeamEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

Discard1WHealAllDamageCommands:		; Recover code, same as base. Discards a Water energy to heal.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, StarmieRecover_CheckEnergyHP
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, StarmieRecover_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, StarmieRecover_HealEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, StarmieRecover_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, StarmieRecover_AISelectEffect
	db  $00

StarmieStarFreezeEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

SquirtleBubbleEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

SquirtleWithdrawEffectCommands:		;Free, deleted to make room
	db  $00

HorseaSmokescreenEffectCommands:		;Free, deleted to make room
	db  $00

NoRetreatAbilityEffectCommands:		; Does nothing, just here to prevent game crashes. Real effect is in Substatus, Duel > Core and Duel> AI> Retreat.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, SuctionCupsEffect
	db  $00

TentacruelJellyfishStingEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoisonEffect
	dbw EFFECTCMDTYPE_AI, JellyfishSting_AIEffect
	db  $00

OppCantUse1AttackEffectCommands:		; Choose an attack and Opp can't use it next turn. Same as base Amnesia.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PoliwhirlAmnesia_CheckAttacks
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PoliwhirlAmnesia_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoliwhirlAmnesia_DisableEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, PoliwhirlAmnesia_AISelectEffect
	db  $00

MoreDamageIfDFPInjuredEffectCommands:		;Does 20 more damage if the DFP has damage counters on it
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MoreDamageifDFPDamagedEffect
	dbw EFFECTCMDTYPE_AI, MoreDamageifDFPDamagedAIEffect
	db  $00

PoliwrathWaterGunEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoliwrathWaterGunEffect
	dbw EFFECTCMDTYPE_AI, PoliwrathWaterGunEffect
	db  $00

Discard1EnergyFromTargetEffectCommands:		;Discards 1 energy from Opp if damage is successful. Same as base Whirlpool, Hyper Beam, and the rest.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Whirlpool_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Whirlpool_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Whirlpool_AISelectEffect
	db  $00

Do10LessPerOppRCEffectCommands:		;Does 10 less damage for every * in opp's retreat cost.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoliwagWaterGunEffect
	dbw EFFECTCMDTYPE_AI, PoliwagWaterGunEffect
	
	db  $00

Do10PerOppRCEffectCommands:		;Does 10 damage for every * in opp's retreat cost.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ClampEffect
	dbw EFFECTCMDTYPE_AI, ClampEffect
	db  $00

DriveOffEffectCommands:		; Pokepower, if Arcanine is active, force switch the DFP.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, DriveOffCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DriveOffSetFlag
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PidgeottoWhirlwind_SelectEffect
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, PidgeottoWhirlwind_SelectEffect
	db  $00

ArticunoFreezeDryEffectCommands:		;Does 10 less for every * in DFP's retreate, then forced switch.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoliwagWaterGunEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PidgeyWhirlwind_SwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PidgeyWhirlwind_SelectEffect
	dbw EFFECTCMDTYPE_AI, PoliwagWaterGunEffect
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, PidgeyWhirlwind_SelectEffect
	db  $00

CF10ToYourOrOppBenchEffectCommands:		;CF 10 to all bench, if H it's opp's, if T it's yours.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Blizzard_BenchDamage50PercentEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Blizzard_BenchDamageEffect
	db  $00

TentacoolCowardiceEffectCommands:
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Cowardice_Check
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Cowardice_RemoveFromPlayAreaEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Cowardice_PlayerSelectEffect
	db  $00

LaprasWaterGunEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, LaprasWaterGunEffect
	dbw EFFECTCMDTYPE_AI, LaprasWaterGunEffect
	db  $00

LaprasConfuseRayEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Confusion50PercentEffect
	db  $00

ETB10ToOppBenchEffectCommands:		; When the card enters play, Pokepower triggers, does 10 to each bench. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, MagnetonLv35SelfdestructEffect
	db  $00

ArticunoIceBreathEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, IceBreath_ZeroDamage
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, IceBreath_RandomPokemonDamageEffect
	db  $00

SelfDoubleDamageEffectCommands:		; Specific to Crystal Charizard. Next turn, all opp's damage is doubled on it.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FocusEnergyEffect
	db  $00

ArcanineFlamethrowerEffectCommands:		;Free
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ArcanineFlamethrower_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ArcanineFlamethrower_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, ArcanineFlamethrower_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, ArcanineFlamethrower_AISelectEffect
	db  $00

Do40ToSelfEffectCommands:		; Does 40 damage to self. Modified Take Down code.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, TakeDownEffect
	db  $00

MayDo30Plus20EffectCommands:		; Heads = 30+20 damage. Modified quick attack code.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ArcanineQuickAttack_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, ArcanineQuickAttack_AIEffect
	db  $00

Discard2FThenPlus10PerSelfDamageEffectCommands:		; Discards 1 fire, then +10 damage per damage counter on self. -1F discard comapred to base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ArcanineFlamethrower_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ArcanineFlamethrower_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FlamesOfRage_DamageBoostEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, ArcanineFlamethrower_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, ArcanineFlamethrower_AISelectEffect
	dbw EFFECTCMDTYPE_AI, FlamesOfRage_AIEffect
	db  $00

RapidashStompEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RapidashStomp_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, RapidashStomp_AIEffect
	db  $00

RapidashAgilityEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RapidashAgilityEffect
	db  $00

SwitchAndPoisonEffectCommands:		; Can switch the opp out (or not) then poisons it and makes it unable to retreat next turn. Modifed Lure code.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ElectrodeSonicboom_UnaffectedByColorEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, ElectrodeSonicboom_NullEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PoisonAcidEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, NinetalesLure_AISelectEffect
	db  $00

NinetalesFireBlastEffectCommands:		;Free
	db  $00

Discard1FireEffectCommands:		; Discards 1 fire energy, then attacks for damage. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Ember_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Ember_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Ember_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Ember_AISelectEffect
	db  $00

DiscardFForMoreDamageEffectCommands:		; Modified Wildfire code. Discard any number of fire energy (min 1) then +20 per discard. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Wildfire_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Wildfire_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Wildfire_DiscardDeckEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Wildfire_DiscardEnergyEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Wildfire_AISelectEffect
	dbw EFFECTCMDTYPE_AI, Wildfire_AIEffect
	db  $00

MoltresLv35DiveBombEffectCommands:		;Free
	db  $00

FlareonQuickAttackEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FlareonQuickAttack_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, FlareonQuickAttack_AIEffect
	db  $00

FlareonFlamethrowerEffectCommands:		;Free
	db  $00

FinalBlowEffectCommands:		;Free
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FinalBlowPPEffect
	db  $00

SmokescreenEffectCommands:		; If opp attacks next turn, they must flip a coin. If tails, attack does nothing.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MagmarSmokescreenEffect
	db  $00

MagmarSmogEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Poison50PercentEffect
	dbw EFFECTCMDTYPE_AI, MagmarSmog_AIEffect
	db  $00

CharmeleonFlamethrowerEffectCommands:		;Free
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, CharmeleonFlamethrower_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, CharmeleonFlamethrower_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, CharmeleonFlamethrower_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, CharmeleonFlamethrower_AISelectEffect
	db  $00

AllEnergyIsFireEffectCommands:		; All energy turns to fire. Same as base Energy Burn. This command is just flavor, Energy Burn is found elsewhere.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergyBurnEffect
	db  $00

Discard2EnergyEffectCommands:		; Discards 2 energies, then attacks.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FireSpin_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, FireSpin_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, FireSpin_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, FireSpin_AISelectEffect
	db  $00

DeepSleepEffectCommands:		; Used for Gengars Deep Sleep. This command is just flavor, Deep Sleep code is found in Duel -> Core.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergyBurnEffect
	db  $00

FlareonRageEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FlareonRage_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, FlareonRage_AIEffect
	db  $00

NinetalesMixUpEffectCommands:		;Free, this attack is just pure chaos, I swear...
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MixUpEffect
	db  $00

CF10X9EffectCommands:		; Flip 9 coins, 10 per heads. Modified Dancing Embers code.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DancingEmbers_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, DancingEmbers_AIEffect
	db  $00

Get4FireFromDeckEffectCommands:		; When it enters the field, triggers the pokepower and gets 4 fires from the deck. Modified Firegiver code.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Firegiver_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, Firegiver_AddToHandEffect
	db  $00

MoltresLv37DiveBombEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MoltresLv37DiveBomb_Success50PercentEffect
	dbw EFFECTCMDTYPE_AI, MoltresLv37DiveBomb_AIEffect
	db  $00

AbraPsyshockEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

CurseEffectCommands:		; Same as base Curse.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Curse_CheckDamageAndBench
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Curse_TransferDamageEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Curse_PlayerSelectEffect
	db  $00

DamageAndDo10ToABenchEffectCommands:	; Deal damage, then deal 10 to a benched opp. Same as base.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, GengarDarkMind_DamageBenchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, GengarDarkMind_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, GengarDarkMind_AISelectEffect
	db  $00

MayInflictSleepEffectCommands:		; Heads = Sleep effect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SleepingGasEffect
	db  $00

GastlyDestinyBondEffectCommands:		;Free, because no one ever used it and its boring.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, DestinyBond_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, DestinyBond_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DestinyBond_DestinyBondEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, DestinyBond_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, DestinyBond_AISelectEffect
	db  $00

GastlyLickEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

Retrieve2DiscardedEnergyEffectCommands:		; Gets 2 energy from discard pile to hand. Modified Energy Conversion code.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergyConversion_CheckEnergy
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EnergyConversion_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergyConversion_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, EnergyConversion_AISelectEffect
	db  $00

Do20moreIfDFPStatusedEffectCommands:		;Does +20 if DFP is statused.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DreamEaterEffect
	dbw EFFECTCMDTYPE_AI, TransparencyEffect ; Define damage for AI here (10+20)
	db  $00

ExtraDMGIfOppStatusedEffectCommands:	; Modified Dream eater code. Does extra damage if DFP is affected by a status. Define AI damage for each iteration
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DreamEaterEffect
	dbw EFFECTCMDTYPE_AI, DreamEaterAIEffect ; Define damage for AI here (30+20)
	db  $00

EtherealFlameEffectCommands:		;Does +20 if opp statused, then CF's for confusion.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DreamEaterEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Confusion50PercentEffect
	dbw EFFECTCMDTYPE_AI, DreamEaterAIEffect ; Define damage for AI here
	db  $00

InflictSleepAfterDamageEffectCommands:		; Inflicts sleep after damage. Same as other sleep effect.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SleepEffect
	db  $00

ProphecyEffectCommands:		; Check 3 deck cards, reorder them. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Prophecy_CheckDeck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Prophecy_ReorderDeckEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Prophecy_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Prophecy_AISelectEffect
	db  $00

CF20ToABenchEffectCommands:		;Does 20 damage to a benched pokemon on a CFH, or 10 to self with a T. Modified from base hypno dark mind.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, HypnoDarkMind_DamageBenchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, HypnoDarkMind_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, HypnoDarkMind_AISelectEffect
	db  $00

DrowzeeConfuseRayEffectCommands:		;free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Confusion50PercentEffect
	db  $00

MythicalShieldEffectCommands:		; Same as base Invisible Walls
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, InvisibleWallEffect
	db  $00

Do10MorePerOppDamageEffectCommands:	; Does 10 more damage per opponent's damage counters. Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MrMimeMeditate_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, MrMimeMeditate_AIEffect
	db  $00

DamageSwapEffectCommands:		; Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, DamageSwap_CheckDamage
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DamageSwap_SelectAndSwapEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DamageSwap_SwapEffect
	db  $00

AlakazamConfuseRayEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Confusion50PercentEffect
	db  $00

EeveelutionEffectCommands:		; Searches for a card that evolves from Eevee and puts it into the hand.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EeveelutionCheckDeckEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EeveelutionAddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EeveelutionPlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, EeveelutionAISelectEffect
	db  $00

DevolutionBeamEffectCommands:		; Devolves a pokemon. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, DevolutionBeam_CheckPlayArea
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, DevolutionBeam_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DevolutionBeam_LoadAnimation
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DevolutionBeam_DevolveEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, DevolutionBeam_AISelectEffect
	db  $00

CutenessEffectCommands:		; Same as base Neutralizing Shield.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, NeutralizingShieldEffect
	db  $00

MewPsyshockEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

Do10MorePerOppEnergyEffectCommands:	; Does 10 more damage for each opp energy. Same as base Psychic.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Psychic_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, Psychic_AIEffect
	db  $00

MewtwoBarrierEffectCommands:		; Same as base, unused to prevent degenerate exploits.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Barrier_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Barrier_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Barrier_BarrierEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Barrier_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Barrier_AISelectEffect
	db  $00

Do30moreIfDFPStatusedEffectCommands:	; 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CriticalStrikeEffect
	dbw EFFECTCMDTYPE_AI, CriticalStrikeEffectAIEffect ; Define damage for AI here (20+30)
	db  $00

Get2DiscardEnergyAttachToSelfEffectCommands:	; Gets 2 energy from the discard and attached them to self. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MewtwoLv60EnergyAbsorption_CheckDiscardPile
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MewtwoLv60EnergyAbsorption_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, MewtwoLv60EnergyAbsorption_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, MewtwoLv60EnergyAbsorption_AISelectEffect
	db  $00

AltruismEffectCommands:		; Same as base Strange Behavior
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, StrangeBehavior_CheckDamage
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, StrangeBehavior_SelectAndSwapEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, StrangeBehavior_SwapEffect
	db  $00

Do20MorePerOppEnergyEffectCommands:	; Does +20 damage per opponent's energy. Modified Psychic code.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Psychic_DamageBoostEffect2
	dbw EFFECTCMDTYPE_AI, Psychic_AIEffect2
	db  $00

SlowpokeSpacingOutEffectCommands:	;Free
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, SpacingOut_CheckDamage
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SpacingOut_Success50PercentEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SpacingOut_HealEffect
	db  $00

ScavengeEffectCommands:		; Gets a trainer from the discard at the cost of 1 psychic energy. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Scavenge_CheckDiscardPile
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Scavenge_PlayerSelectEnergyEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Scavenge_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Scavenge_PlayerSelectTrainerEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Scavenge_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Scavenge_AISelectEffect
	db  $00

SlowpokeAmnesiaEffectCommands:	;Free
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, SlowpokeAmnesia_CheckAttacks
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, SlowpokeAmnesia_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SlowpokeAmnesia_DisableEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, SlowpokeAmnesia_AISelectEffect
	db  $00

KadabraRecoverEffectCommands:	;Free, although some effect functions are used for Celebi's Time Warp.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, KadabraRecover_CheckEnergyHP
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, KadabraRecover_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, KadabraRecover_HealEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, KadabraRecover_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, KadabraRecover_AISelectEffect
	db  $00

JynxDoubleslapEffectCommands:	;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, JynxDoubleslap_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, JynxDoubleslap_AIEffect
	db  $00

JynxMeditateEffectCommands:	;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, JynxMeditate_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, JynxMeditate_AIEffect
	db  $00

MysteryAttackEffectCommands:	; Modified to do more damage, otherwise, same as base. Does a random effect.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MysteryAttack_RandomEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MysteryAttack_RecoverEffect
	dbw EFFECTCMDTYPE_AI, MysteryAttack_AIEffect
	db  $00

CFXMill2PerHeadsEffectCommands:		; Flip coins until tails, mill 2 from opp for each heads. Modified Stone Barrage and Wildfire effect.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, StoneBarrage_MultiplierEffect
	db  $00

OnixHardenEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, OnixHardenEffect
	db  $00

PrimeapeFurySwipesEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PrimeapeFurySwipes_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, PrimeapeFurySwipes_AIEffect
	db  $00

PrimeapeTantrumEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, TantrumEffect
	db  $00

MagmaArmorEffectCommands:		; Same as base Strikes Back.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, StrikesBackEffect
	db  $00

IroncladEffectCommands:		; Same as base Kabuto Armor.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, KabutoArmorEffect
	db  $00

HealHalfDamageEffectCommands:		; Heals damage equal to half the damage done to opp.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, AbsorbEffect
	db  $00

ReduceDamageBy20EffectCommands:		; Reduced damage by 20 next turn.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SnivelEffect
	db  $00

Do10MorePerSelfDamageEffectCommands:	; Does 10 more damage per self damage counters.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CuboneRage_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, CuboneRage_AIEffect
	db  $00

MarowakBonemerangEffectCommands:	;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Bonemerang_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, Bonemerang_AIEffect
	db  $00

SearchForTPutOnBenchEffectCommands:	; Searches for a basic fighting type and puts it on the bench. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MarowakCallForFamily_CheckDeckAndPlayArea
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MarowakCallForFamily_PutInPlayAreaEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, MarowakCallForFamily_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, MarowakCallForFamily_AISelectEffect
	db  $00

Do10LessPerSelfDamageEffectCommands:	; This attack will do 10 less per damage counter on you.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, KarateChop_DamageSubtractionEffect
	dbw EFFECTCMDTYPE_AI, KarateChop_AIEffect
	db  $00

MachokeSubmissionEffectCommands:	;Free
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SubmissionEffect
	db  $00

Do10ToAllBenchAnd40ToSelfEffectCommands:	; Does 10 to all benched pokemon and 40 to self. Modified selfdestruct code.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, GolemSelfdestructEffect
	db  $00

GravelerHardenEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, GravelerHardenEffect
	db  $00

RamEffectCommands:		; Does 20 to self, then your opp must switch their pokemon.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Ram_RecoilSwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Ram_SelectSwitchEffect
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, Ram_SelectSwitchEffect
	db  $00

CFHOppCantAttackEffectCommands:		; Heads = opp can't attack next turn. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, LeerEffect
	db  $00

Do30ToABenchEffectCommands:		; Does 30 to a benched opp. Modified Stretch kick code.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, StretchKick_CheckBench
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, StretchKick_BenchDamageEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, StretchKick_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, StretchKick_AISelectEffect
	db  $00

SandshrewSandAttackEffectCommands:	;Same as smokescreen, but sand attack name specific
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SandAttackEffect
	db  $00

CF20X3EffectCommands:	; Flip 3 coins, 20 per heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SandslashFurySwipes_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, SandslashFurySwipes_AIEffect
	db  $00

Do10ToOwnBenchEffectCommands:		; Does 10 damage to all your benched pokes. Same as base Earthquake.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EarthquakeEffect
	db  $00

NoMoreEvosBothPlayersEffectCommands:		; No more evolutions can be played. Same as base Prehistoric Power.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PrehistoricPowerEffect
	db  $00

SwitchAndNoRetreatEffectCommands:		; Can switch DFP, then does damage and can't retreat.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ElectrodeSonicboom_UnaffectedByColorEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, ElectrodeSonicboom_NullEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, NewAcidEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, NinetalesLure_AISelectEffect
	db  $00

MarowakBoneAttackEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BoneAttackEffect
	db  $00

WailEffectCommands:		; Fills player's bench with random basics. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Wail_BenchCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Wail_FillBenchEffect
	db  $00

ElectabuzzThundershockEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

MayDoPlus10Or10ToSelfEffectCommands:		; Heads = +10 to opp, Tails = 10 to you. Same as base Thunderpunch.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Thunderpunch_ModifierEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Thunderpunch_RecoilEffect
	dbw EFFECTCMDTYPE_AI, Thunderpunch_AIEffect
	db  $00

HalveDamageEffectCommands:		; Next turn, halve all damage. Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, LightScreenEffect
	db  $00

MayDo20Plus20EffectCommands:		; May do 20 more on copinflip. Specific to an attack that does 20+20.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ElectabuzzQuickAttack_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, ElectabuzzQuickAttack_AIEffect
	db  $00

MagnemiteThunderWaveEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

MagnemiteSelfdestructEffectCommands:		;Free
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MagnemiteSelfdestructEffect
	db  $00

ZapdosThunderEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ZapdosThunder_Recoil50PercentEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ZapdosThunder_RecoilEffect
	db  $00

DiscardAllEnergyEffectCommands:		; Discards all energy upon use. Same as base Thunderbolt.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ThunderboltEffect
	db  $00

ZapdosThunderstormEffectCommands:		;Free
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ThunderstormEffect
	db  $00

JolteonQuickAttackEffectCommands:	;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, JolteonQuickAttack_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, JolteonQuickAttack_AIEffect
	db  $00

JolteonPinMissileEffectCommands:	;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PinMissile_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, PinMissile_AIEffect
	db  $00

FlyingPikachuThundershockEffectCommands:	;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

MayGetImmunityOrDoNothingEffectCommands:	; Heads = Agility effect, Tails = Do nothing.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Fly_Success50PercentEffect
	dbw EFFECTCMDTYPE_AI, Fly_AIEffect
	db  $00

CFT10ToSelfEffectCommands:	; Tails = 10 to self.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ThunderJolt_Recoil50PercentEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ThunderJolt_RecoilEffect
	db  $00

PikachuSparkEffectCommands:		;Free
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Spark_BenchDamageEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Spark_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Spark_AISelectEffect
	db  $00

Do20ToOppBenchOnlyEffectCommands:	; Does 20 damage to an opponents bench, same as base Stretch Kick.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, StretchKick_CheckBench
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PikachuLv16GrowlEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, StretchKick_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, StretchKick_AISelectEffect
	db $00

PikachuLv16ThundershockEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

ReduceDamageBy10EffectCommands:		;Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PikachuAltLv16GrowlEffect
	db  $00

SurprisePresentEffectCommands:	;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PresentEffect
	db  $00

PsysplashEffectCommands:	; 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PsywaveEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ChainLightningEffect
	dbw EFFECTCMDTYPE_AI, PsywaveAIEffect
	db  $00

RaichuAgilityEffectCommands:	;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RaichuAgilityEffect
	db  $00

CFT30ToSelfEffectCommands:	; Tails = 30 to self.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RaichuThunder_Recoil50PercentEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RaichuThunder_RecoilEffect
	db  $00

Do10To3BenchedEffectCommands:	; Does 10 to up to 3 benched pokemon. Same as base.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Gigashock_BenchDamageEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Gigashock_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Gigashock_AISelectEffect
	db  $00

MagnetonThunderWaveEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

Do10ToAllOppBenchedEffectCommands:	; Does 10 to all opp's benched pokemon. Modified Selfdestruct code.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MagnetonLv28SelfdestructEffect
	db  $00

DontApplyWREffectCommands:		; Does not apply Weakness or Resistance for this attack.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MagnetonSonicboom_UnaffectedByColorEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MagnetonSonicboom_NullEffect
	dbw EFFECTCMDTYPE_AI, MagnetonSonicboom_UnaffectedByColorEffect
	db  $00

MagnetonLv35SelfdestructEffectCommands:		;Free
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FireSpin_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, FireSpin_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, FireSpin_DiscardEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MagnetonLv35SelfdestructEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, FireSpin_AISelectEffect
	db  $00

ETB30ToARandomEffectCommands:		; Enter the field, trigger the pokepower to do 30 to a random poke.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PealOfThunder_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, PealOfThunder_RandomlyDamageEffect
	db  $00

DiscardAllLForPlusDamageEffectCommands:	 ; Can choose to discard all L. If yes, does 80 damage instead of 40.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RaichuLS_DamageEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PlayerYesOrNoSelectionRaichu1Effect
	dbw EFFECTCMDTYPE_AI_SELECTION, RaichuLS_AISelectEffect
	dbw EFFECTCMDTYPE_AI, RaichuLS_AIEffect
	db  $00

ShinyFeatherEffectCommands:		; Enters the field to trigger the pokepower. Gets a trainer card from discard. Modified Itemfinder effect. Ai doesn't understand this?
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, MagneticStormEffect
	db  $00

CanSwitchOppBeforeDamageAndSLPEffectCommands:	; Can switch the opp before doing damage. After damage, sleep. Modified Ram effect. Unused in game.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ElectrodeSonicboom_UnaffectedByColorEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, ElectrodeSonicboom_NullEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SleepEffect
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, ElectrodeSonicboom_UnaffectedByColorEffect
	db  $00

SearchAndAttachEnergyEffectCommands:	; Same as base energy spike, except in SRC>Duel>AI> Core and Special Attacks, the AI can get Lightning or Grass energy.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergySpike_DeckCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EnergySpike_AttachEnergyEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergySpike_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, EnergySpike_AISelectEffect
	db  $00

CF30X3EffectCommands:	; Flip 3 coins, 30 per heads. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, JolteonDoubleKick_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, JolteonDoubleKick_AIEffect
	db  $00

JolteonStunNeedleEffectCommands:	;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

OppMayNotAttackEffectCommands:		; Heads = Opp can't attack next turn.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, TailWagEffect
	db  $00

MayDo10Plus20EffectCommands:	; Heads = +20 damage. Specific to an attack that does 10+20.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EeveeQuickAttack_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, EeveeQuickAttack_AIEffect
	db  $00

SpearowMirrorMoveEffectCommands:	;Free
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, SpearowMirrorMove_InitialEffect1
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, SpearowMirrorMove_InitialEffect2
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SpearowMirrorMove_BeforeDamage
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SpearowMirrorMove_AfterDamage
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, SpearowMirrorMove_PlayerSelection
	dbw EFFECTCMDTYPE_AI_SELECTION, SpearowMirrorMove_AISelection
	dbw EFFECTCMDTYPE_AI, SpearowMirrorMove_AIEffect
	db  $00

MayGetImmunityEffectCommands:
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FearowAgilityEffect
	db  $00
; Heads= immunity to everything. Early hacking rumor had it that only Fearow's agility works. Was false but I believe it at the time, so only Fearow's agility made it in.

StepInEffectCommands:	; Same as base. Ai might not know how to do this; no AI effect codes found?
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, StepIn_BenchCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, StepIn_SwitchEffect
	db  $00

CF40X2EffectCommands:	; Flip 2 coins, 40 per heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DragoniteLv45Slam_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, DragoniteLv45Slam_AIEffect
	db  $00

PokepowerNoStatusEffectCommands:	; Can't get statused, pokepower. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ThickSkinnedEffect
	db  $00

MayInflictParalysisEffectCommands:	; Heads = opp paralyzed.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

Do20ToABenchEffectCommands:	; Does 20 damage to a benched pokemon in addition to attack. Similar to base Stretch Kick. 
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, LeekSlap_SetUsedThisDuelFlag
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, LeekSlap_OncePerDuelCheck
	dbw EFFECTCMDTYPE_AI_SELECTION, GengarDarkMind_AISelectEffect
	db  $00

Draw1CardEffectCommands:	; Draws 1 card. Same as base.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FetchEffect
	db  $00

CF20X4EffectCommands:		; Flip 4 coins, 20 per heads. Same as base Kangaskhans comet punch.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CometPunch_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, CometPunch_AIEffect
	db  $00

MayDo20Plus10EffectCommands:	; Heads = +10 damage. Specific to an attack that does 20+10.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, TaurosStomp_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, TaurosStomp_AIEffect
	db  $00

Do10PerSelfDamageThenMayConfuseEffectCommands:	; Does +10 per self damage, then Tails = self confusion. Same as base rampage.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Rampage_Confusion50PercentEffect
	dbw EFFECTCMDTYPE_AI, Rampage_AIEffect
	db  $00

DoduoFuryAttackEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FuryAttack_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, FuryAttack_AIEffect
	db  $00

ReduceRCBy2EffectCommands:		;Reduced Retreat by 1. Messing with this code in substatus breaks the game in very interesting ways. Not reccomended to hack.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RetreatAidEffect
	db  $00

Heal20DamageEffectCommands:		; Heals 20 damage exactly from user, residual effect. Modified First Aid code.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, DodrioRage_AIEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DodrioRage_DamageBoostEffect
	db  $00

MayDraw1CardEffectCommands:		; Heads = Draw 1 card.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PayDayEffect
	db  $00

DragonairSlamEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DragonairSlam_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, DragonairSlam_AIEffect
	db  $00

DragonairHyperBeamEffectCommands:		;Free
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DragonairHyperBeam_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, DragonairHyperBeam_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, DragonairHyperBeam_AISelectEffect
	db  $00

CopyOppAttackEffectCommands2:		;Same as base, needs 1 energy for metronome effect
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ClefableMetronome_CheckAttacks
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ClefableMetronome_UseAttackEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, ClefableMetronome_AISelectEffect
	db  $00

Heal20IfSuccessEffectCommands:		; Heal 20 damage, but only if you deal nonzero damage to opp. 
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ClefableMinimizeEffect
	db  $00

IfNoKOReturnToHandEffectCommands: ;If the attack doesn't KO opponent, put it and all cards attached to it in the opp's hand. Same as base hurricane.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, HurricaneEffect
	db  $00

PidgeottoWhirlwindEffectCommands:		;Free
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PidgeottoWhirlwind_SwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PidgeottoWhirlwind_SelectEffect
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, PidgeottoWhirlwind_SelectEffect
	db  $00

CounterLastAttackEffectCommands:	; Does the exact same attack as the opponent did last turn, incl;uding effects. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PidgeottoMirrorMove_InitialEffect1
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PidgeottoMirrorMove_InitialEffect2
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PidgeottoMirrorMove_BeforeDamage
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PidgeottoMirrorMove_AfterDamage
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PidgeottoMirrorMove_PlayerSelection
	dbw EFFECTCMDTYPE_AI_SELECTION, PidgeottoMirrorMove_AISelection
	dbw EFFECTCMDTYPE_AI, PidgeottoMirrorMove_AIEffect
	db  $00

OppMill5IfSuccessEffectCommands:	;If opp dealt nonzero damage, mills five from their deck.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SingEffect
	db  $00

CopyOppAttackEffectCommands:	; Copies 1 opp attack and uses it as this attack, needs 2 energy to use. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ClefairyMetronome_CheckAttacks
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ClefairyMetronome_UseAttackEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, ClefairyMetronome_AISelectEffect
	db  $00

WigglytuffLullabyEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SleepEffect
	db  $00

Do10MorePerSelfBenchEffectCommands:	; Does 10 more for each of your benched pokemon. Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DoTheWaveEffect
	dbw EFFECTCMDTYPE_AI, DoTheWaveEffect
	db  $00

JigglypuffLullabyEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SleepEffect
	db  $00

SelfHeal10EffectCommands:		; Heals 10 damage only if successful. Same as base, except some attacks modified to do damage and thus aren't residual.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FirstAid_DamageCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FirstAid_HealEffect
	db  $00

Do20ToSelfEffectCommands:		; Does 20 damage to self. Same as base.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, JigglypuffDoubleEdgeEffect
	db  $00

PersianPounceEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PounceEffect
	db  $00

LickitungTongueWrapEffectCommands:		;Free
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

LickitungSupersonicEffectCommands:		;Free
	db  $00

SwitchOppAfterDamageEffectCommands:	; Switches opp after dealing damage. Same as base whirlwind.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PidgeyWhirlwind_SwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PidgeyWhirlwind_SelectEffect
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, PidgeyWhirlwind_SelectEffect
	db  $00

MayChangeWeaknessEffectCommands:	; Changes the weakness of the opp. Modified to work even if the defending poke has no weakness, otherwsie the same. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Conversion1_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Conversion1_ChangeWeaknessEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Conversion1_AISelectEffect
	db  $00

Conversion2EffectCommands:		; Changes your resistance. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Conversion2_ResistanceCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Conversion2_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Conversion2_ChangeResistanceEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Conversion2_AISelectEffect
	db  $00

MayGetImmunityNoDMGEffectCommands:		; CF, if H, get immunity effect. This one is specifically for attacks that deal no damage.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ScrunchEffect
	db  $00

ChanseyDoubleEdgeEffectCommands:		;Free
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ChanseyDoubleEdgeEffect
	db  $00

PainSplitEffectCommands:		; Halves opp's HP and restores 10 HP. Modified Super Fang code that ignores weaknesses and resistances, with a +10 heal code thrown in.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SuperFang_HalfHPEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, BulbasaurLeechSeedEffect
	dbw EFFECTCMDTYPE_AI, SuperFang_AIEffect
	db  $00

TrainerCardAsPokemonEffectCommands:	; Not sure what this one is... even in base, it's not assigned to any pokemon. Leave it alone just in case?
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, TrainerCardAsPokemon_BenchCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, TrainerCardAsPokemon_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, TrainerCardAsPokemon_PlayerSelectSwitch
	db  $00

ETBHeal30AllSelfEffectCommands:		; Enter the field, trigger the pokepower to heal 30 from all of your pokes. Modified Healing Wind code.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, HealingWind_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, HealingWind_PlayAreaHealEffect
	db  $00

CF30X2EffectCommands:		; Flip 2 coins, 30 for each heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DragoniteLv41Slam_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, DragoniteLv41Slam_AIEffect
	db  $00

Heal10FromAllEffectCommands:		;Heals 10 from all your pokes.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Heal10FromAllEffect
	db  $00

Mill3OppCardsEffectCommands:	; If attack is successful, mill 3 from opp's deck.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MorphEffect
	db  $00

Do30ToARandomOppEffectCommands:		; Does 30 to a random opp
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SlicingWindEffect
	db  $00

PidgeotGaleEffectCommands: 	;Free, Switches both player's pokes with benches pokes at random after damage. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Gale_LoadAnimation
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Gale_SwitchEffect
	db  $00

JigglypuffFriendshipSongEffectCommands:		;Free, but effect functions are used elsewhere.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FriendshipSong_BenchCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FriendshipSong_AddToBench50PercentEffect
	db  $00

ReduceDamageBy10AfterDamageEffectCommands:	; Reduces damage by 10 next turn if attack is successful.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ExpandEffect
	db  $00

DoubleColorlessEnergyEffectCommands:
	db  $00

PsychicEnergyEffectCommands:
	db  $00

FightingEnergyEffectCommands:
	db  $00

LightningEnergyEffectCommands:
	db  $00

WaterEnergyEffectCommands:
	db  $00

FireEnergyEffectCommands:
	db  $00

GrassEnergyEffectCommands:
	db  $00

SuperPotionEffectCommands: 	; Discard 1 energy from a poke, recover 60 HP from it. Modified to give +20 heal from base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, SuperPotion_DamageEnergyCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, SuperPotion_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SuperPotion_HealEffect
	db  $00

ImakuniEffectCommands:		; Heavily modifed Water energy boost code. It gives the +20 per P energy code the base for which damage is calculated properly.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ImakuniEffect
	dbw EFFECTCMDTYPE_AI, ImakuniEffect
	db  $00

EnergyRemovalEffectCommands:	; Choose 1 opp energy, flip a coin, heads = discard it. Modified from base to include a coinflip.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergyRemoval_EnergyCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, EnergyRemoval_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EnergyRemoval_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, EnergyRemoval_AISelection
	db  $00

EnergyRetrievalEffectCommands:		; Discard 1 card from hand, get 2 energy from the discard. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergyRetrieval_HandEnergyCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, EnergyRetrieval_PlayerHandSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EnergyRetrieval_DiscardAndAddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergyRetrieval_PlayerDiscardPileSelection
	db  $00

EnergySearchEffectCommands:		;Search for a basic energy in the deck, add to your hand. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergySearch_DeckCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EnergySearch_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergySearch_PlayerSelection
	db  $00

ProfessorOakEffectCommands:	; Discard hand and draw 6 cards. Mofified from base to draw 1 less card.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ProfessorOakEffect
	db  $00

PotionEffectCommands:		; Heal 30 from a poke. Modified from base to do +10 heal.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Potion_DamageCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Potion_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Potion_HealEffect
	db  $00

GamblerEffectCommands:		; Shuffle hand into deck, then flip a coin. Tails = Draw 1. Heads = Draw 9. Modified from base to draw 2 more if successful.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, GamblerEffect
	db  $00

ItemFinderEffectCommands:	; Discard 2 cards from hand, get a trainer from the discard. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ItemFinder_HandDiscardPileCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ItemFinder_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ItemFinder_DiscardAddToHandEffect
	db  $00

DefenderEffectCommands:		; Attach to your poke, next turn -20 damage from attacks. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Defender_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Defender_AttachDefenderEffect
	db  $00

MysteriousFossilEffectCommands:		; Is a fossil than can evolve or be discarded for no prizes. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MysteriousFossil_BenchCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MysteriousFossil_PlaceInPlayAreaEffect
	db  $00

FullHealEffectCommands:		; Heals all status from your poke. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FullHeal_StatusCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FullHeal_ClearStatusEffect
	db  $00

ImposterProfessorOakEffectCommands:	; Opp shuffles hand into their deck and draws 4. Modified from base to draw 3 less cards. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ImposterProfessorOakEffect
	db  $00

ComputerSearchEffectCommands:	; Discard 2 cards from hand, search your deck for any card and add it. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ComputerSearch_HandDeckCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ComputerSearch_PlayerDiscardHandSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ComputerSearch_DiscardAddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, ComputerSearch_PlayerDeckSelection
	db  $00

ClefairyDollEffectCommands:	; Is a pokemon trainer card that can be discarded for no prizes. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ClefairyDoll_BenchCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ClefairyDoll_PlaceInPlayAreaEffect
	db  $00

MrFujiEffectCommands:	; Choose a poke on your bench, shuffle it + all cards omn it into your deck. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MrFuji_BenchCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, MrFuji_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MrFuji_ReturnToDeckEffect
	db  $00

PlusPowerEffectCommands:	; Attack to your poke, attacks from it do +10 damage this turn. Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PlusPowerEffect
	db  $00

SwitchEffectCommands:		; Switch your poke  with a benched one. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Switch_BenchCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Switch_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Switch_SwitchEffect
	db  $00

PokemonCenterEffectCommands:	; Discard all energy atatched to all your pokes, then heal all damage from all of them. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PokemonCenter_DamageCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PokemonCenter_HealDiscardEnergyEffect
	db  $00

PokemonFluteEffectCommands:	; Get an opp's poke in the discard and put it onto their bench. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PokemonFlute_BenchCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PokemonFlute_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PokemonFlute_PlaceInPlayAreaText
	db  $00

PokemonBreederEffectCommands:	; Put a stage 2 onto a basic poke when legal. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PokemonBreeder_HandPlayAreaCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PokemonBreeder_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PokemonBreeder_EvolveEffect
	db  $00

ScoopUpEffectCommands:	; Choose 1 poke and return it to your hand, discarding all other cards. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ScoopUp_BenchCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ScoopUp_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ScoopUp_ReturnToHandEffect
	db  $00

PokemonTraderEffectCommands:	; Trade 1 poke in your hand for another in your deck. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PokemonTrader_HandDeckCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PokemonTrader_PlayerHandSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PokemonTrader_TradeCardsEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PokemonTrader_PlayerDeckSelection
	db  $00

PokedexEffectCommands:		; Look at the top 5 of your deck and rearrange them in any order. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Pokedex_DeckCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Pokedex_OrderDeckCardsEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Pokedex_PlayerSelection
	db  $00

BillEffectCommands:		; Draw 2. Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BillEffect
	db  $00

LassEffectCommands:	; Everybody shows their hands and shuffles all trainers into the deck. Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, LassEffect
	db  $00

MaintenanceEffectCommands:	; Shuffle 2 cards into your deck, then draw 2. Modified to draw 2 instead of 1. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Maintenance_HandCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Maintenance_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Maintenance_ReturnToDeckAndDrawEffect
	db  $00

PokeBallEffectCommands:		; Flip a coin. Heads = Search for any poke in the deck and add to hand. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PokeBall_DeckCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PokeBall_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PokeBall_PlayerSelection
	db  $00

OLD_RODEffectCommands:		; Flip a coin. If heads, take a card from your discard and put it on top of the deck. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, OLD_ROD_DiscardPileCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, OLD_ROD_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, OLD_ROD_PlayerSelection
	db  $00

ReviveEffectCommands:		; Take a poke from your discard and put it onto your bench, then deal damage to it equal to half its HP. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Revive_BenchCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Revive_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Revive_PlaceInPlayAreaEffect
	db  $00

DevolutionSprayEffectCommands:	;Return the highest stage evolution of one of your pokes to your hand. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, DevolutionSpray_PlayAreaEvolutionCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, DevolutionSpray_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DevolutionSpray_DevolutionEffect
	db  $00

SuperEnergyRemovalEffectCommands:	; Is now master ball. Search your deck for any poke and add to hand. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, SuperEnergyRemoval_EnergyCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SuperEnergyRemoval_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, SuperEnergyRemoval_PlayerSelection
	db  $00

SuperEnergyRetrievalEffectCommands:	; Discard 2 from hand, return 4 energy from discard to hand. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, SuperEnergyRetrieval_HandEnergyCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, SuperEnergyRetrieval_PlayerHandSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SuperEnergyRetrieval_DiscardAndAddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, SuperEnergyRetrieval_PlayerDiscardPileSelection
	db  $00

GustOfWindEffectCommands:	; Choose an opp's benched poke and switch it with the active. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, GustOfWind_BenchCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, GustOfWind_PlayerSelection
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, GustOfWind_SwitchEffect
	db  $00
