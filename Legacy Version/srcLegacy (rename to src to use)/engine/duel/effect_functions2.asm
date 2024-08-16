SpitPoison_AIEffect_2:
	ld a, 1
	ld c, a
	ld b, $00
	call SwapTurn
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ld a, DECK_SIZE
	sub [hl]
	cp c
	jr nc, .start_discard
	; only discard number of cards that are left in deck
	ld c, a

.start_discard
	push bc
	inc c
	jr .check_remaining

.loop
	; discard top card from deck
	call DrawCardFromDeck
	call nc, PutCardInDiscardPile
.check_remaining
	dec c
	jr nz, .loop

	pop hl
	farcall LoadTxRam3
	ldtx hl, DiscardedCardsFromDeckText
	call DrawWideTextBox_PrintText
	call SwapTurn
	ret

StreamingMantleEffect2:
	call SwapTurn
	ld a, 3
	ld c, a
	ld b, $00
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ld a, DECK_SIZE
	sub [hl]
	cp c
	jr nc, .start_discard
	; only discard number of cards that are left in deck
	ld c, a

.start_discard
	push bc
	inc c
	jr .check_remaining

.loop
	; discard top card from deck
	call DrawCardFromDeck
	call nc, PutCardInDiscardPile
.check_remaining
	dec c
	jr nz, .loop

	pop hl
	call LoadTxRam3
	ldtx hl, DiscardedCardsFromDeckText
	call DrawWideTextBox_PrintText
	ld a, ATK_ANIM_TERRAFORMING
	ld [wLoadedAttackAnimation], a
	call DealDamageToPlayAreaPokemon 
	call SwapTurn
	ret

HypnoShowerEffect2:
	farcall SleepEffect
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call WaitAttackAnimation
	ld a, ATK_ANIM_HEALING_WIND_PLAY_AREA
	ld [wLoadedAttackAnimation], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld d, a
	ld e, PLAY_AREA_ARENA
.loop_play_area
	push de
	ld a, e
	ldh [hTempPlayAreaLocation_ff9d], a
	call GetCardDamageAndMaxHP
	or a
	jr z, .next_pkmn ; skip if no damage

; if less than 20 damage, cap recovery at 10 damage
	ld de, 10
	cp e
	jr nc, .heal
	ld e, a

.heal
; add HP to this card
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	add e
	ld [hl], a

; play heal animation
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $01
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
.next_pkmn
	pop de
	inc e
	dec d
	jr nz, .loop_play_area
	jp HypnoShowerHealOpp
	ret

HypnoShowerHealOpp:
	call SwapTurn
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call WaitAttackAnimation
	ld a, ATK_ANIM_HEALING_WIND_PLAY_AREA
	ld [wLoadedAttackAnimation], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld d, a
	ld e, PLAY_AREA_ARENA
.loop_play_area
	push de
	ld a, e
	ldh [hTempPlayAreaLocation_ff9d], a
	call GetCardDamageAndMaxHP
	or a
	jr z, .next_pkmn ; skip if no damage

; if less than 20 damage, cap recovery at 10 damage
	ld de, 10
	cp e
	jr nc, .heal
	ld e, a

.heal
; add HP to this card
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	add e
	ld [hl], a

; play heal animation
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $01
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
.next_pkmn
	pop de
	inc e
	dec d
	jr nz, .loop_play_area
	call SwapTurn
	ret

FossilEggSearch_CheckDeckAndPlayArea2:
	farcall CheckIfDeckIsEmpty
	ret nc ; return if no cards in deck
	ccf
	ret

FossilEggSearch_PutInPlayAreaEffect2:
	ldh a, [hTemp_ffa0]
	cp $ff
	jr z, .shuffle
	farcall SearchCardInDeckAndAddToHand
	farcall AddCardToHand
	farcall IsPlayerTurn
	jr c, .shuffle
	ldh a, [hTemp_ffa0]
	ldtx hl, FoundCardText
	bank1call DisplayCardDetailScreen
.shuffle
	farcall Func_2c0bd
	ret

FossilEggSearch_PlayerSelectEffect2:
	ld a, $ff
	ldh [hTemp_ffa0], a
	farcall CreateDeckCardList
	ldtx hl, ChooseAKrabbyFromDeckText
	ldtx bc, KrabbyText
	lb de, SEARCHEFFECT_CARD_ID, OMASTAR
	farcall LookForCardsInDeck
	ret c

; draw Deck list interface and print text
	bank1call Func_5591
	ldtx hl, ChooseAKrabbyText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText

.loop
	bank1call DisplayCardList
	jr c, .pressed_b
	farcall GetCardIDFromDeckIndex
	ld bc, OMASTAR
	farcall CompareDEtoBC
	jr nz, .play_sfx

; Krabby was selected
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	or a
	ret

.play_sfx
	; play SFX and loop back
	farcall Func_3794
	jr .loop

.pressed_b
; figure if Player can exit the screen without selecting,
; that is, if the Deck has no Krabby card.
	ld a, DUELVARS_CARD_LOCATIONS
	farcall GetTurnDuelistVariable
.loop_b_press
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	ld a, l
	farcall GetCardIDFromDeckIndex
	ld bc, OMASTAR
	farcall CompareDEtoBC
	jr z, .play_sfx ; found Krabby, go back to top loop
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_b_press

; no Krabby in Deck, can safely exit screen
	ld a, $ff
	ldh [hTemp_ffa0], a
	or a
	ret

FossilEggSearch_AISelectEffect2:
	farcall CreateDeckCardList
	ld hl, wDuelTempList
.loop_deck
	ld a, [hli]
	ldh [hTemp_ffa0], a
	cp $ff
	ret z ; no Krabby
	farcall GetCardIDFromDeckIndex
	ld a, e
	cp OMASTAR
	jr nz, .loop_deck
	ret ; Krabby found

SearchGyaradosEffect:
	ld a, $ff
	ldh [hTemp_ffa0], a
	farcall CreateDeckCardList
	ldtx hl, ChooseAGyaradosFromDeckText
	ldtx bc, GyaradosText
	lb de, SEARCHEFFECT_CARD_ID, GYARADOS_S
	farcall LookForCardsInDeck
	ret c

; draw Deck list interface and print text
	bank1call Func_5591
	ldtx hl, ChooseAGyaradosText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText

.loop
	bank1call DisplayCardList
	jr c, .pressed_b
	farcall GetCardIDFromDeckIndex
	ld bc, GYARADOS_S
	farcall CompareDEtoBC
	jr nz, .play_sfx

; Krabby was selected
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	or a
	ret

.play_sfx
	; play SFX and loop back
	farcall Func_3794
	jr .loop

.pressed_b
; figure if Player can exit the screen without selecting,
; that is, if the Deck has no Krabby card.
	ld a, DUELVARS_CARD_LOCATIONS
	farcall GetTurnDuelistVariable
.loop_b_press
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	ld a, l
	farcall GetCardIDFromDeckIndex
	ld bc, GYARADOS_S
	farcall CompareDEtoBC
	jr z, .play_sfx ; found Krabby, go back to top loop
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_b_press

; no Krabby in Deck, can safely exit screen
	ld a, $ff
	ldh [hTemp_ffa0], a
	or a
	ret

SearchGyaradosAIEffect:
	farcall CreateDeckCardList
	ld hl, wDuelTempList
.loop_deck
	ld a, [hli]
	ldh [hTemp_ffa0], a
	cp $ff
	ret z ; no Krabby
	farcall GetCardIDFromDeckIndex
	ld a, e
	cp GYARADOS_S
	jr nz, .loop_deck
	ret ; Krabby found

BillEffect2:
	ld a, 2
	bank1call DisplayDrawNCardsScreen
	ld c, 2
.loop_draw
	farcall DrawCardFromDeck
	jr c, .done
	ldh [hTempCardIndex_ff98], a
	farcall AddCardToHand
	farcall IsPlayerTurn
	jr nc, .skip_display_screen
	push bc
	bank1call DisplayPlayerDrawCardScreen
	pop bc
.skip_display_screen
	dec c
	jr nz, .loop_draw
.done
	ret

EveryoneDrawTwo2:
	ld a, 2
	bank1call DisplayDrawNCardsScreen
	ld c, 2
.loop_drawYou
	farcall DrawCardFromDeck
	jr c, .doneYou
	ldh [hTempCardIndex_ff98], a
	farcall AddCardToHand
	farcall IsPlayerTurn
	jr nc, .skip_display_screen
	push bc
	bank1call DisplayPlayerDrawCardScreen
	pop bc
.skip_display_screen
	dec c
	jr nz, .loop_drawYou
.doneYou
	farcall SwapTurn
	ld a, 2
	bank1call DisplayDrawNCardsScreen
	ld c, 2
.loop_drawOpp
	farcall DrawCardFromDeck
	jr c, .doneOpp
	ldh [hTempCardIndex_ff98], a
	farcall AddCardToHand
	farcall IsPlayerTurn
	jr nc, .skip_display_screenOpp
	push bc
	bank1call DisplayPlayerDrawCardScreen
	pop bc
.skip_display_screenOpp
	dec c
	jr nz, .loop_drawOpp
.doneOpp
	farcall SwapTurn
	ret

CFRageOrNothingEffect2:
	ldtx de, RageOrNothingText
	farcall TossCoin_BankB
	jr c, .heads
	xor a
	farcall SetDefiniteDamage
	farcall SetWasUnsuccessful
	ret
.heads
	ld e, PLAY_AREA_ARENA
	farcall GetCardDamageAndMaxHP
	farcall AddToDamage
	ret

EeveelutionCheckDeckEffect2:
	farcall CheckIfDeckIsEmpty
	ret nc ; return if no cards in deck
	ccf
	ret

EeveelutionPlayerSelectEffect2:
	ld a, $ff
	ldh [hTemp_ffa0], a
	farcall CreateDeckCardList
	ldtx hl, ChooseNidoranFromDeckText
	ldtx bc, NidoranMNidoranFText
	lb de, SEARCHEFFECT_NIDORAN, $00
	farcall LookForCardsInDeck
	ret c

; draw Deck list interface and print text
	bank1call Func_5591
	ldtx hl, ChooseNidoranText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText

.loop
	bank1call DisplayCardList
	jr c, .pressed_b
	farcall GetCardIDFromDeckIndex
	ld bc, FLAREON
	farcall CompareDEtoBC
	jr z, .selected_nidoran
	ld bc, JOLTEON
	farcall CompareDEtoBC
	jr z, .selected_nidoran
	ld bc, VAPOREON
	farcall CompareDEtoBC
	jr z, .selected_nidoran
	ld bc, ESPEON1
	farcall CompareDEtoBC
	jr z, .selected_nidoran
	ld bc, ESPEON2
	farcall CompareDEtoBC
	jr z, .selected_nidoran
	ld bc, UMBREON
	farcall CompareDEtoBC
	jr z, .selected_nidoran
	jr nz, .loop ; .play_sfx would be more appropriate here

.selected_nidoran
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	or a
	ret

.play_sfx
	; play SFX and loop back
	call Func_3794
	jr .loop

.pressed_b
; figure if Player can exit the screen without selecting,
; that is, if the Deck has no NidoranF or NidoranM card.
	ld a, DUELVARS_CARD_LOCATIONS
	farcall GetTurnDuelistVariable
.loop_b_press
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	ld a, l
	farcall GetCardIDFromDeckIndex
	ld bc, FLAREON
	farcall CompareDEtoBC
	ld bc, VAPOREON
	farcall CompareDEtoBC
	ld bc, ESPEON1
	farcall CompareDEtoBC
	ld bc, ESPEON2
	farcall CompareDEtoBC
	ld bc, UMBREON
	farcall CompareDEtoBC
	jr z, .play_sfx ; found, go back to top loop
	ld bc, JOLTEON
	jr z, .play_sfx ; found, go back to top loop
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_b_press

; no Nidoran in Deck, can safely exit screen
	ld a, $ff
	ldh [hTemp_ffa0], a
	or a
	ret

EeveelutionAISelectEffect2:
	farcall CreateDeckCardList
	ld hl, wDuelTempList
.loop_deck
	ld a, [hli]
	ldh [hTemp_ffa0], a
	cp $ff
	ret z ; none found
	farcall GetCardIDFromDeckIndex
	ld a, e
	cp FLAREON
	jr z, .found
	cp VAPOREON
	jr z, .found
	cp ESPEON1
	jr z, .found
	cp ESPEON2
	jr z, .found
	cp UMBREON
	jr z, .found
	cp JOLTEON
	jr nz, .loop_deck
.found
	ret

EeveelutionAddToHandEffect2:
	ldh a, [hTemp_ffa0]
	cp $ff
	jr z, .shuffle
	farcall SearchCardInDeckAndAddToHand
	farcall AddCardToHand
	farcall IsPlayerTurn
	jr c, .shuffle
	; display card on screen
	ldh a, [hTemp_ffa0]
	ldtx hl, FoundCardText
	bank1call DisplayCardDetailScreen
.shuffle
	farcall Func_2c0bd
	ret

DischargeEffect2:
	ld e, PLAY_AREA_ARENA
	call CreateListOfElectricEnergyAttachedToArena
	ld a, c
	ldtx de, Damage30PerHText
	farcall TossCoinATimes_BankB
;	fallthrough

SetDamageToATimes30:
	ld l, a
	ld h, $00
	ld e, l
	ld d, h
	add hl, hl ; Coin on heads multiplied by 2, = start 2 per heads
	add hl, de ; + 1, =3 damage per heads
	add hl, hl ; x2, =6
	add hl, de ; + 1, =7
	add hl, hl ; x2, =14
	add hl, de ; + 1, =15
	add hl, hl ; x2, =30 damage per heads!
	ld a, l
	ld [wDamage], a
	ld a, h
	ld [wDamage + 1], a
	call DiscardAllLEffect2
	ret

CreateListOfElectricEnergyAttachedToArena:
	ld a, TYPE_ENERGY_LIGHTNING
	ld b, a
	ld c, 0
	ld de, wDuelTempList
	ld a, DUELVARS_CARD_LOCATIONS
	farcall GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .next
	push de
	ld a, l
	farcall GetCardIDFromDeckIndex
	farcall GetCardType
	pop de
	cp b
	jr nz, .next ; is same as input type?
	ld a, l
	ld [de], a
	inc de
	inc c
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop

	ld a, $ff
	ld [de], a
	ld a, c
	ret

PlayerPickLEnergyCardToReturn2:
	call CreateListOfElectricEnergyAttachedToArena
	xor a
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempList], a
	ret

DiscardAllLEffect2:
	xor a
	call CreateListOfElectricEnergyAttachedToArena
	ld hl, wDuelTempList
; put all energy cards in Discard Pile
.loop
	ld a, [hli]
	cp $ff
	ret z
	farcall PutCardInDiscardPile
	jr .loop

Gale_LoadAnimation2:
	ld a, ATK_ANIM_MAGNETIC_STORM
	ld [wLoadedAttackAnimation], a
	ret

Gale_SwitchEffect2:
	farcall HandleNoDamageOrEffect
	jr c, .SwitchWithRandomBenchPokemon
	ld a, DUELVARS_ARENA_CARD_HP
	farcall GetNonTurnDuelistVariable
	or a
	jr nz, .skip_destiny_bond
	bank1call HandleDestinyBondSubstatus
.skip_destiny_bond
	farcall SwapTurn
	farcall .SwitchWithRandomBenchPokemon
	jr c, .skip_clear_damage
; clear dealt damage because Pokemon was switched
	xor a
	ld hl, wDealtDamage
	ld [hli], a
	ld [hl], a
.skip_clear_damage
	farcall SwapTurn

.SwitchWithRandomBenchPokemon
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp 2
	ret c ; return if no Bench Pokemon
	dec a
	farcall Random
	inc a
	ld e, a
	farcall SwapArenaWithBenchPokemon
	xor a
	ld [wDuelDisplayedScreen], a
	ret

MagneticWaveEffect2:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	farcall GetTurnDuelistVariable
	dec a 
	farcall ATimes10
	ld e, a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	farcall GetNonTurnDuelistVariable
	dec a
	farcall ATimes10
	sub e
	jr nc, .no_underflow
	xor a
.no_underflow
	farcall SetDefiniteDamage
	ret

PP_NoDamage50PercentEffect2:
	ldtx de, DamageCheckIfTailsNoDamageText
	farcall TossCoin_BankB
	jr c, .heads
	xor a
	farcall SetDefiniteDamage
	farcall SetWasUnsuccessful
	ret
.heads
	ld a, ATK_ANIM_HIT
	ld [wLoadedAttackAnimation], a
	ret

Maydo20ToSelfEffect2:
	ld a, 20
	call DealRecoilDamageToSelf
	ret

PlayerPickFightingEnergyCardToDiscard:
	.loop_input
	call CreateListOfFightingEnergyAttachedToArena
	xor a
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempList], a
	jr c, .loop_input ; can't exit with B button
	ld a, 20
	call AddToDamage
	jp Magcargo_DiscardEffect
	
AIPickFightingEnergyCardToDiscard:
	call CreateListOfFightingEnergyAttachedToArena
	ld a, [wDuelTempList]
	ldh [hTempList], a ; pick first in list
	ld a, 20
	call AddToDamage
	jp Magcargo_DiscardEffect

CreateListOfFightingEnergyAttachedToArena:
	ld a, TYPE_ENERGY_FIGHTING
	ld b, a
	ld c, 0
	ld de, wDuelTempList
	ld a, DUELVARS_CARD_LOCATIONS
	farcall GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .next
	push de
	ld a, l
	farcall GetCardIDFromDeckIndex
	farcall GetCardType
	pop de
	cp b
	jr nz, .next ; is same as input type?
	ld a, l
	ld [de], a
	inc de
	inc c
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop

	ld a, $ff
	ld [de], a
	ld a, c
	ret

Magcargo_DiscardEffect:
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

SmashPunchEffect2:
	ldtx de, DamageCheckIfTailsNoDamageText
	farcall TossCoin_BankB
	jr c, .heads
	xor a
	farcall SetDefiniteDamage
	farcall SetWasUnsuccessful
	ret
.heads
	ld a, ATK_ANIM_HIT
	ld [wLoadedAttackAnimation], a
	ret

TrampleEffect2:
	ld a, 1
	ldh [hCurSelectionItem], a
	farcall SwapTurn
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	farcall GetTurnDuelistVariable
	ld c, a
	ld b, 0
	ld e, b
	jr .next_pkmn

.check_damage
	push de
	push bc
	call .DisplayText
	ld de, $0
	farcall SwapTurn
	farcall TossCoin_BankB
	farcall SwapTurn
	push af
	farcall GetNextPositionInTempList
	pop af
	ld [hl], a ; store result in list
	pop bc
	pop de
	jr c, .next_pkmn
	inc b ; increase number of tails

.next_pkmn
	inc e
	dec c
	jr nz, .check_damage

; all coins were tossed for each Benched Pokemon
	farcall GetNextPositionInTempList
	ld [hl], $ff
	ld a, b
	ldh [hTemp_ffa0], a
	farcall ResetAnimationQueue
	farcall SwapTurn

; tally recoil damage
	ldh a, [hTemp_ffa0]
	or a
	jr z, .skip_recoil

.skip_recoil

; deal damage for Bench Pokemon that got heads
	farcall SwapTurn
	ld hl, hTempPlayAreaLocation_ffa1
	ld b, PLAY_AREA_BENCH_1
.loop_bench
	ld a, [hli]
	cp $ff
	jr z, .done
	or a
	jr z, .skip_damage ; skip if tails
	ld de, 30
	farcall DealDamageToPlayAreaPokemon_RegularAnim
.skip_damage
	inc b
	jr .loop_bench

.done
	farcall SwapTurn
	ret

.DisplayText 
	ld b, e
	ldtx hl, BenchText
	ld de, wDefaultText
	farcall CopyText
	ld a, $30 ; 0 FW character
	add b
	ld [de], a
	inc de
	ld a, $20 ; space FW character
	ld [de], a
	inc de

	ld a, DUELVARS_ARENA_CARD
	add b
	farcall GetTurnDuelistVariable
	farcall LoadCardDataToBuffer2_FromDeckIndex
	ld hl, wLoadedCard2Name
	ld a, [hli]
	ld h, [hl]
	ld l, a
	farcall CopyText

	xor a
	ld [wDuelDisplayedScreen], a
	ret

TrampleEffect3:
	ld a, 1
	ldh [hCurSelectionItem], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	farcall GetTurnDuelistVariable
	ld c, a
	ld b, 0
	ld e, b
	jr .next_pkmn

.check_damage
	push de
	push bc
	call .DisplayText
	ld de, $0
	farcall TossCoin_BankB
	push af
	farcall GetNextPositionInTempList
	pop af
	ld [hl], a ; store result in list
	pop bc
	pop de
	jr c, .next_pkmn
	inc b ; increase number of tails

.next_pkmn
	inc e
	dec c
	jr nz, .check_damage

; all coins were tossed for each Benched Pokemon
	farcall GetNextPositionInTempList
	ld [hl], $ff
	ld a, b
	ldh [hTemp_ffa0], a
	farcall ResetAnimationQueue

; tally recoil damage
	ldh a, [hTemp_ffa0]
	or a
	jr z, .skip_recoil

.skip_recoil

; deal damage for Bench Pokemon that got heads
	ld hl, hTempPlayAreaLocation_ffa1
	ld b, PLAY_AREA_BENCH_1
.loop_bench
	ld a, [hli]
	cp $ff
	jr z, .done
	or a
	jr z, .skip_damage ; skip if tails
	ld de, 30
	farcall DealDamageToPlayAreaPokemon_RegularAnim
.skip_damage
	inc b
	jr .loop_bench

.done
	ret

.DisplayText 
	ld b, e
	ldtx hl, BenchText
	ld de, wDefaultText
	farcall CopyText
	ld a, $30 ; 0 FW character
	add b
	ld [de], a
	inc de
	ld a, $20 ; space FW character
	ld [de], a
	inc de

	ld a, DUELVARS_ARENA_CARD
	add b
	farcall GetTurnDuelistVariable
	farcall LoadCardDataToBuffer2_FromDeckIndex
	ld hl, wLoadedCard2Name
	ld a, [hli]
	ld h, [hl]
	ld l, a
	farcall CopyText

	xor a
	ld [wDuelDisplayedScreen], a
	ret

MurkrowCallForFamily_CheckDeckAndPlayArea2:
	farcall CheckIfDeckIsEmpty
	ret c ; return if no cards in deck
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	farcall GetTurnDuelistVariable
	ldtx hl, NoSpaceOnTheBenchText
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ret

MurkrowCallForFamily_PlayerSelectEffect2:
	ld a, $ff
	ldh [hTemp_ffa0], a
	call CreateDeckCardList
	ldtx hl, ChooseABellsproutFromDeckText
	ldtx bc, MurkrowText
	lb de, SEARCHEFFECT_CARD_ID, MURKROW
	farcall LookForCardsInDeck
	ret c

; draw Deck list interface and print text
	bank1call Func_5591
	ldtx hl, ChooseABellsproutText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText

.loop
	bank1call DisplayCardList
	jr c, .pressed_b
	farcall GetCardIDFromDeckIndex
	ld bc, MURKROW
	farcall CompareDEtoBC
	jr nz, .play_sfx

; Bellsprout was selected
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	or a
	ret

.play_sfx
	; play SFX and loop back
	farcall Func_3794
	jr .loop

.pressed_b
; figure if Player can exit the screen without selecting,
; that is, if the Deck has no Bellsprout card.
	ld a, DUELVARS_CARD_LOCATIONS
	farcall GetTurnDuelistVariable
.loop_b_press
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	ld a, l
	farcall GetCardIDFromDeckIndex
	ld bc, MURKROW
	farcall CompareDEtoBC
	jr z, .play_sfx ; found Bellsprout, go back to top loop
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_b_press

; no Bellsprout in Deck, can safely exit screen
	ld a, $ff
	ldh [hTemp_ffa0], a
	or a
	ret

MurkrowCallForFamily_AISelectEffect2:
	farcall CreateDeckCardList
	ld hl, wDuelTempList
.loop_deck
	ld a, [hli]
	ldh [hTemp_ffa0], a
	cp $ff
	ret z ; no Bellsprout
	farcall GetCardIDFromDeckIndex
	ld a, e
	cp MURKROW
	jr nz, .loop_deck
	ret ; Bellsprout found

MurkrowCallForFamily_PutInPlayAreaEffect2:
	ldh a, [hTemp_ffa0]
	cp $ff
	jr z, .shuffle
	farcall SearchCardInDeckAndAddToHand
	farcall AddCardToHand
	farcall PutHandPokemonCardInPlayArea
	farcall IsPlayerTurn
	jr c, .shuffle
	ldh a, [hTemp_ffa0]
	ldtx hl, PlacedOnTheBenchText
	bank1call DisplayCardDetailScreen
.shuffle
	farcall Func_2c0bd
	ret

FlockEffect2:
	ld a, DUELVARS_ARENA_CARD
	farcall GetTurnDuelistVariable
	ld c, PLAY_AREA_ARENA
.loop
	ld a, [hl]
	cp $ff
	jr z, .done
	farcall GetCardIDFromDeckIndex
	ld a, e
	cp MURKROW
	jr nz, .next
	ld a, d
	cp $00 ; why check d? Card IDs are only 1 byte long
	jr nz, .next
	inc c
.next
	inc hl
	jr .loop
.done
	ld a, c
	dec a
	ldtx de, FlockText
	farcall TossCoinATimes_BankB
	farcall ATimes10
	farcall AddToDamage
	ret

MoreDamageAndCFNEffect2:
	ldtx de, MindBlastText
	farcall TossCoin_BankB
	ret nc
	ld a, 10
	farcall AddToDamage
	farcall ConfusionEffect
	ret

MoreDamageAndNoRetreatEffect2:
	ldtx de, UnusedText008f
	farcall TossCoin_BankB
	ret nc
	ld a, 10
	farcall AddToDamage
	farcall NewAcidEffect
	ret

PerishSongCheckEffect2:
	ld a, DUELVARS_ARENA_CARD_STATUS
	farcall GetNonTurnDuelistVariable
	and CNF_SLP_PRZ
	cp ASLEEP
	ret z ; return if asleep
; not asleep, set carry and load text
	ldtx hl, OpponentIsNotAsleepText
	scf
	ret

AnyTargetEffect2:
	xor a  ; PLAY_AREA_ARENA
	ldh [hTempPlayAreaLocation_ffa1], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	farcall GetNonTurnDuelistVariable
	cp 2
	jr c, .done ; has no Bench Pokemon

	ldtx hl, ChoosePkmnToGiveDamageText
	farcall DrawWideTextBox_WaitForInput
	farcall SwapTurn
	bank1call HasAlivePokemonInPlayArea
.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTempPlayAreaLocation_ffa1], a
	farcall SwapTurn
.done
	or a
	ret

AnyTargetAIEffect2:
	xor a ;play area arena
	ldh [hTempPlayAreaLocation_ffa1], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	farcall GetNonTurnDuelistVariable
	cp 2
	jr c, .done ;no benched mons
	
	farcall GetBenchPokemonWithLowestHP
	ldh [hTempPlayAreaLocation_ffa1], a
	ld a, DUELVARS_ARENA_CARD_HP
	farcall GetNonTurnDuelistVariable
	ld a, e ; amount of hp remaining is e
	cp [hl]
	jr c, .done ; got minimum

	xor a
	ldh [hTempPlayAreaLocation_ffa1], a
.done
	or a
	ret
	
FlashingEyesEffect2:
	ldtx de, EyesEffectText
	farcall TossCoin_BankB
	jr c, .OneH
	jr nc, .OneT
	xor a
	ret
.OneH
	ldtx de, EyesEffectText
	farcall TossCoin_BankB
	jr c, .TwoH
	jr nc, .OneHOneT
	xor a
	ret
.OneT
	ldtx de, EyesEffectText
	farcall TossCoin_BankB
	jr c, .OneHOneT
	jr nc, .TwoT
	xor a
	ret
.OneHOneT
	ldtx de, EyesEffectText
	farcall TossCoin_BankB
	jr c, .TwoHOneT
	jr nc, .OneHTwoT
	xor a
	ret
.TwoT
	ldtx de, EyesEffectText
	farcall TossCoin_BankB
	jr c, .OneHTwoT
	ret
.TwoH
	ldtx de, EyesEffectText
	farcall TossCoin_BankB
	jr nc, .TwoHOneT
	farcall ParalysisEffect
	ret
.TwoHOneT
	farcall ConfusionEffect
	ret
.OneHTwoT
	farcall SleepEffect
	ret

Heal20FromAllEffect2:
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
	ld a, ATK_ANIM_HEALING_WIND_PLAY_AREA
	ld [wLoadedAttackAnimation], a

	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	farcall GetTurnDuelistVariable
	ld d, a
	ld e, PLAY_AREA_ARENA
.loop_play_area
	push de
	ld a, e
	ldh [hTempPlayAreaLocation_ff9d], a
	farcall GetPlayAreaCardColor
	cp TYPE_PKMN_COLORLESS
	jr nz, .next_pkmn
	farcall GetCardDamageAndMaxHP
	or a
	jr z, .next_pkmn ; skip if no damage

; if less than 20 damage, cap recovery at 10 damage
	ld de, 20
	cp e
	jr nc, .heal
	ld e, a

.heal
; add HP to this card
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	farcall GetTurnDuelistVariable
	add e
	ld [hl], a

; play heal animation
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $01
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
.next_pkmn
	pop de
	inc e
	dec d
	jr nz, .loop_play_area
	jp .opponent

.opponent
	farcall SwapTurn
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
	ld a, ATK_ANIM_HEALING_WIND_PLAY_AREA
	ld [wLoadedAttackAnimation], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	farcall GetTurnDuelistVariable
	ld d, a
	ld e, PLAY_AREA_ARENA
.loop_play_areaOpp
	push de
	ld a, e
	ldh [hTempPlayAreaLocation_ff9d], a
	farcall GetPlayAreaCardColor
	cp TYPE_PKMN_COLORLESS
	jr nz, .next_pkmnOpp
	farcall GetCardDamageAndMaxHP
	or a
	jr z, .next_pkmnOpp ; skip if no damage

; if less than 20 damage, cap recovery at 10 damage
	ld de, 20
	cp e
	jr nc, .healOpp
	ld e, a

.healOpp
; add HP to this card
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	farcall GetTurnDuelistVariable
	add e
	ld [hl], a

; play heal animation
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $01
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
.next_pkmnOpp
	pop de
	inc e
	dec d
	jr nz, .loop_play_areaOpp
	farcall SwapTurn
	ret

Bounty_AISelectEffect2:
	ld a, $ff
	ldh [hTemp_ffa0], a
	farcall CreateHandCardList
	ret

Bounty_AttachEnergyEffect2:
	ldh a, [hTemp_ffa0]
	cp $ff
	jr z, .done

; add card to hand and attach it to the selected Pokemon
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld e, a
	ldh a, [hTemp_ffa0]
	farcall PutHandCardInPlayArea
	farcall IsPlayerTurn
	jr c, .done

; not Player, so show detail screen
; and which Pokemon was chosen to attach Energy.
	ldh a, [hTempPlayAreaLocation_ffa1]
	add DUELVARS_ARENA_CARD
	farcall GetTurnDuelistVariable
	farcall LoadCardDataToBuffer1_FromDeckIndex
	ld hl, wLoadedCard1Name
	ld de, wTxRam2_b
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ldh a, [hTemp_ffa0]
	ldtx hl, AttachedEnergyToPokemonText
	bank1call DisplayCardDetailScreen

.done
	ret

DiscardAllEnergyEffect2:
	xor a
	call CreateArenaOrBenchEnergyCardList
	ld hl, wDuelTempList
; put all energy cards in Discard Pile
.loop
	ld a, [hli]
	cp $ff
	ret z
	call PutCardInDiscardPile
	jr .loop
	ret
