JumpSetWindowOff:
	jp SetWindowOff

; debug function
; prints player's coordinates by pressing B
; and draws palettes by pressing A
Func_1c003: ; unreferenced
	ld a, [wCurMap]
	or a
	jr z, JumpSetWindowOff
	ld a, [wOverworldMode]
	cp OWMODE_START_SCRIPT
	jr nc, JumpSetWindowOff

	ldh a, [hKeysHeld]
	ld b, a
	and A_BUTTON | B_BUTTON
	cp b
	jr nz, JumpSetWindowOff
	and B_BUTTON
	jr z, JumpSetWindowOff

	ld bc, $20
	ld a, [wPlayerXCoord]
	bank1call WriteTwoByteNumberInTxSymbolFormat
	ld bc, $320
	ld a, [wPlayerYCoord]
	bank1call WriteTwoByteNumberInTxSymbolFormat
	ld a, $77
	ldh [hWX], a
	ld a, $88
	ldh [hWY], a

	ldh a, [hKeysPressed]
	and A_BUTTON
	jr z, .skip_load_scene
	ld a, SCENE_COLOR_PALETTE
	lb bc, 0, 33
	call LoadScene
.skip_load_scene
	ldh a, [hKeysHeld]
	and A_BUTTON
	jr z, .set_wd_on
	ld a, $67
	ldh [hWX], a
	ld a, $68
	ldh [hWY], a
.set_wd_on
	call SetWindowOn
	ret

Func_1c056:
	push hl
	push bc
	push de
	ld a, [wCurMap]
	add a
	ld c, a
	ld b, $0
	ld hl, WarpDataPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0005
	ld a, [wPlayerXCoord]
	ld d, a
	ld a, [wPlayerYCoord]
	ld e, a
.asm_1c072
	ld a, [hli]
	or [hl]
	jr z, .asm_1c095
	ld a, [hld]
	cp e
	jr nz, .asm_1c07e
	ld a, [hl]
	cp d
	jr z, .asm_1c081
.asm_1c07e
	add hl, bc
	jr .asm_1c072
.asm_1c081
	inc hl
	inc hl
	ld a, [hli]
	ld [wTempMap], a
	ld a, [hli]
	ld [wTempPlayerXCoord], a
	ld a, [hli]
	ld [wTempPlayerYCoord], a
	ld a, [wPlayerDirection]
	ld [wTempPlayerDirection], a
.asm_1c095
	pop de
	pop bc
	pop hl
	ret

INCLUDE "data/warps.asm"

; loads data from the map header of wCurMap
LoadMapHeader:
	push hl
	push bc
	push de
	ld a, [wCurMap]
	add a
	ld c, a
	add a
	add c
	ld c, a
	ld b, 0
	ld hl, MapHeaders
	add hl, bc
	ld a, [hli]
	ld [wCurTilemap], a
	ld a, [hli]
	ld c, a ; CGB tilemap variant
	ld a, [hli]
	ld [wCurMapInitialPalette], a ; always 0?
	ld a, [hli]
	ld [wCurMapSGBPals], a
	ld a, [hli]
	ld [wCurMapPalette], a
	ld a, [hli]
	ld [wDefaultSong], a

	ld a, [wConsole]
	cp CONSOLE_CGB
	jr nz, .got_tilemap
	; use CGB variant, if valid
	ld a, c
	or a
	jr z, .got_tilemap
	ld [wCurTilemap], a
.got_tilemap

	pop de
	pop bc
	pop hl
	ret

INCLUDE "data/map_headers.asm"

ClearNPCs:
	push hl
	push bc
	ld hl, wLoadedNPCs
	ld c, LOADED_NPC_MAX * LOADED_NPC_LENGTH
	xor a
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ld [wNumLoadedNPCs], a
	ld [wRonaldIsInMap], a
	pop bc
	pop hl
	ret

GetNPCDirection:
	push hl
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_DIRECTION
	call GetItemInLoadedNPCIndex
	ld a, [hl]
	pop hl
	ret

; sets new position to active NPC
; and updates its tile permissions
; bc = new coords
SetNPCPosition:
	push hl
	push bc
	call UpdateNPCsTilePermission
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_COORD_X
	call GetItemInLoadedNPCIndex
	ld a, b
	ld [hli], a
	ld [hl], c
	call SetNPCsTilePermission
	pop bc
	pop hl
	ret

GetNPCPosition:
	push hl
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_COORD_X
	call GetItemInLoadedNPCIndex
	ld a, [hli]
	ld b, a
	ld c, [hl]
	pop hl
	ret

; Loads NPC Sprite Data
LoadNPC:
	push hl
	push bc
	push de
	xor a
	ld [wLoadedNPCTempIndex], a
	ld b, a
	ld c, LOADED_NPC_MAX
	ld hl, wLoadedNPCs
	ld de, LOADED_NPC_LENGTH
.findEmptyIndexLoop
	ld a, [hl]
	or a
	jr z, .foundEmptyIndex
	add hl, de
	inc b
	dec c
	jr nz, .findEmptyIndexLoop
	ld hl, wLoadedNPCs
	debug_nop
	jr .exit
.foundEmptyIndex
	ld a, b
	ld [wLoadedNPCTempIndex], a
	ld a, [wNPCSpriteID]
	farcall CreateSpriteAndAnimBufferEntry
	jr c, .exit
	ld a, [wLoadedNPCTempIndex]
	call GetLoadedNPCID
	push hl
	ld a, [wTempNPC]
	ld [hli], a
	ld a, [wWhichSprite]
	ld [hli], a
	ld a, [wLoadNPCXPos]
	ld [hli], a
	ld a, [wLoadNPCYPos]
	ld [hli], a
	ld a, [wLoadNPCDirection]
	ld [hli], a
	ld a, [wNPCAnimFlags]
	ld [hli], a
	ld a, [wNPCAnim]
	ld [hli], a
	ld a, [wLoadNPCDirection]
	ld [hli], a
	call UpdateNPCAnimation
	call ApplyRandomCountToNPCAnim
	ld hl, wNumLoadedNPCs
	inc [hl]
	pop hl

	call UpdateNPCSpritePosition
	call SetNPCsTilePermission

	ld a, [wTempNPC]
	call CheckIfNPCIsRonald
	jr nc, .exit
	ld a, TRUE
	ld [wRonaldIsInMap], a
.exit
	pop de
	pop bc
	pop hl
	ret

; returns carry if input NPC ID in register a is Ronald
CheckIfNPCIsRonald:
	cp NPC_RONALD1
	jr z, .set_carry
	cp NPC_RONALD2
	jr z, .set_carry
	cp NPC_RONALD3
	jr z, .set_carry
	or a
	ret
.set_carry
	scf
	ret

UnloadNPC:
	push hl
	call UpdateNPCsTilePermission
	ld a, [wLoadedNPCTempIndex]
	call GetLoadedNPCID
	ld a, [hl]
	or a
	jr z, .exit
	call CheckIfNPCIsRonald
	jr nc, .not_ronald
	xor a ; FALSE
	ld [wRonaldIsInMap], a
.not_ronald

	xor a
	ld [hli], a
	ld a, [hl]
	farcall DisableSpriteAnim
	ld hl, wNumLoadedNPCs
	dec [hl]

.exit
	pop hl
	ret

Func_1c52e:
	push hl
	push af
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_DIRECTION_BACKUP
	call GetItemInLoadedNPCIndex
	pop af
	ld [hl], a
	call Func_1c5e9
	pop hl
	ret

Func_1c53f:
	push hl
	push bc
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_DIRECTION
	call GetItemInLoadedNPCIndex
	ld a, [hl]
	ld bc, LOADED_NPC_DIRECTION_BACKUP - LOADED_NPC_DIRECTION
	add hl, bc
	ld [hl], a ; LOADED_NPC_DIRECTION_BACKUP
	push af
	call Func_1c5e9
	pop af
	pop bc
	pop hl
	ret

Func_1c557:
	push bc
	ld c, a
	ld a, [wLoadedNPCTempIndex]
	push af
	ld a, [wTempNPC]
	push af
	ld a, c
	ld [wTempNPC], a
	ld c, $0
	call FindLoadedNPC
	jr c, .asm_1c570
	call Func_1c53f
	ld c, a

.asm_1c570
	pop af
	ld [wTempNPC], a
	pop af
	ld [wLoadedNPCTempIndex], a
	ld a, c
	pop bc
	ret

; a = NPC animation
SetNPCAnimation:
	push hl
	push bc
	push af
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_ANIM
	call GetItemInLoadedNPCIndex
	pop af
	ld [hl], a
	call UpdateNPCAnimation
	pop bc
	pop hl
	ret

UpdateNPCAnimation:
	push hl
	push bc
	ld a, [wWhichSprite]
	push af
	ld a, [wLoadedNPCTempIndex]
	call GetLoadedNPCID
	ld a, [hli]
	or a
	jr z, .quit
	ld a, [hl]
	ld [wWhichSprite], a
	ld bc, LOADED_NPC_ANIM - LOADED_NPC_SPRITE
	add hl, bc
	ld a, [hld] ; LOADED_NPC_ANIM
	bit NPC_FLAG_DIRECTIONLESS_F, [hl] ; LOADED_NPC_FLAGS
	jr nz, .asm_1c5ae
	dec hl
	add [hl] ; LOADED_NPC_ANIM + LOADED_NPC_DIRECTION
	inc hl
.asm_1c5ae
	farcall StartNewSpriteAnimation
.quit
	pop af
	ld [wWhichSprite], a
	pop bc
	pop hl
	ret

; if NPC's sprite has an animation,
; give it a random initial value
; this makes it so that all NPCs are out of phase
; when they are loaded into a map
ApplyRandomCountToNPCAnim:
	push hl
	push bc
	ld a, [wWhichSprite]
	push af
	ld a, [wLoadedNPCTempIndex]
	call GetLoadedNPCID
	ld a, [hli]
	or a
	jr z, .done
	ld a, [hl]
	ld [wWhichSprite], a
	ld c, SPRITE_ANIM_COUNTER
	call GetSpriteAnimBufferProperty
	ld a, [hl]
	or a
	jr z, .done
	cp $ff
	jr z, .done
	dec a
	call Random
	ld c, a
	ld a, [hl]
	sub c
	ld [hl], a
.done
	pop af
	ld [wWhichSprite], a
	pop bc
	pop hl
	ret

; sets the loaded NPC's direction
; to the direction that is in LOADED_NPC_DIRECTION_BACKUP
Func_1c5e9:
	push hl
	push bc
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_DIRECTION_BACKUP
	call GetItemInLoadedNPCIndex
	ld a, [hl]
	ld bc, LOADED_NPC_DIRECTION - LOADED_NPC_DIRECTION_BACKUP
	add hl, bc
	ld [hl], a ; LOADED_NPC_DIRECTION
	call UpdateNPCAnimation
	pop bc
	pop hl
	ret

; a = new direction
SetNPCDirection:
	push hl
	push af
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_DIRECTION
	call GetItemInLoadedNPCIndex
	pop af
	ld [hl], a
	call UpdateNPCAnimation
	pop hl
	ret

HandleAllNPCMovement:
	push hl
	push bc
	push de
	xor a
	ld [wIsAnNPCMoving], a
	ld a, [wNumLoadedNPCs]
	or a
	jr z, .exit

	ld c, LOADED_NPC_MAX
	ld hl, wLoadedNPCs
	ld de, LOADED_NPC_LENGTH
.loop_npcs
	ld a, [hl]
	or a
	jr z, .next_npc
	push bc
	inc hl
	ld a, [hld]
	ld [wWhichSprite], a
	call UpdateNPCMovementStep
	call .UpdateSpriteAnimFlag
	call UpdateNPCSpritePosition
	call UpdateIsAnNPCMovingFlag
	pop bc
.next_npc
	add hl, de
	dec c
	jr nz, .loop_npcs
.exit
	pop de
	pop bc
	pop hl
	ret

.UpdateSpriteAnimFlag
	push hl
	push bc
	ld bc, LOADED_NPC_COORD_X
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	call GetPermissionOfMapPosition
	and $10
	push af
	ld c, SPRITE_ANIM_FLAGS
	call GetSpriteAnimBufferProperty
	pop af
	ld a, [hl]
	jr z, .reset_flag
	set SPRITE_ANIM_FLAG_UNSKIPPABLE, [hl]
	jr .done
.reset_flag
	res SPRITE_ANIM_FLAG_UNSKIPPABLE, [hl]
.done
	pop bc
	pop hl
	ret

UpdateNPCSpritePosition:
	push hl
	push bc
	push de
	call .GetOffset

	; get NPC and sprite coords
	push bc
	ld de, LOADED_NPC_COORD_X
	add hl, de
	ld e, l
	ld d, h
	ld c, SPRITE_ANIM_COORD_X
	call GetSpriteAnimBufferProperty
	pop bc

	; hl = sprite coords
	; de = NPC coords
	ld a, [de] ; x
	sla a
	sla a
	sla a
	add $8
	sub b
	ld [hli], a
	inc de
	ld a, [de] ; y
	sla a
	sla a
	sla a
	add $10
	sub c
	ld [hli], a
	pop de
	pop bc
	pop hl
	ret

; outputs in bc the coordinate offsets
; given NPCs direction and its movement step
.GetOffset
	push hl
	ld bc, $0
	ld de, LOADED_NPC_FLAGS
	add hl, de
	ld e, 0
	ld a, [hl]
	and NPC_FLAG_MOVING
	jr z, .got_direction
	dec hl
	ld a, [hl] ; LOADED_NPC_DIRECTION
	ld de, LOADED_NPC_MOVEMENT_STEP - LOADED_NPC_DIRECTION
	add hl, de
	ld e, [hl] ; LOADED_NPC_MOVEMENT_STEP
.got_direction
	ld hl, .function_table
	call JumpToFunctionInTable
	pop hl
	ret

.function_table
	dw .north
	dw .east
	dw .south
	dw .west

.west
	ld a, e
	cpl
	inc a
	ld e, a
.east
	ld b, e
	ldh a, [hSCX]
	sub b
	ld b, a
	ldh a, [hSCY]
	ld c, a
	ret

.north
	ld a, e
	cpl
	inc a
	ld e, a
.south
	ld c, e
	ldh a, [hSCY]
	sub c
	ld c, a
	ldh a, [hSCX]
	ld b, a
	ret

; ands wIsAnNPCMoving with the current
; NPC's NPC_FLAG_MOVING_F
UpdateIsAnNPCMovingFlag:
	push hl
	push bc
	ld bc, LOADED_NPC_FLAGS
	add hl, bc
	ld a, [wIsAnNPCMoving]
	or [hl]
	ld [wIsAnNPCMoving], a
	pop bc
	pop hl
	ret

SetNPCsTilePermission:
	push hl
	push bc
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_COORD_X
	call GetItemInLoadedNPCIndex
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, $40
	call SetPermissionOfMapPosition
	pop bc
	pop hl
	ret

SetAllNPCTilePermissions:
	push hl
	push bc
	push de
	ld b, $00
	ld c, LOADED_NPC_MAX
	ld hl, wLoadedNPCs
	ld de, LOADED_NPC_LENGTH
.loop_npcs
	ld a, [hl]
	or a
	jr z, .next_npc
	ld a, b
	ld [wLoadedNPCTempIndex], a
	call SetNPCsTilePermission
.next_npc
	add hl, de
	inc b
	dec c
	jr nz, .loop_npcs
	pop de
	pop bc
	pop hl
	ret

UpdateNPCsTilePermission:
	push hl
	push bc
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_COORD_X
	call GetItemInLoadedNPCIndex
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, $40
	call UpdatePermissionOfMapPosition
	pop bc
	pop hl
	ret

; Find NPC at coords b (x) c (y)
FindNPCAtLocation:
	push hl
	push bc
	push de
	ld d, $00
	ld e, LOADED_NPC_MAX
	ld hl, wLoadedNPC1CoordX
.findValidNPCLoop
	ld a, [hli]
	cp b
	jr nz, .noValidNPCHere
	ld a, [hl]
	cp c
	jr nz, .noValidNPCHere
	push hl
	inc hl
	inc hl
	bit 6, [hl]
	pop hl
	jr nz, .noValidNPCHere
	push hl
	dec hl
	dec hl
	ld a, [hl]
	or a
	pop hl
	jr nz, .foundNPCExit
.noValidNPCHere
	ld a, LOADED_NPC_LENGTH - 1
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	inc d
	dec e
	jr nz, .findValidNPCLoop
	scf
	jr .exit
.foundNPCExit
	ld a, d
	ld [wLoadedNPCTempIndex], a
	or a
.exit
	pop de
	pop bc
	pop hl
	ret

; Probably needs a new name. Loads data for NPC that the next Script is for
; Sets direction, Loads Image data for it, loads name, and more
SetNewScriptNPC:
	push hl
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_DIRECTION
	call GetItemInLoadedNPCIndex
	ld a, [wPlayerDirection]
	xor $02
	ld [hl], a
	call UpdateNPCAnimation
	ld a, 1 << RESTORE_FACING_DIRECTION
	farcall SetOverworldNPCFlags
	ld a, [wLoadedNPCTempIndex]
	call GetLoadedNPCID
	ld a, [hl]
	farcall GetNPCNameAndScript
	pop hl
	ret

StartNPCMovement:
	push hl
; set NPC as moving
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_FLAGS
	call GetItemInLoadedNPCIndex
	set NPC_FLAG_MOVING_F, [hl]

; reset its movement step
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_MOVEMENT_STEP
	call GetItemInLoadedNPCIndex
	xor a
	ld [hli], a
.loop_movement
	ld [hl], c ; LOADED_NPC_MOVEMENT_PTR
	inc hl
	ld [hl], b
	dec hl
	call GetNextNPCMovementByte
	cp $f0
	jr nc, .special_command
	push af
	and DIRECTION_MASK
	call SetNPCDirection
	pop af
	; if it was not a rotation, exit...
	bit 7, a
	jr z, .exit
	; ...otherwise jump to next movement instruction
	inc bc
	jr .loop_movement

.special_command
	cp $ff
	jr z, .stop_movement
; jump to a movement command
	; read its argument
	inc bc
	call GetNextNPCMovementByte
	push hl
	ld l, a
	ld h, $0
	bit 7, l
	jr z, .got_offset
	dec h ; $ff
.got_offset
	; add the offset to bc
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	jr .loop_movement

.stop_movement
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_FLAGS
	call GetItemInLoadedNPCIndex
	res NPC_FLAG_MOVING_F, [hl]

.exit
	pop hl
	ret

; returns nz if there is an NPC currently moving
CheckIsAnNPCMoving:
	ld a, [wIsAnNPCMoving]
	and NPC_FLAG_MOVING
	ret

; while the NPC is moving, increment its movement step by 1
; once it reaches a value greater than 16, update
; its tile permission and its position and start next movement
UpdateNPCMovementStep:
	push hl
	push bc
	push de
	ld bc, LOADED_NPC_FLAGS
	add hl, bc
	bit NPC_FLAG_MOVING_F, [hl]
	jr z, .exit
	ld bc, LOADED_NPC_MOVEMENT_STEP - LOADED_NPC_FLAGS
	add hl, bc
	inc [hl] ; increment movement step
	bit 4, [hl]
	jr z, .exit ; still hasn't reached the next tile
	call UpdateNPCsTilePermission
	call UpdateNPCPosition
	inc hl
	ld c, [hl] ; LOADED_NPC_MOVEMENT_PTR
	inc hl
	ld b, [hl]
	inc bc
	call StartNPCMovement
	call SetNPCsTilePermission
.exit
	pop de
	pop bc
	pop hl
	ret

UpdateNPCPosition:
	push hl
	push bc
	ld a, [wLoadedNPCTempIndex]
	ld l, LOADED_NPC_DIRECTION
	call GetItemInLoadedNPCIndex
	ld a, [hld]
	push hl
	rlca ; *2
	ld c, a
	ld b, $00
	ld hl, PlayerMovementOffsetTable_Tiles
	add hl, bc
	ld b, [hl] ; x offset
	inc hl
	ld c, [hl] ; y offset
	pop hl
	ld a, [hl] ; LOADED_NPC_COORD_Y
	add c
	ld [hld], a
	ld a, [hl] ; LOADED_NPC_COORD_X
	add b
	ld [hl], a
	pop bc
	pop hl
	ret

ClearMasterBeatenList:
	push hl
	push bc
	ld c, $a
	ld hl, wMastersBeatenList
	xor a
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	pop bc
	pop hl
	ret

; writes Master in register a to
; first empty slot in wMastersBeatenList
AddMasterBeatenToList:
	push hl
	push bc
	ld b, a
	ld c, $a
	ld hl, wMastersBeatenList
.loop
	ld a, [hl]
	or a
	jr z, .found_empty_slot
	cp b
	jr z, .exit
	inc hl
	dec c
	jr nz, .loop
	debug_nop
	jr .exit

.found_empty_slot
	ld a, b
	ld [hl], a

.exit
	pop bc
	pop hl
	ret

; iterates all masters and attempts to
; add each of them to wMastersBeatenList
AddAllMastersToMastersBeatenList:
	ld a, $01
.loop
	push af
	call AddMasterBeatenToList
	pop af
	inc a
	cp $0b
	jr c, .loop
	ret

Func_1c865:
	ret

; debug function
; adjusts hSCX and hSCY by using the arrow keys
; pressing B makes it scroll faster
Func_1c866: ; unreferenced
	ldh a, [hKeysHeld]
	and B_BUTTON
	call nz, .asm_1c86d ; executes following part twice
.asm_1c86d
	ldh a, [hSCX]
	ld b, a
	ldh a, [hSCY]
	ld c, a
	ldh a, [hKeysHeld]
	bit D_UP_F, a
	jr z, .check_d_down
	inc c
.check_d_down
	bit D_DOWN_F, a
	jr z, .check_d_left
	dec c
.check_d_left
	bit D_LEFT_F, a
	jr z, .check_d_right
	inc b
.check_d_right
	bit D_RIGHT_F, a
	jr z, .asm_1c889
	dec b
.asm_1c889
	ld a, b
	ldh [hSCX], a
	ld a, c
	ldh [hSCY], a
	ret

; sets some flags on a given sprite
Func_1c890: ; unreferenced
	ld a, [wVBlankCounter]
	and %111111
	ret nz

	ld a, [wd41b]
	cp $11
	jr z, .asm_1c8a3
	cp $0e
	ret c
	cp $10
	ret nc

; wd41b == $11 || (wd41b >= $0e && wd41b < $10)
.asm_1c8a3
	ld a, [wd41c]
	ld [wWhichSprite], a
	ld c, SPRITE_ANIM_FLAGS
	call GetSpriteAnimBufferProperty
	call UpdateRNGSources
	and (1 << SPRITE_ANIM_FLAG_X_SUBTRACT)
	jr nz, .asm_1c8b9
	res SPRITE_ANIM_FLAG_SPEED, [hl]
	jr .asm_1c8bb
.asm_1c8b9
	set SPRITE_ANIM_FLAG_SPEED, [hl]
.asm_1c8bb
	ret
