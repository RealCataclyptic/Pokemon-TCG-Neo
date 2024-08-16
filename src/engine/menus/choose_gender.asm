PlayerGenderSelection:
	; setup the screen
	xor a
	ld [wTileMapFill], a
	call EmptyScreen
	call ZeroObjectPositions
	ld a, $01
	ld [wVBlankOAMCopyToggle], a
	call LoadSymbolsFont
	lb de, $38, $bf
	call SetupText

	; draw male portrait
	ld a, PLAYER_PIC
	ld [wCurPortrait], a
	ld a, TILEMAP_PLAYER
	lb bc, 2, 4
	call DrawPortrait

	; draw female portrait
	ld a, MINT_PIC
	ld [wCurPortrait], a
	ld a, TILEMAP_OPPONENT
	lb bc, 12, 4
	call DrawPortrait

	; print text
	ld hl, .TextItems
	call PlaceTextItems
	ldtx hl, AreYouBoyOrGirlText
	call DrawWideTextBox_PrintText

	; set parameters for the cursor
	lb de, 3, 2 ; cursor x and y
	lb bc, SYM_CURSOR_R, SYM_SPACE
	call SetCursorParametersForTextBox

	; start loop for selection
	ld a, [wCurMenuItem]
	jr .refresh_menu

.loop_input
	call DoFrame
	call RefreshMenuCursor
	ldh a, [hKeysPressed]
	bit A_BUTTON_F, a
	jr nz, .selection_made
	ldh a, [hDPadHeld]
	and D_RIGHT | D_LEFT
	jr z, .loop_input
	ld a, SFX_01
	call PlaySFX
	call EraseCursor
	ld hl, wCurMenuItem
	ld a, [hl]
	xor $1 ; toggle selected gender
	ld [hl], a
.refresh_menu
	or a
	ld a, 3 ; "Boy" cursor x
	jr z, .got_cursor_x
	ld a, 13 ; "Girl" cursor x
.got_cursor_x
	ld [wCursorXPosition], a
	xor a
	ld [wCursorBlinkCounter], a
	jr .loop_input

.selection_made
	; set the gender event value
	ld a, [wCurMenuItem]
	or a
	ld a, EVENT_PLAYER_GENDER
	jr nz, .female
	farcall ZeroOutEventValue ; bit unset
	ret
.female
	farcall MaxOutEventValue ; bit set
	ret

.TextItems:
	textitem  4, 2, BoyText
	textitem 14, 2, GirlText
	db $ff