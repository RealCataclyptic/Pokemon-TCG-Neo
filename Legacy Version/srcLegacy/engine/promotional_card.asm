; shows screen with the promotional card and received text
; depending on input a
; if $0 = Legendary Molters, Articuno, Zapdos and Dragonite cards
; otherwise, a card ID
_ShowPromotionalCardScreen:
	push af
	lb de, $38, $9f
	call SetupText
	pop af
	or a
	jr nz, .else
	ld a, CHARIZARD_C
	call .legendary_card_text
	ld a, LUGIA_C
	call .legendary_card_text
	ld a, CELEBI_C
	call .legendary_card_text
	ld a, HOOH_C
.legendary_card_text
	ldtx hl, ReceivedLegendaryCardText
	jr .print_text
.else
	ldtx hl, ReceivedCardText
	cp MEWTWO_S
	jr z, .print_text
	ldtx hl, ReceivedCardText
	cp RAIKOU
	jr z, .print_text
	ldtx hl, ReceivedCardText
	cp BELLOSSOM
	jr z, .print_text
	cp GYARADOS_S
	jr z, .print_text
	ldtx hl, ReceivedCardText
	cp MASTER_BALL
	jr z, .print_text
	ldtx hl, ReceivedPromotionalCardText
	cp ENTEI2
	jr z, .print_text
	cp UNOWN_J
	jr z, .print_text
	ldtx hl, ReceivedPromotionalCardText
.print_text
	push hl
	ld e, a
	ld d, $0
	call LoadCardDataToBuffer1_FromCardID
	call PauseSong
	ld a, MUSIC_MEDAL
	call PlaySong
	ld hl, wLoadedCard1Name
	ld a, [hli]
	ld h, [hl]
	ld l, a
	bank1call LoadTxRam2 ; switch to bank 1, but call a home func
	ld a, PLAYER_TURN
	ldh [hWhoseTurn], a
	pop hl
	bank1call _DisplayCardDetailScreen
.loop
	call AssertSongFinished
	or a
	jr nz, .loop

	call ResumeSong
	bank1call OpenCardPage_FromHand
	ret
