; input:
; a = scene ID (SCENE_* constant)
; b = base X position of scene in tiles
; c = base Y position of scene in tiles
_LoadScene:
	push hl
	push bc
	push de
	ld e, a
	ld a, [wCurTilemap]
	push af
	ld a, [wd291]
	push af
	ld a, e
	push bc
	push af
	ld a, b
	add a
	add a
	add a
	add $08
	ld [wSceneBaseX], a
	ld a, c
	add a
	add a
	add a
	add $10
	ld [wSceneBaseY], a
	pop af
	add a
	ld c, a
	ld b, 0
	ld hl, ScenePointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld [wSceneSGBPacketPtr], a
	ld a, [hli]
	ld [wSceneSGBPacketPtr + 1], a
	ld a, [hli]
	ld [wSceneSGBRoutinePtr], a
	ld a, [hli]
	ld [wSceneSGBRoutinePtr + 1], a
	call LoadScene_LoadCompressedSGBPacket
	ld a, %11100100
	ld [wBGP], a
	ld a, [wConsole]
	cp CONSOLE_CGB
	ld a, [hli]
	jr nz, .not_cgb_1
	ld a, [hl]
.not_cgb_1
	inc hl
	push af ; palette
	xor a
	ld [wd4ca], a
	ld a, [hli]
	ld [wd4cb], a ; palette offset
	ld [wd291], a ; palette offset
	pop af ; palette
	farcall SetBGPAndLoadedPal ; load palette
	ld a, [wConsole]
	cp CONSOLE_CGB
	ld a, [hli]
	jr nz, .not_cgb_2
	ld a, [hl]
.not_cgb_2
	inc hl
	ld [wCurTilemap], a
	pop bc
	push bc
	farcall LoadTilemap_ToVRAM
	pop bc ; base x,y
	call LoadScene_LoadSGBPacket
	ld a, [hli]
	ld [wd4ca], a ; tile offset
	ld a, [hli]
	ld [wd4cb], a ; vram0 or vram1
	farcall LoadTilesetGfx
.next_sprite
	ld a, [hli]
	or a
	jr z, .done ; no sprite
	ld [wSceneSprite], a
	ld a, [wConsole]
	cp CONSOLE_CGB
	ld a, [hli]
	jr nz, .not_cgb_3
	ld a, [hl]
.not_cgb_3
	inc hl
	push af ; sprite palette
	xor a
	ld [wd4ca], a
	ld a, [hli]
	ld [wd4cb], a ; palette offset
	pop af ; sprite palette
	farcall LoadPaletteData
.next_animation
	ld a, [hli]
	or a
	jr z, .next_sprite
	dec hl
	ld a, [wConsole]
	cp CONSOLE_CGB
	ld a, [hli]
	jr nz, .not_cgb_4
	ld a, [hl]
.not_cgb_4
	inc hl
	ld [wSceneSpriteAnimation], a
	ld a, [wSceneSprite]
	farcall CreateSpriteAndAnimBufferEntry
	ld a, [wWhichSprite]
	ld [wSceneSpriteIndex], a
	push hl
	ld c, SPRITE_ANIM_COORD_X
	call GetSpriteAnimBufferProperty
	ld e, l
	ld d, h
	pop hl
	ld a, [wSceneBaseX]
	add [hl]
	ld [de], a
	inc hl
	inc de
	ld a, [wSceneBaseY]
	add [hl]
	ld [de], a
	inc hl
	ld a, [wSceneSpriteAnimation]
	cp $ff
	jr z, .no_animation
	farcall StartSpriteAnimation
.no_animation
	jr .next_animation
.done
	pop af
	ld [wd291], a
	pop af
	ld [wCurTilemap], a
	pop de
	pop bc
	pop hl
	ret

INCLUDE "data/scenes.asm"

LoadScene_LoadCompressedSGBPacket:
	ld a, [wConsole]
	cp CONSOLE_SGB
	ret nz
	push hl
	ld hl, wSceneSGBPacketPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .skip
	farcall Func_703cb
.skip
	pop hl
	ret

LoadScene_LoadSGBPacket:
	ld a, [wConsole]
	cp CONSOLE_SGB
	ret nz
	push hl
	push bc
	push de
	ld hl, wSceneSGBPacketPtr
	ld a, [hli]
	or [hl]
	jr z, .done
	ld hl, wSceneSGBRoutinePtr + 1
	ld a, [hld]
	or [hl]
	jr z, .use_default
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CallHL2
	jr .done
.use_default
	ld l, %001010 ; outside, border, inside palette numbers
	ld a, [wBGMapWidth]
	ld d, a
	ld a, [wBGMapHeight]
	ld e, a
	farcall Func_70498
.done
	pop de
	pop bc
	pop hl
	ret

LoadScene_SetGameBoyPrinterAttrBlk:
	push hl
	push bc
	push de
	ld hl, SGBPacket_GameBoyPrinter
	call SendSGB
	pop de
	pop bc
	pop hl
	ret

SGBPacket_GameBoyPrinter:
	sgb ATTR_BLK, 1
	db 1 ; number of data sets
	db ATTR_BLK_CTRL_OUTSIDE | ATTR_BLK_CTRL_LINE | ATTR_BLK_CTRL_INSIDE
	db %101111 ; Color Palette Designation
	db 11 ; x1
	db 0  ; y1
	db 16 ; x2
	db 9  ; y2
	ds 6 ; data set 2
	ds 2 ; data set 3

LoadScene_SetCardPopAttrBlk:
	push hl
	push bc
	push de
	ld hl, SGBPacket_CardPop
	call SendSGB
	pop de
	pop bc
	pop hl
	ret

SGBPacket_CardPop:
	sgb ATTR_BLK, 1
	db 1 ; number of data sets
	db ATTR_BLK_CTRL_OUTSIDE | ATTR_BLK_CTRL_LINE | ATTR_BLK_CTRL_INSIDE
	db %101111 ; Color Palette Designation
	db 0  ; x1
	db 0  ; y1
	db 19 ; x2
	db 4  ; y3
	ds 6 ; data set 2
	ds 2 ; data set 3

Func_12fc6:
	ld a, [wd291]
	push af
	push de
	push bc
	lb de, $d0, $07
	ld a, [wCurTilemap]
	cp TILEMAP_PLAYER
	jr z, .asm_12fd9
	lb de, $a0, $06
.asm_12fd9
	ld a, e
	ld [wd291], a
	farcall LoadTilemap_ToVRAM
	ld a, [wd61e]
	add a
	add a
	ld c, a
	ld b, $00
	ld hl, PortraitGfxData
	add hl, bc
	ld a, [hli]
	push hl
	ld [wCurTileset], a
	ld a, d
	ld [wd4ca], a
	xor a
	ld [wd4cb], a
	farcall LoadTilesetGfx
	pop hl
	xor a
	ld [wd4ca], a
	ld a, [wd291]
	ld [wd4cb], a
	ld a, [hli]
	push hl
	farcall SetBGPAndLoadedPal
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
	farcall SendSGBPortraitPalettes
	pop de
	pop af
	ld [wd291], a
	ret

PortraitGfxData:
	db TILESET_PLAYER, PALETTE_119
	dw SGBData_PlayerPortraitPals

	db TILESET_PLAYER, PALETTE_119
	dw SGBData_PlayerPortraitPals

	db TILESET_RONALD, PALETTE_121
	dw SGBData_RonaldPortraitPals

	db TILESET_SAM, PALETTE_122
	dw SGBData_SamPortraitPals

	db TILESET_IMAKUNI, PALETTE_123
	dw SGBData_ImakuniPortraitPals

	db TILESET_NIKKI, PALETTE_124
	dw SGBData_NikkiPortraitPals

	db TILESET_RICK, PALETTE_125
	dw SGBData_RickPortraitPals

	db TILESET_KEN, PALETTE_126
	dw SGBData_KenPortraitPals

	db TILESET_AMY, PALETTE_127
	dw SGBData_AmyPortraitPals

	db TILESET_ISAAC, PALETTE_128
	dw SGBData_IsaacPortraitPals

	db TILESET_MITCH, PALETTE_129
	dw SGBData_MitchPortraitPals

	db TILESET_GENE, PALETTE_130
	dw SGBData_GenePortraitPals

	db TILESET_MURRAY, PALETTE_131
	dw SGBData_MurrayPortraitPals

	db TILESET_COURTNEY, PALETTE_132
	dw SGBData_CourtneyPortraitPals

	db TILESET_STEVE, PALETTE_133
	dw SGBData_StevePortraitPals

	db TILESET_JACK, PALETTE_134
	dw SGBData_JackPortraitPals

	db TILESET_ROD, PALETTE_135
	dw SGBData_RodPortraitPals

	db TILESET_JOSEPH, PALETTE_136
	dw SGBData_JosephPortraitPals

	db TILESET_DAVID, PALETTE_137
	dw SGBData_DavidPortraitPals

	db TILESET_ERIK, PALETTE_138
	dw SGBData_ErikPortraitPals

	db TILESET_JOHN, PALETTE_139
	dw SGBData_JohnPortraitPals

	db TILESET_ADAM, PALETTE_140
	dw SGBData_AdamPortraitPals

	db TILESET_JONATHAN, PALETTE_141
	dw SGBData_JonathanPortraitPals

	db TILESET_JOSHUA, PALETTE_142
	dw SGBData_JoshuaPortraitPals

	db TILESET_NICHOLAS, PALETTE_143
	dw SGBData_NicholasPortraitPals

	db TILESET_BRANDON, PALETTE_144
	dw SGBData_BrandonPortraitPals

	db TILESET_MATTHEW, PALETTE_145
	dw SGBData_MatthewPortraitPals

	db TILESET_RYAN, PALETTE_146
	dw SGBData_RyanPortraitPals

	db TILESET_ANDREW, PALETTE_147
	dw SGBData_AndrewPortraitPals

	db TILESET_CHRIS, PALETTE_148
	dw SGBData_ChrisPortraitPals

	db TILESET_MICHAEL, PALETTE_149
	dw SGBData_MichaelPortraitPals

	db TILESET_DANIEL, PALETTE_150
	dw SGBData_DanielPortraitPals

	db TILESET_ROBERT, PALETTE_151
	dw SGBData_RobertPortraitPals

	db TILESET_BRITTANY, PALETTE_152
	dw SGBData_BrittanyPortraitPals

	db TILESET_KRISTIN, PALETTE_153
	dw SGBData_KristinPortraitPals

	db TILESET_HEATHER, PALETTE_154
	dw SGBData_HeatherPortraitPals

	db TILESET_SARA, PALETTE_155
	dw SGBData_SaraPortraitPals

	db TILESET_AMANDA, PALETTE_156
	dw SGBData_AmandaPortraitPals

	db TILESET_JENNIFER, PALETTE_157
	dw SGBData_JenniferPortraitPals

	db TILESET_JESSICA, PALETTE_158
	dw SGBData_JessicaPortraitPals

	db TILESET_STEPHANIE, PALETTE_159
	dw SGBData_StephaniePortraitPals

	db TILESET_AARON, PALETTE_160
	dw SGBData_AaronPortraitPals

	db TILESET_PLAYER, PALETTE_120
	dw SGBData_LinkOpponentPortraitPals

LoadBoosterGfx:
	push hl
	push bc
	push de
	ld e, a
	ld a, [wCurTilemap]
	push af
	push bc
	ld a, e
	call _LoadScene
	call FlushAllPalettes
	call SetBoosterLogoOAM
	pop bc
	pop af
	ld [wCurTilemap], a
	pop de
	pop bc
	pop hl
	ret

SetBoosterLogoOAM:
	ld a, [wConsole]
	cp CONSOLE_CGB
	ret nz
	push hl
	push bc
	push de
	push bc
	xor a
	ld [wd4cb], a
	ld [wd4ca], a
	ld a, SPRITE_BOOSTER_PACK_OAM
	farcall Func_8025b
	pop bc
	call ZeroObjectPositions
	ld hl, BoosterLogoOAM
	ld c, [hl]
	inc hl
.oam_loop
	push bc
	ldh a, [hSCX]
	ld d, a
	ldh a, [hSCY]
	ld e, a
	ld a, [wSceneBaseY]
	sub e
	add [hl]
	ld e, a
	inc hl
	ld a, [wSceneBaseX]
	sub d
	add [hl]
	ld d, a
	inc hl
	ld a, [wd61f]
	add [hl]
	ld c, a
	inc hl
	ld b, [hl]
	inc hl
	call SetOneObjectAttributes
	pop bc
	dec c
	jr nz, .oam_loop
	ld hl, wVBlankOAMCopyToggle
	inc [hl]
	pop de
	pop bc
	pop hl
	ret

BoosterLogoOAM:
	db $20
	db $00, $00, $00, $00
	db $00, $08, $01, $00
	db $00, $10, $02, $00
	db $00, $18, $03, $00
	db $00, $20, $04, $00
	db $00, $28, $05, $00
	db $00, $30, $06, $00
	db $00, $38, $07, $00
	db $08, $00, $10, $00
	db $08, $08, $11, $00
	db $08, $10, $12, $00
	db $08, $18, $13, $00
	db $08, $20, $14, $00
	db $08, $28, $15, $00
	db $08, $30, $16, $00
	db $08, $38, $17, $00
	db $10, $00, $08, $00
	db $10, $08, $09, $00
	db $10, $10, $0a, $00
	db $10, $18, $0b, $00
	db $10, $20, $0c, $00
	db $10, $28, $0d, $00
	db $10, $30, $0e, $00
	db $10, $38, $0f, $00
	db $18, $00, $18, $00
	db $18, $08, $19, $00
	db $18, $10, $1a, $00
	db $18, $18, $1b, $00
	db $18, $20, $1c, $00
	db $18, $28, $1d, $00
	db $18, $30, $1e, $00
	db $18, $38, $1f, $00
