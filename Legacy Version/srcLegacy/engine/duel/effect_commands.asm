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

Draw2EffectCommands:		; Draw 3 cards upon entering battle
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, AttackDraw2Effect
	db  $00

PinsirIronGripEffectCommands: ;
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Potion_DamageCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, HealingWaterEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Potion_HealEffect
	db  $00

RandomStatusEffectCommands:		;Inflicts a random status on a CFH, but requires damage to be set in effect functions.
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

DracoMeteorEffectCommands: ; Energy Search but on an attack
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergySearch_DeckCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EnergySearch_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergySearch_PlayerSelection
	db  $00

DiscardHandDraw6Commands:		;Pokemon Effect for Professor Oak effect.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ProfessorOakEffect
	db  $00

HealEqualToDamageEffectCommands:		;Heals damage from self equal to damage dealt.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, GolbatLeechLifeEffect
	db  $00

ETBOppMills5EffectCommands:			;When this poke enters the field, CF. If H, mill 5 from the opponent's deck. If T, mill 5 yours.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, KakunaStiffenEffect
	db  $00

Mill1OppCardEffectCommands:			; Mills 1 card from Opp's deck.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SpitPoison_AIEffect
	db  $00

HeracrossDoubleDamageEffectCommands:		;Specific to Machoke. Attacks from Machoke deal x2 damage next turn.
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
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Gale_LoadAnimation
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Gale_SwitchEffect
	db  $00

NoRetreatAbilityEffectCommands:		; Does nothing, just here to prevent game crashes. Real effect is in Substatus, Duel > Core and Duel> AI> Retreat.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, SuctionCupsEffect
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

Do20PerUnownAEffectCommands:		;Boyfriends effect coded to Bellossom
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BoyfriendsEffect
	dbw EFFECTCMDTYPE_AI, BoyfriendsAIEffect
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
	dbw EFFECTCMDTYPE_AI, HornHazard_AIEffect ; 90 damage specific.
	db  $00

MayInflictConfusionEffectCommands:		;Confusion on coinflip heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NidorinaSupersonicEffect
	db  $00

MayParalyzeOrConfuseEffectCommands:		;Paralyzes on heads, confuses on tails. Modified code from Foul Odor.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NidorinaDoubleKick_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, NidorinaDoubleKick_AIEffect
	db  $00

Do10XPerYouAndOppEnergiesEffectCommands:		;Does 10x per your and opponent's energy.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NidorinoDoubleKick_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, NidorinoDoubleKick_AIEffect
	db  $00

ButterfreeWhirlwindEffectCommands: ; opponent must switch DFP on a CFH.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ButterfreeWhirlwind_SwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, ButterfreeWhirlwind_CheckBench
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, ButterfreeWhirlwind_CheckBench
	db  $00

Do10MorePerOppRCEffectCommands:		;Does 10 damage for each * in the DFP's retreat cost in addition to a set number of damage.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ButterfreeMegaDrainEffect
	dbw EFFECTCMDTYPE_AI, ButterfreeMegaDrainEffect
	db  $00

InflictSleepEffectCommands:		;Always inflicts sleep.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SleepEffect
	db  $00

MorePARifHPLowEffectCommands:		;If HP > 20, damage is 120 instead. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SpecialParalysisEffect
	dbw EFFECTCMDTYPE_AI, BoostDamageifLowHPAIEffect
	db  $00

LessDamageifDFPInjuredEffectCommands:		;Does 20 less damage if the DFP already has damage counters on it. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, LessDamageifDFPDamagedEffect
	dbw EFFECTCMDTYPE_AI, WeedlePoisonSting_AIEffect
	db  $00

CrossAttackEffectCommands:		; Flip 3 coins, either deal damage or heal opponent depending on result.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CrossAttackEffect
	dbw EFFECTCMDTYPE_AI, CrossAttack_AIEffect
	db  $00

Heal1DamageifSuccessEffectCommands:		; Heals 10 damage if opp dealt nonzero damage from this attack.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, BulbasaurLeechSeedEffect
	db  $00

EnergyTransEffectCommands:		;Deleted to make room
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EnergyTransAttackEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EnergyTrans_AIEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergyTrans_PrintProcedure
	db  $00

GrimerNastyGooEffectCommands:		;Baton Pass effect: switches self and then rearranges G energies.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EnergyTransAttackEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Teleport_SwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, BatonPass_SelectionEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Teleport_AISelectEffect
	db  $00

ReduceBy20AfterAttackEffectCommands:		;Reduces damage by 20. Damage reduction is found in substatus.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, GrimerMinimizeEffect
	db  $00

NoPokePowersEffectCommands:		; All pokepowers stop working. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ToxicGasEffect
	db  $00

MukSludgeEffectCommands:		;CF, defending pokemon can't retreat next turn.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NewAcidCFEffect
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

VenomothShiftEffectCommands:		; CF and then heals 1 for 20. If T, heals the defending for 20. AI does NOT understand this. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Potion_DamageCheck
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Potion_PlayerSelection
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SweetScentCFHealEffect
	db  $00

MayConfuseAndPoisonEffectCommands:		; Heads = paralyzes and poisons opp.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, VenomPowder_PoisonConfusion50PercentEffect
	dbw EFFECTCMDTYPE_AI, VenomPowder_AIEffect
	db  $00

TangelaBindEffectCommands:		; CF if H CCFN, if T, SLP.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ConfusionOrSleepEffect
	db  $00

TangelaPoisonPowderEffectCommands:		;If heads, +10 and no retreat
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MoreDamageAndNoRetreatEffect
	dbw EFFECTCMDTYPE_AI, MoreDamageAndNoRetreatAIEffect
	db  $00

HealingLightEffectCommands:		; Pokepower that poisons opp on a CF. AI can use it imperfectly, only stops using it if DFP already poisoned. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Heal_OncePerTurnCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Heal_RemoveDamageEffect
	db  $00

Do40x3ThenSelfConfuseEffectCommands:		; Flips 3 coins, 30 damage per heads, then guarenteed confusion to self.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PetalDance_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, PetalDance_AIEffect
	db  $00

TangelaStunSporeEffectCommands:		;Flip 1 coin, if H, heal all damage from a poke.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Potion_DamageCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, SweetNectarSelectionEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SweetScentCFHealEffect
	db  $00

TangelaPoisonWhipEffectCommands:		; CFH, 10 to opps bench and switch DFP.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ShockwaveEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, ShockWaveSelectEffect
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, ShockWaveSelectEffect
	db  $00

AromatherapyEffectCommands:		; Modified base Solar Power that only Full Heals your side.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, SolarPower_CheckUse
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SolarPower_RemoveStatusEffect
	db  $00

VenusaurMegaDrainEffectCommands:	;CF, do a Lass effect to your opp only.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, OneSidedLassEffect
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

GyaradosBubblebeamEffectCommands:		;
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CF2ForConfusionEffect
	db  $00

UltrabrokenEffectCommands:		;Is now an ultra broken attack command used to help me with testing
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, KinglerFlail_HPCheck
	db  $00

UnknownEffectCommands:		; Deleted to make space
	db  $00

Do10XPerSelfDamageEffectCommands:	; Does 10 damage for every 10 damage on you.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MagikarpFlail_HPCheck
	dbw EFFECTCMDTYPE_AI, MagikarpFlail_AIEffect
	db  $00

NoOppTrainersEffectCommands:		; Opponent can't play trainers next turn. Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, HeadacheEffect
	db  $00

CFCFNOrNoTrainersEffectCommands:		;CF, if heads, no trainers next turn.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, HeadacheCFEffect
	db  $00

GolduckPsyshockEffectCommands:		; searches for an Omastar and adds it to hand
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FossilEggSearch_CheckDeckAndPlayArea
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FossilEggSearch_PutInPlayAreaEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, FossilEggSearch_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, FossilEggSearch_AISelectEffect
	db  $00

GolduckHyperBeamEffectCommands:		; Is now Drive Off, a Pokepower that switches the DFP (opponent chooses) once per turn.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, DriveOffCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DriveOffSetFlag
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PidgeottoWhirlwind_SelectEffect
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, PidgeottoWhirlwind_SelectEffect
	db  $00

Do20MorePerSelfPEnergyEffectCommands: 	; does 10 more per W energy attached to the pokemon on a CF. No max.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PsyduckFurySwipes_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, SeadraWaterGunEffect
	db  $00

Entei2MayGetImmunityEffectCommands: 	; Agility effect specific to Entei2, because it needs an additional animation (see in functions).
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SeadraAgilityEffect
	db  $00

CanOnlyUseAttackOnceEffectCommands:		;Makes it so that this attack can only be used once per copy of the pokemon card.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ShellderSupersonicEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, HideInShellEffect
	db  $00

VaporeonQuickAttackEffectCommands:		;Heals 1 of your pokes for 30 on a CFH, or heals opp for 30 on CFT.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Potion_DamageCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, StrangeScent_PlayerSelection
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, StrangeScentCFHealEffect
	db  $00

WWEWaterBoostEffectCommands:		; Water energy boost effect for an attack costing 2 Water energy and 1 of any energy.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, VaporeonWaterGunEffect
	dbw EFFECTCMDTYPE_AI, VaporeonWaterGunEffect
	db  $00

DewgongIceBeamEffectCommands:		;Baton Pass effect for W energy.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, WaterTransAttackEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Teleport_SwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, BatonPass_SelectionEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Teleport_AISelectEffect
	db  $00

Discard1WHealAllDamageCommands:		; Recover code, same as base. Discards a Water energy to heal.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, StarmieRecover_CheckEnergyHP
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, StarmieRecover_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, StarmieRecover_HealEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, StarmieRecover_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, StarmieRecover_AISelectEffect
	db  $00

StarmieStarFreezeEffectCommands:		; CF, paralysis or 10 to self.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BBCoinFlipDecideEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, BBTailsEffect
	db  $00

SquirtleBubbleEffectCommands:		;Energy trans but water
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, WaterTransAttackEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergyTrans_PrintProcedure
	db  $00

SquirtleWithdrawEffectCommands:		;Recycle effect but on an attack and adds it to the hand.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Recycle_DiscardPileCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Recycle_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Recycle_PlayerSelection
	db  $00

HorseaSmokescreenEffectCommands:		; Searches a Gyarados and adds it to hand.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FossilEggSearch_CheckDeckAndPlayArea
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FossilEggSearch_PutInPlayAreaEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, SearchGyaradosPlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, SearchGyaradosAISelectEffect
	db  $00

TentacruelSupersonicEffectCommands:		; Checks Toxic Gas and status, if no, then +10 per W energy. Then 50% paralysis.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FloodlightCheckEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE,Paralysis50PercentEffect
	dbw EFFECTCMDTYPE_AI, FloodlightEffect
	db  $00

TentacruelJellyfishStingEffectCommands:		;DFP can't do 30 or more damage next turn
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Prevent30PlusDamageEffect
	db  $00

OppCantUse1AttackEffectCommands:		; Choose an attack and Opp can't use it next turn. Same as base Amnesia.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PoliwhirlAmnesia_CheckAttacks
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PoliwhirlAmnesia_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoliwhirlAmnesia_DisableEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, PoliwhirlAmnesia_AISelectEffect
	db  $00

MoreDamageIfDFPInjuredEffectCommands:		;Does more damage if the DFP has damage counters on it.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FlockEffect
	db  $00

PoliwrathWaterGunEffectCommands:		; Searches deck for an eeveelution, adds to hand.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EeveelutionCheckDeckEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EeveelutionAddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EeveelutionPlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, EeveelutionAISelectEffect
	db  $00

Discard1EnergyFromTargetEffectCommands:		;Discards 1 energy from Opp on a CF if damage is successful. 
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Whirlpool_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Whirlpool_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Whirlpool_AISelectEffect
	db  $00

Do10LessPerOppRCEffectCommands:		;Pokepower copy of the above
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, JetStreamCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Whirlpool_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Jetstream_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Whirlpool_AISelectEffect
	db  $00

Do10PerOppRCEffectCommands:		;Does 10 damage for every * in opp's retreat cost.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ClampEffect
	dbw EFFECTCMDTYPE_AI, ClampEffect
	db  $00

CloysterSpikeCannonEffectCommands:		;Flip 3, no per heads and if 2+ heads, then paralysis.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ThunderNeedleEffect
	dbw EFFECTCMDTYPE_AI, ThunderNeedleAIEffect
	db  $00

ArticunoFreezeDryEffectCommands:		;Does 10x2 damage.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CF10X2_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, CF10X2_AIEffect
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

LaprasWaterGunEffectCommands:		;Is now Energy Trans but as an attack
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EnergyTransAttackEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EnergyTrans_AIEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergyTrans_PrintProcedure
	db  $00

LaprasConfuseRayEffectCommands:		;Does +10 per L energy, no max. Then, CFT, 10 to self per L.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ElectricTackleEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ElectricTackleRecoilEffect
	dbw EFFECTCMDTYPE_AI, ElectricTackleEffect
	db  $00

ETB10ToOppBenchEffectCommands:		; 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, StreamingMantleEffect
	db  $00

ArticunoIceBreathEffectCommands:		; Does 20 on a CF.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PP_NoDamage50PercentEffect
	dbw EFFECTCMDTYPE_AI, PP_AIEffect ; 20 damage specific.
	db  $00

SelfDoubleDamageEffectCommands:		; Specific to Crystal Charizard. Next turn, all opp's damage is doubled on it.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FocusEnergyEffect
	db  $00

ArcanineFlamethrowerEffectCommands:		; ETB, mills opponent for 3.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, StreamingMantleEffect
	db  $00

Do40ToSelfEffectCommands:		; Discards 2 energies then does 30 damage to self.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FireSpinReal_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, FireSpinReal_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, FireSpinReal_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, FireSpinReal_AISelectEffect
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

RapidashStompEffectCommands:		;Does +10 per extra W energy attached and is unaffected by weakness or resistance.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, WaterSlashEffect
	dbw EFFECTCMDTYPE_AI, SeadraWaterGunEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MagnetonSonicboom_NullEffect
	db  $00

RapidashAgilityEffectCommands:		;CF, if H, sleep. If T, no retreat.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SurroundEffect
	db  $00

SwitchAndPoisonEffectCommands:		; Can switch the opp out (or not) then poisons it and makes it unable to retreat next turn. Modifed Lure code.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ElectrodeSonicboom_UnaffectedByColorEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, ElectrodeSonicboom_NullEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PoisonAcidEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, NinetalesLure_AISelectEffect
	db  $00

NinetalesFireBlastEffectCommands:		;Can Discard 1 T to use this attack. If yes, +20 damage. AI only picks the discard option.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Magcargo_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Magcargo_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Magcargo_AISelectEffect
	db  $00

Discard1FireEffectCommands:		; Discards 1 fire energy, then attacks for damage. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Ember_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Ember_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Ember_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Ember_AISelectEffect
	db  $00

DiscardFForMoreDamageEffectCommands:		; Modified Wildfire code. Discard any number of fire energy (min 1) then CFHX, 40x per heads. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Wildfire_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Wildfire_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Wildfire_DiscardDeckEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Wildfire_DiscardEnergyEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Wildfire_AISelectEffect
	dbw EFFECTCMDTYPE_AI, Wildfire_AIEffect
	db  $00

MoltresLv35DiveBombEffectCommands:		;; Modified Wildfire code. Discard any number of fire energy (min 1) then +20 per discard. 	
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Wildfire_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Wildfire_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BurningFlameEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Wildfire_DiscardEnergyEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Wildfire_AISelectEffect
	dbw EFFECTCMDTYPE_AI, BurningFlameAIEffect
	db  $00

FlareonQuickAttackEffectCommands:		; Does 20 damage to any target.
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, AnyTargetEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DealDamageToTargetEffect ; in functions, contains a special animation effect found in: DealDamageToPlayAreaPokemon_SpecialAnim.
	dbw EFFECTCMDTYPE_AI_SELECTION, AnyTargetAIEffect
	db  $00

FlareonFlamethrowerEffectCommands:		;Returns 1 energy to the hand as cost.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, LSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Discard_ReturnEnergyEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, LAISelectEffect
	db  $00

MagmarFlamethrowerEffectCommands:		; CFT, do nothing. Hit effect.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SmashPunchEffect
	dbw EFFECTCMDTYPE_AI, SmashPunchAIEffect ; 30 damage specific.
	db  $00

SmokescreenEffectCommands:		; If opp attacks next turn, they must flip a coin. If tails, attack does nothing.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MagmarSmokescreenEffect
	db  $00

MagmarSmogEffectCommands:		;CFT Do nothing. Hit effect.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SmashPunchEffect
	dbw EFFECTCMDTYPE_AI, MagmarSmog_AIEffect ; 60 damage specific
	db  $00

CharmeleonFlamethrowerEffectCommands:		;inflicts confusion on self. Used for tests
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SelfConfusionEffect
	db  $00

AllEnergyIsFireEffectCommands:		; All energy turns to fire. Same as base Energy Burn. This command is just flavor, Energy Burn is found elsewhere.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergyBurnEffect
	db  $00

Discard2EnergyEffectCommands:		; Discards 3 energies, then attacks and deals 20 to each bench.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FireSpin_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, FireSpin_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, FireSpin_DiscardEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Damage20AllBenchEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, FireSpin_AISelectEffect
	db  $00

DeepSleepEffectCommands:		; Used for Gengars Deep Sleep. This command is just flavor, Deep Sleep code is found in Duel -> Core.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergyBurnEffect
	db  $00

FlareonRageEffectCommands:		;Clone of base fire spin, discards 2 energies to attack
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FireSpinReal_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, FireSpinReal_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, FireSpinReal_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, FireSpinReal_AISelectEffect
	db  $00

NinetalesMixUpEffectCommands:		; Discards 2 energies, then also does 10 to opp's bench.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DevastateDiscardEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DevastateDamageAndEnergyDiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Whirlpool_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Whirlpool_AISelectEffect
	db  $00

CF10X9EffectCommands:		; Flip 9 coins, 10 per heads. Modified Dancing Embers code.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DancingEmbers_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, DancingEmbers_AIEffect
	db  $00

Get4FireFromDeckEffectCommands:		; When it enters the field, triggers the pokepower and gets 4 fires from the deck. Modified Firegiver code.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Firegiver_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, Firegiver_AddToHandEffect
	db  $00

MoltresLv37DiveBombEffectCommands:		;Inflicts 10 damage to a bench on a CFH.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, OverrunDamageEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, GengarDarkMind_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, GengarDarkMind_AISelectEffect
	db  $00

AbraPsyshockEffectCommands:		;Now inflicts CF 2x10 damage to a bench.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FireWindDamageEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, GengarDarkMind_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, GengarDarkMind_AISelectEffect
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

GastlyDestinyBondEffectCommands:		;CFT do nothing. Hit animation. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SmashPunchEffect
	dbw EFFECTCMDTYPE_AI, GiantTail_AIEffect ; 100 damage specific.
	db  $00

TransparencyEffectCommands:		;Transparency part 2, baby edition
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, TransparencyEffect
	db  $00

Retrieve2DiscardedEnergyEffectCommands:		; Gets 2 energy from discard pile to hand. Modified Energy Conversion code.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergyConversion_CheckEnergy
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EnergyConversion_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergyConversion_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, EnergyConversion_AISelectEffect
	db  $00

Do20moreIfDFPStatusedEffectCommands:		;Does +20 if DFP is statused.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DreamEaterEffect
	dbw EFFECTCMDTYPE_AI, Do20MoreIfStatusedAIEffect ; Define damage for AI here (10+20)
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

CF20ToABenchEffectCommands:		;Does 20 damage to a benched pokemon on a coinflip. Modified from base hypno dark mind.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, HypnoDarkMind_DamageBenchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, HypnoDarkMind_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, HypnoDarkMind_AISelectEffect
	db  $00

DrowzeeConfuseRayEffectCommands:		; Prophecy effect, then draw 1 card
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Prophecy_CheckDeck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Prophecy_ReorderDeckEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FetchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Prophecy_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Prophecy_AISelectEffect
	db  $00

MythicalShieldEffectCommands:		; Same as base Invisible Walls
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, InvisibleWallEffect
	db  $00

Do10MorePerOppDamageEffectCommands:	; Does 10 more damage per opponent's damage counters. Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MrMimeMeditate_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, MrMimeMeditate_AIEffect
	db  $00

DamageSwapEffectCommands:		; Same as base.
	db  $00

AlakazamConfuseRayEffectCommands:		;Deals 30 to any target. AI can only target the bench.
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, AnyTargetEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DealDamageToTargetEffect2 ; in functions, contains a special animation effect found in: DealDamageToPlayAreaPokemon_SpecialAnim.
	dbw EFFECTCMDTYPE_AI_SELECTION, GengarDarkMind_AISelectEffect
	db  $00

MewPsywaveEffectCommands:		;Does 10 per energy attached to the defending pokemon.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PsywaveEffect
	dbw EFFECTCMDTYPE_AI, PsywaveAIEffect
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

MewPsyshockEffectCommands:		;Searches deck for Murkrow and puts it into play
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MurkrowCallForFamily_CheckDeckAndPlayArea
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MurkrowCallForFamily_PutInPlayAreaEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, MurkrowCallForFamily_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, MurkrowCallForFamily_AISelectEffect
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

Do30moreIfDFPStatusedEffectCommands:	; Now does 10 damage per opponent energy, lets you target anything. AI can only target benched mons.
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, AnyTargetEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Deal10DamageToTargetPerEnergy_DamageEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, GengarDarkMind_AISelectEffect
	db  $00

Get2DiscardEnergyAttachToSelfEffectCommands:	; Does 30 to self, then gets 2 energy from the discard and attached them to self.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MewtwoLv60EnergyAbsorption_CheckDiscardPile
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Recoil30ToSelfEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MewtwoLv60EnergyAbsorption_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, MewtwoLv60EnergyAbsorption_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, MewtwoLv60EnergyAbsorption_AISelectEffect
	db  $00

AltruismEffectCommands:	; Gets 2 energy from the discard and attached them to self, then deals 30 to self. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MewtwoLv60EnergyAbsorption_CheckDiscardPile
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MewtwoLv60EnergyAbsorption_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, MewtwoLv60EnergyAbsorption_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, MewtwoLv60EnergyAbsorption_AISelectEffect
	db  $00

Do20MorePerOppEnergyEffectCommands:	; Does +20 damage per opponent's energy. Modified Psychic code.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Psychic_DamageBoostEffect2
	dbw EFFECTCMDTYPE_AI, Psychic_AIEffect2
	db  $00

SlowpokeSpacingOutEffectCommands:	;CF, if heads, Gets 2 energy from the discard and attached them to self.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MewtwoAltLV60EnergyAbsorption_CheckDiscardPile
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MewtwoAltLV60EnergyAbsorption_AddToHandEffect ; THIS CODE SPECIFICALLY FOR CF. OTHER ONE IS FOR GUARENTEED DISCARD ATTACH
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, MewtwoAltLV60EnergyAbsorption_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, MewtwoAltLV60EnergyAbsorption_AISelectEffect
	db  $00

ScavengeEffectCommands:		; pokepower get a trainer from the discard on a CFH.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Scavenge_CheckDiscardPile
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ScavengeOPTCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Scavenge_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Scavenge_PlayerSelectTrainerEffect
	db  $00

SlowpokeAmnesiaEffectCommands:	;Gets 1 energy from the discard pile and attaches it to the pokemon.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MewtwoAltLV60EnergyAbsorption_CheckDiscardPile
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MewtwoLv60EnergyAbsorption_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Choose1EnergyPlaySelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Choose1EnergyAISelectEffect
	db  $00

KadabraRecoverEffectCommands:	;Discards 1 P in order to attack.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, KadabraRecover_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, KadabraRecover_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, KadabraRecover_AISelectEffect
	db  $00

JynxDoubleslapEffectCommands:	;CF, if H, +10 damage and confusion.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MoreDamageAndCFNEffect
	dbw EFFECTCMDTYPE_AI, MoreDamageAndNoRetreatAIEffect
	db  $00

JynxMeditateEffectCommands:	;Attaches an energy from discard on a CFH
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MewtwoAltLV60EnergyAbsorption_CheckDiscardPile
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MewtwoAltLV60EnergyAbsorption_AddToHandEffect ; THIS CODE SPECIFICALLY FOR CF. OTHER ONE IS FOR GUARENTEED DISCARD ATTACH
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, CFGet1Energy_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Choose1EnergyAISelectEffect
	db  $00

MysteryAttackEffectCommands:	; Modified to do more damage, otherwise, same as base. Does a random effect.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MysteryAttack_RandomEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MysteryAttack_RecoverEffect
	dbw EFFECTCMDTYPE_AI, MysteryAttack_AIEffect
	db  $00

CFXMill2PerHeadsEffectCommands:		; Flip coins until tails, mill 2 from opp for each heads. Modified Stone Barrage and Wildfire effect.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, StoneBarrage_MultiplierEffect
	db  $00

OnixHardenEffectCommands:		;Discards 1 F to use the attack, does 10 more per opp energy.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Ember_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Ember_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Ember_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Ember_AISelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Psychic_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, Psychic_AIEffect
	db  $00

PrimeapeFurySwipesEffectCommands:		;Discards 1 F to attack, then CF. If H, confusion. If T, sleep.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Ember_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Ember_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Ember_DiscardEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ConfusionOrSleepEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Ember_AISelectEffect
	db  $00

PrimeapeTantrumEffectCommands:		; Does 3x10 damage on CF, also ignores weakness and resistance
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PsyDamage_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, NidoranFFurySwipes_AIEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MagnetonSonicboom_NullEffect
	dbw EFFECTCMDTYPE_AI, MagnetonSonicboom_UnaffectedByColorEffect
	db  $00

WobblingEffectCommands:		; Same as base Strikes Back.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, StrikesBackEffect
	db  $00

IroncladEffectCommands:		; Same as base Kabuto Armor.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, KabutoArmorEffect
	db  $00

HealHalfDamageEffectCommands:		; Heals damage equal to half the damage done to opp.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, AbsorbEffect
	db  $00

ReduceDamageBy20EffectCommands:		; CFH, Reduce damage by 20 next turn.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SnivelEffect
	db  $00

Do10MorePerSelfDamageEffectCommands:	; Does 10 more damage per self damage counters.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CuboneRage_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, CuboneRage_AIEffect
	db  $00

MarowakBonemerangEffectCommands:	;Flips a coin. If H, does 10 more per self damage.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CFRageEffect
	dbw EFFECTCMDTYPE_AI, CuboneRage_AIEffect
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

MachokeSubmissionEffectCommands:	;does 20 recoil damage to self
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SubmissionEffect
	db  $00

Do10ToAllBenchAnd40ToSelfEffectCommands:	; Does 10 to all benched pokemon and 40 to self. Modified selfdestruct code.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, GolemSelfdestructEffect
	db  $00

GravelerHardenEffectCommands:		; Does 10 to all benched pokemon on a CFH, then switches out the DFP.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, GravelerHardenEffect
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

SandshrewSandAttackEffectCommands:	;CFT, paralysis. CFT, nothing.
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

GazeEffectCommands:		; Does +10 per damage counter on you, then does 20 to self.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CuboneRage_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, CuboneRage_AIEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Maydo20ToSelfEffect
	db  $00

MarowakBoneAttackEffectCommands:		;Clone of metapod stiffen, except it does damage.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CurveAttackEffect
	db  $00

WailEffectCommands:		; Fills player's bench with random basics. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Wail_BenchCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Wail_FillBenchEffect
	db  $00

ElectabuzzThundershockEffectCommands:		;Heals half damage and poisons the DFP.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoisonEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, AbsorbEffect
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

MagnemiteThunderWaveEffectCommands:		;Flip coins until tails. 30x per heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Tumble_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, Tumble_AIEffect
	db  $00

MagnemiteSelfdestructEffectCommands:		;
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CFRageOrNothingEffect
	dbw EFFECTCMDTYPE_AI, CuboneRage_AIEffect
	db  $00

ZapdosThunderEffectCommands:		;
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ZapdosThunder_Recoil50PercentEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ZapdosThunder_RecoilEffect
	db  $00

DiscardAllEnergyEffectCommands:		; Discards all fire energy upon use, then does +20 for each fire discarded.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ThunderboltEffect
	db  $00

ZapdosThunderstormEffectCommands:		; Does 40 on a CFH
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, GiantWave_NoDamage50PercentEffect
	dbw EFFECTCMDTYPE_AI, GiantWave_AIEffect ; 40 damage specific.
	db  $00

JolteonQuickAttackEffectCommands:	;
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DischargeEffect
	db  $00

JolteonPinMissileEffectCommands:	;Discards all L energy on the poke.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DiscardAllLEffect
	db  $00

FlyingPikachuThundershockEffectCommands:	;Recoil effect for Zapdos
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Zapdos_Recoil50PercentEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ThunderJolt_RecoilEffect
	db  $00

MayGetImmunityOrDoNothingEffectCommands:	; Heads = Agility effect, Tails = Do nothing.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Fly_Success50PercentEffect
	dbw EFFECTCMDTYPE_AI, Fly_AIEffect
	db  $00

CFT10ToSelfEffectCommands:	; Tails = 10 to self.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ThunderJolt_Recoil50PercentEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ThunderJolt_RecoilEffect
	db  $00

PikachuSparkEffectCommands:		;Discards 1 F on a CFT.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Ember_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Ember_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Discard1FDiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Ember_AISelectEffect
	db  $00

Do20ToOppBenchOnlyEffectCommands:	; Does 10 damage to an opponents bench only.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, StretchKick_CheckBench
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PikachuLv16GrowlEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, StretchKick_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, StretchKick_AISelectEffect
	db $00

PikachuLv16ThundershockEffectCommands:		; Looks at opp's hand on attack
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ScoutEffect
	db  $00

ReduceDamageBy10EffectCommands:		;Same as base. Reduce damage by 10.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PikachuAltLv16GrowlEffect
	db  $00

PikachuAltLv16ThundershockEffectCommands:	;Flip 2 coins, remove 20 damage per heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MilkDrinkEffect
	db  $00

PsylinkBlastEffectCommands:	; does damage to every opp's pokemon equal to the energy they have on them.
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

MagnetonThunderWaveEffectCommands:		;Does 10 to each benched pokemon.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MagnetonLv35SelfdestructEffect
	db  $00

Do10ToAllOppBenchedEffectCommands:	; Does 10 to all opp's benched pokemon. Modified Selfdestruct code.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MagnetonLv28SelfdestructEffect
	db  $00

DontApplyWREffectCommands:		; Does not apply Weakness or Resistance for this attack.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MagnetonSonicboom_UnaffectedByColorEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MagnetonSonicboom_NullEffect
	dbw EFFECTCMDTYPE_AI, MagnetonSonicboom_UnaffectedByColorEffect
	db  $00

ETB30ToARandomEffectCommands:		;
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, HealingWind_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, BlisseySoftboiledEffect
	db  $00

Do70ToARandomEffectCommands:	 ; Choose yes or no. No = damage like normal, Yes = 80 damage but discard all L too. AI doesn't undersdtand this, always selects 'No'
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RaichuLS_DamageEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PlayerYesOrNoSelectionRaichu1Effect
	dbw EFFECTCMDTYPE_AI_SELECTION, RaichuLS_AISelectEffect
	dbw EFFECTCMDTYPE_AI, RaichuLS_AIEffect
	db  $00

ShinyFeatherEffectCommands: 	;Flip 3 coins, inflict a status condition on the DFP depending on how many heads were flipped.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FlashingEyesEffect
	db  $00

CanSwitchOppBeforeDamageAndSLPEffectCommands:	; Can switch the opp before doing damage. After damage, sleep. Modified Ram effect. gengar only
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

JolteonStunNeedleEffectCommands:	;Discards 1F, then CF, if H, discard an energy on the DFP.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Ember_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Ember_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Ember_DiscardEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Whirlpool_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Whirlpool_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, ScaldingSteamAISelectionEffect
	db  $00

OppMayNotAttackEffectCommands:		; Heads = Opp can't attack next turn.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, TailWagEffect
	db  $00

MayDo10Plus20EffectCommands:	; Heads = +10 damage. Specific to an attack that does 20+10
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EeveeQuickAttack_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, EeveeQuickAttack_AIEffect
	db  $00

SpearowMirrorMoveEffectCommands:	;Pokepower for attaching 1 basic energy from hand to field. Broken on AI. 
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, BountyOPTCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Bounty_AttachEnergyEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Bounty_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Bounty_AISelectEffect
	db  $00

MayGetImmunityEffectCommands: ; Heads= immunity to everything. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FearowAgilityEffect
	db  $00

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

DoduoFuryAttackEffectCommands:		;+10 damage, specific to an attack that does 10+10 damage.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, TaurosStomp_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, AiEffect10plus10
	db  $00

ReduceRCBy1EffectCommands:		;Reduced Retreat by 1. Actually found in substatus.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RetreatAidEffect
	db  $00

Heal20DamageEffectCommands:		; Heals 20 damage exactly from user, residual effect. Modified First Aid code.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, DodrioRage_AIEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DodrioRage_DamageBoostEffect
	db  $00

MayDraw1CardEffectCommands:		;Opponent draws 1 after damage
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FetchOppEffect
	db  $00

DragonairSlamEffectCommands:		; CF3X40 damage
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DragonairSlam_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, DragonairSlam_AIEffect
	db  $00

DragonairHyperBeamEffectCommands:		;Discards 1 energy from the DFP, no CF.
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

IfNoKOReturnToHandEffectCommands: ;If H, put it and all cards attached to it in the opp's hand. If T, forced switch effect.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, HurricaneEffect
	db  $00

PidgeottoWhirlwindEffectCommands:		; CF, if H, 10 to all bench. If tails, nothing.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CrushingEarthEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, CrushingEarthBenchEffect
	db  $00

CounterLastAttackEffectCommands:	; Does the exact same attack as the opponent did last turn, including effects. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PidgeottoMirrorMove_InitialEffect1
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PidgeottoMirrorMove_InitialEffect2
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PidgeottoMirrorMove_BeforeDamage
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PidgeottoMirrorMove_AfterDamage
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PidgeottoMirrorMove_PlayerSelection
	dbw EFFECTCMDTYPE_AI_SELECTION, PidgeottoMirrorMove_AISelection
	dbw EFFECTCMDTYPE_AI, PidgeottoMirrorMove_AIEffect
	db  $00

OppMill5IfSuccessEffectCommands:	;Discards 5 from own deck, then you can select up to 5 energies and attach them to Entei.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, HowlSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, MewtwoLv60EnergyAbsorption_AISelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SingEffect
	db  $00

CopyOppAttackEffectCommands:	; Copies 1 opp attack and uses it as this attack, needs 2 energy to use. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ClefairyMetronome_CheckAttacks
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ClefairyMetronome_UseAttackEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, ClefairyMetronome_AISelectEffect
	db  $00

WigglytuffLullabyEffectCommands:		; CF, if H, +10 and 10 to opp's bench. If T, 10 to self.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, LCutEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, LCutBenchEffect
	db  $00

Do10MorePerSelfBenchEffectCommands:	; Does 10 more for each of your benched pokemon. Same as base.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DoTheWaveEffect
	dbw EFFECTCMDTYPE_AI, DoTheWaveEffect
	db  $00

JigglypuffLullabyEffectCommands:		; Does +10 per your bench - opp bench. Can do negative boost this way.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MagneticWaveEffect
	dbw EFFECTCMDTYPE_AI, MagneticWaveEffect
	db  $00

SelfHeal10EffectCommands:		; Heals 10 damage only if successful. Same as base, except some attacks modified to do damage and thus aren't residual.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FirstAid_DamageCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FirstAid_HealEffect
	db  $00

Do20ToSelfEffectCommands:		; Does 10 damage to self.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, JigglypuffDoubleEdgeEffect
	db  $00

PersianPounceEffectCommands:		; does 40 to self.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Chansey40DoubleEdgeEffect
	db  $00

LickitungTongueWrapEffectCommands:		; CF 50X2 damage. 
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CharizardC_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, CharizardC_AIEffect
	db  $00

LickitungSupersonicEffectCommands:
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, AuroraWaveEffect
	db  $00

SwitchOppAfterDamageEffectCommands:	; Switches opp after dealing damage. Same as base whirlwind.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PidgeyWhirlwind_SwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PidgeyWhirlwind_SelectEffect
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, PidgeyWhirlwind_SelectEffect
	db  $00

MayChangeWeaknessEffectCommands:	; All players draw 2 cards
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EveryoneDrawTwo
	db  $00

Conversion2EffectCommands:		;  CF 3X40 damage
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Hydrocutter_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, Hydrocutter_AIEffect
	db  $00

MayGetImmunityNoDMGEffectCommands:		; CF, if H, get immunity effect. This one is specifically for attacks that deal no damage, anim is different.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ScrunchEffect
	db  $00

ChanseyDoubleEdgeEffectCommands:		;Free
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ChanseyDoubleEdgeEffect
	db  $00

PainSplitEffectCommands:		; KO's DFP if DFP is asleep
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PerishSongCheckEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PerishSongDamageEffect
	dbw EFFECTCMDTYPE_AI, PerishSongAIEffect
	db  $00

TrainerCardAsPokemonEffectCommands:	; Looks like this one has something to do with Mysterious Fossil and Poke Doll
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, TrainerCardAsPokemon_BenchCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, TrainerCardAsPokemon_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, TrainerCardAsPokemon_PlayerSelectSwitch
	db  $00

ETBHeal30AllSelfEffectCommands:		; Enter the field, trigger the pokepower to heal 30 from all of your pokes. Modified Healing Wind code.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, HealingWind_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, HealingWind_PlayAreaHealEffect
	db  $00

CF30X4EffectCommands:		;Does 30 x 4 damage on heads.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DragonairSlam_MultiplierEffect 
	dbw EFFECTCMDTYPE_AI, DragonairSlam_AIEffect
	db  $00

Heal10FromAllEffectCommands:		;Heals 10 from all your pokes.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Heal10FromAllEffect
	db  $00

Mill3OppCardsEffectCommands:	;Sleeps opp, then heals 10 from every benched pokemon in play.
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, HypnoShowerEffect
	db  $00

Do30ToARandomOppEffectCommands:	
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Heal20FromAllEffect	
	db  $00

PidgeotGaleEffectCommands: 	
	db  $00

JigglypuffFriendshipSongEffectCommands:		;
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

SuperPotionEffectCommands: 	; Discard 1 energy from a poke, recover 40 HP from it.
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

PokemonCenterEffectCommands:	; Discard all energy attached to all your pokes, then heal all damage from all of them. Same as base.
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PokemonCenter_DamageCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PokemonCenter_HealDiscardEnergyEffect
	db  $00

PokemonFluteEffectCommands:	;Pokemon Flue effect, but on an attack
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PokemonFlute_BenchCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PokemonFlute_PlayerSelection
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PokemonFlute_PlaceInPlayAreaText
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

OLD_RODEffectCommands:		; Searches for any pokemon on an attack
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, SuperEnergyRemoval_EnergyCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SuperEnergyRemoval_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, SuperEnergyRemoval_PlayerSelection
	db  $00

ReviveEffectCommands:		; same as gust of wind, but now as an attack essentially.
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ElectrodeSonicboom_UnaffectedByColorEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, ElectrodeSonicboom_NullEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, NinetalesLure_AISelectEffect
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
