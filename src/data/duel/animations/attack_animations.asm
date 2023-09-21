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
MACRO anim_unknown
	db $04, \1
ENDM
MACRO anim_unknown2
	db $05, \1
ENDM
MACRO anim_end2
	db $06
ENDM
; THE ICONS AFTER THE ANIMATION INDICATE IF THIS IS USED IN GAME. X IS YES, O IS NO, ? IS IDK WHAT THIS DOES.
PointerTable_AttackAnimation:
	dw NULL                                ; ATK_ANIM_NONE 		;X
	dw AttackAnimation_Hit                 ; ATK_ANIM_HIT 		;X
	dw AttackAnimation_BigHit              ; ATK_ANIM_BIG_HIT 	;X
	dw AttackAnimation_Hit                 ; ATK_ANIM_3 		;?
	dw AttackAnimation_Hit                 ; ATK_ANIM_HIT_RECOIL	;X
	dw AttackAnimation_Hit                 ; ATK_ANIM_HIT_EFFECT	;X
	dw AttackAnimation_ThunderShock        ; ATK_ANIM_THUNDERSHOCK	;X
	dw AttackAnimation_ThunderShock        ; ATK_ANIM_THUNDER	;X
	dw AttackAnimation_Thunderbolt         ; ATK_ANIM_THUNDERBOLT	;X
	dw AttackAnimation_ThunderShock        ; ATK_ANIM_9		;?
	dw AttackAnimation_BigLightning        ; ATK_ANIM_THUNDER_WHOLE_SCREEN	;X
	dw AttackAnimation_BigLightning        ; ATK_ANIM_11		;?
	dw AttackAnimation_BigLightning        ; ATK_ANIM_THUNDERSTORM	;?
	dw AttackAnimation_BigLightning        ; ATK_ANIM_CHAIN_LIGHTNING	;X
	dw AttackAnimation_SmallFlame          ; ATK_ANIM_SMALL_FLAME	;X
	dw AttackAnimation_BigFlame            ; ATK_ANIM_BIG_FLAME	;X
	dw AttackAnimation_FireSpin            ; ATK_ANIM_FIRE_SPIN	;X
	dw AttackAnimation_DiveBomb            ; ATK_ANIM_DIVE_BOMB	;X
	dw AttackAnimation_WaterJets           ; ATK_ANIM_WATER_JETS	;X
	dw AttackAnimation_WaterGun            ; ATK_ANIM_WATER_GUN	;X
	dw AttackAnimation_Whirlpool           ; ATK_ANIM_WHIRLPOOL	;X
	dw AttackAnimation_DragonRage          ; ATK_ANIM_DRAGON_RAGE	;X
	dw AttackAnimation_HydroPump           ; ATK_ANIM_HYDRO_PUMP	;X
	dw AttackAnimation_Blizzard            ; ATK_ANIM_23		;?
	dw AttackAnimation_Blizzard            ; ATK_ANIM_BLIZZARD	;X
	dw AttackAnimation_PsychicHit          ; ATK_ANIM_PSYCHIC_HIT	;X
	dw AttackAnimation_PsychicHit          ; ATK_ANIM_NIGHTMARE	;X
	dw AttackAnimation_PsychicHit          ; ATK_ANIM_27		;?
	dw AttackAnimation_DarkMind            ; ATK_ANIM_DARK_MIND	;X
	dw AttackAnimation_Beam                ; ATK_ANIM_BEAM		;X
	dw AttackAnimation_HyperBeam           ; ATK_ANIM_HYPER_BEAM	;X
	dw AttackAnimation_Beam                ; ATK_ANIM_31		;?
	dw AttackAnimation_RockThrow           ; ATK_ANIM_ROCK_THROW	;X
	dw AttackAnimation_StoneBarrage        ; ATK_ANIM_STONE_BARRAGE	;X
	dw AttackAnimation_Punch               ; ATK_ANIM_PUNCH		;X
	dw AttackAnimation_Thunderpunch        ; ATK_ANIM_THUNDERPUNCH	;X
	dw AttackAnimation_FirePunch           ; ATK_ANIM_FIRE_PUNCH	;X
	dw AttackAnimation_StretchKick         ; ATK_ANIM_STRETCH_KICK	;X
	dw AttackAnimation_Slash               ; ATK_ANIM_SLASH		;X
	dw AttackAnimation_Whip                ; ATK_ANIM_WHIP		;X
	dw AttackAnimation_Tear                ; ATK_ANIM_TEAR		;X
	dw AttackAnimation_MultipleSlash       ; ATK_ANIM_MULTIPLE_SLASH	;X
	dw AttackAnimation_MultipleSlash       ; ATK_ANIM_42		;?
	dw AttackAnimation_MultipleSlash       ; ATK_ANIM_RAMPAGE	;X
	dw AttackAnimation_Drill               ; ATK_ANIM_DRILL		;X
	dw AttackAnimation_PotSmash            ; ATK_ANIM_POT_SMASH	;X
	dw AttackAnimation_Bonemerang          ; ATK_ANIM_BONEMERANG	;X
	dw AttackAnimation_SeismicToss         ; ATK_ANIM_SEISMIC_TOSS	;X
	dw AttackAnimation_Needles             ; ATK_ANIM_NEEDLES	;X
	dw AttackAnimation_Needles             ; ATK_ANIM_49		;?
	dw AttackAnimation_WhiteGas            ; ATK_ANIM_SMOG		;X
	dw AttackAnimation_WhiteGas            ; ATK_ANIM_51		;?
	dw AttackAnimation_WhiteGas            ; ATK_ANIM_52		;?
	dw AttackAnimation_WhiteGas            ; ATK_ANIM_FOUL_GAS	;X
	dw AttackAnimation_WhiteGas            ; ATK_ANIM_FOUL_ODOR	;X
	dw AttackAnimation_Powder              ; ATK_ANIM_POWDER_EFFECT_CHANCE	;X
	dw AttackAnimation_Powder              ; ATK_ANIM_POWDER_HIT_POISON	;X
	dw AttackAnimation_544e                ; ATK_ANIM_POISON_POWDER		;X
	dw AttackAnimation_Powder              ; ATK_ANIM_58		;?
	dw AttackAnimation_Powder              ; ATK_ANIM_59		;?
	dw AttackAnimation_Powder              ; ATK_ANIM_60		;?
	dw AttackAnimation_Goo                 ; ATK_ANIM_GOO		;X
	dw AttackAnimation_Goo                 ; ATK_ANIM_62		;?
	dw AttackAnimation_SpitPoisonFail      ; ATK_ANIM_SPIT_POISON	;XO but only in functions
	dw AttackAnimation_Goo                 ; ATK_ANIM_64		;?
	dw AttackAnimation_Bubbles             ; ATK_ANIM_BUBBLES	;X
	dw AttackAnimation_Bubbles             ; ATK_ANIM_66		;?
	dw AttackAnimation_StringShot          ; ATK_ANIM_STRING_SHOT	;X
	dw AttackAnimation_StringShot          ; ATK_ANIM_68		;?
	dw AttackAnimation_Boyfriends          ; ATK_ANIM_BOYFRIENDS	;O
	dw AttackAnimation_Lure                ; ATK_ANIM_LURE		;X
	dw AttackAnimation_Toxic               ; ATK_ANIM_TOXIC		;X
	dw AttackAnimation_ConfuseRay          ; ATK_ANIM_CONFUSE_RAY	;X
	dw AttackAnimation_ConfuseRay          ; ATK_ANIM_73		;?
	dw AttackAnimation_Sing                ; ATK_ANIM_SING		;X
	dw AttackAnimation_Sing                ; ATK_ANIM_LULLABY	;X	
	dw AttackAnimation_Supersonic          ; ATK_ANIM_SUPERSONIC	;X
	dw AttackAnimation_Supersonic          ; ATK_ANIM_77		;?
	dw AttackAnimation_PetalDance          ; ATK_ANIM_PETAL_DANCE	;X
	dw AttackAnimation_Protect             ; ATK_ANIM_PROTECT	;X
	dw AttackAnimation_Barrier             ; ATK_ANIM_BARRIER	;X
	dw AttackAnimation_QuickAttack         ; ATK_ANIM_QUICK_ATTACK	;X
	dw AttackAnimation_AgilityProtect      ; ATK_ANIM_AGILITY_PROTECT	;X
	dw AttackAnimation_Whirlwind           ; ATK_ANIM_WHIRLWIND	;X
	dw AttackAnimation_Cry                 ; ATK_ANIM_CRY		;X
	dw AttackAnimation_Amnesia             ; ATK_ANIM_AMNESIA	;X
	dw AttackAnimation_Selfdestruct        ; ATK_ANIM_SELFDESTRUCT	;O
	dw AttackAnimation_BigSelfdestruct     ; ATK_ANIM_BIG_SELFDESTRUCTION	;X
	dw AttackAnimation_Recover             ; ATK_ANIM_RECOVER	;X
	dw AttackAnimation_Drain               ; ATK_ANIM_DRAIN		;X
	dw AttackAnimation_DarkGas             ; ATK_ANIM_DARK_GAS	;X
	dw AttackAnimation_GlowEffect          ; ATK_ANIM_GLOW_EFFECT	;X
	dw AttackAnimation_MirrorMove          ; ATK_ANIM_MIRROR_MOVE	;X
	dw AttackAnimation_DevolutionBeam      ; ATK_ANIM_DEVOLUTION_BEAM	;X
	dw AttackAnimation_5543                ; ATK_ANIM_PKMN_POWER_1	;X
	dw AttackAnimation_Firegiver           ; ATK_ANIM_FIREGIVER	;X
	dw AttackAnimation_Quickfreeze         ; ATK_ANIM_QUICKFREEZE	;X
	dw AttackAnimation_PealOfThunder       ; ATK_ANIM_PEAL_OF_THUNDER	;X
	dw AttackAnimation_HealingWind         ; ATK_ANIM_HEALING_WIND
	dw AttackAnimation_WhirlwindZigzag     ; ATK_ANIM_WHIRLWIND_ZIGZAG	;X
	dw AttackAnimation_BigThunder          ; ATK_ANIM_BIG_THUNDER	;X
	dw AttackAnimation_SolarPower          ; ATK_ANIM_SOLAR_POWER	;X
	dw AttackAnimation_PoisonFang          ; ATK_ANIM_POISON_FANG	;X
	dw AttackAnimation_PoisonFang          ; ATK_ANIM_103		;?
	dw AttackAnimation_PoisonFang          ; ATK_ANIM_104		;?
	dw AttackAnimation_558c                ; ATK_ANIM_105		;?
	dw AttackAnimation_FriendshipSong      ; ATK_ANIM_FRIENDSHIP_SONG	;X
	dw AttackAnimation_Scrunch             ; ATK_ANIM_SCRUNCH	;X but only in functions
	dw AttackAnimation_CatPunch            ; ATK_ANIM_CAT_PUNCH	;X	
	dw AttackAnimation_MagneticStorm       ; ATK_ANIM_MAGNETIC_STORM	;X
	dw AttackAnimation_PoisonWhip          ; ATK_ANIM_POISON_WHIP	;O
	dw AttackAnimation_ThunderWave         ; ATK_ANIM_THUNDER_WAVE	;X
	dw AttackAnimation_ThunderWave         ; ATK_ANIM_112		;?
	dw AttackAnimation_Spore               ; ATK_ANIM_SPORE		;O
	dw AttackAnimation_Hypnosis            ; ATK_ANIM_HYPNOSIS	;X
	dw AttackAnimation_EnergyConversion    ; ATK_ANIM_ENERGY_CONVERSION	;X
	dw AttackAnimation_Leer                ; ATK_ANIM_LEER		;X
	dw AttackAnimation_ConfusionHit        ; ATK_ANIM_CONFUSION_HIT	;X
	dw AttackAnimation_55e0                ; ATK_ANIM_118		;?
	dw AttackAnimation_55e5                ; ATK_ANIM_119		;?
	dw AttackAnimation_BenchHit            ; ATK_ANIM_BENCH_HIT	
	dw AttackAnimation_Heal                ; ATK_ANIM_HEAL		;X
	dw AttackAnimation_RecoilHit           ; ATK_ANIM_RECOIL_HIT	;X
	dw AttackAnimation_Poison              ; ATK_ANIM_POISON	;X
	dw AttackAnimation_Confusion           ; ATK_ANIM_CONFUSION	;X
	dw AttackAnimation_Paralysis           ; ATK_ANIM_PARALYSIS	;X
	dw AttackAnimation_Sleep               ; ATK_ANIM_SLEEP		;X
	dw AttackAnimation_ImakuniConfusion    ; ATK_ANIM_IMAKUNI_CONFUSION	;X
	dw AttackAnimation_SleepingGas         ; ATK_ANIM_SLEEPING_GAS	;O
	dw AttackAnimation_560f                ; ATK_ANIM_129		;?
	dw AttackAnimation_ThunderPlayArea     ; ATK_ANIM_THUNDER_PLAY_AREA	;X
	dw AttackAnimation_CatPunchPlayArea    ; ATK_ANIM_CAT_PUNCH_PLAY_AREA	;X
	dw AttackAnimation_FiregiverPlayer     ; ATK_ANIM_FIREGIVER_PLAYER	;X
	dw AttackAnimation_FiregiverOpp        ; ATK_ANIM_FIREGIVER_OPP		;X
	dw AttackAnimation_HealingWindPlayArea ; ATK_ANIM_HEALING_WIND_PLAY_AREA	;X
	dw AttackAnimation_Gale                ; ATK_ANIM_GALE		;O (maybe?)
	dw AttackAnimation_Expand              ; ATK_ANIM_EXPAND	;X
	dw AttackAnimation_564f                ; ATK_ANIM_137		;?
	dw AttackAnimation_FullHeal            ; ATK_ANIM_FULL_HEAL	;X
	dw AttackAnimation_5659                ; ATK_ANIM_139		;?
	dw AttackAnimation_SpitPoisonSuccess   ; ATK_ANIM_SPIT_POISON_SUCCESS 	;X but only in functions
	dw AttackAnimation_GustOfWind          ; ATK_ANIM_GUST_OF_WIND		;X
	dw AttackAnimation_HealBothSides       ; ATK_ANIM_HEAL_BOTH_SIDES	;O
	dw AttackAnimation_5673                ; ATK_ANIM_143		;?
	dw AttackAnimation_5673                ; ATK_ANIM_144		;?

AttackAnimation_Hit: ; (6:52c6)
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
	anim_opponent       DUEL_ANIM_LIGHTNING
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

AttackAnimation_WaterJets:
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
	anim_opponent       DUEL_ANIM_GLARE
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

AttackAnimation_Tear:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_TEAR
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

AttackAnimation_Powder:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_POWDER
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_544e:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_POWDER
	anim_end

AttackAnimation_Goo:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_GOO
	anim_normal         DUEL_ANIM_DISTORT
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_SpitPoisonFail:
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
	anim_opponent       DUEL_ANIM_BOYFRIENDS
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
	anim_normal         DUEL_ANIM_QUICK_ATTACK
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_AgilityProtect:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_QUICK_ATTACK
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
	anim_player         DUEL_ANIM_SELFDESTRUCT
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
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
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_70
	anim_end

AttackAnimation_5543:
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_70
	anim_normal         DUEL_ANIM_FLASH
	anim_end

AttackAnimation_Firegiver:
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_70
	anim_normal         DUEL_ANIM_FLASH
	anim_unknown2       DUEL_ANIM_71
	anim_unknown2       DUEL_ANIM_71
	anim_end

AttackAnimation_Quickfreeze:
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_70
	anim_normal         DUEL_ANIM_69
	anim_unknown        $01
	anim_end

AttackAnimation_PealOfThunder:
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_70
	anim_unknown2       DUEL_ANIM_68
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_unknown2       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_HealingWind:
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_70
	anim_unknown2       DUEL_ANIM_73
	anim_end

AttackAnimation_WhirlwindZigzag:
	anim_player         DUEL_ANIM_GLOW
	anim_unknown        $04
	anim_normal         DUEL_ANIM_74
	anim_end

AttackAnimation_BigThunder:
	anim_player         DUEL_ANIM_GLOW
	anim_end

AttackAnimation_SolarPower:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_FLASH
	anim_end

AttackAnimation_PoisonFang:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_558c:
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
	anim_opponent       DUEL_ANIM_WHIP
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
	anim_opponent       DUEL_ANIM_GLARE
	anim_opponent       DUEL_ANIM_QUESTION_MARK
	anim_end

AttackAnimation_ConfusionHit:
	anim_player         DUEL_ANIM_GLOW
	anim_player         DUEL_ANIM_CONFUSION
	anim_player         DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE3
	anim_player         DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_55e0:
	anim_player         DUEL_ANIM_GLOW
	anim_normal         DUEL_ANIM_WATER_JETS
	anim_end

AttackAnimation_55e5:
	anim_end

AttackAnimation_BenchHit:
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_6
	anim_unknown2       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_Heal:
	anim_player         DUEL_ANIM_HEAL
	anim_player         DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_RecoilHit:
	anim_unknown        $01
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

AttackAnimation_ImakuniConfusion:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent	    DUEL_ANIM_GLARE
	anim_opponent       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_opponent       DUEL_ANIM_SHOW_DAMAGE
	anim_opponent       DUEL_ANIM_SLEEP
	anim_end

AttackAnimation_SleepingGas:
	anim_player         DUEL_ANIM_GLOW
	anim_opponent       DUEL_ANIM_WHITE_GAS
	anim_end

AttackAnimation_560f:
	anim_opponent       DUEL_ANIM_QUESTION_MARK
	anim_end

AttackAnimation_ThunderPlayArea:
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_68
	anim_unknown2       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_unknown2       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_CatPunchPlayArea:
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_76
	anim_unknown2       DUEL_ANIM_HIT
	anim_normal         DUEL_ANIM_SHAKE1
	anim_unknown2       DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_FiregiverPlayer:
	anim_unknown        $04
	anim_normal         DUEL_ANIM_78
	anim_end

AttackAnimation_FiregiverOpp:
	anim_unknown        $04
	anim_normal         DUEL_ANIM_79
	anim_end

AttackAnimation_HealingWindPlayArea:
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_SHOW_DAMAGE
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

AttackAnimation_564f:
	anim_player         DUEL_ANIM_POISON
	anim_player         DUEL_ANIM_SHOW_DAMAGE
	anim_end

AttackAnimation_FullHeal:
	anim_player         DUEL_ANIM_HEAL
	anim_normal         $98
	anim_end

AttackAnimation_5659:
	anim_player         DUEL_ANIM_SLEEP
	anim_normal         $98
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
	anim_unknown        $04
	anim_unknown2       DUEL_ANIM_70
	anim_unknown        $01
	anim_player         DUEL_ANIM_HEAL
	anim_opponent       DUEL_ANIM_HEAL
	anim_end

AttackAnimation_5673:
	anim_end
