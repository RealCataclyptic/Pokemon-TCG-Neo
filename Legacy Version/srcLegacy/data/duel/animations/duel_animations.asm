; data for each animation ID (see src/constants/sprite_constants.asm)
Animations:
	table_width 6, Animations
	; DUEL_ANIM_NONE
	db $00 ; sprite ID
	db $00 ; palette ID
	db $00 ; anim ID
	db $00 ; anim flags
	db $00 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_GLOW
	db SPRITE_DUEL_GLOW ; sprite ID
	db PALETTE_31 ; palette ID
	db SPRITE_ANIM_71 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) ; anim flags
	db SFX_11 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_PARALYSIS
	db SPRITE_DUEL_PARALYSIS ; sprite ID
	db PALETTE_32 ; palette ID
	db SPRITE_ANIM_72 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) ; anim flags
	db SFX_12 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_SLEEP
	db SPRITE_DUEL_SLEEP ; sprite ID
	db PALETTE_33 ; palette ID
	db SPRITE_ANIM_73 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) ; anim flags
	db SFX_13 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_CONFUSION
	db SPRITE_DUEL_STAR ; sprite ID
	db PALETTE_34 ; palette ID
	db SPRITE_ANIM_74 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) ; anim flags
	db SFX_14 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_POISON
	db SPRITE_DUEL_POISON ; sprite ID
	db PALETTE_35 ; palette ID
	db SPRITE_ANIM_75 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) ; anim flags
	db SFX_15 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_SINGLE_HIT
	db SPRITE_DUEL_HIT ; sprite ID
	db PALETTE_36 ; palette ID
	db SPRITE_ANIM_76 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) ; anim flags
	db SFX_16 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_HIT
	db SPRITE_DUEL_HIT ; sprite ID
	db PALETTE_36 ; palette ID
	db SPRITE_ANIM_77 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) ; anim flags
	db SFX_16 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BIG_HIT
	db SPRITE_DUEL_HIT ; sprite ID
	db PALETTE_36 ; palette ID
	db SPRITE_ANIM_78 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) ; anim flags
	db SFX_17 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_SHOW_DAMAGE
	db SPRITE_DUEL_DAMAGE ; sprite ID
	db PALETTE_37 ; palette ID
	db $00 ; anim ID
	db $00 ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_THUNDER_SHOCK
	db SPRITE_DUEL_THUNDER ; sprite ID
	db PALETTE_38 ; palette ID
	db SPRITE_ANIM_92 ; anim ID
	db $00 ; anim flags
	db SFX_18 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_LIGHTNING
	db SPRITE_DUEL_LIGHTNING ; sprite ID
	db PALETTE_39 ; palette ID
	db SPRITE_ANIM_94 ; anim ID
	db $00 ; anim flags
	db SFX_19 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BORDER_SPARK
	db SPRITE_DUEL_SPARK ; sprite ID
	db PALETTE_40 ; palette ID
	db SPRITE_ANIM_95 ; anim ID
	db $00 ; anim flags
	db SFX_1A ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BIG_LIGHTNING
	db SPRITE_DUEL_BIG_LIGHTNING ; sprite ID
	db PALETTE_41 ; palette ID
	db SPRITE_ANIM_96 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_1B ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_SMALL_FLAME
	db SPRITE_DUEL_FLAME ; sprite ID
	db PALETTE_42 ; palette ID
	db SPRITE_ANIM_97 ; anim ID
	db $00 ; anim flags
	db SFX_1C ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BIG_FLAME
	db SPRITE_DUEL_FLAME ; sprite ID
	db PALETTE_42 ; palette ID
	db SPRITE_ANIM_98 ; anim ID
	db $00 ; anim flags
	db SFX_1D ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_FIRE_SPIN
	db SPRITE_DUEL_FIRE_SPIN ; sprite ID
	db PALETTE_43 ; palette ID
	db SPRITE_ANIM_99 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_1E ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_DIVE_BOMB
	db SPRITE_DUEL_FIRE_BIRD ; sprite ID
	db PALETTE_44 ; palette ID
	db SPRITE_ANIM_100 ; anim ID
	db $00 ; anim flags
	db SFX_1F ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_WATER_JETS
	db SPRITE_DUEL_WATER_DROP ; sprite ID
	db PALETTE_45 ; palette ID
	db SPRITE_ANIM_105 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_20 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_WATER_GUN
	db SPRITE_DUEL_WATER_GUN ; sprite ID
	db PALETTE_46 ; palette ID
	db SPRITE_ANIM_106 ; anim ID
	db $00 ; anim flags
	db SFX_21 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_WHIRLPOOL
	db SPRITE_DUEL_WHIRLPOOL ; sprite ID
	db PALETTE_47 ; palette ID
	db SPRITE_ANIM_107 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_22 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_HYDRO_PUMP
	db SPRITE_DUEL_HYDRO_PUMP ; sprite ID
	db PALETTE_48 ; palette ID
	db SPRITE_ANIM_108 ; anim ID
	db $00 ; anim flags
	db SFX_23 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BLIZZARD
	db SPRITE_DUEL_SNOW ; sprite ID
	db PALETTE_49 ; palette ID
	db SPRITE_ANIM_109 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_24 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_PSYCHIC
	db SPRITE_DUEL_PSYCHIC ; sprite ID
	db PALETTE_50 ; palette ID
	db SPRITE_ANIM_110 ; anim ID
	db $00 ; anim flags
	db SFX_25 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_LEER
	db SPRITE_DUEL_LEER ; sprite ID
	db PALETTE_51 ; palette ID
	db SPRITE_ANIM_111 ; anim ID
	db $00 ; anim flags
	db SFX_26 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BEAM
	db SPRITE_DUEL_BEAM ; sprite ID
	db PALETTE_52 ; palette ID
	db SPRITE_ANIM_112 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_6) | (1 << SPRITE_ANIM_FLAG_Y_SUBTRACT) ; anim flags
	db SFX_27 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_HYPER_BEAM
	db SPRITE_DUEL_HYPER_BEAM ; sprite ID
	db PALETTE_53 ; palette ID
	db SPRITE_ANIM_113 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_6) | (1 << SPRITE_ANIM_FLAG_Y_SUBTRACT) ; anim flags
	db SFX_28 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_ROCK_THROW
	db SPRITE_DUEL_ROCK_THROW ; sprite ID
	db PALETTE_54 ; palette ID
	db SPRITE_ANIM_114 ; anim ID
	db $00 ; anim flags
	db SFX_29 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_STONE_BARRAGE
	db SPRITE_DUEL_ROCK_THROW ; sprite ID
	db PALETTE_54 ; palette ID
	db SPRITE_ANIM_115 ; anim ID
	db $00 ; anim flags
	db SFX_2A ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_PUNCH
	db SPRITE_DUEL_PUNCH ; sprite ID
	db PALETTE_55 ; palette ID
	db SPRITE_ANIM_116 ; anim ID
	db $00 ; anim flags
	db SFX_2B ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_THUNDERPUNCH
	db SPRITE_DUEL_PUNCH ; sprite ID
	db PALETTE_55 ; palette ID
	db SPRITE_ANIM_117 ; anim ID
	db $00 ; anim flags
	db SFX_52 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_FIRE_PUNCH
	db SPRITE_DUEL_PUNCH ; sprite ID
	db PALETTE_55 ; palette ID
	db SPRITE_ANIM_118 ; anim ID
	db $00 ; anim flags
	db SFX_53 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_STRETCH_KICK
	db SPRITE_DUEL_STRETCH_KICK ; sprite ID
	db PALETTE_56 ; palette ID
	db SPRITE_ANIM_119 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_5) | (1 << SPRITE_ANIM_FLAG_X_SUBTRACT) ; anim flags
	db SFX_2C ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_SLASH
	db SPRITE_DUEL_SLASH ; sprite ID
	db PALETTE_57 ; palette ID
	db SPRITE_ANIM_120 ; anim ID
	db $00 ; anim flags
	db SFX_2D ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_WHIP
	db SPRITE_DUEL_WHIP ; sprite ID
	db PALETTE_58 ; palette ID
	db SPRITE_ANIM_122 ; anim ID
	db $00 ; anim flags
	db SFX_2D ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_SONICBOOM
	db SPRITE_DUEL_SONICBOOM ; sprite ID
	db PALETTE_59 ; palette ID
	db SPRITE_ANIM_123 ; anim ID
	db $00 ; anim flags
	db SFX_2E ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_FURY_SWIPES
	db SPRITE_DUEL_SLASH ; sprite ID
	db PALETTE_57 ; palette ID
	db SPRITE_ANIM_121 ; anim ID
	db $00 ; anim flags
	db SFX_2F ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_DRILL
	db SPRITE_DUEL_DRILL ; sprite ID
	db PALETTE_60 ; palette ID
	db SPRITE_ANIM_124 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_5) | (1 << SPRITE_ANIM_FLAG_X_SUBTRACT) ; anim flags
	db SFX_30 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_POT_SMASH
	db SPRITE_DUEL_POT ; sprite ID
	db PALETTE_61 ; palette ID
	db SPRITE_ANIM_125 ; anim ID
	db $00 ; anim flags
	db SFX_31 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BONEMERANG
	db SPRITE_DUEL_BONE ; sprite ID
	db PALETTE_62 ; palette ID
	db SPRITE_ANIM_126 ; anim ID
	db $00 ; anim flags
	db SFX_32 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_SEISMIC_TOSS
	db SPRITE_DUEL_PLANET ; sprite ID
	db PALETTE_63 ; palette ID
	db SPRITE_ANIM_127 ; anim ID
	db $00 ; anim flags
	db SFX_33 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_NEEDLES
	db SPRITE_DUEL_NEEDLES ; sprite ID
	db PALETTE_64 ; palette ID
	db SPRITE_ANIM_128 ; anim ID
	db $00 ; anim flags
	db SFX_34 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_WHITE_GAS
	db SPRITE_DUEL_GAS ; sprite ID
	db PALETTE_65 ; palette ID
	db SPRITE_ANIM_129 ; anim ID
	db $00 ; anim flags
	db SFX_35 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_POWDER
	db SPRITE_DUEL_POWDER ; sprite ID
	db PALETTE_66 ; palette ID
	db SPRITE_ANIM_130 ; anim ID
	db $00 ; anim flags
	db SFX_36 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_GOO
	db SPRITE_DUEL_GOO ; sprite ID
	db PALETTE_67 ; palette ID
	db SPRITE_ANIM_131 ; anim ID
	db $00 ; anim flags
	db SFX_37 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BUBBLES
	db SPRITE_DUEL_BUBBLE ; sprite ID
	db PALETTE_68 ; palette ID
	db SPRITE_ANIM_132 ; anim ID
	db $00 ; anim flags
	db SFX_38 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_STRING_SHOT
	db SPRITE_DUEL_STRING ; sprite ID
	db PALETTE_69 ; palette ID
	db SPRITE_ANIM_133 ; anim ID
	db $00 ; anim flags
	db SFX_39 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BOYFRIENDS
	db SPRITE_DUEL_HEART ; sprite ID
	db PALETTE_70 ; palette ID
	db SPRITE_ANIM_134 ; anim ID
	db $00 ; anim flags
	db SFX_3A ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_LURE
	db SPRITE_DUEL_LURE ; sprite ID
	db PALETTE_71 ; palette ID
	db SPRITE_ANIM_135 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_5) | (1 << SPRITE_ANIM_FLAG_X_SUBTRACT) ; anim flags
	db SFX_3B ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_TOXIC
	db SPRITE_DUEL_SKULL ; sprite ID
	db PALETTE_72 ; palette ID
	db SPRITE_ANIM_136 ; anim ID
	db $00 ; anim flags
	db SFX_3C ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_CONFUSE_RAY
	db SPRITE_DUEL_SMALL_STAR ; sprite ID
	db PALETTE_73 ; palette ID
	db SPRITE_ANIM_137 ; anim ID
	db $00 ; anim flags
	db SFX_3D ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_SING
	db SPRITE_DUEL_NOTE ; sprite ID
	db PALETTE_74 ; palette ID
	db SPRITE_ANIM_138 ; anim ID
	db $00 ; anim flags
	db SFX_3E ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_SUPERSONIC
	db SPRITE_DUEL_SOUND ; sprite ID
	db PALETTE_75 ; palette ID
	db SPRITE_ANIM_139 ; anim ID
	db $00 ; anim flags
	db SFX_3F ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_PETAL_DANCE
	db SPRITE_DUEL_PETAL ; sprite ID
	db PALETTE_76 ; palette ID
	db SPRITE_ANIM_140 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_40 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_PROTECT
	db SPRITE_DUEL_PROTECT ; sprite ID
	db PALETTE_77 ; palette ID
	db SPRITE_ANIM_141 ; anim ID
	db $00 ; anim flags
	db SFX_41 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BARRIER
	db SPRITE_DUEL_BARRIER ; sprite ID
	db PALETTE_78 ; palette ID
	db SPRITE_ANIM_142 ; anim ID
	db $00 ; anim flags
	db SFX_42 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_SPEED
	db SPRITE_DUEL_SPEED ; sprite ID
	db PALETTE_79 ; palette ID
	db SPRITE_ANIM_143 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_43 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_WHIRLWIND
	db SPRITE_DUEL_WHIRLWIND ; sprite ID
	db PALETTE_80 ; palette ID
	db SPRITE_ANIM_144 ; anim ID
	db $00 ; anim flags
	db SFX_44 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_CRY
	db SPRITE_DUEL_CRY ; sprite ID
	db PALETTE_81 ; palette ID
	db SPRITE_ANIM_146 ; anim ID
	db $00 ; anim flags
	db SFX_45 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_QUESTION_MARK
	db SPRITE_DUEL_QUESTION_MARK ; sprite ID
	db PALETTE_82 ; palette ID
	db SPRITE_ANIM_147 ; anim ID
	db $00 ; anim flags
	db SFX_46 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_SELFDESTRUCT
	db SPRITE_DUEL_EXPLOSION ; sprite ID
	db PALETTE_83 ; palette ID
	db SPRITE_ANIM_148 ; anim ID
	db $00 ; anim flags
	db SFX_47 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BIG_SELFDESTRUCT_1
	db SPRITE_DUEL_EXPLOSION ; sprite ID
	db PALETTE_83 ; palette ID
	db SPRITE_ANIM_149 ; anim ID
	db $00 ; anim flags
	db SFX_48 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_HEAL
	db SPRITE_DUEL_HEAL ; sprite ID
	db PALETTE_84 ; palette ID
	db SPRITE_ANIM_151 ; anim ID
	db $00 ; anim flags
	db SFX_49 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_DRAIN
	db SPRITE_DUEL_DRAIN ; sprite ID
	db PALETTE_85 ; palette ID
	db SPRITE_ANIM_153 ; anim ID
	db $00 ; anim flags
	db SFX_4A ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_DARK_GAS
	db SPRITE_DUEL_GAS ; sprite ID
	db PALETTE_86 ; palette ID
	db SPRITE_ANIM_129 ; anim ID
	db $00 ; anim flags
	db SFX_4B ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BIG_SELFDESTRUCT_2
	db SPRITE_DUEL_EXPLOSION ; sprite ID
	db PALETTE_83 ; palette ID
	db SPRITE_ANIM_150 ; anim ID
	db $00 ; anim flags
	db SFX_47 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_UNUSED_42
	db SPRITE_DUEL_HIT ; sprite ID
	db PALETTE_36 ; palette ID
	db SPRITE_ANIM_77 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) ; anim flags
	db SFX_16 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_UNUSED_43
	db SPRITE_DUEL_HIT ; sprite ID
	db PALETTE_36 ; palette ID
	db SPRITE_ANIM_78 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) ; anim flags
	db SFX_17 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BENCH_THUNDER
	db SPRITE_DUEL_THUNDER ; sprite ID
	db PALETTE_38 ; palette ID
	db SPRITE_ANIM_92 ; anim ID
	db $00 ; anim flags
	db SFX_18 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_QUICKFREEZE
	db SPRITE_DUEL_SNOW ; sprite ID
	db PALETTE_49 ; palette ID
	db SPRITE_ANIM_109 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_24 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BENCH_GLOW
	db SPRITE_DUEL_SMALL_GLOW ; sprite ID
	db PALETTE_87 ; palette ID
	db SPRITE_ANIM_154 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) ; anim flags
	db SFX_11 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_FIREGIVER_START
	db SPRITE_DUEL_FIRE_BIRD ; sprite ID
	db PALETTE_44 ; palette ID
	db SPRITE_ANIM_101 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_5C ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_UNUSED_48
	db SPRITE_DUEL_FIRE_BIRD ; sprite ID
	db PALETTE_44 ; palette ID
	db SPRITE_ANIM_102 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_HEALING_WIND
	db SPRITE_DUEL_HEAL ; sprite ID
	db PALETTE_84 ; palette ID
	db SPRITE_ANIM_152 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_4C ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BENCH_WHIRLWIND
	db SPRITE_DUEL_WHIRLWIND ; sprite ID
	db PALETTE_80 ; palette ID
	db SPRITE_ANIM_145 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_4D ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_EXPAND
	db SPRITE_DUEL_BALL ; sprite ID
	db PALETTE_88 ; palette ID
	db SPRITE_ANIM_155 ; anim ID
	db $00 ; anim flags
	db SFX_4E ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_CAT_PUNCH
	db SPRITE_DUEL_CAT_POW ; sprite ID
	db PALETTE_89 ; palette ID
	db SPRITE_ANIM_156 ; anim ID
	db $00 ; anim flags
	db SFX_4F ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_THUNDER_WAVE
	db SPRITE_DUEL_WAVE ; sprite ID
	db PALETTE_90 ; palette ID
	db SPRITE_ANIM_157 ; anim ID
	db $00 ; anim flags
	db SFX_50 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_FIREGIVER_PLAYER
	db SPRITE_DUEL_FIRE_BIRD ; sprite ID
	db PALETTE_44 ; palette ID
	db SPRITE_ANIM_103 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_51 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_FIREGIVER_OPP
	db SPRITE_DUEL_FIRE_BIRD ; sprite ID
	db PALETTE_44 ; palette ID
	db SPRITE_ANIM_104 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_51 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_UNUSED_50
	db SPRITE_DUEL_CARD ; sprite ID
	db PALETTE_91 ; palette ID
	db SPRITE_ANIM_158 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_3) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_PLAYER_SHUFFLE
	db SPRITE_DUEL_CARD ; sprite ID
	db PALETTE_91 ; palette ID
	db SPRITE_ANIM_159 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_3) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_07 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_OPP_SHUFFLE
	db SPRITE_DUEL_CARD ; sprite ID
	db PALETTE_91 ; palette ID
	db SPRITE_ANIM_160 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_3) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_07 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BOTH_SHUFFLE
	db SPRITE_DUEL_CARD ; sprite ID
	db PALETTE_91 ; palette ID
	db SPRITE_ANIM_161 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_3) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_07 ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_UNUSED_54
	db SPRITE_DUEL_CARD ; sprite ID
	db PALETTE_91 ; palette ID
	db SPRITE_ANIM_162 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_BOTH_DRAW
	db SPRITE_DUEL_CARD ; sprite ID
	db PALETTE_91 ; palette ID
	db SPRITE_ANIM_163 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_3) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_PLAYER_DRAW
	db SPRITE_DUEL_CARD ; sprite ID
	db PALETTE_91 ; palette ID
	db SPRITE_ANIM_164 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_3) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_OPP_DRAW
	db SPRITE_DUEL_CARD ; sprite ID
	db PALETTE_91 ; palette ID
	db SPRITE_ANIM_165 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_3) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_COIN_SPIN
	db SPRITE_DUEL_COIN ; sprite ID
	db PALETTE_92 ; palette ID
	db SPRITE_ANIM_167 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_3) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_COIN_TOSS1
	db SPRITE_DUEL_COIN ; sprite ID
	db PALETTE_92 ; palette ID
	db SPRITE_ANIM_168 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_3) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_0B ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_COIN_TOSS2
	db SPRITE_DUEL_COIN ; sprite ID
	db PALETTE_92 ; palette ID
	db SPRITE_ANIM_169 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_3) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_0B ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_COIN_TAILS
	db SPRITE_DUEL_COIN ; sprite ID
	db PALETTE_92 ; palette ID
	db SPRITE_ANIM_170 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_COIN_HEADS
	db SPRITE_DUEL_COIN ; sprite ID
	db PALETTE_92 ; palette ID
	db SPRITE_ANIM_171 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_DUEL_WIN
	db SPRITE_DUEL_RESULT ; sprite ID
	db PALETTE_93 ; palette ID
	db SPRITE_ANIM_172 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_DUEL_LOSS
	db SPRITE_DUEL_RESULT ; sprite ID
	db PALETTE_93 ; palette ID
	db SPRITE_ANIM_173 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_DUEL_DRAW
	db SPRITE_DUEL_RESULT ; sprite ID
	db PALETTE_93 ; palette ID
	db SPRITE_ANIM_174 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function

	; DUEL_ANIM_UNUSED_60
	db SPRITE_DUEL_CARD ; sprite ID
	db PALETTE_91 ; palette ID
	db SPRITE_ANIM_166 ; anim ID
	db (1 << SPRITE_ANIM_FLAG_UNSKIPPABLE) | (1 << SPRITE_ANIM_FLAG_SPEED) ; anim flags
	db SFX_STOP ; sound FX ID
	db $00 ; handler function
	assert_table_length NUM_REGULAR_DUEL_ANIMS
