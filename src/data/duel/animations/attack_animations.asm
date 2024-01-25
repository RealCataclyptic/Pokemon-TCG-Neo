MACRO anim_end
	db $00
ENDM
MACRO anim_normal
	db $01, \1
ENDM
MACRO anim_player
	db $02, \1
ENDM
MACRO anim_opponent
	db $03, \1
ENDM
MACRO anim_screen
	db $04, \1
ENDM
MACRO anim_play_area
	db $05, \1
ENDM
MACRO anim_end2
	db $06
ENDM
; THE ICONS AFTER THE ANIMATION INDICATE IF THIS IS USED IN GAME. X IS YES, O IS NO (Free to alter), ? IS IDK WHAT THIS DOES.
; NOTE2: You can make new attack anims by replacing the unused ones. They have to be renamed, pointed down in the second table, and then defined in constants.

PointerTable_AttackAnimation:
	table_width 2, PointerTable_AttackAnimation
	dw NULL                                ; ATK_ANIM_NONE ;X
	dw AttackAnimation_Hit                 ; ATK_ANIM_HIT ;X
	dw AttackAnimation_BigHit              ; ATK_ANIM_BIG_HIT ;X
	dw AttackAnimation_RoarDamage          ; ATK_ANIM_ROAR_DAMAGE ; This is an example of how to make a new animation. 
	dw AttackAnimation_Hit                 ; ATK_ANIM_HIT_RECOIL ;X
	dw AttackAnimation_Hit                 ; ATK_ANIM_HIT_EFFECT ;X
	dw AttackAnimation_ThunderShock        ; ATK_ANIM_THUNDERSHOCK ;X
	dw AttackAnimation_ThunderShock        ; ATK_ANIM_THUNDER ;X
	dw AttackAnimation_Thunderbolt         ; ATK_ANIM_THUNDERBOLT ;X
	dw AttackAnimation_Kick		       ; ATK_ANIM_KICK ;X
	dw AttackAnimation_BigLightning        ; ATK_ANIM_THUNDER_WHOLE_SCREEN ;X
	dw AttackAnimation_PullIn	       ; ATK_ANIM_PULL_IN ;X
	dw AttackAnimation_BigLightning        ; ATK_ANIM_THUNDERSTORM ;?
	dw AttackAnimation_BigLightning        ; ATK_ANIM_CHAIN_LIGHTNING ;X
	dw AttackAnimation_SmallFlame          ; ATK_ANIM_SMALL_FLAME ;X
	dw AttackAnimation_BigFlame            ; ATK_ANIM_BIG_FLAME ;X
	dw AttackAnimation_FireSpin            ; ATK_ANIM_FIRE_SPIN ;X
	dw AttackAnimation_DiveBomb            ; ATK_ANIM_DIVE_BOMB ;X
	dw AttackAnimation_WaterJetsHit        ; ATK_ANIM_WATER_JETS ;X
	dw AttackAnimation_WaterGun            ; ATK_ANIM_WATER_GUN ;X
	dw AttackAnimation_Whirlpool           ; ATK_ANIM_WHIRLPOOL ;X
	dw AttackAnimation_DragonRage          ; ATK_ANIM_DRAGON_RAGE ;X
	dw AttackAnimation_HydroPump           ; ATK_ANIM_HYDRO_PUMP ;X
	dw AttackAnimation_BlizzardReal        ; ATK_ANIM_BLIZZARD_REAL ;X
	dw AttackAnimation_Blizzard            ; ATK_ANIM_BLIZZARD ;X
	dw AttackAnimation_PsychicHit          ; ATK_ANIM_PSYCHIC_HIT ;X
	dw AttackAnimation_PsychicHit          ; ATK_ANIM_NIGHTMARE ;X
	dw AttackAnimation_Terraforming        ; ATK_ANIM_TERRAFORMING ;X
	dw AttackAnimation_DarkMind            ; ATK_ANIM_DARK_MIND ;X
	dw AttackAnimation_Beam                ; ATK_ANIM_BEAM ;X
	dw AttackAnimation_HyperBeam           ; ATK_ANIM_HYPER_BEAM ;X
	dw AttackAnimation_Eruption            ; ATK_ANIM_ERUPTION ;X
	dw AttackAnimation_RockThrow           ; ATK_ANIM_ROCK_THROW ;X
	dw AttackAnimation_StoneBarrage        ; ATK_ANIM_STONE_BARRAGE ;X
	dw AttackAnimation_Punch               ; ATK_ANIM_PUNCH ;X
	dw AttackAnimation_Thunderpunch        ; ATK_ANIM_THUNDERPUNCH ;X
	dw AttackAnimation_FirePunch           ; ATK_ANIM_FIRE_PUNCH ;X
	dw AttackAnimation_StretchKick         ; ATK_ANIM_STRETCH_KICK ;X
	dw AttackAnimation_Slash               ; ATK_ANIM_SLASH ;X
	dw AttackAnimation_Whip                ; ATK_ANIM_WHIP ;X
	dw AttackAnimation_Sonicboom           ; ATK_ANIM_SONICBOOM ;X
	dw AttackAnimation_MultipleSlash       ; ATK_ANIM_MULTIPLE_SLASH ;X
	dw AttackAnimation_Magnetism           ; ATK_ANIM_MAGNETISM ;?
	dw AttackAnimation_MultipleSlash       ; ATK_ANIM_RAMPAGE ;X
	dw AttackAnimation_Drill               ; ATK_ANIM_DRILL ;X
	dw AttackAnimation_PotSmash            ; ATK_ANIM_POT_SMASH ;X
	dw AttackAnimation_Bonemerang          ; ATK_ANIM_BONEMERANG ;X
	dw AttackAnimation_SeismicToss         ; ATK_ANIM_SEISMIC_TOSS ;X
	dw AttackAnimation_Needles             ; ATK_ANIM_NEEDLES ;X
	dw AttackAnimation_SpecialPsy          ; ATK_ANIM_SPECIAL_PSY ;x
	dw AttackAnimation_WhiteGas            ; ATK_ANIM_SMOG ;X
	dw AttackAnimation_SelfSleep           ; ATK_ANIM_SELF_SLEEP ;X
	dw AttackAnimation_Conductivity        ; ATK_ANIM_CONDUCTIVITY ;X
	dw AttackAnimation_WhiteGas            ; ATK_ANIM_FOUL_GAS ;X
	dw AttackAnimation_WhiteGas            ; ATK_ANIM_FOUL_ODOR ;X
	dw AttackAnimation_PowderHit           ; ATK_ANIM_POWDER_EFFECT_CHANCE ;X
	dw AttackAnimation_PowderHit           ; ATK_ANIM_POWDER_HIT_POISON ;X
	dw AttackAnimation_Powder              ; ATK_ANIM_POISON_POWDER ;X
	dw AttackAnimation_DriveOff            ; ATK_ANIM_DRIVE_OFF ;?
	dw AttackAnimation_ScreenPsy           ; ATK_ANIM_SCREEN_PSYCHIC_HIT ;x
	dw AttackAnimation_Psysplash           ; ATK_ANIM_PSYSPLASH ;X
	dw AttackAnimation_GooHit              ; ATK_ANIM_GOO ;X
	dw AttackAnimation_HealOpp              ; ATK_ANIM_HEAL_OPP ;X
	dw AttackAnimation_Goo                 ; ATK_ANIM_SPIT_POISON ;O But only in functions
	dw AttackAnimation_FlareBlitz          ; ATK_ANIM_FLARE_BLITZ ;X
	dw AttackAnimation_Bubbles             ; ATK_ANIM_BUBBLES ;X
	dw AttackAnimation_Bubbles             ; ATK_ANIM_UNUSED_42 ;?
	dw AttackAnimation_StringShot          ; ATK_ANIM_STRING_SHOT ;X
	dw AttackAnimation_StringShot          ; ATK_ANIM_UNUSED_44 ;?
	dw AttackAnimation_Boyfriends          ; ATK_ANIM_BOYFRIENDS ;X
	dw AttackAnimation_Lure                ; ATK_ANIM_LURE ;X
	dw AttackAnimation_Toxic               ; ATK_ANIM_TOXIC ;X
	dw AttackAnimation_ConfuseRay          ; ATK_ANIM_CONFUSE_RAY ;X
	dw AttackAnimation_ConfuseRay          ; ATK_ANIM_UNUSED_49 ;?
	dw AttackAnimation_Sing                ; ATK_ANIM_SING ;X
	dw AttackAnimation_Sing                ; ATK_ANIM_LULLABY ;X
	dw AttackAnimation_Supersonic          ; ATK_ANIM_SUPERSONIC ;X
	dw AttackAnimation_Supersonic          ; ATK_ANIM_UNUSED_4D ;X
	dw AttackAnimation_PetalDance          ; ATK_ANIM_PETAL_DANCE ;X
	dw AttackAnimation_Protect             ; ATK_ANIM_PROTECT ;X
	dw AttackAnimation_Barrier             ; ATK_ANIM_BARRIER ;X
	dw AttackAnimation_QuickAttack         ; ATK_ANIM_QUICK_ATTACK ;X
	dw AttackAnimation_AgilityProtect      ; ATK_ANIM_AGILITY_PROTECT ;X
	dw AttackAnimation_Whirlwind           ; ATK_ANIM_WHIRLWIND ;X
	dw AttackAnimation_Cry                 ; ATK_ANIM_CRY ;X
	dw AttackAnimation_Amnesia             ; ATK_ANIM_AMNESIA ;X
	dw AttackAnimation_Selfdestruct        ; ATK_ANIM_SELFDESTRUCT ;X
	dw AttackAnimation_BigSelfdestruct     ; ATK_ANIM_BIG_SELFDESTRUCTION ;X
	dw AttackAnimation_Recover             ; ATK_ANIM_RECOVER ;X
	dw AttackAnimation_Drain               ; ATK_ANIM_DRAIN ;X
	dw AttackAnimation_DarkGas             ; ATK_ANIM_DARK_GAS ;X
	dw AttackAnimation_GlowEffect          ; ATK_ANIM_GLOW_EFFECT ;X
	dw AttackAnimation_MirrorMove          ; ATK_ANIM_MIRROR_MOVE ;X
	dw AttackAnimation_DevolutionBeam      ; ATK_ANIM_DEVOLUTION_BEAM ;X
	dw AttackAnimation_5543                ; ATK_ANIM_PKMN_POWER_1 ;X
	dw AttackAnimation_Firegiver           ; ATK_ANIM_FIREGIVER ;X
	dw AttackAnimation_Quickfreeze         ; ATK_ANIM_QUICKFREEZE ;X
	dw AttackAnimation_PealOfThunder       ; ATK_ANIM_PEAL_OF_THUNDER ;X
	dw AttackAnimation_HealingWind         ; ATK_ANIM_HEALING_WIND
	dw AttackAnimation_WhirlwindZigzag     ; ATK_ANIM_WHIRLWIND_ZIGZAG ;X
	dw AttackAnimation_BigThunder          ; ATK_ANIM_BIG_THUNDER ;X
	dw AttackAnimation_SolarPower          ; ATK_ANIM_SOLAR_POWER ;X
	dw AttackAnimation_Hit2                ; ATK_ANIM_POISON_FANG ;X
	dw AttackAnimation_Hit2                ; ATK_ANIM_UNUSED_67 ;?
	dw AttackAnimation_Hit2                ; ATK_ANIM_UNUSED_68 ;?
	dw AttackAnimation_Needles2            ; ATK_ANIM_UNUSED_69 ;?
	dw AttackAnimation_FriendshipSong      ; ATK_ANIM_FRIENDSHIP_SONG ;X
	dw AttackAnimation_Scrunch             ; ATK_ANIM_SCRUNCH ;X But only in functions
	dw AttackAnimation_CatPunch            ; ATK_ANIM_CAT_PUNCH ;X
	dw AttackAnimation_MagneticStorm       ; ATK_ANIM_MAGNETIC_STORM ;X
	dw AttackAnimation_PoisonWhip          ; ATK_ANIM_POISON_WHIP ;X
	dw AttackAnimation_ThunderWave         ; ATK_ANIM_THUNDER_WAVE ;X
	dw AttackAnimation_ThunderWave         ; ATK_ANIM_UNUSED_70 ;?
	dw AttackAnimation_Spore               ; ATK_ANIM_SPORE ;O
	dw AttackAnimation_Hypnosis            ; ATK_ANIM_HYPNOSIS ;X
	dw AttackAnimation_EnergyConversion    ; ATK_ANIM_ENERGY_CONVERSION ;X
	dw AttackAnimation_Leer                ; ATK_ANIM_LEER ;X
	dw AttackAnimation_ConfusionHit        ; ATK_ANIM_CONFUSION_HIT ;X
	dw AttackAnimation_WaterJets           ; ATK_ANIM_UNUSED_76 ;?
	dw AttackAnimation_DracoMeteor               ; ATK_ANIM_DRACO_METEOR ;X
	dw AttackAnimation_BenchHit            ; ATK_ANIM_BENCH_HIT ;X used in Duel > DealDamageToPlayAreaPokemon_RegularAnim
	dw AttackAnimation_Heal                ; ATK_ANIM_HEAL ;X
	dw AttackAnimation_RecoilHit           ; ATK_ANIM_RECOIL_HIT ;X
	dw AttackAnimation_Poison              ; ATK_ANIM_POISON ;X
	dw AttackAnimation_Confusion           ; ATK_ANIM_CONFUSION ;X
	dw AttackAnimation_Paralysis           ; ATK_ANIM_PARALYSIS ;X
	dw AttackAnimation_Sleep               ; ATK_ANIM_SLEEP ;X
	dw AttackAnimation_OwnConfusion        ; ATK_ANIM_OWN_CONFUSION ;X
	dw AttackAnimation_SleepingGas         ; ATK_ANIM_SLEEPING_GAS ;O
	dw AttackAnimation_QuestionMark        ; ATK_ANIM_UNUSED_81 ;?
	dw AttackAnimation_ThunderPlayArea     ; ATK_ANIM_THUNDER_PLAY_AREA ;X
	dw AttackAnimation_CatPunchPlayArea    ; ATK_ANIM_CAT_PUNCH_PLAY_AREA ;X
	dw AttackAnimation_FiregiverPlayer     ; ATK_ANIM_FIREGIVER_PLAYER ;X
	dw AttackAnimation_FiregiverOpp        ; ATK_ANIM_FIREGIVER_OPP ;X
	dw AttackAnimation_HealingWindPlayArea ; ATK_ANIM_HEALING_WIND_PLAY_AREA ;X
	dw AttackAnimation_Gale                ; ATK_ANIM_GALE ;O 
	dw AttackAnimation_Expand              ; ATK_ANIM_EXPAND ;X
	dw AttackAnimation_PoisonDamage        ; ATK_ANIM_UNUSED_89 ;?
	dw AttackAnimation_FullHeal            ; ATK_ANIM_FULL_HEAL ;X
	dw AttackAnimation_SleepUpdateHUD      ; ATK_ANIM_UNUSED_8B ;?
	dw AttackAnimation_SpitPoisonSuccess   ; ATK_ANIM_SPIT_POISON_SUCCESS ;X But only in functions
	dw AttackAnimation_GustOfWind          ; ATK_ANIM_GUST_OF_WIND ;X
	dw AttackAnimation_HealBothSides       ; ATK_ANIM_HEAL_BOTH_SIDES ;O
	dw AttackAnimation_Stub2               ; ATK_ANIM_UNUSED_8F ;?
	dw AttackAnimation_Stub2               ; ATK_ANIM_UNUSED_90 ;?
	assert_table_length NUM_ATK_ANIMS

AttackAnimation_Hit:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_BigHit:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_BIG_HIT
	anim_normal         DUEL_ANIM_SHAKE2
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_ThunderShock:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_THUNDER_SHOCK
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Thunderbolt:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_FLASH
	anim_normal         DUEL_ANIM_FLASH
	anim_opponent       DUEL_ANIM_THUNDER_SHOCK
	anim_opponent       DUEL_ANIM_BORDER_SPARK
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_BigLightning:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_FLASH
	anim_normal         DUEL_ANIM_BIG_LIGHTNING
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_SmallFlame:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_SMALL_FLAME
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_BigFlame:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_BIG_FLAME
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_FireSpin:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_FIRE_SPIN
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_DiveBomb:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_DIVE_BOMB
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_WaterJetsHit:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_WATER_JETS
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_WaterGun:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_WATER_GUN
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Whirlpool:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_WHIRLPOOL
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_DragonRage:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_LIGHTNING
	anim_opponent       DUEL_ANIM_WATER_GUN
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_HydroPump:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_HYDRO_PUMP
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Blizzard:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_THUNDER_SHOCK
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_opponent       DUEL_ANIM_PARALYSIS									
	anim_end

AttackAnimation_PsychicHit:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_PSYCHIC
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_DarkMind:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_LEER
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Beam:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_BEAM
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_HyperBeam:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_HYPER_BEAM
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_RockThrow:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_ROCK_THROW
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_StoneBarrage:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_BIG_FLAME
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_player         DUEL_ANIM_PROTECT								  
	anim_end

AttackAnimation_Punch:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_PUNCH
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Thunderpunch:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_THUNDERPUNCH
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_FirePunch:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_FIRE_PUNCH
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_StretchKick:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_DISTORT
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Slash:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_SLASH
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Whip:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_WHIP
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Sonicboom:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_SONICBOOM
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_MultipleSlash:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_FURY_SWIPES
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Drill:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_DRILL
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_PotSmash:
	anim_normal         DUEL_ANIM_DISTORT
	anim_opponent       DUEL_ANIM_HYPER_BEAM
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE2
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Bonemerang:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_HIT
	anim_opponent       DUEL_ANIM_QUESTION_MARK
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_SeismicToss:
	anim_player         DUEL_ANIM_LURE
	anim_normal         DUEL_ANIM_DISTORT
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_player         DUEL_ANIM_GLOW
	
	anim_end
AttackAnimation_Needles:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_NEEDLES
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_WhiteGas:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_WHITE_GAS
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_PowderHit:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_POWDER
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Powder:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_POWDER
	anim_end

AttackAnimation_GooHit:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_GOO
	anim_normal         DUEL_ANIM_DISTORT
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Goo:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_GOO
	anim_normal         DUEL_ANIM_DISTORT
	anim_end

AttackAnimation_Bubbles:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_BUBBLES
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_StringShot:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_STRING_SHOT
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Boyfriends:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_BARRIER
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Lure:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_LURE
	anim_normal         DUEL_ANIM_DISTORT
	anim_end

AttackAnimation_Toxic:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_DISTORT
	anim_opponent       DUEL_ANIM_TOXIC
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_ConfuseRay:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_FLASH
	anim_opponent       DUEL_ANIM_CONFUSE_RAY
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Sing:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_SING
	anim_end

AttackAnimation_Supersonic:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_SUPERSONIC
	anim_end

AttackAnimation_PetalDance:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_PETAL_DANCE
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Protect:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_PROTECT
	anim_end

AttackAnimation_Barrier:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_BARRIER
	anim_end

AttackAnimation_QuickAttack:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_SPEED
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_AgilityProtect:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_SPEED
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_player         DUEL_ANIM_PROTECT
	anim_end

AttackAnimation_Whirlwind:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_WHIRLWIND
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Cry:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_CRY
	anim_normal         DUEL_ANIM_SHAKE1
	anim_end

AttackAnimation_Amnesia:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_QUESTION_MARK
	anim_end

AttackAnimation_Selfdestruct:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_player         DUEL_ANIM_HIT
	anim_end

AttackAnimation_BigSelfdestruct:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_BIG_SELFDESTRUCT_1
	anim_normal         DUEL_ANIM_FLASH
	anim_player         DUEL_ANIM_BIG_SELFDESTRUCT_2
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Recover:
	anim_player         DUEL_ANIM_GLOW
	anim_end

AttackAnimation_Drain:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_DRAIN
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_DarkGas:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_DARK_GAS
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_opponent       DUEL_ANIM_QUESTION_MARK
	anim_end

AttackAnimation_GlowEffect:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_FLASH
	anim_end

AttackAnimation_MirrorMove:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_FLASH
	anim_opponent       DUEL_ANIM_GLOW
	anim_end

AttackAnimation_DevolutionBeam:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_FLASH
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_BENCH_GLOW
	anim_end

AttackAnimation_5543:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_BENCH_GLOW
	anim_normal         DUEL_ANIM_FLASH
	anim_end

AttackAnimation_Firegiver:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_BENCH_GLOW
	anim_normal         DUEL_ANIM_FLASH
	anim_play_area      DUEL_ANIM_FIREGIVER_START
	anim_play_area      DUEL_ANIM_FIREGIVER_START
	anim_end

AttackAnimation_Quickfreeze:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_BENCH_GLOW
	anim_normal         DUEL_ANIM_QUICKFREEZE
	anim_screen         SET_ANIM_SCREEN_MAIN
	anim_end

AttackAnimation_PealOfThunder:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_BENCH_GLOW
	anim_play_area      DUEL_ANIM_BENCH_THUNDER
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_play_area      DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_HealingWind:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_BENCH_GLOW
	anim_play_area      DUEL_ANIM_HEALING_WIND
	anim_end

AttackAnimation_WhirlwindZigzag:
	anim_player         DUEL_ANIM_GLOW
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_normal         DUEL_ANIM_BENCH_WHIRLWIND
	anim_end

AttackAnimation_BigThunder:
	anim_player         DUEL_ANIM_GLOW
	
	anim_end

AttackAnimation_SolarPower:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_FLASH
	anim_end

AttackAnimation_Hit2:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Needles2:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_NEEDLES
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_FriendshipSong:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_SING
	anim_end

AttackAnimation_Scrunch:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_EXPAND
	anim_end

AttackAnimation_CatPunch:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_STRING_SHOT
	anim_opponent       DUEL_ANIM_POISON
	anim_end

AttackAnimation_MagneticStorm:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_THUNDER_WAVE
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_PoisonWhip:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_WHITE_GAS
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_ThunderWave:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_THUNDER_WAVE
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Spore:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_POWDER
	anim_end

AttackAnimation_Hypnosis:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_PSYCHIC
	anim_end

AttackAnimation_EnergyConversion:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_FLASH
	anim_end

AttackAnimation_Leer:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_LEER
	anim_opponent       DUEL_ANIM_QUESTION_MARK
	anim_end

AttackAnimation_ConfusionHit:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_CONFUSION
	anim_player         DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE3
	anim_player         DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_WaterJets:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_WATER_JETS
	anim_end

AttackAnimation_DracoMeteor:
	anim_player         DUEL_ANIM_GLOW
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_STONE_BARRAGE
	anim_play_area      DUEL_ANIM_SHAKE3
	anim_play_area      DUEL_ANIM_SHAKE3
	anim_play_area      DUEL_ANIM_SHOW_DAMAGE
	anim_screen         SET_ANIM_SCREEN_MAIN
	anim_end

AttackAnimation_BenchHit:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_SINGLE_HIT
	anim_play_area      DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Heal:
	anim_player         DUEL_ANIM_HEAL
	anim_player         DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_RecoilHit:
	anim_screen         SET_ANIM_SCREEN_MAIN
	anim_player         DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE3
	anim_player         DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Poison:
	anim_opponent       DUEL_ANIM_POISON
	anim_end

AttackAnimation_Confusion:
	anim_opponent       DUEL_ANIM_CONFUSION
	anim_end

AttackAnimation_Paralysis:
	anim_opponent       DUEL_ANIM_PARALYSIS
	anim_end

AttackAnimation_Sleep:
	anim_opponent       DUEL_ANIM_SLEEP
	anim_end

AttackAnimation_OwnConfusion:
	anim_player         DUEL_ANIM_CONFUSION
	anim_end

AttackAnimation_SleepingGas:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_WHITE_GAS
	anim_end

AttackAnimation_QuestionMark:
	anim_opponent       DUEL_ANIM_QUESTION_MARK
	anim_end

AttackAnimation_ThunderPlayArea:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_BENCH_THUNDER
	anim_play_area      DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_play_area      DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_CatPunchPlayArea:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_CAT_PUNCH
	anim_play_area      DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_play_area      DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_FiregiverPlayer:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_normal         DUEL_ANIM_FIREGIVER_PLAYER
	anim_end

AttackAnimation_FiregiverOpp:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_normal         DUEL_ANIM_FIREGIVER_OPP
	anim_end

AttackAnimation_HealingWindPlayArea:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Gale:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_WHIRLWIND
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_normal         DUEL_ANIM_FLASH
	anim_end

AttackAnimation_Expand:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_EXPAND
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_PoisonDamage:
	anim_player         DUEL_ANIM_POISON
	anim_player         DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_FullHeal:
	anim_player         DUEL_ANIM_HEAL
	anim_normal         DUEL_ANIM_UPDATE_HUD
	anim_end

AttackAnimation_SleepUpdateHUD:
	anim_player         DUEL_ANIM_SLEEP
	anim_normal         DUEL_ANIM_UPDATE_HUD
	anim_end

AttackAnimation_SpitPoisonSuccess:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_GOO
	anim_normal         DUEL_ANIM_DISTORT
	anim_end

AttackAnimation_GustOfWind:
	anim_opponent       DUEL_ANIM_WHIRLWIND
	anim_end

AttackAnimation_HealBothSides:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_BENCH_GLOW
	anim_screen         SET_ANIM_SCREEN_MAIN
	anim_player         DUEL_ANIM_HEAL
	anim_opponent       DUEL_ANIM_HEAL
	anim_end

AttackAnimation_RoarDamage:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_SUPERSONIC
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Kick:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_STRETCH_KICK
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Eruption:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_BIG_SELFDESTRUCT_2
	anim_opponent       DUEL_ANIM_BIG_FLAME
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE2
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_PullIn:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent	    DUEL_ANIM_LEER
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_opponent       DUEL_ANIM_SLEEP
	anim_end

AttackAnimation_BlizzardReal:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_BLIZZARD
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Terraforming:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_normal         DUEL_ANIM_SHAKE2
	anim_normal         DUEL_ANIM_SHAKE2
	anim_end

AttackAnimation_Magnetism:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_THUNDER_WAVE
	anim_normal         DUEL_ANIM_SHAKE1
	anim_end

AttackAnimation_SpecialPsy:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_BORDER_SPARK
	anim_normal         DUEL_ANIM_FLASH
	anim_opponent       DUEL_ANIM_QUESTION_MARK
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_SelfSleep:
	anim_player       DUEL_ANIM_SLEEP
	anim_end

AttackAnimation_Conductivity:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_BENCH_THUNDER
	anim_normal         DUEL_ANIM_SHAKE1
	anim_play_area      DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_DriveOff:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area      DUEL_ANIM_BENCH_GLOW
	anim_screen         SET_ANIM_SCREEN_MAIN
	anim_opponent       DUEL_ANIM_WHIRLWIND
	anim_end

AttackAnimation_ScreenPsy:
	anim_player         DUEL_ANIM_GLOW
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area       DUEL_ANIM_PSYCHIC
	anim_play_area       DUEL_ANIM_HIT
	anim_play_area         DUEL_ANIM_SHAKE1
	anim_play_area       DUEL_ANIM_SHOW_DAMAGE
	anim_screen         SET_ANIM_SCREEN_MAIN
	anim_end

AttackAnimation_Psysplash:
	anim_screen         SET_ANIM_SCREEN_PLAY_AREA
	anim_play_area       DUEL_ANIM_PSYCHIC
	anim_play_area       DUEL_ANIM_HIT
	anim_play_area         DUEL_ANIM_SHAKE1
	anim_play_area       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_HealOpp:
	anim_opponent         DUEL_ANIM_HEAL
	anim_opponent         DUEL_ANIM_SHOW_DAMAGE
	anim_screen           SET_ANIM_SCREEN_MAIN ; to prevent a second heal from happening, IDK why but it does
	anim_end

AttackAnimation_FlareBlitz:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_SPEED
	anim_opponent       DUEL_ANIM_BIG_FLAME
	anim_opponent       DUEL_ANIM_BIG_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Stub2:
	anim_end
