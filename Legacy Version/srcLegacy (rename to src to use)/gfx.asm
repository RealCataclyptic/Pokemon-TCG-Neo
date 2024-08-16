INCLUDE "macros.asm"
INCLUDE "constants.asm"

SECTION "Gfx 1", ROMX

Fonts::

FullWidthFonts::
INCBIN "gfx/fonts/full_width/0_0_katakana.1bpp"
INCBIN "gfx/fonts/full_width/0_1_hiragana.1bpp"
INCBIN "gfx/fonts/full_width/0_2_digits_kanji1.1bpp"
INCBIN "gfx/fonts/full_width/1_kanji2.1bpp"
INCBIN "gfx/fonts/full_width/2_kanji3.1bpp"
INCBIN "gfx/fonts/full_width/3.1bpp"
INCBIN "gfx/fonts/full_width/4.1bpp"

HalfWidthFont::
INCBIN "gfx/fonts/half_width.1bpp"

SymbolsFont::
INCBIN "gfx/fonts/symbols.2bpp"

DuelGraphics::

DuelCardHeaderGraphics::
INCBIN "gfx/duel/card_headers.2bpp"

DuelDmgSgbSymbolGraphics::
INCBIN "gfx/duel/dmg_sgb_symbols.2bpp"

DuelCgbSymbolGraphics::
INCBIN "gfx/duel/cgb_symbols.2bpp", $0, $808

SECTION "Gfx 2", ROMX

INCBIN "gfx/duel/cgb_symbols.2bpp", $808, $8

DuelOtherGraphics::
INCBIN "gfx/duel/other.2bpp"

DuelBoxMessages::
INCBIN "gfx/duel/box_messages.2bpp"

SECTION "Gfx 3", ROMX

WaterClubTilemap::
	db $1c ; width
	db $20 ; height
	dw WaterClubPermissions
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/water_club.bin"
WaterClubPermissions:
	INCBIN "data/maps/permissions/water_club.bin"

WaterClubCGBTilemap::
	db $1c ; width
	db $20 ; height
	dw WaterClubCGBPermissions
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/water_club_cgb.bin"
WaterClubCGBPermissions:
	INCBIN "data/maps/permissions/water_club_cgb.bin"

LightningClubTilemap::
	db $1c ; width
	db $20 ; height
	dw LightningClubPermissions
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/lightning_club.bin"
LightningClubPermissions:
	INCBIN "data/maps/permissions/lightning_club.bin"

LightningClubCGBTilemap::
	db $1c ; width
	db $20 ; height
	dw LightningClubCGBPermissions
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/lightning_club_cgb.bin"
LightningClubCGBPermissions:
	INCBIN "data/maps/permissions/lightning_club_cgb.bin"

GrassClubTilemap::
	db $1c ; width
	db $20 ; height
	dw GrassClubPermissions
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/grass_club.bin"
GrassClubPermissions:
	INCBIN "data/maps/permissions/grass_club.bin"

GrassClubCGBTilemap::
	db $1c ; width
	db $20 ; height
	dw GrassClubCGBPermissions
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/grass_club_cgb.bin"
GrassClubCGBPermissions:
	INCBIN "data/maps/permissions/grass_club_cgb.bin"

PsychicClubTilemap::
	db $1c ; width
	db $1c ; height
	dw PsychicClubPermissions
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/psychic_club.bin"
PsychicClubPermissions:
	INCBIN "data/maps/permissions/psychic_club.bin"

PsychicClubCGBTilemap::
	db $1c ; width
	db $1c ; height
	dw PsychicClubCGBPermissions
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/psychic_club_cgb.bin"
PsychicClubCGBPermissions:
	INCBIN "data/maps/permissions/psychic_club_cgb.bin"

ScienceClubTilemap::
	db $1c ; width
	db $20 ; height
	dw ScienceClubPermissions
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/science_club.bin"
ScienceClubPermissions:
	INCBIN "data/maps/permissions/science_club.bin"

ScienceClubCGBTilemap::
	db $1c ; width
	db $20 ; height
	dw ScienceClubCGBPermissions
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/science_club_cgb.bin"
ScienceClubCGBPermissions:
	INCBIN "data/maps/permissions/science_club_cgb.bin"

FireClubTilemap::
	db $1c ; width
	db $20 ; height
	dw FireClubPermissions
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/fire_club.bin"
FireClubPermissions:
	INCBIN "data/maps/permissions/fire_club.bin"

FireClubCGBTilemap::
	db $1c ; width
	db $20 ; height
	dw FireClubCGBPermissions
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/fire_club_cgb.bin"
FireClubCGBPermissions:
	INCBIN "data/maps/permissions/fire_club_cgb.bin"

ChallengeHallTilemap::
	db $20 ; width
	db $20 ; height
	dw ChallengeHallPermissions
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/challenge_hall.bin"
ChallengeHallPermissions:
	INCBIN "data/maps/permissions/challenge_hall.bin"

ChallengeHallCGBTilemap::
	db $20 ; width
	db $20 ; height
	dw ChallengeHallCGBPermissions
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/challenge_hall_cgb.bin"
ChallengeHallCGBPermissions:
	INCBIN "data/maps/permissions/challenge_hall_cgb.bin"

PokemonDomeEntranceTilemap::
	db $20 ; width
	db $12 ; height
	dw PokemonDomeEntrancePermissions
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/pokemon_dome_entrance.bin"
PokemonDomeEntrancePermissions:
	INCBIN "data/maps/permissions/pokemon_dome_entrance.bin"

PokemonDomeEntranceCGBTilemap::
	db $20 ; width
	db $12 ; height
	dw PokemonDomeEntranceCGBPermissions
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/pokemon_dome_entrance_cgb.bin"
PokemonDomeEntranceCGBPermissions:
	INCBIN "data/maps/permissions/pokemon_dome_entrance_cgb.bin"

PokemonDomeTilemap::
	db $20 ; width
	db $20 ; height
	dw PokemonDomePermissions
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/pokemon_dome.bin"
PokemonDomePermissions:
	INCBIN "data/maps/permissions/pokemon_dome.bin"

PokemonDomeCGBTilemap::
	db $20 ; width
	db $20 ; height
	dw PokemonDomeCGBPermissions
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/pokemon_dome_cgb.bin"
PokemonDomeCGBPermissions:
	INCBIN "data/maps/permissions/pokemon_dome_cgb.bin"

HallOfHonorTilemap::
	db $18 ; width
	db $1a ; height
	dw HallOfHonorPermissions
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/hall_of_honor.bin"
HallOfHonorPermissions:
	INCBIN "data/maps/permissions/hall_of_honor.bin"

HallOfHonorCGBTilemap::
	db $18 ; width
	db $1a ; height
	dw HallOfHonorCGBPermissions
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/hall_of_honor_cgb.bin"
HallOfHonorCGBPermissions:
	INCBIN "data/maps/permissions/hall_of_honor_cgb.bin"

CardPopCGBTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/card_pop_cgb.bin"

CardPopTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/card_pop.bin"

ScienceMedalTilemap::
	db $03 ; width
	db $03 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/science_medal.bin"

FireMedalTilemap::
	db $03 ; width
	db $03 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/fire_medal.bin"

WaterMedalTilemap::
	db $03 ; width
	db $03 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/water_medal.bin"

LightningMedalTilemap::
	db $03 ; width
	db $03 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/lightning_medal.bin"

FightingMedalTilemap::
	db $03 ; width
	db $03 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/fighting_medal.bin"

RockMedalTilemap::
	db $03 ; width
	db $03 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/rock_medal.bin"

PsychicMedalTilemap::
	db $03 ; width
	db $03 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/psychic_medal.bin"

GameBoyLinkCGBTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/gameboy_link_cgb.bin"

GameBoyLinkTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/gameboy_link.bin"

GameBoyLinkConnectingCGBTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/gameboy_link_connecting_cgb.bin"

GameBoyLinkConnectingTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/gameboy_link_connecting.bin"

GameBoyPrinterCGBTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/gameboy_printer_cgb.bin"

GameBoyPrinterTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/gameboy_printer.bin"

ColosseumTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/colosseum.bin"

ColosseumCGBTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/colosseum_cgb.bin"

EvolutionTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/evolution.bin"

EvolutionCGBTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/evolution_cgb.bin"

MysteryTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/mystery.bin"

MysteryCGBTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/mystery_cgb.bin"

LaboratoryTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/laboratory.bin"

LaboratoryCGBTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/laboratory_cgb.bin"

CharizardIntroTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/charizard_intro.bin"

CharizardIntroCGBTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/charizard_intro_cgb.bin"

ScytherIntroTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/scyther_intro.bin"

ScytherIntroCGBTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/scyther_intro_cgb.bin"

AerodactylIntroTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/aerodactyl_intro.bin"

AerodactylIntroCGBTilemap::
	db $08 ; width
	db $0c ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/aerodactyl_intro_cgb.bin"

JapaneseTitleScreenTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/japanese_title_screen.bin"

JapaneseTitleScreenCGBTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/japanese_title_screen_cgb.bin"

SolidTiles1Tilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/solid_tiles_1.bin"

SolidTiles2Tilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/solid_tiles_2.bin"

SolidTiles3Tilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/solid_tiles_3.bin"

JapaneseTitleScreen2Tilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/japanese_title_screen_2.bin"

JapaneseTitleScreen2CGBTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/japanese_title_screen_2_cgb.bin"

SolidTiles4Tilemap::
	db $08 ; width
	db $04 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/solid_tiles_4.bin"

PlayerTilemap::
	db $06 ; width
	db $06 ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/player.bin"

OpponentTilemap::
	db $06 ; width
	db $06 ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/opponent.bin"

TitleScreenTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/title_screen.bin"

TitleScreenCGBTilemap::
	db $14 ; width (in hex, dec 20)
	db $12 ; height (in hex, dec 18)
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/title_screen_cgb.bin"

CopyrightTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/copyright.bin"

CopyrightCGBTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db TRUE ; cgb mode
	INCBIN "data/maps/tiles/copyright_cgb.bin"

NintendoTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/nintendo.bin"

CompaniesTilemap::
	db $14 ; width
	db $12 ; height
	dw NULL
	db FALSE ; cgb mode
	INCBIN "data/maps/tiles/companies.bin"

IshiharaTilesetGfx::
	dw 77
	INCBIN "gfx/tilesets/ishihara.2bpp"

SolidTiles1::
	dw 4
	INCBIN "gfx/solid_tiles.2bpp"

SolidTiles2::
	dw 4
	INCBIN "gfx/solid_tiles.2bpp"

PlayerGfx::
	dw 36
	INCBIN "gfx/duelists/player.2bpp"

DuelStarGfx::
	dw $2
	INCBIN "gfx/duel/anims/star.2bpp"

DuelPowderGfx::
	dw $1
	INCBIN "gfx/duel/anims/powder.2bpp"

AnimData12::
	frame_table AnimFrameTable3
	frame_data 2, 8, 0, 0
	frame_data 0, 0, 0, 0

SECTION "Gfx 4", ROMX

OverworldMapTiles::
	dw 193
	INCBIN "gfx/overworld_map.2bpp"

MasonLaboratoryTilesetGfx::
	dw 151
	INCBIN "gfx/tilesets/masonlaboratory.2bpp"

ClubEntranceTilesetGfx::
	dw 129
	INCBIN "gfx/tilesets/clubentrance.2bpp"

ClubLobbyTilesetGfx::
	dw 120
	INCBIN "gfx/tilesets/clublobby.2bpp"

FightingClubTilesetGfx::
	dw 99
	INCBIN "gfx/tilesets/fightingclub.2bpp"

RockClubTilesetGfx::
	dw 60
	INCBIN "gfx/tilesets/rockclub.2bpp"

WaterClubTilesetGfx::
	dw 161
	INCBIN "gfx/tilesets/waterclub.2bpp"

GrassClubTilesetGfx::
	dw 87
	INCBIN "gfx/tilesets/grassclub.2bpp"

OWPlayerGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/player.2bpp"

DuelPetalGfx::
	dw $1
	INCBIN "gfx/duel/anims/petal.2bpp"

AnimData2::
	frame_table AnimFrameTable0
	frame_data 5, 16, 0, 0
	frame_data 6, 16, 0, 0
	frame_data 7, 16, 0, 0
	frame_data 6, 16, 0, 0
	frame_data 0, 0, 0, 0

Palette109::
	db 1, %11100100
	db 0

SECTION "Gfx 5", ROMX

LightningClubTilesetGfx::
	dw 131
	INCBIN "gfx/tilesets/lightningclub.2bpp"

PsychicClubTilesetGfx::
	dw 58
	INCBIN "gfx/tilesets/psychicclub.2bpp"

ScienceClubTilesetGfx::
	dw 82
	INCBIN "gfx/tilesets/scienceclub.2bpp"

FireClubTilesetGfx::
	dw 87
	INCBIN "gfx/tilesets/fireclub.2bpp"

ChallengeHallTilesetGfx::
	dw 157
	INCBIN "gfx/tilesets/challengehall.2bpp"

PokemonDomeEntranceTilesetGfx::
	dw 78
	INCBIN "gfx/tilesets/pokemondomeentrance.2bpp"

PokemonDomeTilesetGfx::
	dw 207
	INCBIN "gfx/tilesets/pokemondome.2bpp"

HallOfHonorTilesetGfx::
	dw 121
	INCBIN "gfx/tilesets/hallofhonor.2bpp"

MedalGfx::
	dw 72
	INCBIN "gfx/medals.2bpp",   $0, $c0
	INCBIN "gfx/medals.2bpp", $240, $30
	INCBIN "gfx/medals.2bpp", $340, $10
	INCBIN "gfx/medals.2bpp",  $c0, $c0
	INCBIN "gfx/medals.2bpp", $300, $30
	INCBIN "gfx/medals.2bpp", $350, $10
	INCBIN "gfx/medals.2bpp", $180, $c0
	INCBIN "gfx/medals.2bpp", $3c0, $30
	INCBIN "gfx/medals.2bpp", $410, $10
	INCBIN "gfx/medals.2bpp", $2d0, $30
	INCBIN "gfx/medals.2bpp", $2a0, $30
	INCBIN "gfx/medals.2bpp", $270, $30
	INCBIN "gfx/medals.2bpp", $390, $30
	INCBIN "gfx/medals.2bpp", $360, $30
	INCBIN "gfx/medals.2bpp", $330, $10
	INCBIN "gfx/medals.2bpp", $450, $30
	INCBIN "gfx/medals.2bpp", $420, $30
	INCBIN "gfx/medals.2bpp", $3f0, $20

NintendoGfx::
	dw 24
	INCBIN "gfx/nintendo.2bpp"

DuelPoisonGfx::
	dw $4
	INCBIN "gfx/duel/anims/poison.2bpp"

AnimData3::
	frame_table AnimFrameTable0
	frame_data 8, 16, 0, 0
	frame_data 9, 16, 0, 0
	frame_data 0, 0, 0, 0

AnimData11::
	frame_table AnimFrameTable3
	frame_data 1, 8, 0, 0
	frame_data 0, 0, 0, 0

SECTION "Gfx 6", ROMX

CardPopGfx::
	dw 189
	INCBIN "gfx/link/card_pop_scene.2bpp"

GameBoyLinkGfx::
	dw 109
	INCBIN "gfx/link/link_scene.2bpp"

GameBoyPrinterGfx::
	dw 93
	INCBIN "gfx/link/printer_scene.2bpp"

Colosseum1Gfx::
	dw 96
	INCBIN "gfx/booster_packs/colosseum1.2bpp"

Colosseum2Gfx::
	dw 86
	INCBIN "gfx/booster_packs/colosseum2.2bpp"

Evolution1Gfx::
	dw 96
	INCBIN "gfx/booster_packs/evolution1.2bpp"

Evolution2Gfx::
	dw 86
	INCBIN "gfx/booster_packs/evolution2.2bpp"

Mystery1Gfx::
	dw 96
	INCBIN "gfx/booster_packs/mystery1.2bpp"

Mystery2Gfx::
	dw 86
	INCBIN "gfx/booster_packs/mystery2.2bpp"

RonaldGfx::
	dw 36
	INCBIN "gfx/duelists/ronald.2bpp"

CopyrightGfx::
	dw 36
	INCBIN "gfx/copyright.2bpp"

OWClerkGfx::
	dw $8
	INCBIN "gfx/overworld_sprites/clerk.2bpp"

DuelSparkGfx::
	dw $3
	INCBIN "gfx/duel/anims/spark.2bpp"

DuelHealGfx::
	dw $2
	INCBIN "gfx/duel/anims/heal.2bpp"

SECTION "Gfx 7", ROMX

Laboratory1Gfx::
	dw 96
	INCBIN "gfx/booster_packs/laboratory1.2bpp"

Laboratory2Gfx::
	dw 86
	INCBIN "gfx/booster_packs/laboratory2.2bpp"

CharizardIntro1Gfx::
	dw 96
	INCBIN "gfx/titlescreen/booster_packs/charizardintro1.2bpp"

CharizardIntro2Gfx::
	dw 96
	INCBIN "gfx/titlescreen/booster_packs/charizardintro2.2bpp"

ScytherIntro1Gfx::
	dw 96
	INCBIN "gfx/titlescreen/booster_packs/scytherintro1.2bpp"

ScytherIntro2Gfx::
	dw 96
	INCBIN "gfx/titlescreen/booster_packs/scytherintro2.2bpp"

AerodactylIntro1Gfx::
	dw 96
	INCBIN "gfx/titlescreen/booster_packs/aerodactylintro1.2bpp"

AerodactylIntro2Gfx::
	dw 96
	INCBIN "gfx/titlescreen/booster_packs/aerodactylintro2.2bpp"

JapaneseTitleScreenGfx::
	dw 97
	INCBIN "gfx/titlescreen/japanese_title_screen.2bpp"

JapaneseTitleScreenCGBGfx::
	dw 97
	INCBIN "gfx/titlescreen/japanese_title_screen_cgb.2bpp"

CompaniesGfx::
	dw 49
	INCBIN "gfx/companies.2bpp"

OWRonaldGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/ronald.2bpp"

AnimData5::
	frame_table AnimFrameTable1
	frame_data 3, 16, 0, 0
	frame_data 4, 16, 0, 0
	frame_data 0, 0, 0, 0

SECTION "Gfx 8", ROMX

JapaneseTitleScreen2Gfx::
	dw 244
	INCBIN "gfx/titlescreen/japanese_title_screen_2.2bpp"

JapaneseTitleScreen2CGBGfx::
	dw 315
	INCBIN "gfx/titlescreen/japanese_title_screen_2_cgb.2bpp"

TitleScreenGfx::
	dw 220
	INCBIN "gfx/titlescreen/title_screen.2bpp"

TitleScreenCGBGfx::
	dw 212
	INCBIN "gfx/titlescreen/title_screen_cgb.2bpp"

OWDrMasonGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/doctormason.2bpp"

OverworldMapOAMGfx::
	dw $8
	INCBIN "gfx/overworld_map_oam.2bpp"

DuelWaterDropGfx::
	dw $3
	INCBIN "gfx/duel/anims/water_drop.2bpp"

DuelSnowGfx::
	dw $1
	INCBIN "gfx/duel/anims/snow.2bpp"

SECTION "Gfx 9", ROMX

SamGfx::
	dw 36
	INCBIN "gfx/duelists/sam.2bpp"

ImakuniGfx::
	dw 36
	INCBIN "gfx/duelists/imakuni.2bpp"

NikkiGfx::
	dw 36
	INCBIN "gfx/duelists/nikki.2bpp"

RickGfx::
	dw 36
	INCBIN "gfx/duelists/rick.2bpp"

KenGfx::
	dw 36
	INCBIN "gfx/duelists/ken.2bpp"

AmyGfx::
	dw 36
	INCBIN "gfx/duelists/amy.2bpp"

IsaacGfx::
	dw 36
	INCBIN "gfx/duelists/isaac.2bpp"

MitchGfx::
	dw 36
	INCBIN "gfx/duelists/mitch.2bpp"

GeneGfx::
	dw 36
	INCBIN "gfx/duelists/gene.2bpp"

MurrayGfx::
	dw 36
	INCBIN "gfx/duelists/murray.2bpp"

CourtneyGfx::
	dw 36
	INCBIN "gfx/duelists/courtney.2bpp"

SteveGfx::
	dw 36
	INCBIN "gfx/duelists/steve.2bpp"

JackGfx::
	dw 36
	INCBIN "gfx/duelists/jack.2bpp"

RodGfx::
	dw 36
	INCBIN "gfx/duelists/rod.2bpp"

JosephGfx::
	dw 36
	INCBIN "gfx/duelists/joseph.2bpp"

DavidGfx::
	dw 36
	INCBIN "gfx/duelists/david.2bpp"

ErikGfx::
	dw 36
	INCBIN "gfx/duelists/erik.2bpp"

JohnGfx::
	dw 36
	INCBIN "gfx/duelists/john.2bpp"

AdamGfx::
	dw 36
	INCBIN "gfx/duelists/adam.2bpp"

JonathanGfx::
	dw 36
	INCBIN "gfx/duelists/jonathan.2bpp"

JoshuaGfx::
	dw 36
	INCBIN "gfx/duelists/joshua.2bpp"

NicholasGfx::
	dw 36
	INCBIN "gfx/duelists/nicholas.2bpp"

BrandonGfx::
	dw 36
	INCBIN "gfx/duelists/brandon.2bpp"

MatthewGfx::
	dw 36
	INCBIN "gfx/duelists/matthew.2bpp"

RyanGfx::
	dw 36
	INCBIN "gfx/duelists/ryan.2bpp"

AndrewGfx::
	dw 36
	INCBIN "gfx/duelists/andrew.2bpp"

ChrisGfx::
	dw 36
	INCBIN "gfx/duelists/chris.2bpp"

MichaelGfx::
	dw 36
	INCBIN "gfx/duelists/michael.2bpp"

OWLegendaryCardGfx::
	dw $a
	INCBIN "gfx/overworld_sprites/legendary_card.2bpp"

DuelDrainGfx::
	dw $2
	INCBIN "gfx/duel/anims/drain.2bpp"

SECTION "Gfx 10", ROMX

DanielGfx::
	dw 36
	INCBIN "gfx/duelists/daniel.2bpp"

RobertGfx::
	dw 36
	INCBIN "gfx/duelists/robert.2bpp"

BrittanyGfx::
	dw 36
	INCBIN "gfx/duelists/brittany.2bpp"

KristinGfx::
	dw 36
	INCBIN "gfx/duelists/kristin.2bpp"

HeatherGfx::
	dw 36
	INCBIN "gfx/duelists/heather.2bpp"

SaraGfx::
	dw 36
	INCBIN "gfx/duelists/sara.2bpp"

AmandaGfx::
	dw 36
	INCBIN "gfx/duelists/amanda.2bpp"

JenniferGfx::
	dw 36
	INCBIN "gfx/duelists/jennifer.2bpp"

JessicaGfx::
	dw 36
	INCBIN "gfx/duelists/jessica.2bpp"

StephanieGfx::
	dw 36
	INCBIN "gfx/duelists/stephanie.2bpp"

AaronGfx::
	dw 36
	INCBIN "gfx/duelists/aaron.2bpp"

OWIshiharaGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/ishihara.2bpp"

OWImakuniGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/imakuni.2bpp"

OWNikkiGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/nikki.2bpp"

OWRickGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/rick.2bpp"

OWKenGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/ken.2bpp"

OWAmyGfx::
	dw $1b
	INCBIN "gfx/overworld_sprites/amy.2bpp"

OWIsaacGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/isaac.2bpp"

OWMitchGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/mitch.2bpp"

OWGeneGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/gene.2bpp"

OWMurrayGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/murray.2bpp"

OWCourtneyGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/courtney.2bpp"

OWSteveGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/steve.2bpp"

OWJackGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/jack.2bpp"

OWRodGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/rod.2bpp"

OWBoyGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/youngster.2bpp"

OWLadGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/lad.2bpp"

OWSpecsGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/specs.2bpp"

OWButchGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/butch.2bpp"

OWManiaGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/mania.2bpp"

OWJoshuaGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/joshua.2bpp"

OWHoodGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/hood.2bpp"

OWTechGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/tech.2bpp"

OWChapGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/chap.2bpp"

OWManGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/man.2bpp"

OWPappyGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/pappy.2bpp"

OWGirlGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/girl.2bpp"

OWLass1Gfx::
	dw $14
	INCBIN "gfx/overworld_sprites/lass1.2bpp"

OWLass2Gfx::
	dw $14
	INCBIN "gfx/overworld_sprites/lass2.2bpp"

OWLass3Gfx::
	dw $14
	INCBIN "gfx/overworld_sprites/lass3.2bpp"

OWSwimmerGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/swimmer.2bpp"

DuelGlowGfx::
	dw $b
	INCBIN "gfx/duel/anims/glow.2bpp"

DuelSmallStarGfx::
	dw $4
	INCBIN "gfx/duel/anims/small_star.2bpp"

Palette117::
	db 0
	db 1

	rgb 27, 27, 24
	rgb 31, 31,  0
	rgb 31,  0,  0
	rgb  0,  8, 19

SECTION "Gfx 11", ROMX

OWGalGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/gal.2bpp"

OWWomanGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/woman.2bpp"

OWGrannyGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/granny.2bpp"

OWTorchGfx::
	dw $16
	INCBIN "gfx/overworld_sprites/torch.2bpp"

DuelParalysisGfx::
	dw $06
	INCBIN "gfx/duel/anims/paralysis.2bpp"

DuelSleepGfx::
	dw $08
	INCBIN "gfx/duel/anims/sleep.2bpp"

DuelHitGfx::
	dw $09
	INCBIN "gfx/duel/anims/hit.2bpp"

DuelDamageGfx::
	dw $12
	INCBIN "gfx/duel/anims/damage.2bpp"

DuelThunderGfx::
	dw $09
	INCBIN "gfx/duel/anims/thunder.2bpp"

DuelLightningGfx::
	dw $11
	INCBIN "gfx/duel/anims/lightning.2bpp"

DuelBigLightningGfx::
	dw $2d
	INCBIN "gfx/duel/anims/big_lightning.2bpp"

DuelFlameGfx::
	dw $0d
	INCBIN "gfx/duel/anims/flame.2bpp"

DuelFireSpinGfx::
	dw $1c
	INCBIN "gfx/duel/anims/fire_spin.2bpp"

DuelFireBirdGfx::
	dw $4c
	INCBIN "gfx/duel/anims/fire_bird.2bpp"

DuelWaterGunGfx::
	dw $1b
	INCBIN "gfx/duel/anims/water_gun.2bpp"

DuelWhirlpoolGfx::
	dw $07
	INCBIN "gfx/duel/anims/whirlpool.2bpp"

DuelHydroPumpGfx::
	dw $0c
	INCBIN "gfx/duel/anims/hydro_pump.2bpp"

DuelPsychicGfx::
	dw $22
	INCBIN "gfx/duel/anims/psychic.2bpp"

DuelLeerGfx::
	dw $20
	INCBIN "gfx/duel/anims/leer.2bpp"

DuelBeamGfx::
	dw $0a
	INCBIN "gfx/duel/anims/beam.2bpp"

DuelHyperBeamGfx::
	dw $25
	INCBIN "gfx/duel/anims/hyper_beam.2bpp"

DuelRockThrowGfx::
	dw $18
	INCBIN "gfx/duel/anims/rock_throw.2bpp"

DuelPunchGfx::
	dw $1b
	INCBIN "gfx/duel/anims/punch.2bpp"

DuelStretchKickGfx::
	dw $08
	INCBIN "gfx/duel/anims/stretch_kick.2bpp"

DuelSlashGfx::
	dw $0d
	INCBIN "gfx/duel/anims/slash.2bpp"

DuelWhipGfx::
	dw $22
	INCBIN "gfx/duel/anims/whip.2bpp"

DuelSonicboomGfx::
	dw $0c
	INCBIN "gfx/duel/anims/sonicboom.2bpp"

DuelDrillGfx::
	dw $25
	INCBIN "gfx/duel/anims/drill.2bpp"

DuelPotGfx::
	dw $22
	INCBIN "gfx/duel/anims/pot.2bpp"

DuelBoneGfx::
	dw $0c
	INCBIN "gfx/duel/anims/bone.2bpp"

DuelPlanetGfx::
	dw $4c
	INCBIN "gfx/duel/anims/planet.2bpp"

DuelNeedlesGfx::
	dw $08
	INCBIN "gfx/duel/anims/needles.2bpp"

DuelGasGfx::
	dw $07
	INCBIN "gfx/duel/anims/gas.2bpp"

DuelGooGfx::
	dw $1a
	INCBIN "gfx/duel/anims/goo.2bpp"

DuelBubbleGfx::
	dw $0a
	INCBIN "gfx/duel/anims/bubble.2bpp"

DuelStringGfx::
	dw $2e
	INCBIN "gfx/duel/anims/string.2bpp"

DuelHeartGfx::
	dw $08
	INCBIN "gfx/duel/anims/heart.2bpp"

DuelLureGfx::
	dw $07
	INCBIN "gfx/duel/anims/lure.2bpp"

DuelSkullGfx::
	dw $1c
	INCBIN "gfx/duel/anims/skull.2bpp"

DuelNoteGfx::
	dw $08
	INCBIN "gfx/duel/anims/note.2bpp"

DuelSoundGfx::
	dw $0b
	INCBIN "gfx/duel/anims/sound.2bpp"

DuelProtectGfx::
	dw $1c
	INCBIN "gfx/duel/anims/protect.2bpp"

DuelBarrierGfx::
	dw $16
	INCBIN "gfx/duel/anims/barrier.2bpp"

DuelSpeedGfx::
	dw $10
	INCBIN "gfx/duel/anims/speed.2bpp"

DuelWhirlwindGfx::
	dw $0f
	INCBIN "gfx/duel/anims/whirlwind.2bpp"

DuelCryGfx::
	dw $07
	INCBIN "gfx/duel/anims/cry.2bpp"

DuelQuestionMarkGfx::
	dw $0a
	INCBIN "gfx/duel/anims/question_mark.2bpp"

DuelExplosionGfx::
	dw $09
	INCBIN "gfx/duel/anims/explosion.2bpp"

DuelSmallGlowGfx::
	dw $03
	INCBIN "gfx/duel/anims/small_glow.2bpp"

AnimData6::
	frame_table AnimFrameTable1
	frame_data 5, 16, 0, 0
	frame_data 6, 16, 0, 0
	frame_data 7, 16, 0, 0
	frame_data 6, 16, 0, 0
	frame_data 0, 0, 0, 0

SECTION "Gfx 12", ROMX

DuelBallGfx::
	dw $08
	INCBIN "gfx/duel/anims/ball.2bpp"

DuelCatPawGfx::
	dw $0f
	INCBIN "gfx/duel/anims/cat_paw.2bpp"

DuelWaveGfx::
	dw $03
	INCBIN "gfx/duel/anims/wave.2bpp"

DuelCardGfx::
	dw $05
	INCBIN "gfx/duel/anims/card.2bpp"

DuelCoinGfx::
	dw $17
	INCBIN "gfx/duel/anims/coin.2bpp"

DuelResultGfx::
	dw $36
	INCBIN "gfx/duel/anims/result.2bpp"

LinkOAMGfx::
	dw $0b
	INCBIN "gfx/link/link_oam.2bpp"

PrinterOAMGfx::
	dw $06
	INCBIN "gfx/link/printer_oam.2bpp"

CardPopOAMGfx::
	dw $16
	INCBIN "gfx/link/card_pop_oam.2bpp"

BoosterPackOAMGfx::
	dw $20
	INCBIN "gfx/booster_packs/oam.2bpp"

PressStartGfx::
	dw $14
	INCBIN "gfx/titlescreen/press_start.2bpp"

GrassGfx::
	dw $04
	INCBIN "gfx/titlescreen/energies/grass.2bpp"

FireGfx::
	dw $04
	INCBIN "gfx/titlescreen/energies/fire.2bpp"

WaterGfx::
	dw $04
	INCBIN "gfx/titlescreen/energies/water.2bpp"

ColorlessGfx::
	dw $04
	INCBIN "gfx/titlescreen/energies/colorless.2bpp"

LightningGfx::
	dw $04
	INCBIN "gfx/titlescreen/energies/lightning.2bpp"

PsychicGfx::
	dw $04
	INCBIN "gfx/titlescreen/energies/psychic.2bpp"

FightingGfx::
	dw $04
	INCBIN "gfx/titlescreen/energies/fighting.2bpp"

SECTION "Gfx 13", ROMX

MintGfx::
	dw 36
	INCBIN "gfx/duelists/mint.2bpp"

OWMintGfx::
	dw $14
	INCBIN "gfx/overworld_sprites/mint.2bpp"

Palette161::
	db 0
	db 1

	rgb 31, 29, 25
	rgb 28, 17, 14
	rgb  0, 14, 31
	rgb  0,  0,  8

SECTION "Anims 1", ROMX
	INCLUDE "data/duel/animations/anims1.asm"

SECTION "Anims 2", ROMX
	INCLUDE "data/duel/animations/anims2.asm"

SECTION "Anims 3", ROMX
	INCLUDE "data/duel/animations/anims3.asm"

Palette31::
	db 1, %11010010
	db 1

	rgb  0,  0,  0
	rgb 31, 31,  7
	rgb 31, 24,  6
	rgb 11,  3,  0

Palette119:: ; player colors
	db 0
	db 1

	rgb 31, 29, 25
	rgb 28, 17, 14
	rgb 30,  5,  9
	rgb  0,  0,  8

SECTION "Anims 4", ROMX
	INCLUDE "data/duel/animations/anims4.asm"

SECTION "Palettes1", ROMX
	INCLUDE "data/palettes1.asm"

SECTION "Palettes2", ROMX
	INCLUDE "data/palettes2.asm"

SECTION "Card Gfx 1", ROMX

CardGraphics::

GrassEnergyCardGfx::
	INCBIN "gfx/cards/grassenergy.2bpp"
	INCBIN "gfx/cards/grassenergy.pal"

FireEnergyCardGfx::
	INCBIN "gfx/cards/fireenergy.2bpp"
	INCBIN "gfx/cards/fireenergy.pal"

WaterEnergyCardGfx::
	INCBIN "gfx/cards/waterenergy.2bpp"
	INCBIN "gfx/cards/waterenergy.pal"

LightningEnergyCardGfx::
	INCBIN "gfx/cards/lightningenergy.2bpp"
	INCBIN "gfx/cards/lightningenergy.pal"

FightingEnergyCardGfx::
	INCBIN "gfx/cards/fightingenergy.2bpp"
	INCBIN "gfx/cards/fightingenergy.pal"

PsychicEnergyCardGfx::
	INCBIN "gfx/cards/psychicenergy.2bpp"
	INCBIN "gfx/cards/psychicenergy.pal"

DoubleColorlessEnergyCardGfx::
	INCBIN "gfx/cards/doublecolorlessenergy.2bpp"
	INCBIN "gfx/cards/doublecolorlessenergy.pal"

Chikorita1CardGfx::
	INCBIN "gfx/cards/CHIKORITA1.2bpp"
	INCBIN "gfx/cards/CHIKORITA1.pal"

Chikorita2CardGfx::
	INCBIN "gfx/cards/CHIKORITA2.2bpp"
	INCBIN "gfx/cards/CHIKORITA2.pal"

Bayleef1CardGfx::
	INCBIN "gfx/cards/BAYLEEF1.2bpp"
	INCBIN "gfx/cards/BAYLEEF1.pal"

Bayleef2CardGfx::
	INCBIN "gfx/cards/BAYLEEF2.2bpp"
	INCBIN "gfx/cards/BAYLEEF2.pal"

Meganium1CardGfx::
	INCBIN "gfx/cards/MEGANIUM1.2bpp"
	INCBIN "gfx/cards/MEGANIUM1.pal"

Meganium2CardGfx::
	INCBIN "gfx/cards/MEGANIUM2.2bpp"
	INCBIN "gfx/cards/MEGANIUM2.pal"

LedybaCardGfx::
	INCBIN "gfx/cards/LEDYBA.2bpp"
	INCBIN "gfx/cards/LEDYBA.pal"

LedianCardGfx::
	INCBIN "gfx/cards/LEDIAN.2bpp"
	INCBIN "gfx/cards/LEDIAN.pal"

SpinarakCardGfx::
	INCBIN "gfx/cards/SPINARAK.2bpp"
	INCBIN "gfx/cards/SPINARAK.pal"

AriadosCardGfx::
	INCBIN "gfx/cards/ARIADOS.2bpp"
	INCBIN "gfx/cards/ARIADOS.pal"

ZubatCardGfx::
	INCBIN "gfx/cards/ZUBAT.2bpp"
	INCBIN "gfx/cards/ZUBAT.pal"

GolbatCardGfx::
	INCBIN "gfx/cards/GOLBAT.2bpp"
	INCBIN "gfx/cards/GOLBAT.pal"

CrobatCardGfx::
	INCBIN "gfx/cards/CROBAT.2bpp"
	INCBIN "gfx/cards/CROBAT.pal"

OddishCardGfx::
	INCBIN "gfx/cards/ODDISH.2bpp"
	INCBIN "gfx/cards/ODDISH.pal"

	ds $58

SECTION "Card Gfx 2", ROMX

GloomCardGfx::
	INCBIN "gfx/cards/GLOOM.2bpp"
	INCBIN "gfx/cards/GLOOM.pal"

VileplumeCardGfx::
	INCBIN "gfx/cards/VILEPLUME.2bpp"
	INCBIN "gfx/cards/VILEPLUME.pal"

BellossomCardGfx::
	INCBIN "gfx/cards/BELLOSSOM.2bpp"
	INCBIN "gfx/cards/BELLOSSOM.pal"

HoppipCardGfx::
	INCBIN "gfx/cards/HOPPIP.2bpp"
	INCBIN "gfx/cards/HOPPIP.pal"

SkiploomCardGfx::
	INCBIN "gfx/cards/SKIPLOOM.2bpp"
	INCBIN "gfx/cards/SKIPLOOM.pal"

JumpluffCardGfx::
	INCBIN "gfx/cards/JUMPLUFF.2bpp"
	INCBIN "gfx/cards/JUMPLUFF.pal"

SunkernCardGfx::
	INCBIN "gfx/cards/SUNKERN.2bpp"
	INCBIN "gfx/cards/SUNKERN.pal"

SunfloraCardGfx::
	INCBIN "gfx/cards/SUNFLORA.2bpp"
	INCBIN "gfx/cards/SUNFLORA.pal"

YanmaCardGfx::
	INCBIN "gfx/cards/YANMA.2bpp"
	INCBIN "gfx/cards/YANMA.pal"

PinecoCardGfx::
	INCBIN "gfx/cards/PINECO.2bpp"
	INCBIN "gfx/cards/PINECO.pal"

ForretressCardGfx::
	INCBIN "gfx/cards/FORRETRESS.2bpp"
	INCBIN "gfx/cards/FORRETRESS.pal"

ScytherCardGfx::
	INCBIN "gfx/cards/SCYTHER.2bpp"
	INCBIN "gfx/cards/SCYTHER.pal"

ScizorCardGfx::
	INCBIN "gfx/cards/SCIZOR.2bpp"
	INCBIN "gfx/cards/SCIZOR.pal"

HeracrossCardGfx::
	INCBIN "gfx/cards/HERACROSS.2bpp"
	INCBIN "gfx/cards/HERACROSS.pal"

CelebiSCardGfx::
	INCBIN "gfx/cards/CELEBIS.2bpp"
	INCBIN "gfx/cards/CELEBIS.pal"

MagbyCardGfx::
	INCBIN "gfx/cards/MAGBY.2bpp"
	INCBIN "gfx/cards/MAGBY.pal"

MagmarCardGfx::
	INCBIN "gfx/cards/MAGMAR.2bpp"
	INCBIN "gfx/cards/MAGMAR.pal"

Cyndaquil1CardGfx::
	INCBIN "gfx/cards/CYNDAQUIL1.2bpp"
	INCBIN "gfx/cards/CYNDAQUIL1.pal"

Cyndaquil2CardGfx::
	INCBIN "gfx/cards/CYNDAQUIL2.2bpp"
	INCBIN "gfx/cards/CYNDAQUIL2.pal"

Quilava1CardGfx::
	INCBIN "gfx/cards/QUILAVA1.2bpp"
	INCBIN "gfx/cards/QUILAVA1.pal"

Quilava2CardGfx::
	INCBIN "gfx/cards/QUILAVA2.2bpp"
	INCBIN "gfx/cards/QUILAVA2.pal"

	ds $58

SECTION "Card Gfx 3", ROMX

Typhlosion1CardGfx::
	INCBIN "gfx/cards/TYPHLOSION1.2bpp"
	INCBIN "gfx/cards/TYPHLOSION1.pal"

Typhlosion2CardGfx::
	INCBIN "gfx/cards/TYPHLOSION2.2bpp"
	INCBIN "gfx/cards/TYPHLOSION2.pal"

SlugmaCardGfx::
	INCBIN "gfx/cards/SLUGMA.2bpp"
	INCBIN "gfx/cards/SLUGMA.pal"

MagcargoCardGfx::
	INCBIN "gfx/cards/MAGCARGO.2bpp"
	INCBIN "gfx/cards/MAGCARGO.pal"

Houndour1CardGfx::
	INCBIN "gfx/cards/HOUNDOUR1.2bpp"
	INCBIN "gfx/cards/HOUNDOUR1.pal"

Houndour2CardGfx::
	INCBIN "gfx/cards/HOUNDOUR2.2bpp"
	INCBIN "gfx/cards/HOUNDOUR2.pal"

HoundoomCardGfx::
	INCBIN "gfx/cards/HOUNDOOM.2bpp"
	INCBIN "gfx/cards/HOUNDOOM.pal"

Entei1CardGfx::
	INCBIN "gfx/cards/ENTEI1.2bpp"
	INCBIN "gfx/cards/ENTEI1.pal"

Entei2CardGfx::
	INCBIN "gfx/cards/ENTEI2.2bpp"
	INCBIN "gfx/cards/ENTEI2.pal"

HoohCardGfx::
	INCBIN "gfx/cards/HOOH.2bpp"
	INCBIN "gfx/cards/HOOH.pal"

GrowlitheCardGfx::
	INCBIN "gfx/cards/GROWLITHE.2bpp"
	INCBIN "gfx/cards/GROWLITHE.pal"

ArcanineCardGfx::
	INCBIN "gfx/cards/ARCANINE.2bpp"
	INCBIN "gfx/cards/ARCANINE.pal"

FlareonCardGfx::
	INCBIN "gfx/cards/FLAREON.2bpp"
	INCBIN "gfx/cards/FLAREON.pal"

CharmanderCardGfx::
	INCBIN "gfx/cards/CHARMANDER.2bpp"
	INCBIN "gfx/cards/CHARMANDER.pal"

CharmeleonCardGfx::
	INCBIN "gfx/cards/CHARMELEON.2bpp"
	INCBIN "gfx/cards/CHARMELEON.pal"

CharizardSCardGfx::
	INCBIN "gfx/cards/CHARIZARDS.2bpp"
	INCBIN "gfx/cards/CHARIZARDS.pal"

OmanyteCardGfx::
	INCBIN "gfx/cards/OMANYTE.2bpp"
	INCBIN "gfx/cards/OMANYTE.pal"

OmastarCardGfx::
	INCBIN "gfx/cards/OMASTAR.2bpp"
	INCBIN "gfx/cards/OMASTAR.pal"

KabutoCardGfx::
	INCBIN "gfx/cards/KABUTO.2bpp"
	INCBIN "gfx/cards/KABUTO.pal"

KabutopsCardGfx::
	INCBIN "gfx/cards/KABUTOPS.2bpp"
	INCBIN "gfx/cards/KABUTOPS.pal"

VaporeonCardGfx::
	INCBIN "gfx/cards/VAPOREON.2bpp"
	INCBIN "gfx/cards/VAPOREON.pal"

	ds $58

SECTION "Card Gfx 4", ROMX

Totodile1CardGfx::
	INCBIN "gfx/cards/TOTODILE1.2bpp"
	INCBIN "gfx/cards/TOTODILE1.pal"

Totodile2CardGfx::
	INCBIN "gfx/cards/TOTODILE2.2bpp"
	INCBIN "gfx/cards/TOTODILE2.pal"

Croconaw1CardGfx::
	INCBIN "gfx/cards/CROCONAW1.2bpp"
	INCBIN "gfx/cards/CROCONAW1.pal"

Croconaw2CardGfx::
	INCBIN "gfx/cards/CROCONAW2.2bpp"
	INCBIN "gfx/cards/CROCONAW2.pal"

Feraligatr1CardGfx::
	INCBIN "gfx/cards/FERALIGATR1.2bpp"
	INCBIN "gfx/cards/FERALIGATR1.pal"

Feraligatr2CardGfx::
	INCBIN "gfx/cards/FERALIGATR2.2bpp"
	INCBIN "gfx/cards/FERALIGATR2.pal"

Marill1CardGfx::
	INCBIN "gfx/cards/MARILL1.2bpp"
	INCBIN "gfx/cards/MARILL1.pal"

Marill2CardGfx::
	INCBIN "gfx/cards/MARILL2.2bpp"
	INCBIN "gfx/cards/MARILL2.pal"

Azumarill1CardGfx::
	INCBIN "gfx/cards/AZUMARILL1.2bpp"
	INCBIN "gfx/cards/AZUMARILL1.pal"

Azumarill2CardGfx::
	INCBIN "gfx/cards/AZUMARILL2.2bpp"
	INCBIN "gfx/cards/AZUMARILL2.pal"

PoliwagCardGfx::
	INCBIN "gfx/cards/POLIWAG.2bpp"
	INCBIN "gfx/cards/POLIWAG.pal"

PoliwhirlCardGfx::
	INCBIN "gfx/cards/POLIWHIRL.2bpp"
	INCBIN "gfx/cards/POLIWHIRL.pal"

PolitoedCardGfx::
	INCBIN "gfx/cards/POLITOED.2bpp"
	INCBIN "gfx/cards/POLITOED.pal"

WooperCardGfx::
	INCBIN "gfx/cards/WOOPER.2bpp"
	INCBIN "gfx/cards/WOOPER.pal"

QuagsireCardGfx::
	INCBIN "gfx/cards/QUAGSIRE.2bpp"
	INCBIN "gfx/cards/QUAGSIRE.pal"

QwilfishCardGfx::
	INCBIN "gfx/cards/QWILFISH.2bpp"
	INCBIN "gfx/cards/QWILFISH.pal"

SneaselCardGfx::
	INCBIN "gfx/cards/SNEASEL.2bpp"
	INCBIN "gfx/cards/SNEASEL.pal"

RemoraidCardGfx::
	INCBIN "gfx/cards/REMORAID.2bpp"
	INCBIN "gfx/cards/REMORAID.pal"

OctilleryCardGfx::
	INCBIN "gfx/cards/OCTILLERY.2bpp"
	INCBIN "gfx/cards/OCTILLERY.pal"

MantineCardGfx::
	INCBIN "gfx/cards/MANTINE.2bpp"
	INCBIN "gfx/cards/MANTINE.pal"

HorseaCardGfx::
	INCBIN "gfx/cards/HORSEA.2bpp"
	INCBIN "gfx/cards/HORSEA.pal"

	ds $58

SECTION "Card Gfx 5", ROMX

SeadraCardGfx::
	INCBIN "gfx/cards/SEADRA.2bpp"
	INCBIN "gfx/cards/SEADRA.pal"

KingdraCardGfx::
	INCBIN "gfx/cards/KINGDRA.2bpp"
	INCBIN "gfx/cards/KINGDRA.pal"

SuicuneCardGfx::
	INCBIN "gfx/cards/SUICUNE.2bpp"
	INCBIN "gfx/cards/SUICUNE.pal"

MagikarpSCardGfx::
	INCBIN "gfx/cards/MAGIKARPS.2bpp"
	INCBIN "gfx/cards/MAGIKARPS.pal"

GyaradosSCardGfx::
	INCBIN "gfx/cards/GYARADOSS.2bpp"
	INCBIN "gfx/cards/GYARADOSS.pal"

JolteonCardGfx::
	INCBIN "gfx/cards/JOLTEON.2bpp"
	INCBIN "gfx/cards/JOLTEON.pal"

Chinchou1CardGfx::
	INCBIN "gfx/cards/CHINCHOU1.2bpp"
	INCBIN "gfx/cards/CHINCHOU1.pal"

Chinchou2CardGfx::
	INCBIN "gfx/cards/CHINCHOU2.2bpp"
	INCBIN "gfx/cards/CHINCHOU2.pal"

Lanturn1CardGfx::
	INCBIN "gfx/cards/LANTURN1.2bpp"
	INCBIN "gfx/cards/LANTURN1.pal"

Lanturn2CardGfx::
	INCBIN "gfx/cards/LANTURN2.2bpp"
	INCBIN "gfx/cards/LANTURN2.pal"

PichuCardGfx::
	INCBIN "gfx/cards/PICHU.2bpp"
	INCBIN "gfx/cards/PICHU.pal"

PikachuCardGfx::
	INCBIN "gfx/cards/PIKACHU.2bpp"
	INCBIN "gfx/cards/PIKACHU.pal"

RaichuCardGfx::
	INCBIN "gfx/cards/RAICHU.2bpp"
	INCBIN "gfx/cards/RAICHU.pal"

Mareep1CardGfx::
	INCBIN "gfx/cards/MAREEP1.2bpp"
	INCBIN "gfx/cards/MAREEP1.pal"

Mareep2CardGfx::
	INCBIN "gfx/cards/MAREEP2.2bpp"
	INCBIN "gfx/cards/MAREEP2.pal"

Flaaffy1CardGfx::
	INCBIN "gfx/cards/FLAAFFY1.2bpp"
	INCBIN "gfx/cards/FLAAFFY1.pal"

Flaaffy2CardGfx::
	INCBIN "gfx/cards/FLAAFFY2.2bpp"
	INCBIN "gfx/cards/FLAAFFY2.pal"

Ampharos1CardGfx::
	INCBIN "gfx/cards/AMPHAROS1.2bpp"
	INCBIN "gfx/cards/AMPHAROS1.pal"

Ampharos2CardGfx::
	INCBIN "gfx/cards/AMPHAROS2.2bpp"
	INCBIN "gfx/cards/AMPHAROS2.pal"

ElekidCardGfx::
	INCBIN "gfx/cards/ELEKID.2bpp"
	INCBIN "gfx/cards/ELEKID.pal"

ElectabuzzCardGfx::
	INCBIN "gfx/cards/ELECTABUZZ.2bpp"
	INCBIN "gfx/cards/ELECTABUZZ.pal"

	ds $58

SECTION "Card Gfx 6", ROMX

RaikouCardGfx::
	INCBIN "gfx/cards/RAIKOU.2bpp"
	INCBIN "gfx/cards/RAIKOU.pal"

RaichuSCardGfx::
	INCBIN "gfx/cards/RAICHUS.2bpp"
	INCBIN "gfx/cards/RAICHUS.pal"

PoliwrathCardGfx::
	INCBIN "gfx/cards/POLIWRATH.2bpp"
	INCBIN "gfx/cards/POLIWRATH.pal"

AerodactylCardGfx::
	INCBIN "gfx/cards/AERODACTYL.2bpp"
	INCBIN "gfx/cards/AERODACTYL.pal"

SudowoodoCardGfx::
	INCBIN "gfx/cards/SUDOWOODO.2bpp"
	INCBIN "gfx/cards/SUDOWOODO.pal"

GligarCardGfx::
	INCBIN "gfx/cards/GLIGAR.2bpp"
	INCBIN "gfx/cards/GLIGAR.pal"

OnixCardGfx::
	INCBIN "gfx/cards/ONIX.2bpp"
	INCBIN "gfx/cards/ONIX.pal"

SteelixCardGfx::
	INCBIN "gfx/cards/STEELIX.2bpp"
	INCBIN "gfx/cards/STEELIX.pal"

ShuckleCardGfx::
	INCBIN "gfx/cards/SHUCKLE.2bpp"
	INCBIN "gfx/cards/SHUCKLE.pal"

SwinubCardGfx::
	INCBIN "gfx/cards/SWINUB.2bpp"
	INCBIN "gfx/cards/SWINUB.pal"

PiloswineCardGfx::
	INCBIN "gfx/cards/PILOSWINE.2bpp"
	INCBIN "gfx/cards/PILOSWINE.pal"

CorsolaCardGfx::
	INCBIN "gfx/cards/CORSOLA.2bpp"
	INCBIN "gfx/cards/CORSOLA.pal"

Phanpy1CardGfx::
	INCBIN "gfx/cards/PHANPY1.2bpp"
	INCBIN "gfx/cards/PHANPY1.pal"

Phanpy2CardGfx::
	INCBIN "gfx/cards/PHANPY2.2bpp"
	INCBIN "gfx/cards/PHANPY2.pal"

Donphan1CardGfx::
	INCBIN "gfx/cards/DONPHAN1.2bpp"
	INCBIN "gfx/cards/DONPHAN1.pal"

Donphan2CardGfx::
	INCBIN "gfx/cards/DONPHAN2.2bpp"
	INCBIN "gfx/cards/DONPHAN2.pal"

TyrogueCardGfx::
	INCBIN "gfx/cards/TYROGUE.2bpp"
	INCBIN "gfx/cards/TYROGUE.pal"

HitmonleeCardGfx::
	INCBIN "gfx/cards/HITMONLEE.2bpp"
	INCBIN "gfx/cards/HITMONLEE.pal"

HitmonchanCardGfx::
	INCBIN "gfx/cards/HITMONCHAN.2bpp"
	INCBIN "gfx/cards/HITMONCHAN.pal"

HitmontopCardGfx::
	INCBIN "gfx/cards/HITMONTOP.2bpp"
	INCBIN "gfx/cards/HITMONTOP.pal"

LarvitarCardGfx::
	INCBIN "gfx/cards/LARVITAR.2bpp"
	INCBIN "gfx/cards/LARVITAR.pal"

	ds $58

SECTION "Card Gfx 7", ROMX

PupitarCardGfx::
	INCBIN "gfx/cards/PUPITAR.2bpp"
	INCBIN "gfx/cards/PUPITAR.pal"

TyranitarCardGfx::
	INCBIN "gfx/cards/TYRANITAR.2bpp"
	INCBIN "gfx/cards/TYRANITAR.pal"

KabutopsSCardGfx::
	INCBIN "gfx/cards/KABUTOPSS.2bpp"
	INCBIN "gfx/cards/KABUTOPSS.pal"

SteelixSCardGfx::
	INCBIN "gfx/cards/STEELIXS.2bpp"
	INCBIN "gfx/cards/STEELIXS.pal"

TyranitarSCardGfx::
	INCBIN "gfx/cards/TYRANITARS.2bpp"
	INCBIN "gfx/cards/TYRANITARS.pal"

GastlyCardGfx::
	INCBIN "gfx/cards/GASTLY.2bpp"
	INCBIN "gfx/cards/GASTLY.pal"

HaunterCardGfx::
	INCBIN "gfx/cards/HAUNTER.2bpp"
	INCBIN "gfx/cards/HAUNTER.pal"

GengarCardGfx::
	INCBIN "gfx/cards/GENGAR.2bpp"
	INCBIN "gfx/cards/GENGAR.pal"

MewtwoCardGfx::
	INCBIN "gfx/cards/MEWTWO.2bpp"
	INCBIN "gfx/cards/MEWTWO.pal"

MewCardGfx::
	INCBIN "gfx/cards/MEW.2bpp"
	INCBIN "gfx/cards/MEW.pal"

NatuCardGfx::
	INCBIN "gfx/cards/NATU.2bpp"
	INCBIN "gfx/cards/NATU.pal"

XatuCardGfx::
	INCBIN "gfx/cards/XATU.2bpp"
	INCBIN "gfx/cards/XATU.pal"

Espeon1CardGfx::
	INCBIN "gfx/cards/ESPEON1.2bpp"
	INCBIN "gfx/cards/ESPEON1.pal"

Espeon2CardGfx::
	INCBIN "gfx/cards/ESPEON2.2bpp"
	INCBIN "gfx/cards/ESPEON2.pal"

UmbreonCardGfx::
	INCBIN "gfx/cards/UMBREON.2bpp"
	INCBIN "gfx/cards/UMBREON.pal"

MurkrowCardGfx::
	INCBIN "gfx/cards/MURKROW.2bpp"
	INCBIN "gfx/cards/MURKROW.pal"

SlowpokeCardGfx::
	INCBIN "gfx/cards/SLOWPOKE.2bpp"
	INCBIN "gfx/cards/SLOWPOKE.pal"

SlowbroCardGfx::
	INCBIN "gfx/cards/SLOWBRO.2bpp"
	INCBIN "gfx/cards/SLOWBRO.pal"

SlowkingCardGfx::
	INCBIN "gfx/cards/SLOWKING.2bpp"
	INCBIN "gfx/cards/SLOWKING.pal"

MisdreavusCardGfx::
	INCBIN "gfx/cards/MISDREAVUS.2bpp"
	INCBIN "gfx/cards/MISDREAVUS.pal"

UnownACardGfx::
	INCBIN "gfx/cards/UNOWNA.2bpp"
	INCBIN "gfx/cards/UNOWNA.pal"

	ds $58

SECTION "Card Gfx 8", ROMX

UnownJCardGfx::
	INCBIN "gfx/cards/UNOWNJ.2bpp"
	INCBIN "gfx/cards/UNOWNJ.pal"

WobbuffetCardGfx::
	INCBIN "gfx/cards/WOBBUFFET.2bpp"
	INCBIN "gfx/cards/WOBBUFFET.pal"

GirafarigCardGfx::
	INCBIN "gfx/cards/GIRAFARIG.2bpp"
	INCBIN "gfx/cards/GIRAFARIG.pal"

SmoochumCardGfx::
	INCBIN "gfx/cards/SMOOCHUM.2bpp"
	INCBIN "gfx/cards/SMOOCHUM.pal"

JynxCardGfx::
	INCBIN "gfx/cards/JYNX.2bpp"
	INCBIN "gfx/cards/JYNX.pal"

CelebiCardGfx::
	INCBIN "gfx/cards/CELEBI.2bpp"
	INCBIN "gfx/cards/CELEBI.pal"

MewtwoSCardGfx::
	INCBIN "gfx/cards/MEWTWOS.2bpp"
	INCBIN "gfx/cards/MEWTWOS.pal"

MewSCardGfx::
	INCBIN "gfx/cards/MEWS.2bpp"
	INCBIN "gfx/cards/MEWS.pal"

DratiniCardGfx::
	INCBIN "gfx/cards/DRATINI.2bpp"
	INCBIN "gfx/cards/DRATINI.pal"

DragonairCardGfx::
	INCBIN "gfx/cards/DRAGONAIR.2bpp"
	INCBIN "gfx/cards/DRAGONAIR.pal"

DragoniteCardGfx::
	INCBIN "gfx/cards/DRAGONITE.2bpp"
	INCBIN "gfx/cards/DRAGONITE.pal"

SentretCardGfx::
	INCBIN "gfx/cards/SENTRET.2bpp"
	INCBIN "gfx/cards/SENTRET.pal"

FurretCardGfx::
	INCBIN "gfx/cards/FURRET.2bpp"
	INCBIN "gfx/cards/FURRET.pal"

HoothootCardGfx::
	INCBIN "gfx/cards/HOOTHOOT.2bpp"
	INCBIN "gfx/cards/HOOTHOOT.pal"

NoctowlCardGfx::
	INCBIN "gfx/cards/NOCTOWL.2bpp"
	INCBIN "gfx/cards/NOCTOWL.pal"

CleffaCardGfx::
	INCBIN "gfx/cards/CLEFFA.2bpp"
	INCBIN "gfx/cards/CLEFFA.pal"

ClefairyCardGfx::
	INCBIN "gfx/cards/CLEFAIRY.2bpp"
	INCBIN "gfx/cards/CLEFAIRY.pal"

ClefableCardGfx::
	INCBIN "gfx/cards/CLEFABLE.2bpp"
	INCBIN "gfx/cards/CLEFABLE.pal"

IgglybuffCardGfx::
	INCBIN "gfx/cards/IGGLYBUFF.2bpp"
	INCBIN "gfx/cards/IGGLYBUFF.pal"

JigglypuffCardGfx::
	INCBIN "gfx/cards/JIGGLYPUFF.2bpp"
	INCBIN "gfx/cards/JIGGLYPUFF.pal"

WigglytuffCardGfx::
	INCBIN "gfx/cards/WIGGLYTUFF.2bpp"
	INCBIN "gfx/cards/WIGGLYTUFF.pal"

	ds $58

SECTION "Card Gfx 9", ROMX

Togepi1CardGfx::
	INCBIN "gfx/cards/TOGEPI1.2bpp"
	INCBIN "gfx/cards/TOGEPI1.pal"

Togepi2CardGfx::
	INCBIN "gfx/cards/TOGEPI2.2bpp"
	INCBIN "gfx/cards/TOGEPI2.pal"

Togetic1CardGfx::
	INCBIN "gfx/cards/TOGETIC1.2bpp"
	INCBIN "gfx/cards/TOGETIC1.pal"

Togetic2CardGfx::
	INCBIN "gfx/cards/TOGETIC2.2bpp"
	INCBIN "gfx/cards/TOGETIC2.pal"

AipomCardGfx::
	INCBIN "gfx/cards/AIPOM.2bpp"
	INCBIN "gfx/cards/AIPOM.pal"

EeveeCardGfx::
	INCBIN "gfx/cards/EEVEE.2bpp"
	INCBIN "gfx/cards/EEVEE.pal"

DunsparceCardGfx::
	INCBIN "gfx/cards/DUNSPARCE.2bpp"
	INCBIN "gfx/cards/DUNSPARCE.pal"

SnubbullCardGfx::
	INCBIN "gfx/cards/SNUBBULL.2bpp"
	INCBIN "gfx/cards/SNUBBULL.pal"

GranbullCardGfx::
	INCBIN "gfx/cards/GRANBULL.2bpp"
	INCBIN "gfx/cards/GRANBULL.pal"

TeddiursaCardGfx::
	INCBIN "gfx/cards/TEDDIURSA.2bpp"
	INCBIN "gfx/cards/TEDDIURSA.pal"

UrsaringCardGfx::
	INCBIN "gfx/cards/URSARING.2bpp"
	INCBIN "gfx/cards/URSARING.pal"

DelibirdCardGfx::
	INCBIN "gfx/cards/DELIBIRD.2bpp"
	INCBIN "gfx/cards/DELIBIRD.pal"

SkarmoryCardGfx::
	INCBIN "gfx/cards/SKARMORY.2bpp"
	INCBIN "gfx/cards/SKARMORY.pal"

PorygonCardGfx::
	INCBIN "gfx/cards/PORYGON.2bpp"
	INCBIN "gfx/cards/PORYGON.pal"

Porygon2CardGfx::
	INCBIN "gfx/cards/PORYGON2.2bpp"
	INCBIN "gfx/cards/PORYGON2.pal"

StantlerCardGfx::
	INCBIN "gfx/cards/STANTLER.2bpp"
	INCBIN "gfx/cards/STANTLER.pal"

SmeargleCardGfx::
	INCBIN "gfx/cards/SMEARGLE.2bpp"
	INCBIN "gfx/cards/SMEARGLE.pal"

MiltankCardGfx::
	INCBIN "gfx/cards/MILTANK.2bpp"
	INCBIN "gfx/cards/MILTANK.pal"

ChanseyCardGfx::
	INCBIN "gfx/cards/CHANSEY.2bpp"
	INCBIN "gfx/cards/CHANSEY.pal"

BlisseyCardGfx::
	INCBIN "gfx/cards/BLISSEY.2bpp"
	INCBIN "gfx/cards/BLISSEY.pal"

LugiaCardGfx::
	INCBIN "gfx/cards/LUGIA.2bpp"
	INCBIN "gfx/cards/LUGIA.pal"

	ds $58

SECTION "Card Gfx 10", ROMX

NoctowlSCardGfx::
	INCBIN "gfx/cards/NOCTOWLS.2bpp"
	INCBIN "gfx/cards/NOCTOWLS.pal"

CharizardCCardGfx::
	INCBIN "gfx/cards/CHARIZARDC.2bpp"
	INCBIN "gfx/cards/CHARIZARDC.pal"

LugiaCCardGfx::
	INCBIN "gfx/cards/LUGIAC.2bpp"
	INCBIN "gfx/cards/LUGIAC.pal"

HoohCCardGfx::
	INCBIN "gfx/cards/HOOHC.2bpp"
	INCBIN "gfx/cards/HOOHC.pal"

CelebiCCardGfx::
	INCBIN "gfx/cards/CELEBIC.2bpp"
	INCBIN "gfx/cards/CELEBIC.pal"

ProfessorElmCardGfx::
	INCBIN "gfx/cards/PROFESSORELM.2bpp"
	INCBIN "gfx/cards/PROFESSORELM.pal"

TeamRocketsEvilDeedsCardGfx::
	INCBIN "gfx/cards/TREVILDEEDS.2bpp"
	INCBIN "gfx/cards/TREVILDEEDS.pal"

MailFromBillCardGfx::
	INCBIN "gfx/cards/MAILFROMBILL.2bpp"
	INCBIN "gfx/cards/MAILFROMBILL.pal"

ForestGuardianCardGfx::
	INCBIN "gfx/cards/FORESTGUARDIAN.2bpp"
	INCBIN "gfx/cards/FORESTGUARDIAN.pal"

SeerCardGfx::
	INCBIN "gfx/cards/SEER.2bpp"
	INCBIN "gfx/cards/SEER.pal"

ShadowLugiaCardGfx::
	INCBIN "gfx/cards/LUGIASHADOW.2bpp"
	INCBIN "gfx/cards/LUGIASHADOW.pal"

PokemonFanClubCardGfx::
	INCBIN "gfx/cards/POKEMONFANCLUB.2bpp"
	INCBIN "gfx/cards/POKEMONFANCLUB.pal"

StarPieceCardGfx::
	INCBIN "gfx/cards/STARPIECE.2bpp"
	INCBIN "gfx/cards/STARPIECE.pal"

PokeDollCardGfx::
	INCBIN "gfx/cards/POKEDOLL.2bpp"
	INCBIN "gfx/cards/POKEDOLL.pal"

FossilEggCardGfx::
	INCBIN "gfx/cards/FOSSILEGG.2bpp"
	INCBIN "gfx/cards/FOSSILEGG.pal"

EnergyArkCardGfx::
	INCBIN "gfx/cards/ENERGYARK.2bpp"
	INCBIN "gfx/cards/ENERGYARK.pal"

SuperEnergyRetrievalCardGfx::
	INCBIN "gfx/cards/superenergyretrieval.2bpp"
	INCBIN "gfx/cards/superenergyretrieval.pal"

EnergySearchCardGfx::
	INCBIN "gfx/cards/energysearch.2bpp"
	INCBIN "gfx/cards/energysearch.pal"

EnergyRemoval2CardGfx::
	INCBIN "gfx/cards/ENERGYREMOVAL2.2bpp"
	INCBIN "gfx/cards/ENERGYREMOVAL2.pal"

MasterBallCardGfx::
	INCBIN "gfx/cards/MASTERBALL.2bpp"
	INCBIN "gfx/cards/MASTERBALL.pal"

SwitchCardGfx::
	INCBIN "gfx/cards/switch.2bpp"
	INCBIN "gfx/cards/switch.pal"

	ds $58

SECTION "Card Gfx 11", ROMX

PokemonNurseCardGfx::
	INCBIN "gfx/cards/POKEMONNURSE.2bpp"
	INCBIN "gfx/cards/POKEMONNURSE.pal"

PokeBallCardGfx::
	INCBIN "gfx/cards/pokeball.2bpp"
	INCBIN "gfx/cards/pokeball.pal"

SuperScoopUpCardGfx::
	INCBIN "gfx/cards/SUPERSCOOPUP.2bpp"
	INCBIN "gfx/cards/SUPERSCOOPUP.pal"

PokegearCardGfx::
	INCBIN "gfx/cards/POKEGEAR.2bpp"
	INCBIN "gfx/cards/POKEGEAR.pal"

NewPokedexCardGfx::
	INCBIN "gfx/cards/NEWPOKEDEX.2bpp"
	INCBIN "gfx/cards/NEWPOKEDEX.pal"

StrengthCharmCardGfx::
	INCBIN "gfx/cards/STRENGTHCHARM.2bpp"
	INCBIN "gfx/cards/STRENGTHCHARM.pal"

CrystalShardCardGfx::
	INCBIN "gfx/cards/CRYSTALSHARD.2bpp"
	INCBIN "gfx/cards/CRYSTALSHARD.pal"

RuinWallCardGfx::
	INCBIN "gfx/cards/RUINWALL.2bpp"
	INCBIN "gfx/cards/RUINWALL.pal"

PokemonReversalCardGfx::
	INCBIN "gfx/cards/POKEMONREVERSAL.2bpp"
	INCBIN "gfx/cards/POKEMONREVERSAL.pal"

CrobatSCardGfx::
	INCBIN "gfx/cards/CROBATS.2bpp"
	INCBIN "gfx/cards/CROBATS.pal"

PotionCardGfx::
	INCBIN "gfx/cards/potion.2bpp"
	INCBIN "gfx/cards/potion.pal"

HyperPotionCardGfx::
	INCBIN "gfx/cards/HYPERPOTION.2bpp"
	INCBIN "gfx/cards/HYPERPOTION.pal"

FullHealCardGfx::
	INCBIN "gfx/cards/fullheal.2bpp"
	INCBIN "gfx/cards/fullheal.pal"

SnorlaxCardGfx::
	INCBIN "gfx/cards/MIRACLEBERRY.2bpp"
	INCBIN "gfx/cards/MIRACLEBERRY.pal"

BillsMaintenanceCardGfx::
	INCBIN "gfx/cards/BILLSMAINTENANCE.2bpp"
	INCBIN "gfx/cards/BILLSMAINTENANCE.pal"

KingdraSCardGfx::
	INCBIN "gfx/cards/KINGDRAS.2bpp"
	INCBIN "gfx/cards/KINGDRAS.pal"

ArcadeGameCardGfx::
	INCBIN "gfx/cards/ARCADEGAME.2bpp"
	INCBIN "gfx/cards/ARCADEGAME.pal"

AlakazamCardGfx::
	INCBIN "gfx/cards/OLDROD.2bpp"
	INCBIN "gfx/cards/OLDROD.pal"