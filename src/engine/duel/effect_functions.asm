Poison50PercentEffect: ; 2c000 (b:4000)
	ldtx de, PoisonCheckText
	call TossCoin_BankB
	ret nc

PoisonEffect: ; 2c007 (b:4007)
	lb bc, CNF_SLP_PRZ, POISONED
	jr ApplyStatusEffect

DoublePoisonEffect: ; 2c00c (b:400c)
	lb bc, CNF_SLP_PRZ, DOUBLE_POISONED
	jr ApplyStatusEffect

Paralysis50PercentEffect: ; 2c011 (b:4011)
	ldtx de, ParalysisCheckText
	call TossCoin_BankB
	ret nc

ParalysisEffect: ; 2c018 (b:4018)
	lb bc, PSN_DBLPSN, PARALYZED
	jr ApplyStatusEffect

Confusion50PercentEffect: ; 2c01d (b:401d)
	ldtx de, ConfusionCheckText
	call TossCoin_BankB
	ret nc

ConfusionEffect: ; 2c024 (b:4024)
	lb bc, PSN_DBLPSN, CONFUSED
	jr ApplyStatusEffect

Sleep50PercentEffect: ; 2c029 (b:4029)
	ldtx de, SleepCheckText
	call TossCoin_BankB
	ret nc

SleepEffect: ; 2c030 (b:4030)
	lb bc, PSN_DBLPSN, ASLEEP
	jr ApplyStatusEffect

ApplyStatusEffect: ; 2c035 (b:4035)
	ldh a, [hWhoseTurn]
	ld hl, wWhoseTurn
	cp [hl]
	jr nz, .can_induce_status
	ld a, [wTempNonTurnDuelistCardID]
	cp POKE_DOLL
	jr z, .cant_induce_status
	cp FOSSIL_EGG
	jr z, .cant_induce_status
	; Snorlax's Thick Skinned prevents it from being statused...
	cp SUICUNE
	jr nz, .can_induce_status
	call SwapTurn
	xor a
	; ...unless already so, or if affected by Muk's Toxic Gas
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	call SwapTurn
	jr c, .can_induce_status

.cant_induce_status
	ld a, c
	ld [wNoEffectFromWhichStatus], a
	call SetNoEffectFromStatus
	or a
	ret

.can_induce_status
	ld hl, wEffectFunctionsFeedbackIndex
	push hl
	ld e, [hl]
	ld d, $0
	ld hl, wEffectFunctionsFeedback
	add hl, de
	call SwapTurn
	ldh a, [hWhoseTurn]
	ld [hli], a
	call SwapTurn
	ld [hl], b ; mask of status conditions not to discard on the target
	inc hl
	ld [hl], c ; status condition to inflict to the target
	pop hl
	; advance wEffectFunctionsFeedbackIndex
	inc [hl]
	inc [hl]
	inc [hl]
	scf
	ret

TossCoin_BankB: ; 2c07e (b:407e)
	call TossCoin
	ret

TossCoinATimes_BankB: ; 2c082 (b:4082)
	call TossCoinATimes
	ret

CommentedOut_2c086: ; 2c086 (b:4086)
	ret

Func_2c087: ; 2c087 (b:4087)
	xor a
	jr Func_2c08c

Func_2c08a: ; 2c08a (b:408a)
	ld a, $1

Func_2c08c: ; 2c08c (b:408c)
	push de
	push af
	ld a, OPPACTION_TOSS_COIN_A_TIMES
	call SetOppAction_SerialSendDuelData
	pop af
	pop de
	call SerialSend8Bytes
	call TossCoinATimes
	ret

SetNoEffectFromStatus: ; 2c09c (b:409c)
	ld a, EFFECT_FAILED_NO_EFFECT
	ld [wEffectFailed], a
	ret

SetWasUnsuccessful: ; 2c0a2 (b:40a2)
	ld a, EFFECT_FAILED_UNSUCCESSFUL
	ld [wEffectFailed], a
	ret

Func_2c0a8: ; 2c0a8 (b:40a8)
	ldh a, [hTemp_ffa0]
	push af
	ldh a, [hWhoseTurn]
	ldh [hTemp_ffa0], a
	ld a, OPPACTION_6B30
	call SetOppAction_SerialSendDuelData
	bank1call Func_4f2d
	ld c, a
	pop af
	ldh [hTemp_ffa0], a
	ld a, c
	ret

Func_2c0bd: ; 2c0bd (b:40bd)
	call ExchangeRNG
	bank1call Func_4f2d
	call ShuffleDeck
	ret

; return carry if Player is the Turn Duelist
IsPlayerTurn: ; 2c0c7 (b:40c7)
	ld a, DUELVARS_DUELIST_TYPE
	call GetTurnDuelistVariable
	cp DUELIST_TYPE_PLAYER
	jr z, .player
	or a
	ret
.player
	scf
	ret

; Stores information about the attack damage for AI purposes
; taking into account poison damage between turns.
; if target poisoned
;	[wAIMinDamage] <- [wDamage]
;	[wAIMaxDamage] <- [wDamage]
; else
;	[wAIMinDamage] <- [wDamage] + d
;	[wAIMaxDamage] <- [wDamage] + e
;	[wDamage]      <- [wDamage] + a
UpdateExpectedAIDamage_AccountForPoison: ; 2c0d4 (b:40d4)
	push af
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetNonTurnDuelistVariable
	and POISONED | DOUBLE_POISONED
	jr z, UpdateExpectedAIDamage.skip_push_af
	pop af
	ld a, [wDamage]
	ld [wAIMinDamage], a
	ld [wAIMaxDamage], a
	ret

; Sets some variables for AI use
;	[wAIMinDamage] <- [wDamage] + d
;	[wAIMaxDamage] <- [wDamage] + e
;	[wDamage]      <- [wDamage] + a
UpdateExpectedAIDamage: ; 2c0e9 (b:40e9)
	push af

.skip_push_af
	ld hl, wDamage
	ld a, [hl]
	add d
	ld [wAIMinDamage], a
	ld a, [hl]
	add e
	ld [wAIMaxDamage], a
	pop af
	add [hl]
	ld [hl], a
	ret

; Stores information about the attack damage for AI purposes
; [wDamage]      <- a (average amount of damage)
; [wAIMinDamage] <- d (minimum)
; [wAIMaxDamage] <- e (maximum)
SetExpectedAIDamage: ; 2c0fb (b:40fb)
	ld [wDamage], a
	xor a
	ld [wDamage + 1], a
	ld a, d
	ld [wAIMinDamage], a
	ld a, e
	ld [wAIMaxDamage], a
	ret

Func_2c10b: ; 2c10b (b:410b)
	ldh [hTempPlayAreaLocation_ff9d], a
	bank1call Func_61a1
	bank1call PrintPlayAreaCardList_EnableLCD
	bank1call Func_6194
	ret

; deal damage to all the turn holder's benched Pokemon
; input: a = amount of damage to deal to each Pokemon
DealDamageToAllBenchedPokemon: ; 2c117 (b:4117)
	ld e, a
	ld d, $00
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld b, PLAY_AREA_ARENA
	jr .skip_to_bench
.loop
	push bc
	call DealDamageToPlayAreaPokemon_RegularAnim
	pop bc
.skip_to_bench
	inc b
	dec c
	jr nz, .loop
	ret

Func_2c12e: ; 2c12e (b:412e)
	ld [wLoadedAttackAnimation], a
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $0 ; neither WEAKNESS nor RESISTANCE
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
	ret

; apply a status condition of type 1 identified by register a to the target
ApplySubstatus1ToDefendingCard: ; 2c140 (b:4140)
	push af
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS1
	call GetTurnDuelistVariable
	pop af
	ld [hli], a
	ret

ApplySubstatus1ToSelf: ; 2c140 (b:4140)
	push af
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS1
	call GetNonTurnDuelistVariable
	pop af
	ld [hli], a
	ret

; apply a status condition of type 2 identified by register a to the target,
; unless prevented by wNoDamageOrEffect
ApplySubstatus2ToDefendingCard: ; 2c149 (b:4149)
	push af
	call CheckNoDamageOrEffect
	jr c, .no_damage_orEffect
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS2
	call GetNonTurnDuelistVariable
	pop af
	ld [hl], a
	ld l, $f6
	ld [hl], a
	ret

.no_damage_orEffect
	pop af
	push hl
	bank1call DrawDuelMainScene
	pop hl
	ld a, l
	or h
	call nz, DrawWideTextBox_PrintText
	ret

; overwrites in wDamage, wAIMinDamage and wAIMaxDamage
; with the value in a.
SetDefiniteDamage: ; 2c166 (b:4166)
	ld [wDamage], a
	ld [wAIMinDamage], a
	ld [wAIMaxDamage], a
	xor a
	ld [wDamage + 1], a
	ret

; overwrites wAIMinDamage and wAIMaxDamage
; with value in wDamage.
SetDefiniteAIDamage: ; 2c174 (b:4174)
	ld a, [wDamage]
	ld [wAIMinDamage], a
	ld [wAIMaxDamage], a
	ret

; returns in a some random occupied Play Area location
; in Turn Duelist's Play Area.
PickRandomPlayAreaCard: ; 2c17e (b:417e)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	call Random
	or a
	ret

; outputs in hl the next position
; in hTempList to place a new card,
; and increments hCurSelectionItem.
GetNextPositionInTempList: ; 2c188 (b:4188)
	push de
	ld hl, hCurSelectionItem
	ld a, [hl]
	inc [hl]
	ld e, a
	ld d, $00
	ld hl, hTempList
	add hl, de
	pop de
	ret

; creates in wDuelTempList list of attached Fire Energy cards
; that are attached to the Turn Duelist's Arena card.
CreateListOfFireEnergyAttachedToArena: ; 2c197 (b:4197)
	ld a, TYPE_ENERGY_FIRE
	; fallthrough

; creates in wDuelTempList a list of cards that
; are in the Arena of the same type as input a.
; this is called to list Energy cards of a specific type
; that are attached to the Arena Pokemon.
; input:
;	a = TYPE_ENERGY_* constant
; output:
;	a = number of cards in list;
;	wDuelTempList filled with cards, terminated by $ff
CreateListOfEnergyAttachedToArena: ; 2c199 (b:4199)
	ld b, a
	ld c, 0
	ld de, wDuelTempList
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .next
	push de
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
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

; prints the text "<X> devolved to <Y>!" with
; the proper card names and levels.
; input:
;	d = deck index of the lower stage card
;	e = deck index of card that was devolved
PrintDevolvedCardNameAndLevelText: ; 2c1c4 (b:41c4)
	push de
	ld a, e
	call LoadCardDataToBuffer1_FromDeckIndex
	ld bc, wTxRam2
	ld hl, wLoadedCard1Name
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hl]
	ld [bc], a

	inc bc ; wTxRam2_b
	xor a
	ld [bc], a
	inc bc
	ld [bc], a

	ld a, d
	call LoadCardDataToBuffer1_FromDeckIndex
	ld a, 18
	call CopyCardNameAndLevel
	ld [hl], $00
	ldtx hl, PokemonDevolvedToText
	call DrawWideTextBox_WaitForInput
	pop de
	ret

HandleSwitchDefendingPokemonEffect: ; 2c1ec (b:41ec)
	ld e, a
	cp $ff
	ret z

; check Defending Pokemon's HP
	ld a, DUELVARS_ARENA_CARD_HP
	call GetNonTurnDuelistVariable
	or a
	jr nz, .switch

; if 0, handle Destiny Bond first
	push de
	bank1call HandleDestinyBondSubstatus
	pop de

.switch
	call HandleNoDamageOrEffect
	ret c

; attack was successful, switch Defending Pokemon
	call SwapTurn
	call SwapArenaWithBenchPokemon
	call SwapTurn

	xor a
	ld [wccc5], a
	ld [wDuelDisplayedScreen], a
	inc a
	ld [wccef], a
	ret

; returns carry if Defending has No Damage or Effect
; if so, print its appropriate text.
HandleNoDamageOrEffect: ; 2c216 (b:4216)
	call CheckNoDamageOrEffect
	ret nc
	ld a, l
	or h
	call nz, DrawWideTextBox_PrintText
	scf
	ret

; applies HP recovery on Pokemon after an attack
; with HP recovery effect, and handles its animation.
; input:
;	d = damage effectiveness
;	e = HP amount to recover
ApplyAndAnimateHPRecovery: ; 2c221 (b:4221)
	push de
	ld hl, wccbd
	ld [hl], e
	inc hl
	ld [hl], d

; get Arena card's damage
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	pop de
	or a
	ret z ; return if no damage

; load correct animation
	push de
	ld a, ATK_ANIM_HEAL
	ld [wLoadedAttackAnimation], a
	ld bc, $01 ; arrow
	bank1call PlayAttackAnimation

; compare HP to be restored with max HP
; if HP to be restored would cause HP to
; be larger than max HP, cap it accordingly
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	ld b, $00
	pop de
	ld a, DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	add e
	ld e, a
	ld a, 0
	adc d
	ld d, a
	; de = damage dealt + current HP
	; bc = max HP of card
	call CompareDEtoBC
	jr c, .skip_cap
	; cap de to value in bc
	ld e, c
	ld d, b

.skip_cap
	ld [hl], e ; apply new HP to arena card
	bank1call WaitAttackAnimation
	ret

; returns carry if Play Area has no damage counters.
CheckIfPlayAreaHasAnyDamage: ; 2c25b (b:425b)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld d, a
	ld e, PLAY_AREA_ARENA
.loop_play_area
	call GetCardDamageAndMaxHP
	or a
	ret nz ; found damage
	inc e
	dec d
	jr nz, .loop_play_area
	; no damage found
	scf
	ret

; makes a list in wDuelTempList with the deck indices
; of Trainer cards found in Turn Duelist's Discard Pile.
; returns carry set if no Trainer cards found, and loads
; corresponding text to notify this.
CreateTrainerCardListFromDiscardPile: ; 2c26e (b:426e)
; get number of cards in Discard Pile
; and have hl point to the end of the
; Discard Pile list in wOpponentDeckCards.
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_DISCARD_PILE
	call GetTurnDuelistVariable
	ld b, a
	add DUELVARS_DECK_CARDS
	ld l, a

	ld de, wDuelTempList
	inc b
	jr .next_card

.check_trainer
	ld a, [hl]
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_TRAINER
	jr nz, .next_card

	ld a, [hl]
	ld [de], a
	inc de

.next_card
	dec l
	dec b
	jr nz, .check_trainer

	ld a, $ff ; terminating byte
	ld [de], a
	ld a, [wDuelTempList]
	cp $ff
	jr z, .no_trainers
	or a
	ret
.no_trainers
	ldtx hl, ThereAreNoTrainerCardsInDiscardPileText
	scf
	ret

; makes a list in wDuelTempList with the deck indices
; of all basic energy cards found in Turn Duelist's Discard Pile.
CreateEnergyCardListFromDiscardPile_OnlyBasic: ; 2c2a0 (b:42a0)
	ld c, $01
	jr CreateEnergyCardListFromDiscardPile

; makes a list in wDuelTempList with the deck indices
; of all energy cards (including Double Colorless)
; found in Turn Duelist's Discard Pile.
CreateEnergyCardListFromDiscardPile_AllEnergy: ; 2c2a4 (b:42a4)
	ld c, $00
;	fallthrough

; makes a list in wDuelTempList with the deck indices
; of energy cards found in Turn Duelist's Discard Pile.
; if (c == 0), all energy cards are allowed;
; if (c != 0), double colorless energy cards are not included.
; returns carry if no energy cards were found.
CreateEnergyCardListFromDiscardPile: ; 2c2a6 (b:42a6)
; get number of cards in Discard Pile
; and have hl point to the end of the
; Discard Pile list in wOpponentDeckCards.
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_DISCARD_PILE
	call GetTurnDuelistVariable
	ld b, a
	add DUELVARS_DECK_CARDS
	ld l, a

	ld de, wDuelTempList
	inc b
	jr .next_card

.check_energy
	ld a, [hl]
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	and TYPE_ENERGY
	jr z, .next_card

; if (c != $00), then we dismiss Double Colorless
; energy cards found.
	ld a, c
	or a
	jr z, .copy
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY_DOUBLE_COLORLESS
	jr nc, .next_card

.copy
	ld a, [hl]
	ld [de], a
	inc de

; goes through Discard Pile list
; in wOpponentDeckCards in descending order.
.next_card
	dec l
	dec b
	jr nz, .check_energy

; terminating byte on wDuelTempList
	ld a, $ff
	ld [de], a

; check if any energy card was found
; by checking whether the first byte
; in wDuelTempList is $ff.
; if none were found, return carry.
	ld a, [wDuelTempList]
	cp $ff
	jr z, .set_carry
	or a
	ret

.set_carry
	scf
	ret

; returns carry if Deck is empty
CheckIfDeckIsEmpty: ; 2c2e0 (b:42e0)
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ldtx hl, NoCardsLeftInTheDeckText
	cp DECK_SIZE
	ccf
	ret

; searches through Deck in wDuelTempList looking for
; a certain card or cards, and prints text depending
; on whether at least one was found.
; if none were found, asks the Player whether to look
; in the Deck anyway, and returns carry if No is selected.
; uses SEARCHEFFECT_* as input which determines what to search for:
;	SEARCHEFFECT_CARD_ID = search for card ID in e
;	SEARCHEFFECT_NIDORAN = search for either NidoranM or NidoranF
;	SEARCHEFFECT_BASIC_FIGHTING = search for any Basic Fighting Pokemon
;	SEARCHEFFECT_BASIC_ENERGY = search for any Basic Energy
;	SEARCHEFFECT_POKEMON = search for any Pokemon card
; input:
;	d = SEARCHEFFECT_* constant
;	e = (optional) card ID to search for in deck
;	hl = text to print if Deck has card(s)
; output:
;	carry set if refused to look at deck
LookForCardsInDeck: ; 2c2ec (b:42ec)
	push hl
	push bc
	ld a, [wDuelTempList]
	cp $ff
	jr z, .none_in_deck
	ld a, d
	ld hl, .search_table
	call JumpToFunctionInTable
	jr c, .none_in_deck
	pop bc
	pop hl
	call DrawWideTextBox_WaitForInput
	or a
	ret

.none_in_deck
	pop hl
	call LoadTxRam2
	pop hl
	ldtx hl, ThereIsNoInTheDeckText
	call DrawWideTextBox_WaitForInput
	ldtx hl, WouldYouLikeToCheckTheDeckText
	call YesOrNoMenuWithText_SetCursorToYes
	ret

.search_table
	dw .SearchDeckForCardID
	dw .SearchDeckForNidoran
	dw .SearchDeckForBasicFighting
	dw .SearchDeckForBasicEnergy
	dw .SearchDeckForPokemon

.set_carry ; 2c321 (b:4321)
	scf
	ret

; returns carry if no card with
; same card ID as e is found in Deck
.SearchDeckForCardID ; 2c323 (b:4323)
	ld hl, wDuelTempList
.loop_deck_e
	ld a, [hli]
	cp $ff
	jr z, .set_carry
	push de
	call GetCardIDFromDeckIndex
	ld a, e
	pop de
	cp e
	jr nz, .loop_deck_e
	or a
	ret

; returns carry if no NidoranM or NidoranF card is found in Deck
.SearchDeckForNidoran ; 2c336 (b:4336)
	ld hl, wDuelTempList
.loop_deck_nidoran
	ld a, [hli]
	cp $ff
	jr z, .set_carry
	call GetCardIDFromDeckIndex
	ld a, e
	cp UNOWN_A
	jr z, .found_nidoran
	cp UNOWN_J
	jr nz, .loop_deck_nidoran
.found_nidoran
	or a
	ret

; returns carry if no Basic Fighting Pokemon is found in Deck
.SearchDeckForBasicFighting ; 2c34c (b:434c)
	ld hl, wDuelTempList
.loop_deck_fighting
	ld a, [hli]
	cp $ff
	jr z, .set_carry
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_PKMN_FIGHTING
	jr nz, .loop_deck_fighting
	ld a, [wLoadedCard2Stage]
	or a ; BASIC
	jr nz, .loop_deck_fighting
	ret

; returns carry if no Basic Energy cards are found in Deck
.SearchDeckForBasicEnergy ; 2c365 (b:4365)
	ld hl, wDuelTempList
.loop_deck_energy
	ld a, [hli]
	cp $ff
	jr z, .set_carry
	call GetCardIDFromDeckIndex
	call GetCardType
	cp TYPE_ENERGY_DOUBLE_COLORLESS
	jr z, .loop_deck_energy
	and TYPE_ENERGY
	jr z, .loop_deck_energy
	or a
	ret

; returns carry if no Pokemon cards are found in Deck
.SearchDeckForPokemon ; 2c37d (b:437d)
	ld hl, wDuelTempList
.loop_deck_pkmn
	ld a, [hli]
	cp $ff
	jr z, .set_carry
	call GetCardIDFromDeckIndex
	call GetCardType
	cp TYPE_ENERGY
	jr nc, .loop_deck_pkmn
	or a
	ret

; handles the Player selection of attack
; to use, i.e. Amnesia or Metronome on.
; returns carry if none selected.
; outputs:
;	d = card index of defending card
;	e = attack index selected
HandleDefendingPokemonAttackSelection: ; 2c391 (b:4391)
	bank1call DrawDuelMainScene
	call SwapTurn
	xor a
	ldh [hCurSelectionItem], a

.start
	bank1call PrintAndLoadAttacksToDuelTempList
	push af
	ldh a, [hCurSelectionItem]
	ld hl, .menu_parameters
	call InitializeMenuParameters
	pop af

	ld [wNumMenuItems], a
	call EnableLCD
.loop_input
	call DoFrame
	ldh a, [hKeysPressed]
	bit B_BUTTON_F, a
	jr nz, .set_carry
	and START
	jr nz, .open_atk_page
	call HandleMenuInput
	jr nc, .loop_input
	cp -1
	jr z, .loop_input

; an attack was selected
	ldh a, [hCurMenuItem]
	add a
	ld e, a
	ld d, $00
	ld hl, wDuelTempList
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	call SwapTurn
	or a
	ret

.set_carry
	call SwapTurn
	scf
	ret

.open_atk_page
	ldh a, [hCurMenuItem]
	ldh [hCurSelectionItem], a
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex
	bank1call OpenAttackPage
	call SwapTurn
	bank1call DrawDuelMainScene
	call SwapTurn
	jr .start

.menu_parameters
	db 1, 13 ; cursor x, cursor y
	db 2 ; y displacement between items
	db 2 ; number of items
	db SYM_CURSOR_R ; cursor tile number
	db SYM_SPACE ; tile behind cursor
	dw NULL ; function pointer if non-0

; loads in hl the pointer to attack's name.
; input:
;	d = deck index of card
; 	e = attack index (0 = first attack, 1 = second attack)
GetAttackName: ; 2c3fc (b:43fc)
	ld a, d
	call LoadCardDataToBuffer1_FromDeckIndex
	ld hl, wLoadedCard1Atk1Name
	inc e
	dec e
	jr z, .load_name
	ld hl, wLoadedCard1Atk2Name
.load_name
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

; returns carry if Defending Pokemon
; doesn't have an attack.
CheckIfDefendingPokemonHasAnyAttack: ; 2c40e (b:440e)
	call SwapTurn
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Atk1Category]
	cp POKEMON_POWER
	jr nz, .has_attack
	ld hl, wLoadedCard2Atk2Name
	ld a, [hli]
	or [hl]
	jr nz, .has_attack
	call SwapTurn
	scf
	ret
.has_attack
	call SwapTurn
	or a
	ret

; overwrites HP and Stage data of the card that was
; devolved in the Play Area to the values of new card.
; if the damage exceeds HP of pre-evolution,
; then HP is set to zero.
; input:
;	a = card index of pre-evolved card
UpdateDevolvedCardHPAndStage: ; 2c431 (b:4431)
	push bc
	push de
	push af
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld e, a
	call GetCardDamageAndMaxHP
	ld b, a ; store damage
	ld a, e
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	pop af

	ld [hl], a
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, e
	add DUELVARS_ARENA_CARD_HP
	ld l, a
	ld a, [wLoadedCard2HP]
	sub b ; subtract damage from new HP
	jr nc, .got_hp
	; damage exceeds HP
	xor a ; 0 HP
.got_hp
	ld [hl], a
	ld a, e
; overwrite card stage
	add DUELVARS_ARENA_CARD_STAGE
	ld l, a
	ld a, [wLoadedCard2Stage]
	ld [hl], a
	pop de
	pop bc
	ret

; reset various status after devolving card.
ResetDevolvedCardStatus: ; 2c45d (b:445d)
; if it's Arena card, clear status conditions
	ldh a, [hTempPlayAreaLocation_ff9d]
	or a
	jr nz, .skip_clear_status
	call ClearAllStatusConditions
.skip_clear_status
; reset changed color status
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_CHANGED_TYPE
	call GetTurnDuelistVariable
	ld [hl], $00
; reset C2 flags
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_FLAGS
	ld l, a
	ld [hl], $00
	ret

; prompts the Player with a Yes/No question
; whether to quit the screen, even though
; they can select more cards from list.
; [hCurSelectionItem] holds number of cards
; that were already selected by the Player.
; input:
;	- a = total number of cards that can be selected
; output:
;	- carry set if "No" was selected
AskWhetherToQuitSelectingCards: ; 2c476 (b:4476)
	ld hl, hCurSelectionItem
	sub [hl]
	ld l, a
	ld h, $00
	call LoadTxRam3
	ldtx hl, YouCanSelectMoreCardsQuitText
	call YesOrNoMenuWithText
	ret

; handles the selection of a forced switch by link/AI opponent or by the player.
; outputs the Play Area location of the chosen bench card in hTempPlayAreaLocation_ff9d.
DuelistSelectForcedSwitch: ; 2c487 (b:4487)
	ld a, DUELVARS_DUELIST_TYPE
	call GetNonTurnDuelistVariable
	cp DUELIST_TYPE_LINK_OPP
	jr z, .link_opp

	cp DUELIST_TYPE_PLAYER
	jr z, .player

; AI opponent
	call SwapTurn
	bank1call AIDoAction_ForcedSwitch
	call SwapTurn

	ld a, [wPlayerAttackingAttackIndex]
	ld e, a
	ld a, [wPlayerAttackingCardIndex]
	ld d, a
	ld a, [wPlayerAttackingCardID]
	call CopyAttackDataAndDamage_FromCardID
	call Func_16f6
	ret

.player
	ldtx hl, SelectPkmnOnBenchToSwitchWithActiveText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench
	ld a, $01
	ld [wcbd4], a
.asm_2c4c0
	bank1call OpenPlayAreaScreenForSelection
	jr c, .asm_2c4c0
	call SwapTurn
	ret

.link_opp
; get selection from link opponent
	ld a, OPPACTION_FORCE_SWITCH_ACTIVE
	call SetOppAction_SerialSendDuelData
.loop
	call SerialRecvByte
	jr nc, .received
	halt
	nop
	jr .loop
.received
	ldh [hTempPlayAreaLocation_ff9d], a
	ret

; returns in a the card index of energy card
; attached to Defending Pokemon
; that is to be discarded by the AI for an effect.
; outputs $ff is none was found.
; output:
;	a = deck index of attached energy card chosen
AIPickEnergyCardToDiscardFromDefendingPokemon: ; 2c4da (b:44da)
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies

	xor a
	call CreateArenaOrBenchEnergyCardList
	jr nc, .has_energy
	; no energy, return
	ld a, $ff
	jr .done

.has_energy
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex
	ld e, COLORLESS
	ld a, [wAttachedEnergies + COLORLESS]
	or a
	jr nz, .pick_color ; has colorless attached?

	; no colorless energy attached.
	; if it's colorless Pokemon, just
	; pick any energy card at random...
	ld a, [wLoadedCard1Type]
	cp COLORLESS
	jr nc, .choose_random

	; ...if not, check if it has its
	; own color energy attached.
	; if it doesn't, pick at random.
	ld e, a
	ld d, $00
	ld hl, wAttachedEnergies
	add hl, de
	ld a, [hl]
	or a
	jr z, .choose_random

; pick attached card with same color as e
.pick_color
	ld hl, wDuelTempList
.loop_energy
	ld a, [hli]
	cp $ff
	jr z, .choose_random
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	and TYPE_PKMN
	cp e
	jr nz, .loop_energy
	dec hl

.done_chosen
	ld a, [hl]
.done
	call SwapTurn
	ret

.choose_random
	call CountCardsInDuelTempList
	ld hl, wDuelTempList
	call ShuffleCards
	jr .done_chosen

; handles AI logic to pick attack for Amnesia
AIPickAttackForAmnesia: ; 2c532 (b:4532)
; load Defending Pokemon attacks
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	call HandleEnergyBurn
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	ld d, a
	call LoadCardDataToBuffer2_FromDeckIndex
; if has no attack 1 name, return
	ld hl, wLoadedCard2Atk1Name
	ld a, [hli]
	or [hl]
	jr z, .chosen

; if Defending Pokemon has enough energy for second attack, choose it
	ld e, SECOND_ATTACK
	bank1call _CheckIfEnoughEnergiesToAttack
	jr nc, .chosen
; otherwise if first attack isn't a Pkmn Power, choose it instead.
	ld e, FIRST_ATTACK_OR_PKMN_POWER
	ld a, [wLoadedCard2Atk1Category]
	cp POKEMON_POWER
	jr nz, .chosen
; if it is a Pkmn Power, choose second attack.
	ld e, SECOND_ATTACK
.chosen
	ld a, e
	call SwapTurn
	ret

; Return in a the PLAY_AREA_* of the non-turn holder's Pokemon card in bench with the lowest (remaining) HP.
; if multiple cards are tied for the lowest HP, the one with the highest PLAY_AREA_* is returned.
GetBenchPokemonWithLowestHP: ; 2c564 (b:4564)
	call SwapTurn
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	lb de, PLAY_AREA_ARENA, $ff
	ld b, d
	ld a, DUELVARS_BENCH1_CARD_HP
	call GetTurnDuelistVariable
	jr .start
; find Play Area location with least amount of HP
.loop_bench
	ld a, e
	cp [hl]
	jr c, .next ; skip if HP is higher
	ld e, [hl]
	ld d, b

.next
	inc hl
.start
	inc b
	dec c
	jr nz, .loop_bench

	ld a, d
	call SwapTurn
	ret

; handles drawing and selection of screen for
; choosing a color (excluding colorless), for use
; of Shift Pkmn Power and Conversion attacks.
; outputs in a the color that was selected or,
; if B was pressed, returns carry.
; input:
;	a  = Play Area location (PLAY_AREA_*), with:
;	     bit 7 not set if it's applying to opponent's card
;	     bit 7 set if it's applying to player's card
;	hl = text to be printed in the bottom box
; output:
;	a = color that was selected
HandleColorChangeScreen: ; 2c588 (b:4588)
	or a
	call z, SwapTurn
	push af
	call .DrawScreen
	pop af
	call z, SwapTurn

	ld hl, .menu_params
	xor a
	call InitializeMenuParameters
	call EnableLCD

.loop_input
	call DoFrame
	call HandleMenuInput
	jr nc, .loop_input
	cp -1 ; b pressed?
	jr z, .set_carry
	ld e, a
	ld d, $00
	ld hl, ShiftListItemToColor
	add hl, de
	ld a, [hl]
	or a
	ret
.set_carry
	scf
	ret

.menu_params
	db 1, 1 ; cursor x, cursor y
	db 2 ; y displacement between items
	db MAX_PLAY_AREA_POKEMON ; number of items
	db SYM_CURSOR_R ; cursor tile number
	db SYM_SPACE ; tile behind cursor
	dw NULL ; function pointer if non-0

.DrawScreen: ; 2c5be (b:45be)
	push hl
	push af
	call EmptyScreen
	call ZeroObjectPositions
	call LoadDuelCardSymbolTiles

; load card data
	pop af
	and $7f
	ld [wTempPlayAreaLocation_cceb], a
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex

; draw card gfx
	ld de, v0Tiles1 + $20 tiles ; destination offset of loaded gfx
	ld hl, wLoadedCard1Gfx
	ld a, [hli]
	ld h, [hl]
	ld l, a
	lb bc, $30, TILE_SIZE
	call LoadCardGfx
	bank1call SetBGP6OrSGB3ToCardPalette
	bank1call FlushAllPalettesOrSendPal23Packet
	ld a, $a0
	lb hl, 6, 1
	lb de, 9, 2
	lb bc, 8, 6
	call FillRectangle
	bank1call ApplyBGP6OrSGB3ToCardImage

; print card name and level at the top
	ld a, 16
	call CopyCardNameAndLevel
	ld [hl], $00
	lb de, 7, 0
	call InitTextPrinting
	ld hl, wDefaultText
	call ProcessText

; list all the colors
	ld hl, ShiftMenuData
	call PlaceTextItems

; print card's color, resistance and weakness
	ld a, [wTempPlayAreaLocation_cceb]
	call GetPlayAreaCardColor
	inc a
	lb bc, 15, 9
	call WriteByteToBGMap0
	ld a, [wTempPlayAreaLocation_cceb]
	call GetPlayAreaCardWeakness
	lb bc, 15, 10
	bank1call PrintCardPageWeaknessesOrResistances
	ld a, [wTempPlayAreaLocation_cceb]
	call GetPlayAreaCardResistance
	lb bc, 15, 11
	bank1call PrintCardPageWeaknessesOrResistances

	call DrawWideTextBox

; print list of color names on all list items
	lb de, 4, 1
	ldtx hl, ColorListText
	call InitTextPrinting_ProcessTextFromID

; print input hl to text box
	lb de, 1, 14
	pop hl
	call InitTextPrinting_ProcessTextFromID

; draw and apply palette to color icons
	ld hl, ColorTileAndBGP
	lb de, 2, 0
	ld c, NUM_COLORED_TYPES
.loop_colors
	ld a, [hli]
	push de
	push bc
	push hl
	lb hl, 1, 2
	lb bc, 2, 2
	call FillRectangle

	ld a, [wConsole]
	cp CONSOLE_CGB
	jr nz, .skip_vram1
	pop hl
	push hl
	call BankswitchVRAM1
	ld a, [hl]
	lb hl, 0, 0
	lb bc, 2, 2
	call FillRectangle
	call BankswitchVRAM0

.skip_vram1
	pop hl
	pop bc
	pop de
	inc hl
	inc e
	inc e
	dec c
	jr nz, .loop_colors
	ret

; loads wTxRam2 and wTxRam2_b:
; [wTxRam2]   <- wLoadedCard1Name
; [wTxRam2_b] <- input color as text symbol
; input:
;	a = type (color) constant
LoadCardNameAndInputColor: ; 2c686 (b:4686)
	add a
	ld e, a
	ld d, $00
	ld hl, ColorToTextSymbol
	add hl, de

; load wTxRam2 with card's name
	ld de, wTxRam2
	ld a, [wLoadedCard1Name]
	ld [de], a
	inc de
	ld a, [wLoadedCard1Name + 1]
	ld [de], a

; load wTxRam2_b with ColorToTextSymbol
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret

ShiftMenuData: ; 2c6a1 (b:46a1)
	; x, y, text id
	textitem 10,  9, TypeText
	textitem 10, 10, WeaknessText
	textitem 10, 11, ResistanceText
	db $ff

ColorTileAndBGP: ; 2c6ae (b:46ae)
	; tile, BG
	db $e4, $02
	db $e0, $01
	db $eC, $02
	db $e8, $01
	db $f0, $03
	db $f4, $03

ShiftListItemToColor: ; 2c6ba (b:46ba)
	db GRASS
	db FIRE
	db WATER
	db LIGHTNING
	db FIGHTING
	db PSYCHIC

ColorToTextSymbol:  ; 2c6c0 (b:46c0)
	tx FireSymbolText
	tx GrassSymbolText
	tx LightningSymbolText
	tx WaterSymbolText
	tx FightingSymbolText
	tx PsychicSymbolText

DrawSymbolOnPlayAreaCursor: ; 2c6cc (b:46cc)
	ld c, a
	add a
	add c
	add 2
	; a = 3*a + 2
	ld c, a
	ld a, b
	ld b, 0
	call WriteByteToBGMap0
	ret

; possibly unreferenced
Func_2c6d9: ; 2c6d9 (b:46d9)
	ldtx hl, IncompleteText
	call DrawWideTextBox_WaitForInput
	ret

PlayAreaSelectionMenuParameters: ; 2c6e0 (b:46e0)
	db 0, 0 ; cursor x, cursor y
	db 3 ; y displacement between items
	db MAX_PLAY_AREA_POKEMON ; number of items
	db SYM_CURSOR_R ; cursor tile number
	db SYM_SPACE ; tile behind cursor
	dw NULL ; function pointer if non-0

BenchSelectionMenuParameters: ; 2c6e8 (b:46e8)
	db 0, 3 ; cursor x, cursor y
	db 3 ; y displacement between items
	db MAX_PLAY_AREA_POKEMON ; number of items
	db SYM_CURSOR_R ; cursor tile number
	db SYM_SPACE ; tile behind cursor
	dw NULL ; function pointer if non-0

SpitPoison_AIEffect: ; 2c6f0 (b:46f0)
	ld hl, wDealtDamage
	ld a, [hli]
	or a
	ret z ; return if no damage dealt
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
	call LoadTxRam3
	ldtx hl, DiscardedCardsFromDeckText
	call DrawWideTextBox_PrintText
	call SwapTurn
	ret

; If heads, defending Pokemon becomes poisoned
SpitPoison_Poison50PercentEffect: ; 2c6f8 (b:46f8)
	ldtx de, PoisonCheckText
	call TossCoin_BankB
	jp c, PoisonEffect
	ld a, ATK_ANIM_SPIT_POISON_SUCCESS
	ld [wLoadedAttackAnimation], a
	call SetNoEffectFromStatus
	ret

; outputs in hTemp_ffa0 the result of the coin toss (0 = tails, 1 = heads).
; in case it was heads, stores in hTempPlayAreaLocation_ffa1
; the PLAY_AREA_* location of the Bench Pokemon that was selected for switch.
TerrorStrike_50PercentSelectSwitchPokemon: ; 2c70a (b:470a)
	ld a, (20 * 2) / 2
	lb de, 30, 70
	jp SetExpectedAIDamage
	

TerrorStrike_SwitchDefendingPokemon: ; 2c726 (b:4726)
	ld hl, 20 ; This number is for the damagecheck text directly below
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	add a
	call ATimes10
	call AddToDamage
	ret

PoisonFang_AIEffect: ; 2c730 (b:4730)
	ld a, 10
	lb de, 10, 10
	jp UpdateExpectedAIDamage_AccountForPoison

WeepinbellPoisonPowder_AIEffect: ; 2c738 (b:4738)
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

; return carry if there are no Pokemon cards in the non-turn holder's bench
VictreebelLure_AssertPokemonInBench: ; 2c740 (b:4740)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

; return in hTempPlayAreaLocation_ffa1 the PLAY_AREA_* location
; of the Bench Pokemon that was selected for switch
VictreebelLure_SelectSwitchPokemon: ; 2c74b (b:474b)
	ldtx hl, SelectPkmnOnBenchToSwitchWithActiveText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench
.select_pokemon
	bank1call OpenPlayAreaScreenForSelection
	jr c, .select_pokemon
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

; Return in hTemp_ffa0 the PLAY_AREA_* of the non-turn holder's Pokemon card in bench with the lowest (remaining) HP.
; if multiple cards are tied for the lowest HP, the one with the highest PLAY_AREA_* is returned.
VictreebelLure_GetBenchPokemonWithLowestHP: ; 2c764 (b:4764)
	call GetBenchPokemonWithLowestHP
	ldh [hTemp_ffa0], a
	ret

; Defending Pokemon is swapped out for the one with the PLAY_AREA_* at hTemp_ffa0
; unless Mew's Neutralizing Shield or Haunter's Transparency prevents it.
VictreebelLure_SwitchDefendingPokemon: ; 2c76a (b:476a)
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld e, a
	call HandleNShieldAndTransparency
	call nc, SwapArenaWithBenchPokemon
	call SwapTurn
	xor a
	ld [wDuelDisplayedScreen], a
	ret

; If heads, defending Pokemon can't retreat next turn
AcidEffect: ; 2c77e (b:477e)
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 4
	call TossCoinATimes_BankB
	call ATimes10
	call SetDefiniteDamage
	ret
	

GloomPoisonPowder_AIEffect: ; 2c78b (b:478b)
	ld a, 40 / 2
	lb de, 0, 40
	jp SetExpectedAIDamage

; Defending Pokemon and user become confused
FoulOdorEffect: ; 2c793 (b:4793)
	call ConfusionEffect
	call SwapTurn
	call ConfusionEffect
	call SwapTurn
	ret

; If heads, prevent all damage done to user next turn
KakunaStiffenEffect: ; 2c7a0 (b:47a0)
	ldtx de, IfHeadsNoDamageNextTurnText
	call TossCoin_BankB
	jp nc, SetWasUnsuccessful
	ld a, ATK_ANIM_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_NO_DAMAGE_STIFFEN
	call ApplySubstatus1ToDefendingCard
	ret

KakunaPoisonPowder_AIEffect: ; 2c7b4 (b:47b4)
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

GolbatLeechLifeEffect: ; 2c7bc (b:47bc)
	ld hl, wDealtDamage
	ld e, [hl]
	inc hl ; wDamageEffectiveness
	ld d, [hl]
	call ApplyAndAnimateHPRecovery
	ret

VenonatLeechLifeEffect: ; 2c7c6 (b:47c6)
	ld hl, wDealtDamage
	ld e, [hl]
	inc hl ; wDamageEffectiveness
	ld d, [hl]
	call ApplyAndAnimateHPRecovery
	ret

; During your next turn, double damage
SwordsDanceEffect: ; 2c7d0 (b:47d0)
	ld a, [wTempTurnDuelistCardID]
	cp HERACROSS
	ret nz
	ld a, SUBSTATUS1_NEXT_TURN_DOUBLE_DAMAGE
	call ApplySubstatus1ToDefendingCard
	ret

; If heads, defending Pokemon becomes confused
ZubatSupersonicEffect: ; 2c7dc (b:47dc)
	call Confusion50PercentEffect
	call nc, SetNoEffectFromStatus
	ret

ZubatLeechLifeEffect: ; 2c7e3 (b:47e3)
	ld hl, wDealtDamage
	ld e, [hl]
	inc hl
	ld d, [hl]
	call ApplyAndAnimateHPRecovery
	ret

Twineedle_AIEffect: ; 2c7ed (b:47ed)
	ld a, 40 / 2
	lb de, 0, 40
	jp SetExpectedAIDamage

Twineedle_MultiplierEffect: ; 2c7f5 (b:47f5)
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	add a ; a = 2 * heads
	call ATimes10
	call SetDefiniteDamage
	ret
	
BeedrillPoisonSting_AIEffect: ; 2c80d (b:480d)
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

ExeggcuteLeechSeedEffect: ; 2c815 (b:4815)
	ld a, 1
	ldh [hCurSelectionItem], a

	call SwapTurn
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld b, 0
	ld e, b
	jr .next_pkmn

.check_damage
	push de
	push bc
	call .DisplayText
	ld de, $0
	call SwapTurn
	call TossCoin_BankB
	call SwapTurn
	push af
	call GetNextPositionInTempList
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
	call GetNextPositionInTempList
	ld [hl], $ff
	ld a, b
	ldh [hTemp_ffa0], a
	call Func_3b21
	call SwapTurn

; tally recoil damage
	ldh a, [hTemp_ffa0]
	or a
	jr z, .skip_recoil

.skip_recoil

; deal damage for Bench Pokemon that got heads
	call SwapTurn
	ld hl, hTempPlayAreaLocation_ffa1
	ld b, PLAY_AREA_BENCH_1
.loop_bench
	ld a, [hli]
	cp $ff
	jr z, .done
	or a
	jr z, .skip_damage ; skip if tails
	ld de, 20
	call DealDamageToPlayAreaPokemon_RegularAnim
.skip_damage
	inc b
	jr .loop_bench

.done
	call SwapTurn
	ret

; displays text for current Bench Pokemon,
; printing its Bench number and name.
.DisplayText ; 2e491 (b:6491)
	ld b, e
	ldtx hl, BenchText
	ld de, wDefaultText
	call CopyText
	ld a, $30 ; 0 FW character
	add b
	ld [de], a
	inc de
	ld a, $20 ; space FW character
	ld [de], a
	inc de

	ld a, DUELVARS_ARENA_CARD
	add b
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer2_FromDeckIndex
	ld hl, wLoadedCard2Name
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyText

	xor a
	ld [wDuelDisplayedScreen], a
	ret

FoulGas_AIEffect: ; 2c822 (b:4822)
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage

; If heads, defending Pokemon becomes poisoned. If tails, defending Pokemon becomes confused
FoulGas_PoisonOrConfusionEffect: ; 2c82a (b:482a)
	ldtx de, PoisonedIfHeadsConfusedIfTailsText
	call TossCoin_BankB
	jp c, PoisonEffect
	jp ConfusionEffect

; an exact copy of KakunaStiffenEffect
; If heads, prevent all damage done to user next turn
MetapodStiffenEffect: ; 2c836 (b:4836)
	ldtx de, IfHeadsNoDamageNextTurnText
	call TossCoin_BankB
	jp nc, SetWasUnsuccessful
	ld a, ATK_ANIM_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_NO_DAMAGE_STIFFEN
	call ApplySubstatus1ToDefendingCard
	ret

; returns carry if no cards in Deck or if
; Play Area is full already.
Sprout_CheckDeckAndPlayArea: ; 2c84a (b:484a)
	call CheckIfDeckIsEmpty
	ret c ; return if no cards in deck
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, NoSpaceOnTheBenchText
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ret

Sprout_PlayerSelectEffect: ; 2c85a (b:485a)
	ld a, $ff
	ldh [hTemp_ffa0], a

	call CreateDeckCardList
	ldtx hl, ChooseAnOddishFromDeckText
	ldtx bc, OddishText
	lb de, SEARCHEFFECT_CARD_ID, SUNKERN
	call LookForCardsInDeck
	ret c

; draw Deck list interface and print text
	bank1call Func_5591
	ldtx hl, ChooseAnOddishText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText

.loop
	bank1call DisplayCardList
	jr c, .pressed_b
	call GetCardIDFromDeckIndex
	ld bc, SUNKERN
	call CompareDEtoBC
	jr nz, .play_sfx

; Oddish was selected
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
; that is, if the Deck has no Oddish card.
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop_b_press
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	ld a, l
	call GetCardIDFromDeckIndex
	ld bc, SUNKERN
	call CompareDEtoBC
	jr z, .play_sfx ; found Oddish, go back to top loop
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_b_press

; no Oddish in Deck, can safely exit screen
	ld a, $ff
	ldh [hTemp_ffa0], a
	or a
	ret

Sprout_AISelectEffect: ; 2c8b7 (b:48b7)
	call CreateDeckCardList
	ld hl, wDuelTempList
.loop_deck
	ld a, [hli]
	ldh [hTemp_ffa0], a
	cp $ff
	ret z ; no Oddish
	call GetCardIDFromDeckIndex
	ld a, e
	cp SUNKERN
	jr nz, .loop_deck
	ret ; Oddish found

Sprout_PutInPlayAreaEffect: ; 2c8cc (b:48cc)
	ldh a, [hTemp_ffa0]
	cp $ff
	jr z, .shuffle
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	call PutHandPokemonCardInPlayArea
	call IsPlayerTurn
	jr c, .shuffle
	; display card on screen
	ldh a, [hTemp_ffa0]
	ldtx hl, PlacedOnTheBenchText
	bank1call DisplayCardDetailScreen
.shuffle
	call Func_2c0bd
	ret

; returns carry if no Pokemon on Bench
Teleport_CheckBench: ; 2c8ec (b:48ec)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, ThereAreNoPokemonOnBenchText
	cp 2
	ret

Teleport_PlayerSelectEffect: ; 2c8f7 (b:48f7)
	ldtx hl, DiscardOppDeckAsManyFireEnergyCardsText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInBench
	ld a, $01
	ld [wcbd4], a
.loop
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret

Teleport_AISelectEffect: ; 2c90f (b:490f)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	call Random
	ldh [hTemp_ffa0], a
	ret

Teleport_SwitchEffect: ; 2c91a (b:491a)
	ldh a, [hTemp_ffa0]
	ld e, a
	call SwapArenaWithBenchPokemon
	xor a
	ld [wDuelDisplayedScreen], a
	ret

BigEggsplosion_AIEffect: ; 2c925 (b:4925) ;Gets attached energies, AI understand this code.
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld e, a
	call GetPlayAreaCardAttachedEnergies
	ld a, [wTotalAttachedEnergies]
	call SetDamageToATimes20
	inc h
	jr nz, .capped
	ld l, 255
.capped
	ld a, l
	ld [wAIMaxDamage], a
	srl a
	ld [wDamage], a
	xor a
	ld [wAIMinDamage], a
	ret

; Flip coins equal to attached energies; deal 20x number of heads
BigEggsplosion_MultiplierEffect: ; 2c944 (b:4944)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld hl, 30 ;This is just for text purposes
	call LoadTxRam3
	ld a, [wTotalAttachedEnergies]
	ldtx de, DamageCheckIfHeadsXDamageText
	call TossCoinATimes_BankB
;	fallthrough

; set damage to 20*a. Also return result in hl
SetDamageToATimes20: ; 2c958 (b:4958) ;Modified to be 30 in a very convoluted way
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
	ret

Thrash_AIEffect: ; 2c96b (b:496b)
	ld a, (30 + 40) / 2
	lb de, 30, 40
	jp SetExpectedAIDamage


Thrash_ModifierEffect: ; 2c973 (b:4973)
	ld hl, 20
	call LoadTxRam3
	ldtx de, IfTailsDamageToYourselfTooText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret

Thrash_RecoilEffect: ; 2c982 (b:4982)
	ld hl, 20
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if got heads
	ld a, 20
	call DealRecoilDamageToSelf
	ret

Toxic_AIEffect: ; 2c98c (b:498c)
	ld a, 20
	lb de, 20, 20
	jp UpdateExpectedAIDamage

; Defending Pok??mon becomes double poisoned (takes 20 damage per turn rather than 10)
Toxic_DoublePoisonEffect: ; 2c994 (b:4994)
	call DoublePoisonEffect
	ret

BoyfriendsEffect: ; 2c998 (b:4998)
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	ld c, PLAY_AREA_ARENA
.loop
	ld a, [hl]
	cp $ff
	jr z, .done
	call GetCardIDFromDeckIndex
	ld a, e
	cp UNOWN_A
	jr nz, .next
	ld a, d
	cp $00 ; why check d? Card IDs are only 1 byte long
	jr nz, .next
	inc c
.next
	inc hl
	jr .loop
.done
; c holds number of Nidoking found in Play Area ; it's now Unown A
	ld a, c
	add a
	call ATimes10
	call SetDefiniteDamage ; adds 2 * 10 * c
	ret

NidoranFFurySwipes_AIEffect: ; 2c9be (b:49be)
	ld a, 30 / 2
	lb de, 0, 30
	jp SetExpectedAIDamage

NidoranFFurySwipes_MultiplierEffect: ; 2c9c6 (b:49c6)
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 3
	call TossCoinATimes_BankB
	call ATimes10
	call SetDefiniteDamage
	ret

NidoranFCallForFamily_CheckDeckAndPlayArea: ; 2c9db (b:49db)
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	and USED_PKMN_POWER_THIS_TURN
	jr nz, .already_used

	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]

	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret

.already_used
	ldtx hl, OnlyOncePerTurnText
	scf
	ret


NidoranFCallForFamily_PlayerSelectEffect: ; 2c9eb (b:49eb) ;Self trainer lock test
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS3
	call GetTurnDuelistVariable
	set SUBSTATUS3_HEADACHE, [hl]
	ret
	

NidoranFCallForFamily_AISelectEffect: ; 2ca55 (b:4a55)
	

NidoranFCallForFamily_PutInPlayAreaEffect: ; 2ca6e (b:4a6e)
	

HornHazard_AIEffect: ; 2ca8e (b:4a8e)
	ld a, 30 / 2
	lb de, 0, 30
	jp SetExpectedAIDamage

HornHazard_NoDamage50PercentEffect: ; 2ca96 (b:4a96)
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin_BankB
	jr c, .heads
	xor a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret
.heads
	ld a, ATK_ANIM_HIT
	ld [wLoadedAttackAnimation], a
	ret

NidorinaSupersonicEffect: ; 2caac (b:4aac)
	call Confusion50PercentEffect
	call nc, SetNoEffectFromStatus
	ret

NidorinaDoubleKick_AIEffect: ; 2cab3 (b:4ab3)
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage

NidorinaDoubleKick_MultiplierEffect: ; 2cabb (b:4abb)
	ldtx de, UnableToRetreatDueToAcidText
	call TossCoin_BankB
	jp c, ParalysisEffect
	jp ConfusionEffect

NidorinoDoubleKick_AIEffect: ; 2cad3 (b:4ad3)
	ld a, 60 / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

NidorinoDoubleKick_MultiplierEffect: ; 2cabb (b:4abb)
	ld hl, 30
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	ld e, a
	add a
	add e
	call ATimes10
	call SetDefiniteDamage
	ret

ButterfreeWhirlwind_CheckBench: ; 2caf3 (b:4af3)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	jr nc, .has_bench
	; no bench, do not do effect
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret
.has_bench
	call DuelistSelectForcedSwitch
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret

ButterfreeWhirlwind_SwitchEffect: ; 2cb09 (b:4b09)
	ldh a, [hTemp_ffa0]
	call HandleSwitchDefendingPokemonEffect
	ret

ButterfreeMegaDrainEffect: ; 2cb0f (b:4b0f)
	ld hl, wDealtDamage
	ld a, [hli]
	ld h, [hl]
	ld l, a
	srl h
	rr l
	bit 0, l
	jr z, .rounded
	; round up to nearest 10
	ld de, 10 / 2
	add hl, de
.rounded
	ld e, l
	ld d, h
	call ApplyAndAnimateHPRecovery
	ret

WeedlePoisonSting_AIEffect: ; 2cb27 (b:4b27)
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

IvysaurPoisonPowder_AIEffect: ; 2cb2f (b:4b2f)
	ld a, 10
	lb de, 10, 10
	jp UpdateExpectedAIDamage_AccountForPoison

BulbasaurLeechSeedEffect: ; 2cb37 (b:4b37)
	ld hl, wDealtDamage
	ld a, [hli]
	or a
	ret z ; return if no damage dealt
	ld de, 10
	call ApplyAndAnimateHPRecovery
	ret

; returns carry if no Grass Energy in Play Area
EnergyTrans_CheckPlayArea: ; 2cb44 (b:4b44)
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret c ; cannot use Pkmn Power

; search in Play Area for at least 1 Grass Energy type
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop_deck
	ld a, [hl]
	and CARD_LOCATION_PLAY_AREA
	jr z, .next
	push hl
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop hl
	cp TYPE_ENERGY_GRASS
	ret z
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_deck

; none found
	ldtx hl, NoGrassEnergyText
	scf
	ret

EnergyTrans_PrintProcedure: ; 2cb6f (b:4b6f)
	ldtx hl, ProcedureForEnergyTransferText
	bank1call DrawWholeScreenTextBox
	or a
	ret

EnergyTrans_TransferEffect: ; 2cb77 (b:4b77)
	ld a, DUELVARS_DUELIST_TYPE
	call GetTurnDuelistVariable
	cp DUELIST_TYPE_PLAYER
	jr z, .player
; not player
	bank1call Func_61a1
	bank1call PrintPlayAreaCardList_EnableLCD
	ret

.player
	xor a
	ldh [hCurSelectionItem], a
	bank1call Func_61a1

.draw_play_area
	bank1call PrintPlayAreaCardList_EnableLCD
	push af
	ldh a, [hCurSelectionItem]
	ld hl, PlayAreaSelectionMenuParameters
	call InitializeMenuParameters
	pop af
	ld [wNumMenuItems], a

; handle the action of taking a Grass Energy card
.loop_input_take
	call DoFrame
	call HandleMenuInput
	jr nc, .loop_input_take
	cp -1 ; b press?
	ret z

; a press
	ldh [hAIPkmnPowerEffectParam], a
	ldh [hCurSelectionItem], a
	call CheckIfCardHasGrassEnergyAttached
	jr c, .play_sfx ; no Grass attached

	ldh [hAIEnergyTransEnergyCard], a
	ldh a, [hAIEnergyTransEnergyCard] ; useless
	; temporarily take card away to draw Play Area
	call AddCardToHand
	bank1call PrintPlayAreaCardList_EnableLCD
	ldh a, [hAIPkmnPowerEffectParam]
	ld e, a
	ldh a, [hAIEnergyTransEnergyCard]
	; give card back
	call PutHandCardInPlayArea

	; draw Grass symbol near cursor
	ldh a, [hAIPkmnPowerEffectParam]
	ld b, SYM_GRASS
	call DrawSymbolOnPlayAreaCursor

; handle the action of placing a Grass Energy card
.loop_input_put
	call DoFrame
	call HandleMenuInput
	jr nc, .loop_input_put
	cp -1 ; b press?
	jr z, .remove_symbol

; a press
	ldh [hCurSelectionItem], a
	ldh [hAIEnergyTransPlayAreaLocation], a
	ld a, OPPACTION_6B15
	call SetOppAction_SerialSendDuelData
	ldh a, [hAIEnergyTransPlayAreaLocation]
	ld e, a
	ldh a, [hAIEnergyTransEnergyCard]
	; give card being held to this Pokemon
	call AddCardToHand
	call PutHandCardInPlayArea

.remove_symbol
	ldh a, [hAIPkmnPowerEffectParam]
	ld b, SYM_SPACE
	call DrawSymbolOnPlayAreaCursor
	call EraseCursor
	jr .draw_play_area

.play_sfx
	call Func_3794
	jr .loop_input_take

EnergyTrans_AIEffect: ; 2cbfb (b:4bfb)
	ldh a, [hAIEnergyTransPlayAreaLocation]
	ld e, a
	ldh a, [hAIEnergyTransEnergyCard]
	call AddCardToHand
	call PutHandCardInPlayArea
	bank1call PrintPlayAreaCardList_EnableLCD
	ret

; returns carry if no Grass Energy cards
; attached to card in Play Area location of a.
; input:
;	a = PLAY_AREA_* of location to check
CheckIfCardHasGrassEnergyAttached: ; 2cc0a (b:4c0a)
	or CARD_LOCATION_PLAY_AREA
	ld e, a

	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp e
	jr nz, .next
	push de
	push hl
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop hl
	pop de
	cp TYPE_ENERGY_GRASS
	jr z, .no_carry
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
	scf
	ret
.no_carry
	ld a, l
	or a
	ret

GrimerMinimizeEffect: ; 2cc30 (b:4c30)
	ld a, SUBSTATUS1_REDUCE_BY_20
	call ApplySubstatus1ToDefendingCard
	ret

ToxicGasEffect: ; 2cc36 (b:4c36)
	scf
	ret

Sludge_AIEffect: ; 2cc38 (b:4c38)
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

; returns carry if no cards in Deck
; or if Play Area is full already.
BellsproutCallForFamily_CheckDeckAndPlayArea: ; 2cc40 (b:4c40) ; FREE
	ldtx de, IfHeadsDoNotReceiveDamageOrEffectText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, ATK_ANIM_STONE_BARRAGE
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_AGILITY
	call ApplySubstatus1ToDefendingCard
	ret

BellsproutCallForFamily_PlayerSelectEffect: ; 2cc50 (b:4c50)
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if got heads
	call ParalysisEffect
	ret

BellsproutCallForFamily_AISelectEffect: ; 2ccad (b:4cad)
	ld a, (40 + 60) / 2
	lb de, 40, 60
	jp SetExpectedAIDamage

BellsproutCallForFamily_PutInPlayAreaEffect: ; 2ccc2 (b:4cc2)
	ldtx de, BatteriesHaveLostTheirChargeText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret nc ; return if got tails
	ld a, 20
	call AddToDamage
	ld a, ATK_ANIM_THUNDER
	ld [wLoadedAttackAnimation], a
	ret

WeezingSmog_AIEffect: ; 2cce2 (b:4ce2)
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

WeezingSelfdestructEffect: ; 2ccea (b:4cea)
	ld a, 50
	call DealRecoilDamageToSelf
	ld a, $01
	ld [wIsDamageToSelf], a
	ld a, 20
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	xor a
	ld [wIsDamageToSelf], a
	ld a, 20
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	ret

Shift_OncePerTurnCheck: ; 2cd09 (b:4d09)
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	and USED_PKMN_POWER_THIS_TURN
	jr nz, .already_used
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret
.already_used
	ldtx hl, OnlyOncePerTurnText
	scf
	ret

Shift_PlayerSelectEffect: ; 2cd21 (b:4d21)
	ldtx hl, ChoosePokemonWishToColorChangeText
	ldh a, [hTemp_ffa0]
	or $80
	call HandleColorChangeScreen
	ldh [hAIPkmnPowerEffectParam], a
	ret c ; cancelled

; check whether the color selected is valid
	; look in Turn Duelist's Play Area
	call .CheckColorInPlayArea
	ret nc
	; look in NonTurn Duelist's Play Area
	call SwapTurn
	call .CheckColorInPlayArea
	call SwapTurn
	ret nc
	; not found in either Duelist's Play Area
	ldtx hl, UnableToSelectText
	call DrawWideTextBox_WaitForInput
	jr Shift_PlayerSelectEffect ; loop back to start

; checks in input color in a exists in Turn Duelist's Play Area
; returns carry if not found.
.CheckColorInPlayArea: ; 2cd44 (b:4d44)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld b, PLAY_AREA_ARENA
.loop_play_area
	push bc
	ld a, b
	call GetPlayAreaCardColor
	pop bc
	ld hl, hAIPkmnPowerEffectParam
	cp [hl]
	ret z ; found
	inc b
	dec c
	jr nz, .loop_play_area
	; not found
	scf
	ret

Shift_ChangeColorEffect: ; 2cd5d (b:4d5d)
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex

	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]

	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_CHANGED_TYPE
	ld l, a
	ldh a, [hAIPkmnPowerEffectParam]
	or HAS_CHANGED_COLOR
	ld [hl], a
	call LoadCardNameAndInputColor
	ldtx hl, ChangedTheColorOfText
	call DrawWideTextBox_WaitForInput
	ret

VenomPowder_AIEffect: ; 2cd84 (b:4d84)
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage

VenomPowder_PoisonConfusion50PercentEffect: ; 2cd8c (b:4d8c)
	ldtx de, VenomPowderCheckText
	call TossCoin_BankB
	ret nc ; return if tails

; heads
	call PoisonEffect
	call ConfusionEffect
	ret c
	ld a, CONFUSED | POISONED
	ld [wNoEffectFromWhichStatus], a
	ret

TangelaPoisonPowder_AIEffect: ; 2cda0 (b:4da0)
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

Heal_OncePerTurnCheck: ; 2cda8 (b:4da8)
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	and USED_PKMN_POWER_THIS_TURN
	jr nz, .already_used

	call CheckIfPlayAreaHasAnyDamage
	ldtx hl, NoPokemonWithDamageCountersText
	ret c ; no damage counters to heal

	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret

.already_used
	ldtx hl, OnlyOncePerTurnText
	scf
	ret

Heal_RemoveDamageEffect: ; 2cdc7 (b:4dc7)
	ldtx de, IfHeadsHealIsSuccessfulText

	ld a, DUELVARS_DUELIST_TYPE
	call GetTurnDuelistVariable
	cp DUELIST_TYPE_LINK_OPP
	jr z, .link_opp
	and DUELIST_TYPE_AI_OPP
	jr nz, .done

; player
	ldtx hl, ChoosePkmnToRemoveDamageCounterText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInPlayArea
.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hPlayAreaEffectTarget], a
	ld e, a
	call GetCardDamageAndMaxHP
	or a
	jr z, .loop_input ; has no damage counters
	ldh a, [hTempPlayAreaLocation_ff9d]
	call SerialSend8Bytes
	jr .done

.link_opp
	call SerialRecv8Bytes
	ldh [hPlayAreaEffectTarget], a
	; fallthrough

.done
; flag Pkmn Power as being used regardless of coin outcome
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ldh a, [hAIPkmnPowerEffectParam]
	or a
	ret z ; return if coin was tails

	ldh a, [hPlayAreaEffectTarget]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	add 10 ; remove 1 damage counter
	ld [hl], a
	ldh a, [hPlayAreaEffectTarget]
	call Func_2c10b
	call ExchangeRNG
	ret

PetalDance_AIEffect: ; 2ce23 (b:4e23)
	ld a, 120 / 2
	lb de, 0, 120
	jp SetExpectedAIDamage

PetalDance_MultiplierEffect: ; 2ce2b (b:4e2b)
	ld hl, 40
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 3
	call TossCoinATimes_BankB
	add a
	add a
	call ATimes10
	; a = 4 * 10 * heads
	call SetDefiniteDamage
	call SwapTurn
	call ConfusionEffect
	call SwapTurn
	ret

PoisonWhip_AIEffect: ; 2ce4b (b:4e4b)
	ld a, 10
	lb de, 10, 10
	jp UpdateExpectedAIDamage_AccountForPoison

SolarPower_CheckUse: ; 2ce53 (b:4e53)
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	and USED_PKMN_POWER_THIS_TURN
	jr nz, .already_used

	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret c ; can't use PKMN due to status or Toxic Gas

; return carry if none of the Arena cards have status conditions
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetTurnDuelistVariable
	or a
	jr nz, .has_status
	jr z, .no_status
.has_status
	or a
	ret
.already_used
	ldtx hl, OnlyOncePerTurnText
	scf
	ret
.no_status
	ldtx hl, NotAffectedByPoisonSleepParalysisOrConfusionText
	scf
	ret

SolarPower_RemoveStatusEffect: ; 2ce82 (b:4e82)
	ld a, ATK_ANIM_HEAL
	ld [wLoadedAttackAnimation], a
	bank1call Func_7415
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation

	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ld l, DUELVARS_ARENA_CARD_STATUS
	ld [hl], NO_STATUS


	bank1call DrawDuelHUDs
	ret

VenusaurMegaDrainEffect: ; 2ceb0 (b:4eb0)
	ld hl, wDealtDamage
	ld a, [hli]
	ld h, [hl]
	ld l, a
	srl h
	rr l
	bit 0, l
	jr z, .rounded
	; round up to nearest 10
	ld de, 10 / 2
	add hl, de
.rounded
	ld e, l
	ld d, h
	call ApplyAndAnimateHPRecovery
	ret

; applies the damage bonus for attacks that get bonus
; from extra Water energy cards.
; this bonus is always 10 more damage for each extra Water energy
; and is always capped at a maximum of 20 damage.
; input:
;	b = number of Water energy cards needed for paying Energy Cost
;	c = number of colorless energy cards needed for paying Energy Cost
ApplyExtraWaterEnergyDamageBonus: ; 2cec8 (b:4ec8)
	ld a, [wMetronomeEnergyCost]
	or a
	jr z, .not_metronome
	ld c, a ; amount of colorless needed for Metronome
	ld b, 0 ; no Water energy needed for Metronome

.not_metronome
	push bc
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld e, a
	call GetPlayAreaCardAttachedEnergies
	pop bc

	ld hl, wAttachedEnergies + WATER
	ld a, c
	or a
	jr z, .check_bonus ; is Energy cost all water energy?

	; it's not, so we need to remove the
	; Water energy cards from calculations
	; if they pay for colorless instead.
	ld a, [wTotalAttachedEnergies]
	cp [hl]
	jr nz, .check_bonus ; skip if at least 1 non-Water energy attached

	; Water is the only energy color attached
	ld a, c
	add b
	ld b, a
	; b += c

.check_bonus
	ld a, [hl]
	sub b
	jr c, .skip_bonus ; is water energy <  b?
	jr z, .skip_bonus ; is water energy == b?

; a holds number of water energy not payed for energy cost
	cp 3
	jr c, .less_than_3
	ld a, 2 ; cap this to 2 for bonus effect
.less_than_3
	call ATimes10
	call AddToDamage ; add 10 * a to damage

.skip_bonus
	ld a, [wDamage]
	ld [wAIMinDamage], a
	ld [wAIMaxDamage], a
	ret

OmastarWaterGunEffect: ; 2cf05 (b:4f05)
	lb bc, 1, 1
	jr ApplyExtraWaterEnergyDamageBonus

OmastarSpikeCannon_AIEffect: ; 2cf0a (b:4f0a)
	ld a, 60 / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

OmastarSpikeCannon_MultiplierEffect: ; 2cf12 (b:4f12)
	ld hl, 30
	call LoadTxRam3
	ld a, 2
	ldtx de, DamageCheckIfHeadsXDamageText
	call TossCoinATimes_BankB
	ld e, a
	add a
	add e
	call ATimes10
	call SetDefiniteDamage ; 3 * 10 * heads
	ret

ClairvoyanceEffect: ; 2cf2a (b:4f2a)
	scf
	ret

OmanyteWaterGunEffect: ; 2cf2c (b:4f2c)
	lb bc, 1, 0
	jp ApplyExtraWaterEnergyDamageBonus

WartortleWithdrawEffect: ; 2cf32 (b:4f32)
	ldtx de, BubbleShowerText
	call TossCoin_BankB
	ret nc
	call ParalysisEffect
	call SwapTurn
	xor a
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	ret

RainDanceEffect: ; 2cf46 (b:4f46)
	scf
	ret

HydroPumpEffect: ; 2cf48 (b:4f48)
	lb bc, 3, 0
	jp ApplyExtraWaterEnergyDamageBonus

KinglerFlail_AIEffect: ; 2cf4e (b:4f4e)
	call KinglerFlail_HPCheck
	jp SetDefiniteAIDamage

KinglerFlail_HPCheck: ; 2cf54 (b:4f54)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call SetDefiniteDamage
	ret

; returns carry if no cards in Deck
; or if Play Area is full already.


KrabbyCallForFamily_CheckDeckAndPlayArea: ; 2cf5d (b:4f5d)
	call CheckIfDeckIsEmpty
	ret c ; return if no cards in deck
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, NoSpaceOnTheBenchText
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ret

KrabbyCallForFamily_PlayerSelectEffect: ; 2cf6d (b:4f6d)
	ld a, $ff
	ldh [hTemp_ffa0], a

	call CreateDeckCardList
	ldtx hl, ChooseNidoranFromDeckText
	ldtx bc, NidoranMNidoranFText
	lb de, SEARCHEFFECT_NIDORAN, $00
	call LookForCardsInDeck
	ret c

; draw Deck list interface and print text
	bank1call Func_5591
	ldtx hl, ChooseNidoranText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText

.loop
	bank1call DisplayCardList
	jr c, .pressed_b
	call GetCardIDFromDeckIndex
	ld bc, UNOWN_A
	call CompareDEtoBC
	jr z, .selected_nidoran
	ld bc, UNOWN_J
	call CompareDEtoBC
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
	call GetTurnDuelistVariable
.loop_b_press
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	ld a, l
	call GetCardIDFromDeckIndex
	ld bc, UNOWN_A
	call CompareDEtoBC
	jr z, .play_sfx ; found, go back to top loop
	ld bc, UNOWN_J
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

KrabbyCallForFamily_AISelectEffect: ; 2cfdf (b:4fdf)
	call CreateDeckCardList
	ld hl, wDuelTempList
.loop_deck
	ld a, [hli]
	ldh [hTemp_ffa0], a
	cp $ff
	ret z ; none found
	call GetCardIDFromDeckIndex
	ld a, e
	cp UNOWN_A
	jr z, .found
	cp UNOWN_J
	jr nz, .loop_deck
.found
	ret

KrabbyCallForFamily_PutInPlayAreaEffect: ; 2cfca (b:4fca)
	ldh a, [hTemp_ffa0]
	cp $ff
	jr z, .shuffle
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	call PutHandPokemonCardInPlayArea
	call IsPlayerTurn
	jr c, .shuffle
	; display card on screen
	ldh a, [hTemp_ffa0]
	ldtx hl, PlacedOnTheBenchText
	bank1call DisplayCardDetailScreen
.shuffle
	call Func_2c0bd
	ret

MagikarpFlail_AIEffect: ; 2cfff (b:4fff)
	call MagikarpFlail_HPCheck
	jp SetDefiniteAIDamage

MagikarpFlail_HPCheck: ; 2d005 (b:5005)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call SetDefiniteDamage
	ret

HeadacheEffect: ; 2d00e (b:500e)
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS3
	call GetNonTurnDuelistVariable
	set SUBSTATUS3_HEADACHE, [hl]
	ret

PsyduckFurySwipes_AIEffect: ; 2d016 (b:5016)
	ld a, 30 / 2
	lb de, 0, 30
	jp SetExpectedAIDamage

PsyduckFurySwipes_MultiplierEffect: ; 2d01e (b:501e)
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 3
	call TossCoinATimes_BankB
	call ATimes10
	call SetDefiniteDamage
	ret

GolduckHyperBeam_PlayerSelectEffect: ; 2d033 (b:5033)
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wTotalAttachedEnergies]
	or a
	jr z, .no_energy

; draw Energy Card list screen
	ldtx hl, ChooseDiscardEnergyCardFromOpponentText
	call DrawWideTextBox_WaitForInput
	xor a ; PLAY_AREA_ARENA
	call CreateArenaOrBenchEnergyCardList
	xor a ; PLAY_AREA_ARENA
	bank1call DisplayEnergyDiscardScreen

.loop_input
	bank1call HandleEnergyDiscardMenuInput
	jr c, .loop_input

	call SwapTurn
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a ; store selected card to discard
	ret

.no_energy
	call SwapTurn
	ld a, $ff
	ldh [hTemp_ffa0], a
	or a
	ret

GolduckHyperBeam_AISelectEffect: ; 2d065 (b:5065)
	call AIPickEnergyCardToDiscardFromDefendingPokemon
	ldh [hTemp_ffa0], a
	ret

GolduckHyperBeam_DiscardEffect: ; 2d06b (b:506b)
	call HandleNoDamageOrEffect
	ret c ; return if attack had no effect

	; check if energy card was chosen to discard
	ldh a, [hTemp_ffa0]
	cp $ff
	ret z ; return if none selected

	; discard Defending card's energy
	call SwapTurn
	call PutCardInDiscardPile
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_EFFECT
	call GetTurnDuelistVariable
	ld [hl], LAST_TURN_EFFECT_DISCARD_ENERGY
	call SwapTurn
	ret

SeadraWaterGunEffect: ; 2d085 (b:5085)
	lb bc, 1, 2
	jp ImakuniEffect

SeadraAgilityEffect: ; 2d08b (b:508b)
	ldtx de, IfHeadsDoNotReceiveDamageOrEffectText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, ATK_ANIM_STONE_BARRAGE
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_AGILITY
	call ApplySubstatus1ToDefendingCard
	ret

ShellderSupersonicEffect: ; 2d09d (b:509d)
	call Confusion50PercentEffect
	call nc, SetNoEffectFromStatus
	ret

HideInShellEffect: ; 2d0a4 (b:50a4)
	ldtx de, IfHeadsNoDamageNextTurnText
	call TossCoin_BankB
	jp nc, SetWasUnsuccessful
	ld a, ATK_ANIM_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_NO_DAMAGE_11
	call ApplySubstatus1ToDefendingCard
	ret

VaporeonQuickAttack_AIEffect: ; 2d0b8 (b:50b8)
	ld a, (10 + 30) / 2
	lb de, 10, 30
	jp SetExpectedAIDamage

VaporeonQuickAttack_DamageBoostEffect: ; 2d0c0 (b:50c0)
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, 20
	call AddToDamage
	ret

VaporeonWaterGunEffect: ; 2d0d3 (b:50d3)
	lb bc, 2, 1
	jp ApplyExtraWaterEnergyDamageBonus

; returns carry if Arena card has no Water Energy attached
; or if it doesn't have any damage counters.
StarmieRecover_CheckEnergyHP: ; 2d0d9 (b:50d9)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wAttachedEnergies + WATER]
	ldtx hl, NotEnoughWaterEnergyText
	cp 1
	ret c ; return if not enough energy
	call GetCardDamageAndMaxHP
	ldtx hl, NoDamageCountersText
	cp 10
	ret ; return carry if no damage

StarmieRecover_PlayerSelectEffect: ; 2d0f0 (b:50f0)
	ld a, TYPE_ENERGY_WATER
	call CreateListOfEnergyAttachedToArena
	xor a ; PLAY_AREA_ARENA
	bank1call DisplayEnergyDiscardScreen
.loop_input
	bank1call HandleEnergyDiscardMenuInput
	jr c, .loop_input
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a ; store card chosen
	ret

StarmieRecover_AISelectEffect: ; 2d103 (b:5103)
	ld a, TYPE_ENERGY_WATER
	call CreateListOfEnergyAttachedToArena
	ld a, [wDuelTempList] ; pick first card
	ldh [hTemp_ffa0], a
	ret

StarmieRecover_DiscardEffect: ; 2d10e (b:510e)
	ldh a, [hTemp_ffa0]
	call PutCardInDiscardPile
	ret

StarmieRecover_HealEffect: ; 2d114 (b:5114)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	ld e, a ; all damage for recovery
	ld d, 0
	call ApplyAndAnimateHPRecovery
	ret

SquirtleWithdrawEffect: ; 2d120 (b:5120)
	ldtx de, IfHeadsNoDamageNextTurnText
	call TossCoin_BankB
	jp nc, SetWasUnsuccessful
	ld a, ATK_ANIM_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_NO_DAMAGE_10
	call ApplySubstatus1ToDefendingCard
	ret

HorseaSmokescreenEffect: ; 2d134 (b:5134)
	ld a, SUBSTATUS2_SMOKESCREEN
	call ApplySubstatus2ToDefendingCard
	ret

TentacruelSupersonicEffect: ; 2d13a (b:513a)
	call Confusion50PercentEffect
	call nc, SetNoEffectFromStatus
	ret

JellyfishSting_AIEffect: ; 2d141 (b:5141)
	ld a, 10
	lb de, 10, 10
	jp UpdateExpectedAIDamage_AccountForPoison

; returns carry if Defending Pokemon has no attacks
PoliwhirlAmnesia_CheckAttacks: ; 2d149 (b:5149)
	call SwapTurn
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Atk1Category]
	cp POKEMON_POWER
	jr nz, .has_attack
	ld hl, wLoadedCard2Atk2Name
	ld a, [hli]
	or [hl]
	jr nz, .has_attack
; has no attack
	call SwapTurn
	ldtx hl, NoAttackMayBeChosenText
	scf
	ret
.has_attack
	call SwapTurn
	or a
	ret

PoliwhirlAmnesia_PlayerSelectEffect: ; 2d16f (b:516f)
	call PlayerPickAttackForAmnesia
	ret

PoliwhirlAmnesia_AISelectEffect: ; 2d173 (b:5173)
	call AIPickAttackForAmnesia
	ldh [hTemp_ffa0], a
	ret

PoliwhirlAmnesia_DisableEffect: ; 2d179 (b:5179)
	call ApplyAmnesiaToAttack
	ret

PlayerPickAttackForAmnesia: ; 2d17d (b:517d)
	ldtx hl, ChooseAttackOpponentWillNotBeAbleToUseText
	call DrawWideTextBox_WaitForInput
	call HandleDefendingPokemonAttackSelection
	ld a, e
	ldh [hTemp_ffa0], a
	ret

; applies the Amnesia effect on the defending Pokemon,
; for the attack index in hTemp_ffa0.
ApplyAmnesiaToAttack: ; 2d18a (b:518a)
	ld a, SUBSTATUS2_AMNESIA
	call ApplySubstatus2ToDefendingCard
	ld a, [wNoDamageOrEffect]
	or a
	ret nz ; no effect

; set selected attack as disabled
	ld a, DUELVARS_ARENA_CARD_DISABLED_ATTACK_INDEX
	call GetNonTurnDuelistVariable
	ldh a, [hTemp_ffa0]
	ld [hl], a

	ld l, DUELVARS_ARENA_CARD_LAST_TURN_EFFECT
	ld [hl], LAST_TURN_EFFECT_AMNESIA

	call IsPlayerTurn
	ret c ; return if Player

; the rest of the routine if for Opponent
; to announce which attack was used for Amnesia.
	call SwapTurn
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	ld d, a
	ldh a, [hTemp_ffa0]
	ld e, a
	call GetAttackName
	call LoadTxRam2
	ldtx hl, WasChosenForTheEffectOfAmnesiaText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	ret

PoliwhirlDoubleslap_AIEffect: ; 2d1c0 (b:51c0)
	ld a, 60 / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

PoliwhirlDoubleslap_MultiplierEffect: ; 2d1c8 (b:51c8)
	ld hl, 30
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	ld e, a
	add a
	add e
	call ATimes10
	call SetDefiniteDamage
	ret

PoliwrathWaterGunEffect: ; 2d1e0 (b:51e0)
	lb bc, 2, 1
	jp ApplyExtraWaterEnergyDamageBonus

Whirlpool_PlayerSelectEffect: ; 2d1e6 (b:51e6)
	call SwapTurn
	xor a ; PLAY_AREA_ARENA
	call CreateArenaOrBenchEnergyCardList
	jr c, .no_energy

	ldtx hl, ChooseDiscardEnergyCardFromOpponentText
	call DrawWideTextBox_WaitForInput
	xor a ; PLAY_AREA_ARENA
	bank1call DisplayEnergyDiscardScreen
.loop_input
	bank1call HandleEnergyDiscardMenuInput
	jr c, .loop_input

	call SwapTurn
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a ; store selected card to discard
	ret

.no_energy
	call SwapTurn
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

Whirlpool_AISelectEffect: ; 2d20e (b:520e)
	call AIPickEnergyCardToDiscardFromDefendingPokemon
	ldh [hTemp_ffa0], a
	ret

Whirlpool_DiscardEffect: ; 2d214 (b:5214)
	call HandleNoDamageOrEffect
	ret c ; return if attack had no effect
	ldh a, [hTemp_ffa0]
	cp $ff
	ret z ; return if none selected

	; discard Defending card's energy
	; this doesn't update DUELVARS_ARENA_CARD_LAST_TURN_EFFECT
	call SwapTurn
	call PutCardInDiscardPile
	; ld a, DUELVARS_ARENA_CARD_LAST_TURN_EFFECT
	; call GetTurnDuelistVariable
	; ld [hl], LAST_TURN_EFFECT_DISCARD_ENERGY
	call SwapTurn
	ret

PoliwagWaterGunEffect: ; 2d227 (b:5227)
	lb bc, 1, 0
	jp ApplyExtraWaterEnergyDamageBonus

ClampEffect: ; 2d22d (b:522d)
	ld a, ATK_ANIM_HIT_EFFECT
	ld [wLoadedAttackAnimation], a
	ldtx de, SuccessCheckIfHeadsAttackIsSuccessfulText
	call TossCoin_BankB
	jp c, ParalysisEffect
; unsuccessful
	xor a ; ATK_ANIM_NONE
	ld [wLoadedAttackAnimation], a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret

CloysterSpikeCannon_AIEffect: ; 2d246 (b:5246)
	ld a, 60 / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

CloysterSpikeCannon_MultiplierEffect: ; 2d24e (b:524e)
	ld hl, 30
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	ld e, a
	add a
	add e
	call ATimes10
	call SetDefiniteDamage
	ret

Blizzard_BenchDamage50PercentEffect: ; 2d266 (b:5266)
	ldtx de, DamageToOppBenchIfHeadsDamageToYoursIfTailsText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a ; store coin result
	ret

Blizzard_BenchDamageEffect: ; 2d26f (b:526f)
	ldh a, [hTemp_ffa0]
	or a
	jr nz, .opp_bench

; own bench
	ld a, $01
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	ret

.opp_bench
	call SwapTurn
	ld a, 10
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	ret

; return carry if can use Cowardice
Cowardice_Check: ; 2d28b (b:528b)
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret c ; return if cannot use

	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret c ; return if no bench

	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	ldtx hl, CannotBeUsedInTurnWhichWasPlayedText
	and CAN_EVOLVE_THIS_TURN
	scf
	ret z ; return if was played this turn

	or a
	ret

Cowardice_PlayerSelectEffect: ; 2d2ae (b:52ae)
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if not Arena card
	ldtx hl, SelectPokemonToPlaceInTheArenaText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInBench
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hAIPkmnPowerEffectParam], a
	ret

Cowardice_RemoveFromPlayAreaEffect: ; 2d2c3 (b:52c3)
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable

; put card in Discard Pile temporarily, so that
; all cards attached are discarded as well.
	push af
	ldh a, [hTemp_ffa0]
	ld e, a
	call MovePlayAreaCardToDiscardPile

; if card was in Arena, swap selected Bench
; Pokemon with Arena, otherwise skip.
	ldh a, [hTemp_ffa0]
	or a
	jr nz, .skip_switch
	ldh a, [hAIPkmnPowerEffectParam]
	ld e, a
	call SwapArenaWithBenchPokemon

.skip_switch
; move card back to Hand from Discard Pile
; and adjust Play Area
	pop af
	call MoveDiscardPileCardToHand
	call AddCardToHand
	call ShiftAllPokemonToFirstPlayAreaSlots

	xor a
	ld [wDuelDisplayedScreen], a
	ret

LaprasWaterGunEffect: ; 2d2eb (b:52eb)
	lb bc, 1, 0
	jp ApplyExtraWaterEnergyDamageBonus

Quickfreeze_InitialEffect: ; 2d2f1 (b:52f1)
	scf
	ret

Quickfreeze_Paralysis50PercentEffect: ; 2d2f3 (b:52f3)
	ldtx de, ParalysisCheckText
	call TossCoin_BankB
	jr c, .heads

; tails
	call SetWasUnsuccessful
	bank1call DrawDuelMainScene
	bank1call Func_1bca
	call WaitForWideTextBoxInput
	ret

.heads
	call ParalysisEffect
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call Func_741a
	bank1call WaitAttackAnimation
	bank1call Func_6df1
	bank1call DrawDuelHUDs
	bank1call Func_1bca
	call c, WaitForWideTextBoxInput
	ret

IceBreath_ZeroDamage: ; 2d329 (b:5329)
	xor a
	call SetDefiniteDamage
	ret

IceBreath_RandomPokemonDamageEffect: ; 2d32e (b:532e)
	call SwapTurn
	call PickRandomPlayAreaCard
	ld b, a
	ld de, 40
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

FocusEnergyEffect: ; 2d33f (b:533f)
	ld hl, wDealtDamage
	ld a, [hli]
	or a
	ret z ; return if no damage dealt
	ld a, SUBSTATUS1_NO_DAMAGE_11
	call ApplySubstatus1ToDefendingCard
	ret

PlayerPickFireEnergyCardToDiscard: ; 2d34b (b:534b)
	call CreateListOfFireEnergyAttachedToArena
	xor a
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempList], a
	ret

AIPickFireEnergyCardToDiscard: ; 2d35a (b:535a)
	call CreateListOfFireEnergyAttachedToArena
	ld a, [wDuelTempList]
	ldh [hTempList], a ; pick first in list
	ret

; returns carry if Arena card has no Fire Energy cards
ArcanineFlamethrower_CheckEnergy: ; 2d363 (b:5363)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wAttachedEnergies]
	ldtx hl, NotEnoughFireEnergyText
	cp 1
	ret

ArcanineFlamethrower_PlayerSelectEffect: ; 2d371 (b:5371)
	call PlayerPickFireEnergyCardToDiscard
	ret

ArcanineFlamethrower_AISelectEffect: ; 2d375 (b:5375)
	call AIPickFireEnergyCardToDiscard
	ret

ArcanineFlamethrower_DiscardEffect: ; 2d379 (b:5379)
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

TakeDownEffect: ; 2d37f (b:537f)
	ld a, 40
	call DealRecoilDamageToSelf
	ret

ArcanineQuickAttack_AIEffect: ; 2d385 (b:5385)
	ld a, (40 + 30) / 2
	lb de, 40, 70
	jp SetExpectedAIDamage

ArcanineQuickAttack_DamageBoostEffect: ; 2d38d (b:538d)
	ld hl, 30
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, 30
	call AddToDamage
	ret

; return carry if has less than 2 Fire Energy cards
FlamesOfRage_CheckEnergy: ; 2d3a0 (b:53a0)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wAttachedEnergies]
	ldtx hl, NotEnoughFireEnergyText
	cp 2
	ret

FlamesOfRage_PlayerSelectEffect: ; 2d3ae (b:53ae)
	ldtx hl, ChooseAndDiscard2FireEnergyCardsText
	call DrawWideTextBox_WaitForInput

	xor a
	ldh [hCurSelectionItem], a
	call CreateListOfFireEnergyAttachedToArena
	xor a
	bank1call DisplayEnergyDiscardScreen
.loop_input
	bank1call HandleEnergyDiscardMenuInput
	ret c
	call GetNextPositionInTempList
	ldh a, [hTempCardIndex_ff98]
	ld [hl], a
	call RemoveCardFromDuelTempList
	ldh a, [hCurSelectionItem]
	cp 2
	ret nc ; return when 2 have been chosen
	bank1call DisplayEnergyDiscardMenu
	jr .loop_input

FlamesOfRage_AISelectEffect: ; 2d3d5 (b:53d5)
	call AIPickFireEnergyCardToDiscard
	ld a, [wDuelTempList + 1]
	ldh [hTempList + 1], a
	ret

FlamesOfRage_DiscardEffect: ; 2d3de (b:53de)
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ldh a, [hTempList + 1]
	call PutCardInDiscardPile
	ret

FlamesOfRage_AIEffect: ; 2d3e9 (b:53e9)
	call FlamesOfRage_DamageBoostEffect
	jp SetDefiniteAIDamage

FlamesOfRage_DamageBoostEffect: ; 2d3ef (b:53ef)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call AddToDamage
	ret

RapidashStomp_AIEffect: ; 2d3f8 (b:53f8)
	ld a, (20 + 30) / 2
	lb de, 20, 30
	jp SetExpectedAIDamage

RapidashStomp_DamageBoostEffect: ; 2d400 (b:5400)
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, 10
	call AddToDamage
	ret

RapidashAgilityEffect: ; 2d413 (b:5413)
	ldtx de, IfHeadsDoNotReceiveDamageOrEffectText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, ATK_ANIM_AGILITY_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_AGILITY
	call ApplySubstatus1ToDefendingCard
	ret

; returns carry if Opponent has no Pokemon in bench
NinetalesLure_CheckBench: ; 2d425 (b:5425)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

NinetalesLure_PlayerSelectEffect: ; 2d430 (b:5430)
	ldtx hl, SelectPkmnOnBenchToSwitchWithActiveText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench
.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

NinetalesLure_AISelectEffect: ; 2d449 (b:5449)
	call GetBenchPokemonWithLowestHP
	ldh [hTemp_ffa0], a
	ret

NinetalesLure_SwitchEffect: ; 2d44f (b:544f)
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld e, a
	call HandleNShieldAndTransparency
	call nc, SwapArenaWithBenchPokemon
	call SwapTurn
	xor a
	ld [wDuelDisplayedScreen], a
	ret

; return carry if no Fire energy cards
FireBlast_CheckEnergy: ; 2d463 (b:5463)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ldtx hl, NotEnoughFireEnergyText
	ld a, [wAttachedEnergies]
	cp 1
	ret

FireBlast_PlayerSelectEffect: ; 2d471 (b:5471)
	call PlayerPickFireEnergyCardToDiscard
	ret

FireBlast_AISelectEffect: ; 2d475 (b:5475)
	call AIPickFireEnergyCardToDiscard
	ret

FireBlast_DiscardEffect: ; 2d479 (b:5479)
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

; return carry if no Fire energy cards
Ember_CheckEnergy: ; 2d47f (b:547f)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ldtx hl, NotEnoughFireEnergyText
	ld a, [wAttachedEnergies]
	cp 1
	ret

Ember_PlayerSelectEffect: ; 2d48d (b:548d)
	call PlayerPickFireEnergyCardToDiscard
	ret

Ember_AISelectEffect: ; 2d491 (b:5491)
	call AIPickFireEnergyCardToDiscard
	ret

Ember_DiscardEffect: ; 2d495 (b:5495)
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

; return carry if no Fire energy cards
Wildfire_CheckEnergy: ; 2d49b (b:549b)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ldtx hl, NotEnoughFireEnergyText
	ld a, [wAttachedEnergies]
	cp 1
	ret

Wildfire_PlayerSelectEffect: ; 2d4a9 (b:54a9)
	ldtx hl, DiscardOppDeckAsManyFireEnergyCardsText
	call DrawWideTextBox_WaitForInput

	xor a
	ldh [hCurSelectionItem], a
	call CreateListOfFireEnergyAttachedToArena
	xor a
	bank1call DisplayEnergyDiscardScreen

; show list to Player and for each card selected to discard,
; just increase a counter and store it.
; this will be the output used by Wildfire_DiscardEnergyEffect.
	xor a
	ld [wEnergyDiscardMenuDenominator], a
.loop
	ldh a, [hCurSelectionItem]
	ld [wEnergyDiscardMenuNumerator], a
	bank1call HandleEnergyDiscardMenuInput
	jr c, .done
	ld hl, hCurSelectionItem
	inc [hl]
	call RemoveCardFromDuelTempList
	jr c, .done
	bank1call DisplayEnergyDiscardMenu
	jr .loop

.done
; return carry if no cards were discarded
; output the result in hTemp_ffa0
	ldh a, [hCurSelectionItem]
	ldh [hTemp_ffa0], a
	or a
	ret nz
	scf
	ret

Wildfire_AISelectEffect: ; 2d4dd (b:54dd)
; AI always chooses 0 cards to discard
	xor a
	ldh [hTempList], a
	ret

Wildfire_DiscardEnergyEffect: ; 2d4e1 (b:54e1)
	call CreateListOfFireEnergyAttachedToArena
	ldh a, [hTemp_ffa0]
	or a
	ret z ; no cards to discard

; discard cards from wDuelTempList equal to the number
; of cards that were input in hTemp_ffa0.
; these are all the Fire Energy cards attached to Arena card
; so it will discard the cards in order, regardless
; of the actual order that was selected by Player.
	ld c, a
	ld hl, wDuelTempList
.loop_discard
	ld a, [hli]
	call PutCardInDiscardPile
	dec c
	jr nz, .loop_discard
	ret

Wildfire_DiscardDeckEffect: ; 2d4f4 (b:54f4)
	ldh a, [hTemp_ffa0]
	ld c, a
	ld b, $00
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
	ld a, 20
	call AddToDamage
.check_remaining
	dec c
	jr nz, .loop
	ret
	

MoltresLv35DiveBomb_AIEffect: ; 2d523 (b:5523)
	ld a, 80 / 2
	lb de, 0, 80
	jp SetExpectedAIDamage

MoltresLv35DiveBomb_Success50PercentEffect: ; 2d52b (b:552b)
	ldtx de, SuccessCheckIfHeadsAttackIsSuccessfulText
	call TossCoin_BankB
	jr c, .heads
; tails
	xor a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret
.heads
	ld a, ATK_ANIM_DIVE_BOMB
	ld [wLoadedAttackAnimation], a
	ret

FlareonQuickAttack_AIEffect: ; 2d541 (b:5541)
	ld a, (10 + 30) / 2
	lb de, 10, 30
	jp SetExpectedAIDamage

FlareonQuickAttack_DamageBoostEffect: ; 2d549 (b:5549)
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, 20
	call AddToDamage
	ret

; return carry if no Fire Energy attached
FlareonFlamethrower_CheckEnergy: ; 2d55c (b:555c)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ldtx hl, NotEnoughFireEnergyText
	ld a, [wAttachedEnergies]
	cp 1
	ret

FlareonFlamethrower_PlayerSelectEffect: ; 2d56a (b:556a)
	call PlayerPickFireEnergyCardToDiscard
	ret

FlareonFlamethrower_AISelectEffect: ; 2d56e (b:556e)
	call AIPickFireEnergyCardToDiscard
	ret

FlareonFlamethrower_DiscardEffect: ; 2d572 (b:5572)
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

; return carry if no Fire Energy attached
MagmarFlamethrower_CheckEnergy: ; 2d578 (b:5578)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ldtx hl, NotEnoughFireEnergyText
	ld a, [wAttachedEnergies]
	cp 1
	ret

MagmarFlamethrower_PlayerSelectEffect: ; 2d586 (b:5586)
	call PlayerPickFireEnergyCardToDiscard
	ret

MagmarFlamethrower_AISelectEffect: ; 2d58a (b:558a)
	call AIPickFireEnergyCardToDiscard
	ret

MagmarFlamethrower_DiscardEffect: ; 2d58e (b:558e)
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

MagmarSmokescreenEffect: ; 2d594 (b:5594)
	ld a, SUBSTATUS2_SMOKESCREEN
	call ApplySubstatus2ToDefendingCard
	ret

MagmarSmog_AIEffect: ; 2d59a (b:559a)
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

; return carry if no Fire Energy attached
CharmeleonFlamethrower_CheckEnergy: ; 2d5a2 (b:55a2)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ldtx hl, NotEnoughFireEnergyText
	ld a, [wAttachedEnergies]
	cp 1
	ret

CharmeleonFlamethrower_PlayerSelectEffect: ; 2d5b0 (b:55b0)
	call PlayerPickFireEnergyCardToDiscard
	ret

CharmeleonFlamethrower_AISelectEffect: ; 2d5b4 (b:55b4)
	call AIPickFireEnergyCardToDiscard
	ret

CharmeleonFlamethrower_DiscardEffect: ; 2d5b8 (b:55b8)
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

EnergyBurnEffect: ; 2d5be (b:55be)
	scf
	ret

; return carry if has less than 2 Fire Energy cards
FireSpin_CheckEnergy: ; 2d5c0 (b:55c0)
	xor a ; PLAY_AREA_ARENA
	call CreateArenaOrBenchEnergyCardList
	call CountCardsInDuelTempList
	ldtx hl, NotEnoughEnergyCardsText
	cp 2
	ret

FireSpin_PlayerSelectEffect: ; 2d5cd (b:55cd)
	ldtx hl, ChooseAndDiscard2EnergyCardsText
	call DrawWideTextBox_WaitForInput

	xor a
	ldh [hCurSelectionItem], a
	xor a
	call CreateArenaOrBenchEnergyCardList
	call SortCardsInDuelTempListByID
	xor a
	bank1call DisplayEnergyDiscardScreen

	ld a, 2
	ld [wEnergyDiscardMenuDenominator], a
.loop_input
	bank1call HandleEnergyDiscardMenuInput
	ret c
	call GetNextPositionInTempList
	ldh a, [hTempCardIndex_ff98]
	ld [hl], a
	ld hl, wEnergyDiscardMenuNumerator
	inc [hl]
	ldh a, [hCurSelectionItem]
	cp 2
	jr nc, .done
	ldh a, [hTempCardIndex_ff98]
	call RemoveCardFromDuelTempList
	bank1call DisplayEnergyDiscardMenu
	jr .loop_input
.done
; return when 2 have been chosen
	or a
	ret

FireSpin_AISelectEffect: ; 2d606 (b:5606)
	xor a ; PLAY_AREA_ARENA
	call CreateArenaOrBenchEnergyCardList
	ld hl, wDuelTempList
	ld a, [hli]
	ldh [hTempList], a
	ld a, [hl]
	ldh [hTempList + 1], a
	ret

FireSpin_DiscardEffect: ; 2d614 (b:5614)
	ld hl, hTempList
	ld a, [hli]
	call PutCardInDiscardPile
	ld a, [hli]
	call PutCardInDiscardPile
	ret

; returns carry if Pkmn Power cannot be used
; or if Arena card is not Charizard.
; this is unused.
EnergyBurnCheck_Unreferenced: ; 2d620 (b:5620)
	xor a
	bank1call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret c
	ld a, DUELVARS_ARENA_CARD
	push de
	call GetTurnDuelistVariable
	call GetCardIDFromDeckIndex
	ld a, e
	pop de
	cp ENTEI1
	jr nz, .not_charizard
	or a
	ret
.not_charizard
	scf
	ret

FlareonRage_AIEffect: ; 2d638 (b:5638)
	call FlareonRage_DamageBoostEffect
	jp SetDefiniteAIDamage

FlareonRage_DamageBoostEffect: ; 2d63e (b:563e)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call AddToDamage
	ret

MixUpEffect: ; 2d647 (b:5647)
	call SwapTurn
	call CreateHandCardList
	call SortCardsInDuelTempListByID

; first go through Hand to place
; all Pkmn cards in it in the Deck.
	ld hl, wDuelTempList
	ld c, 0
.loop_hand
	ld a, [hl]
	cp $ff
	jr z, .done_hand
	call .CheckIfCardIsPkmnCard
	jr nc, .next_hand
	; found Pkmn card, place in deck
	inc c
	ld a, [hl]
	call RemoveCardFromHand
	call ReturnCardToDeck
.next_hand
	inc hl
	jr .loop_hand

.done_hand
	ld a, c
	ldh [hCurSelectionItem], a
	push bc
	ldtx hl, ThePkmnCardsInHandAndDeckWereShuffledText
	call DrawWideTextBox_WaitForInput

	call Func_2c0bd
	call CreateDeckCardList
	pop bc
	ldh a, [hCurSelectionItem]
	or a
	jr z, .done ; if no cards were removed from Hand, return

; c holds the number of cards that were placed in the Deck.
; now pick Pkmn cards from the Deck to place in Hand.
	ld hl, wDuelTempList
.loop_deck
	ld a, [hl]
	call .CheckIfCardIsPkmnCard
	jr nc, .next_deck
	dec c
	ld a, [hl]
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
.next_deck
	inc hl
	ld a, c
	or a
	jr nz, .loop_deck
.done
	call SwapTurn
	ret

; returns carry if card index in a is Pkmn card
.CheckIfCardIsPkmnCard: ; 2d69a (b:569a)
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	ret

DancingEmbers_AIEffect: ; 2d6a3 (b:56a3)
	ld a, 90 / 2
	lb de, 0, 80
	jp SetExpectedAIDamage

DancingEmbers_MultiplierEffect: ; 2d6ab (b:56ab)
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 9
	call TossCoinATimes_BankB
	call ATimes10
	call SetDefiniteDamage
	ret

Firegiver_InitialEffect: ; 2d6c0 (b:56c0)
	scf
	ret

Firegiver_AddToHandEffect: ; 2d6c2 (b:56c2)
; fill wDuelTempList with all Fire Energy card
; deck indices that are in the Deck.
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
	ld de, wDuelTempList
	ld c, 0
.loop_cards
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	push hl
	push de
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop de
	pop hl
	cp TYPE_ENERGY_FIRE
	jr nz, .next
	ld a, l
	ld [de], a
	inc de
	inc c
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_cards
	ld a, $ff
	ld [de], a

; check how many were found
	ld a, c
	or a
	jr nz, .found
	; return if none found
	ldtx hl, ThereWasNoFireEnergyText
	call DrawWideTextBox_WaitForInput
	call Func_2c0bd
	ret

.found
; pick a random number between 1 and 4,
; up to the maximum number of Fire Energy
; cards that were found.
	ld a, 3
	inc a
	cp c
	jr c, .ok

.ok
	ldh [hCurSelectionItem], a
; load correct attack animation depending
; on what side the effect is from.
	ld d, ATK_ANIM_FIREGIVER_PLAYER
	ld a, [wDuelistType]
	cp DUELIST_TYPE_PLAYER
	jr z, .player_1
; opponent
	ld d, ATK_ANIM_FIREGIVER_OPP
.player_1
	ld a, d
	ld [wLoadedAttackAnimation], a

; start loop for adding Energy cards to hand
	ldh a, [hCurSelectionItem]
	ld c, a
	ld hl, wDuelTempList
.loop_energy
	push hl
	push bc
	ld bc, $0
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation

; load correct coordinates to update the number of cards
; in hand and deck during animation.
	lb bc, 18, 7 ; x, y for hand number
	ld e, 3 ; y for deck number
	ld a, [wLoadedAttackAnimation]
	cp ATK_ANIM_FIREGIVER_PLAYER
	jr z, .player_2
	lb bc, 4, 5 ; x, y for hand number
	ld e, 10 ; y for deck number

.player_2
; update and print number of cards in hand
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	inc a
	bank1call WriteTwoDigitNumberInTxSymbolFormat
; update and print number of cards in deck
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ld a, DECK_SIZE - 1
	sub [hl]
	ld c, e
	bank1call WriteTwoDigitNumberInTxSymbolFormat

; load Fire Energy card index and add to hand
	pop bc
	pop hl
	ld a, [hli]
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	dec c
	jr nz, .loop_energy

; load the number of cards added to hand and print text
	ldh a, [hCurSelectionItem]
	ld l, a
	ld h, $00
	call LoadTxRam3
	ldtx hl, DrewFireEnergyFromTheHandText
	call DrawWideTextBox_WaitForInput
	call Func_2c0bd
	ret


MoltresLv37DiveBomb_AIEffect: ; 2d76e (b:576e)
	ld a, 70 / 2
	lb de, 0, 70
	jp SetExpectedAIDamage

MoltresLv37DiveBomb_Success50PercentEffect: ; 2d776 (b:5776)
	ldtx de, SuccessCheckIfHeadsAttackIsSuccessfulText
	call TossCoin_BankB
	jr c, .heads
; tails
	xor a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret
.heads
	ld a, ATK_ANIM_DIVE_BOMB
	ld [wLoadedAttackAnimation], a
	ret

; output in de the number of energy cards
; attached to the Defending Pokemon times 10.
; used for attacks that deal 10x number of energy
; cards attached to the Defending card.
GetEnergyAttachedMultiplierDamage: ; 2d78c (b:578c)
	call SwapTurn
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable

	ld c, 0
.loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .next
	; is in Arena
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	and TYPE_ENERGY
	jr z, .next
	; is Energy attached to Arena card
	inc c
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop

	call SwapTurn
	ld l, c
	ld h, $00
	ld b, $00
	add hl, hl ; hl =  2 * c
	add hl, hl ; hl =  4 * c
	add hl, bc ; hl =  5 * c
	add hl, hl ; hl = 10 * c
	ld e, l
	ld d, h
	ret

; draws list of Energy Cards in Discard Pile
; for Player to select from.
; the Player can select up to 2 cards from the list.
; these cards are given in $ff-terminated list
; in hTempList.
HandleEnergyCardsInDiscardPileSelection: ; 2d7bc (b:57bc)
	push hl
	xor a
	ldh [hCurSelectionItem], a
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	pop hl
	jr c, .finish

	call DrawWideTextBox_WaitForInput
.loop
; draws Discard Pile screen and textbox,
; and handles Player input
	bank1call InitAndDrawCardListScreenLayout
	ldtx hl, ChooseAnEnergyCardText
	ldtx de, PlayerDiscardPileText
	bank1call SetCardListHeaderText
	bank1call DisplayCardList
	jr nc, .selected

; Player is trying to exit screen,
; but can select up to 2 cards total.
; prompt Player to confirm exiting screen.
	ld a, 2
	call AskWhetherToQuitSelectingCards
	jr c, .loop
	jr .finish

.selected
; a card was selected, so add it to list
	call GetNextPositionInTempList
	ldh a, [hTempCardIndex_ff98]
	ld [hl], a
	call RemoveCardFromDuelTempList
	or a
	jr z, .finish ; no more cards?
	ldh a, [hCurSelectionItem]
	cp 2
	jr c, .loop ; already selected 2 cards?

.finish
; place terminating byte on list
	call GetNextPositionInTempList
	ld [hl], $ff
	or a
	ret

; returns carry if Pkmn Power cannot be used, and
; sets the correct text in hl for failure.
Curse_CheckDamageAndBench: ; 2d7fc (b:57fc)
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a

; fail if Pkmn Power has already been used
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	ldtx hl, OnlyOncePerTurnText
	and USED_PKMN_POWER_THIS_TURN
	jr nz, .set_carry

; fail if Opponent only has 1 Pokemon in Play Area
	call SwapTurn
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	call SwapTurn
	ldtx hl, CannotUseSinceTheresOnly1PkmnText
	cp 2
	jr c, .set_carry

; fail if Opponent has no damage counters
	call SwapTurn
	call CheckIfPlayAreaHasAnyDamage
	call SwapTurn
	ldtx hl, NoPokemonWithDamageCountersText
	jr c, .set_carry

; return carry if Pkmn Power cannot be used due
; to Toxic Gas or status.
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret

.set_carry
	scf
	ret

Curse_PlayerSelectEffect: ; 2d834 (b:5834)
	ldtx hl, ProcedureForCurseText
	bank1call DrawWholeScreenTextBox
	call SwapTurn
	xor a
	ldh [hCurSelectionItem], a
	bank1call Func_61a1
.start
	bank1call PrintPlayAreaCardList_EnableLCD
	push af
	ldh a, [hCurSelectionItem]
	ld hl, PlayAreaSelectionMenuParameters
	call InitializeMenuParameters
	pop af
	ld [wNumMenuItems], a

; first pick a target to take 1 damage counter from.
.loop_input_first
	call DoFrame
	call HandleMenuInput
	jr nc, .loop_input_first
	cp $ff
	jr z, .cancel
	ldh [hCurSelectionItem], a
	ldh [hTempPlayAreaLocation_ffa1], a
	call GetCardDamageAndMaxHP
	or a
	jr nz, .picked_first ; test if has damage
	; play sfx
	call Func_3794
	jr .loop_input_first

.picked_first
; give 10 HP to card selected, draw the scene,
; then immediately revert this.
	ldh a, [hTempPlayAreaLocation_ffa1]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	push af
	push hl
	add 10
	ld [hl], a
	bank1call PrintPlayAreaCardList_EnableLCD
	pop hl
	pop af
	ld [hl], a

; draw damage counter on cursor
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, SYM_HP_NOK
	call DrawSymbolOnPlayAreaCursor

; handle input to pick the target to receive the damage counter.
.loop_input_second
	call DoFrame
	call HandleMenuInput
	jr nc, .loop_input_second
	ldh [hPlayAreaEffectTarget], a
	cp $ff
	jr nz, .a_press ; was a pressed?

; b press
; erase the damage counter symbol
; and loop back up again.
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, SYM_SPACE
	call DrawSymbolOnPlayAreaCursor
	call EraseCursor
	jr .start

.a_press
	ld hl, hTempPlayAreaLocation_ffa1
	cp [hl]
	jr z, .loop_input_second ; same as first?
; a different Pokemon was picked,
; so store this Play Area location
; and erase the damage counter in the cursor.
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, SYM_SPACE
	call DrawSymbolOnPlayAreaCursor
	call EraseCursor
	call SwapTurn
	or a
	ret

.cancel
; return carry if operation was cancelled.
	call SwapTurn
	scf
	ret

Curse_TransferDamageEffect: ; 2d8bb (b:58bb)
; set Pkmn Power as used
	ldh a, [hTempList]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]

; figure out the type of duelist that used Curse.
; if it was the player, no need to draw the Play Area screen.
	call SwapTurn
	ld a, DUELVARS_DUELIST_TYPE
	call GetNonTurnDuelistVariable
	cp DUELIST_TYPE_PLAYER
	jr z, .vs_player

; vs. opponent
	bank1call Func_61a1
.vs_player
; transfer the damage counter to the targets that were selected.
	ldh a, [hPlayAreaEffectTarget]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	sub 10
	ld [hl], a
	ldh a, [hTempPlayAreaLocation_ffa1]
	add DUELVARS_ARENA_CARD_HP
	ld l, a
	ld a, 10
	add [hl]
	ld [hl], a

	bank1call PrintPlayAreaCardList_EnableLCD
	ld a, DUELVARS_DUELIST_TYPE
	call GetNonTurnDuelistVariable
	cp DUELIST_TYPE_PLAYER
	jr z, .done
; vs. opponent
	ldh a, [hPlayAreaEffectTarget]
	ldh [hTempPlayAreaLocation_ff9d], a
	bank1call Func_6194

.done
	call SwapTurn
	call ExchangeRNG
	bank1call Func_6e49
	ret

GengarDarkMind_PlayerSelectEffect: ; 2d903 (b:5903)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	jr nc, .has_bench
; no bench Pokemon to damage.
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

.has_bench
; opens Play Area screen to select Bench Pokemon
; to damage, and store it before returning.
	ldtx hl, ChoosePkmnInTheBenchToGiveDamageText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench
.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

GengarDarkMind_AISelectEffect: ; 2d92a (b:592a)
	ld a, $ff
	ldh [hTemp_ffa0], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	ret c ; return if no Bench Pokemon
; just pick Pokemon with lowest remaining HP.
	call GetBenchPokemonWithLowestHP
	ldh [hTemp_ffa0], a
	ret

GengarDarkMind_DamageBenchEffect: ; 2d93c (b:593c)
	ldh a, [hTemp_ffa0]
	cp $ff
	ret z ; no target chosen
	call SwapTurn
	ld b, a
	ld de, 10
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

SleepingGasEffect: ; 2d94f (b:594f)
	call Sleep50PercentEffect
	call nc, SetNoEffectFromStatus
	ret

DestinyBond_CheckEnergy: ; 2d956 (b:5956)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wAttachedEnergies + PSYCHIC]
	ldtx hl, NotEnoughPsychicEnergyText
	cp 1
	ret

DestinyBond_PlayerSelectEffect: ; 2d964 (b:5964)
; handle input and display of Energy card list
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	xor a
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ret c
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempList], a
	ret

DestinyBond_AISelectEffect: ; 2d976 (b:5976)
; pick first card in list
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	ld a, [wDuelTempList]
	ldh [hTempList], a
	ret

DestinyBond_DiscardEffect: ; 2d981 (b:5981)
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

DestinyBond_DestinyBondEffect: ; 2d987 (b:5987)
	ld a, SUBSTATUS1_DESTINY_BOND
	call ApplySubstatus1ToDefendingCard
	ret

; returns carry if no Energy cards in Discard Pile.
EnergyConversion_CheckEnergy: ; 2d98d (b:598d)
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	ldtx hl, ThereAreNoEnergyCardsInDiscardPileText
	ret

EnergyConversion_PlayerSelectEffect: ; 2d994 (b:5994)
	ldtx hl, Choose2EnergyCardsFromDiscardPileForHandText
	call HandleEnergyCardsInDiscardPileSelection
	ret

EnergyConversion_AISelectEffect: ; 2d99b (b:599b)
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	ld hl, wDuelTempList
	ld de, hTempList
	ld c, 2
; select the first two energy cards found in Discard Pile
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	ld [de], a
	inc de
	dec c
	jr nz, .loop
.done
	ld a, $ff
	ld [de], a
	ret

EnergyConversion_AddToHandEffect: ; 2d9b4 (b:59b4)

; loop cards that were chosen
; until $ff is reached,
; and move them to the hand.
	ld hl, hTempList
	ld de, wDuelTempList
.loop_cards
	ld a, [hli]
	ld [de], a
	inc de
	cp $ff
	jr z, .done
	call MoveDiscardPileCardToHand
	call AddCardToHand
	jr .loop_cards

.done
	call IsPlayerTurn
	ret c
	bank1call Func_4b38
	ret

; return carry if Defending Pokemon is not asleep
DreamEaterEffect: ; 2d9d6 (b:59d6)
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetNonTurnDuelistVariable
	or a
	jr nz, .has_status
	jr z, .no_status
.has_status
	ld a, 30
	call AddToDamage
	ret

.no_status
	ret

TransparencyEffect: ; 2d9e5 (b:59e5)
	scf
	ret

; returns carry if neither the Turn Duelist or
; the non-Turn Duelist have any deck cards.
Prophecy_CheckDeck: ; 2d9e7 (b:59e7)
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	cp DECK_SIZE
	jr c, .no_carry
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetNonTurnDuelistVariable
	cp DECK_SIZE
	jr c, .no_carry
	ldtx hl, NoCardsLeftInTheDeckText
	scf
	ret
.no_carry
	or a
	ret

Prophecy_PlayerSelectEffect: ; 2da00 (b:5a00)
	ldtx hl, ProcedureForProphecyText
	bank1call DrawWholeScreenTextBox
.select_deck
	bank1call DrawDuelMainScene
	ldtx hl, PleaseSelectTheDeckText
	call TwoItemHorizontalMenu
	ldh a, [hKeysHeld]
	and B_BUTTON
	jr nz, Prophecy_PlayerSelectEffect ; loop back to start

	ldh a, [hCurMenuItem]
	ldh [hTempList], a ; store selection in first position in list
	or a
	jr z, .turn_duelist

; non-turn duelist
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetNonTurnDuelistVariable
	cp DECK_SIZE
	jr nc, .select_deck ; no cards, go back to deck selection
	call SwapTurn
	call HandleProphecyScreen
	call SwapTurn
	ret

.turn_duelist
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	cp DECK_SIZE
	jr nc, .select_deck ; no cards, go back to deck selection
	call HandleProphecyScreen
	ret

Prophecy_AISelectEffect: ; 2da3c (b:5a3c)
; AI doesn't ever choose this attack
; so this it does no sorting.
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

Prophecy_ReorderDeckEffect: ; 2da41 (b:5a41)
	ld hl, hTempList
	ld a, [hli]
	or a
	jr z, .ReorderCards ; turn duelist's deck
	cp $ff
	ret z

	; non-turn duelist's deck
	call SwapTurn
	call .ReorderCards
	call SwapTurn
	ret

.ReorderCards
	ld c, 0
; add selected cards to hand in the specified order
.loop_add_hand
	ld a, [hli]
	cp $ff
	jr z, .dec_hl
	call SearchCardInDeckAndAddToHand
	inc c
	jr .loop_add_hand

.dec_hl
; go to last card that was in the list
	dec hl
	dec hl

.loop_return_deck
; return the cards to the top of the deck
	ld a, [hld]
	call ReturnCardToDeck
	dec c
	jr nz, .loop_return_deck
	call IsPlayerTurn
	ret c
	; print text in case it was the opponent
	ldtx hl, ExchangedCardsInDuelistsHandText
	call DrawWideTextBox_WaitForInput
	ret

; draw and handle Player selection for reordering
; the top 3 cards of Deck.
; the resulting list is output in order in hTempList.
HandleProphecyScreen: ; 2da76 (b:5a76)
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ld b, a
	ld a, DECK_SIZE
	sub [hl] ; a = number of cards in deck

; store in c the number of cards that will be reordered.
; this number is 3, unless the deck as fewer cards than
; that in which case it will be the number of cards remaining.
	ld c, 3
	cp c
	jr nc, .got_number_cards
	ld c, a ; store number of remaining cards in c
.got_number_cards
	ld a, c
	inc a
	ld [wNumberOfCardsToOrder], a

; store in wDuelTempList the cards
; at top of Deck to be reordered.
	ld a, b
	add DUELVARS_DECK_CARDS
	ld l, a
	ld de, wDuelTempList
.loop_top_cards
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_top_cards
	ld a, $ff ; terminating byte
	ld [de], a

.start
	call CountCardsInDuelTempList
	ld b, a
	ld a, 1 ; start at 1
	ldh [hCurSelectionItem], a

; initialize buffer ahead in wDuelTempList.
	ld hl, wDuelTempList + 10
	xor a
.loop_init_buffer
	ld [hli], a
	dec b
	jr nz, .loop_init_buffer
	ld [hl], $ff

	bank1call InitAndDrawCardListScreenLayout
	ldtx hl, ChooseTheOrderOfTheCardsText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText
	bank1call Func_5735

.loop_selection
	bank1call DisplayCardList
	jr c, .clear

; first check if this card was already selected
	ldh a, [hCurMenuItem]
	ld e, a
	ld d, $00
	ld hl, wDuelTempList + 10
	add hl, de
	ld a, [hl]
	or a
	jr nz, .loop_selection ; already chosen

; being here means card hasn't been selected yet,
; so add its order number to buffer and increment
; the sort number for the next card.
	ldh a, [hCurSelectionItem]
	ld [hl], a
	inc a
	ldh [hCurSelectionItem], a
	bank1call Func_5744
	ldh a, [hCurSelectionItem]
	ld hl, wNumberOfCardsToOrder
	cp [hl]
	jr c, .loop_selection ; still more cards

; confirm that the ordering has been completed
	call EraseCursor
	ldtx hl, IsThisOKText
	call YesOrNoMenuWithText_LeftAligned
	jr c, .start ; if not, return back to beginning of selection

; write in hTempList the card list
; in order that was selected.
	ld hl, wDuelTempList + 10
	ld de, wDuelTempList
	ld c, 0
.loop_order
	ld a, [hli]
	cp $ff
	jr z, .done
	push hl
	push bc
	ld c, a
	ld b, $00
	ld hl, hTempList
	add hl, bc
	ld a, [de]
	ld [hl], a
	pop bc
	pop hl
	inc de
	inc c
	jr .loop_order
; now hTempList has the list of card deck indices
; in the order selected to be place on top of the deck.

.done
	ld b, $00
	ld hl, hTempList + 1
	add hl, bc
	ld [hl], $ff ; terminating byte
	or a
	ret

.clear
; check if any reordering was done.
	ld hl, hCurSelectionItem
	ld a, [hl]
	cp 1
	jr z, .loop_selection ; none done, go back
; clear the order that was selected thus far.
	dec a
	ld [hl], a
	ld c, a
	ld hl, wDuelTempList + 10
.loop_clear
	ld a, [hli]
	cp c
	jr nz, .loop_clear
	; clear this byte
	dec hl
	ld [hl], $00
	bank1call Func_5744
	jr .loop_selection

HypnoDarkMind_PlayerSelectEffect: ; 2db2b (b:5b2b)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	jr nc, .has_bench
; no bench Pokemon to damage.
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

.has_bench
; opens Play Area screen to select Bench Pokemon
; to damage, and store it before returning.
	ldtx hl, ChoosePkmnInTheBenchToGiveDamageText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench
.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

HypnoDarkMind_AISelectEffect: ; 2db52 (b:5b52)
	call HypnoDarkMind_DamageBenchEffect
	ret

HypnoDarkMind_DamageBenchEffect: ; 2db64 (b:5b64)
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetNonTurnDuelistVariable
	or a
	jr nz, .has_status
	jr z, .no_status
.has_status
	ld a, 20
	call AddToDamage
	ret

.no_status
	ret

InvisibleWallEffect: ; 2db77 (b:5b77)
	scf
	ret

MrMimeMeditate_AIEffect: ; 2db79 (b:5b79)
	call MrMimeMeditate_DamageBoostEffect
	jp SetDefiniteAIDamage

MrMimeMeditate_DamageBoostEffect: ; 2db7f (b:5b7f)
; add damage counters of Defending card to damage
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call SwapTurn
	call AddToDamage
	ret

; returns carry if Damage Swap cannot be used.
DamageSwap_CheckDamage: ; 2db8e (b:5b8e)
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call CheckIfPlayAreaHasAnyDamage
	jr c, .no_damage
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret
.no_damage
	ldtx hl, NoPokemonWithDamageCountersText
	scf
	ret

DamageSwap_SelectAndSwapEffect: ; 2dba2 (b:5ba2)
	ld a, DUELVARS_DUELIST_TYPE
	call GetTurnDuelistVariable
	cp DUELIST_TYPE_PLAYER
	jr z, .player
; non-player
	bank1call Func_61a1
	bank1call PrintPlayAreaCardList_EnableLCD
	ret

.player
	ldtx hl, ProcedureForDamageSwapText
	bank1call DrawWholeScreenTextBox
	xor a
	ldh [hCurSelectionItem], a
	bank1call Func_61a1

.start
	bank1call PrintPlayAreaCardList_EnableLCD
	push af
	ldh a, [hCurSelectionItem]
	ld hl, PlayAreaSelectionMenuParameters
	call InitializeMenuParameters
	pop af
	ld [wNumMenuItems], a

; handle selection of Pokemon to take damage from
.loop_input_first
	call DoFrame
	call HandleMenuInput
	jr nc, .loop_input_first
	cp $ff
	ret z ; quit when B button is pressed

	ldh [hTempPlayAreaLocation_ffa1], a
	ldh [hCurSelectionItem], a

; if card has no damage, play sfx and return to start
	call GetCardDamageAndMaxHP
	or a
	jr z, .no_damage

; take damage away temporarily to draw UI.
	ldh a, [hTempPlayAreaLocation_ffa1]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	push af
	push hl
	add 10
	ld [hl], a
	bank1call PrintPlayAreaCardList_EnableLCD
	pop hl
	pop af
	ld [hl], a

; draw damage counter in cursor
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, SYM_HP_NOK
	call DrawSymbolOnPlayAreaCursor

; handle selection of Pokemon to give damage to
.loop_input_second
	call DoFrame
	call HandleMenuInput
	jr nc, .loop_input_second
	; if B is pressed, return damage counter
	; to card that it was taken from
	cp $ff
	jr z, .update_ui

; try to give the card selected the damage counter
; if it would KO, ignore it.
	ldh [hPlayAreaEffectTarget], a
	ldh [hCurSelectionItem], a
	call TryGiveDamageCounter_DamageSwap
	jr c, .loop_input_second

	ld a, OPPACTION_6B15
	call SetOppAction_SerialSendDuelData

.update_ui
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, SYM_SPACE
	call DrawSymbolOnPlayAreaCursor
	call EraseCursor
	jr .start

.no_damage
	call Func_3794
	jr .loop_input_first

; tries to give damage counter to hPlayAreaEffectTarget,
; and if successful updates UI screen.
DamageSwap_SwapEffect: ; 2dc27 (b:5c27)
	call TryGiveDamageCounter_DamageSwap
	ret c
	bank1call PrintPlayAreaCardList_EnableLCD
	or a
	ret

; tries to give the damage counter to the target
; chosen by the Player (hPlayAreaEffectTarget).
; if the damage counter would KO card, then do
; not give the damage counter and return carry.
TryGiveDamageCounter_DamageSwap: ; 2dc30 (b:5c30)
	ldh a, [hPlayAreaEffectTarget]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	sub 10
	jr z, .set_carry ; would bring HP to zero?
; has enough HP to receive a damage counter
	ld [hl], a
	ldh a, [hTempPlayAreaLocation_ffa1]
	add DUELVARS_ARENA_CARD_HP
	ld l, a
	ld a, 10
	add [hl]
	ld [hl], a
	or a
	ret
.set_carry
	scf
	ret

PsywaveEffect: ; 2dc49 (b:5c49)
	call GetEnergyAttachedMultiplierDamage
	ld hl, wDamage
	ld [hl], e
	inc hl
	ld [hl], d
	ret

; returns carry if neither Duelist has evolved Pokemon.
DevolutionBeam_CheckPlayArea: ; 2dc53 (b:5c53)
	call CheckIfTurnDuelistHasEvolvedCards
	ret nc
	call SwapTurn
	call CheckIfTurnDuelistHasEvolvedCards
	call SwapTurn
	ldtx hl, ThereAreNoStage1PokemonText
	ret

; returns carry of Player cancelled selection.
; otherwise, output in hTemp_ffa0 which Play Area
; was selected ($0 = own Play Area, $1 = opp. Play Area)
; and in hTempPlayAreaLocation_ffa1 selected card.
DevolutionBeam_PlayerSelectEffect: ; 2dc64 (b:5c64)
	ldtx hl, ProcedureForDevolutionBeamText
	bank1call DrawWholeScreenTextBox

.start
	bank1call DrawDuelMainScene
	ldtx hl, PleaseSelectThePlayAreaText
	call TwoItemHorizontalMenu
	ldh a, [hKeysHeld]
	and B_BUTTON
	jr nz, .set_carry

; a Play Area was selected
	ldh a, [hCurMenuItem]
	or a
	jr nz, .opp_chosen

; player chosen
	call HandleEvolvedCardSelection
	jr c, .start

	xor a
.store_selection
	ld hl, hTemp_ffa0
	ld [hli], a ; store which Duelist Play Area selected
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld [hl], a ; store which card selected
	or a
	ret

.opp_chosen
	call SwapTurn
	call HandleEvolvedCardSelection
	call SwapTurn
	jr c, .start
	ld a, $01
	jr .store_selection

.set_carry
	scf
	ret

DevolutionBeam_AISelectEffect: ; 2dc9e (b:5c9e)
	ld a, $01
	ldh [hTemp_ffa0], a
	call SwapTurn
	call FindFirstNonBasicCardInPlayArea
	call SwapTurn
	jr c, .found
	xor a
	ldh [hTemp_ffa0], a
	call FindFirstNonBasicCardInPlayArea
.found
	ldh [hTempPlayAreaLocation_ffa1], a
	ret

DevolutionBeam_LoadAnimation: ; 2dcb6 (b:5cb6)
	xor a ; ATK_ANIM_NONE
	ld [wLoadedAttackAnimation], a
	ret

DevolutionBeam_DevolveEffect: ; 2dcbb (b:5cbb)
	ldh a, [hTemp_ffa0]
	or a
	jr z, .DevolvePokemon
	cp $ff
	ret z

; opponent's Play Area
	call SwapTurn
	ldh a, [hTempPlayAreaLocation_ffa1]
	jr nz, .skip_handle_no_damage_effect
	call HandleNoDamageOrEffect
	jr c, .unaffected
.skip_handle_no_damage_effect
	call .DevolvePokemon
.unaffected
	call SwapTurn
	ret

.DevolvePokemon
	ld a, ATK_ANIM_DEVOLUTION_BEAM
	ld [wLoadedAttackAnimation], a
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation

; load selected card's data
	ldh a, [hTempPlayAreaLocation_ffa1]
	ldh [hTempPlayAreaLocation_ff9d], a
	ld [wTempPlayAreaLocation_cceb], a
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex

; check if car is affected
	ld a, [wLoadedCard1ID]
	ld [wTempNonTurnDuelistCardID], a
	ld de, $0
	ldh a, [hTempPlayAreaLocation_ff9d]
	or a
	jr nz, .skip_substatus_check
	call HandleNoDamageOrEffectSubstatus
	jr c, .check_no_damage_effect
.skip_substatus_check
	call HandleDamageReductionOrNoDamageFromPkmnPowerEffects
.check_no_damage_effect
	call CheckNoDamageOrEffect
	jr nc, .devolve
	call DrawWideTextBox_WaitForInput
	ret

.devolve
	ldh a, [hTempPlayAreaLocation_ffa1]
	ldh [hTempPlayAreaLocation_ff9d], a
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	bank1call GetCardOneStageBelow
	call PrintDevolvedCardNameAndLevelText

	ld a, d
	call UpdateDevolvedCardHPAndStage
	call ResetDevolvedCardStatus

; add the evolved card to the hand
	ld a, e
	call AddCardToHand

; check if this devolution KO's card
	ldh a, [hTempPlayAreaLocation_ffa1]
	call PrintPlayAreaCardKnockedOutIfNoHP

	xor a
	ld [wDuelDisplayedScreen], a
	ret

; returns carry if Turn Duelist
; has no Stage1 or Stage2 cards in Play Area.
CheckIfTurnDuelistHasEvolvedCards: ; 2dd3b (b:5d3b)
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	ld d, h
	ld e, DUELVARS_ARENA_CARD_STAGE
.loop
	ld a, [hli]
	cp $ff
	jr z, .set_carry
	ld a, [de]
	inc de
	or a
	jr z, .loop ; is Basic Stage
	ret
.set_carry
	scf
	ret

; handles Player selection of an evolved card in Play Area.
; returns carry if Player cancelled operation.
HandleEvolvedCardSelection: ; 2dd50 (b:5d50)
	bank1call HasAlivePokemonInPlayArea
.loop
	bank1call OpenPlayAreaScreenForSelection
	ret c
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_STAGE
	call GetTurnDuelistVariable
	or a
	jr z, .loop ; if Basic, loop
	ret

; finds first occurrence in Play Area
; of Stage 1 or 2 card, and outputs its
; Play Area location in a, with carry set.
; if none found, don't return carry set.
FindFirstNonBasicCardInPlayArea: ; 2dd62 (b:5d62)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a

	ld b, PLAY_AREA_ARENA
	ld l, DUELVARS_ARENA_CARD_STAGE
.loop
	ld a, [hli]
	or a
	jr nz, .not_basic
	inc b
	dec c
	jr nz, .loop
	or a
	ret
.not_basic
	ld a, b
	scf
	ret

NeutralizingShieldEffect: ; 2dd79 (b:5d79)
	scf
	ret

Psychic_AIEffect: ; 2dd7b (b:5d7b)
	call Psychic_DamageBoostEffect
	jp SetDefiniteAIDamage

Psychic_DamageBoostEffect: ; 2dd81 (b:5d81)
	call GetEnergyAttachedMultiplierDamage
	ld hl, wDamage
	ld a, e
	add [hl]
	ld [hli], a
	ld a, d
	adc [hl]
	ld [hl], a
	ret

Psychic_AIEffect2: ; 2dd7b (b:5d7b)
	call Psychic_DamageBoostEffect
	jp SetDefiniteAIDamage

Psychic_DamageBoostEffect2: ; 2dd81 (b:5d81)
	call GetEnergyAttachedMultiplierDamage
	ld hl, wDamage
	ld a, e
	add a
	add [hl]
	ld [hli], a
	ld a, d
	adc [hl]
	ld [hl], a
	ret

; return carry if no Psychic Energy attached
Barrier_CheckEnergy: ; 2dd8e (b:5d8e)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wAttachedEnergies + PSYCHIC]
	ldtx hl, NotEnoughPsychicEnergyText
	cp 1
	ret

Barrier_PlayerSelectEffect: ; 2dd9c (b:5d9c)
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	xor a ; PLAY_AREA_ARENA
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ret c
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	ret

Barrier_AISelectEffect: ; 2ddae (b:5dae)
; AI picks the first energy in list
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	ld a, [wDuelTempList]
	ldh [hTemp_ffa0], a
	ret

Barrier_DiscardEffect: ; 2ddb9 (b:5db9)
	ldh a, [hTemp_ffa0]
	call PutCardInDiscardPile
	ret

Barrier_BarrierEffect: ; 2ddbf (b:5dbf)
	ld a, SUBSTATUS1_BARRIER
	call ApplySubstatus1ToDefendingCard
	ret

MewtwoAltLV60EnergyAbsorption_CheckDiscardPile: ; 2ddc5 (b:5dc5)
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	ldtx hl, ThereAreNoEnergyCardsInDiscardPileText
	ret

MewtwoAltLV60EnergyAbsorption_PlayerSelectEffect: ; 2ddcc (b:5dcc)
	ldtx hl, Choose2EnergyCardsFromDiscardPileToAttachText
	call HandleEnergyCardsInDiscardPileSelection
	ret

MewtwoAltLV60EnergyAbsorption_AISelectEffect: ; 2ddd3 (b:5dd3)
; AI picks first 2 energy cards
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	ld hl, wDuelTempList
	ld de, hTempList
	ld c, 2
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	ld [de], a
	inc de
	dec c
	jr nz, .loop
.done
	ld a, $ff ; terminating byte
	ld [de], a
	ret

MewtwoAltLV60EnergyAbsorption_AddToHandEffect: ; 2ddec (b:5dec)
	ld hl, hTempList
.loop
	ld a, [hli]
	cp $ff
	ret z
	push hl
	call MoveDiscardPileCardToHand
	call GetTurnDuelistVariable
	ld [hl], CARD_LOCATION_ARENA
	pop hl
	jr .loop

MewtwoLv60EnergyAbsorption_CheckDiscardPile: ; 2ddff (b:5dff)
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	ldtx hl, ThereAreNoEnergyCardsInDiscardPileText
	ret

MewtwoLv60EnergyAbsorption_PlayerSelectEffect: ; 2de06 (b:5e06)
	ldtx hl, Choose2EnergyCardsFromDiscardPileToAttachText
	call HandleEnergyCardsInDiscardPileSelection
	ret

MewtwoLv60EnergyAbsorption_AISelectEffect: ; 2de0d (b:5e0d)
; AI picks first 2 energy cards
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	ld hl, wDuelTempList
	ld de, hTempList
	ld c, 2
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	ld [de], a
	inc de
	dec c
	jr nz, .loop
.done
	ld a, $ff ; terminating byte
	ld [de], a
	ret

MewtwoLv60EnergyAbsorption_AddToHandEffect: ; 2de26 (b:5e26)
	ld hl, hTempList
.loop
	ld a, [hli]
	cp $ff
	ret z
	push hl
	call MoveDiscardPileCardToHand
	call GetTurnDuelistVariable
	ld [hl], CARD_LOCATION_ARENA
	pop hl
	jr .loop

; returns carry if Strange Behavior cannot be used.
StrangeBehavior_CheckDamage: ; 2de39 (b:5e39)
; does Play Area have any damage counters?
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call CheckIfPlayAreaHasAnyDamage
	ldtx hl, NoPokemonWithDamageCountersText
	jr c, .set_carry
; can Slowbro receive any damage counters without KO-ing?
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	ldtx hl, CannotUseBecauseItWillBeKnockedOutText
	cp 10 + 10
	jr c, .set_carry
; can Pkmn Power be used?
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret

.set_carry
	scf
	ret

StrangeBehavior_SelectAndSwapEffect: ; 2de5b (b:5e5b)
	ld a, DUELVARS_DUELIST_TYPE
	call GetTurnDuelistVariable
	cp DUELIST_TYPE_PLAYER
	jr z, .player

; not player
	bank1call Func_61a1
	bank1call PrintPlayAreaCardList_EnableLCD
	ret

.player
	ldtx hl, ProcedureForStrangeBehaviorText
	bank1call DrawWholeScreenTextBox

	xor a
	ldh [hCurSelectionItem], a
	bank1call Func_61a1
.start
	bank1call PrintPlayAreaCardList_EnableLCD
	push af
	ldh a, [hCurSelectionItem]
	ld hl, PlayAreaSelectionMenuParameters
	call InitializeMenuParameters
	pop af

	ld [wNumMenuItems], a
.loop_input
	call DoFrame
	call HandleMenuInput
	jr nc, .loop_input
	cp -1
	ret z ; return when B button is pressed

	ldh [hCurSelectionItem], a
	ldh [hTempPlayAreaLocation_ffa1], a
	ld hl, hTemp_ffa0
	cp [hl]
	jr z, .play_sfx ; can't select Slowbro itself

	call GetCardDamageAndMaxHP
	or a
	jr z, .play_sfx ; can't select card without damage

	call TryGiveDamageCounter_StrangeBehavior
	jr c, .play_sfx
	ld a, OPPACTION_6B15
	call SetOppAction_SerialSendDuelData
	jr .start

.play_sfx
	call Func_3794
	jr .loop_input

StrangeBehavior_SwapEffect: ; 2deb3 (b:5eb3)
	call TryGiveDamageCounter_StrangeBehavior
	ret c
	bank1call PrintPlayAreaCardList_EnableLCD
	or a
	ret

; tries to give the damage counter to the target
; chosen by the Player (hTemp_ffa0).
; if the damage counter would KO card, then do
; not give the damage counter and return carry.
TryGiveDamageCounter_StrangeBehavior: ; 2debc (b:5ebc)
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	sub 10
	jr z, .set_carry  ; would bring HP to zero?
; has enough HP to receive a damage counter
	ld [hl], a
	ldh a, [hTempPlayAreaLocation_ffa1]
	add DUELVARS_ARENA_CARD_HP
	ld l, a
	ld a, 10
	add [hl]
	ld [hl], a
	or a
	ret
.set_carry
	scf
	ret

; returns carry if has no damage counters.
SpacingOut_CheckDamage: ; 2ded5 (b:5ed5)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	ldtx hl, NoDamageCountersText
	cp 10
	ret

SpacingOut_Success50PercentEffect: ; 2dee0 (b:5ee0)
	ldtx de, SuccessCheckIfHeadsAttackIsSuccessfulText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	jp nc, SetWasUnsuccessful
	ld a, ATK_ANIM_RECOVER
	ld [wLoadedAttackAnimation], a
	ret

SpacingOut_HealEffect: ; 2def1 (b:5ef1)
	ldh a, [hTemp_ffa0]
	or a
	ret z ; coin toss was tails
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	or a
	ret z ; no damage counters
	ld a, DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	add 10
	ld [hl], a
	ret

; sets carry if no Trainer cards in the Discard Pile.
Scavenge_CheckDiscardPile: ; 2df05 (b:5f05)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wAttachedEnergies + PSYCHIC]
	ldtx hl, NotEnoughPsychicEnergyText
	cp 1
	ret c ; return if no Psychic energy attached
	call CreateTrainerCardListFromDiscardPile
	ldtx hl, ThereAreNoTrainerCardsInDiscardPileText ; this is redundant
	ret

Scavenge_PlayerSelectEnergyEffect: ; 2df1a (b:5f1a)
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	xor a ; PLAY_AREA_ARENA
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ret c
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	or a
	ret

Scavenge_AISelectEffect: ; 2df2d (b:5f2d)
; AI picks first Energy card in list
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	ld a, [wDuelTempList]
	ldh [hTemp_ffa0], a
; AI picks first Trainer card in list
	call CreateTrainerCardListFromDiscardPile
	ld a, [wDuelTempList]
	ldh [hTempPlayAreaLocation_ffa1], a
	ret

Scavenge_DiscardEffect: ; 2df40 (b:5f40)
	ldh a, [hTemp_ffa0]
	call PutCardInDiscardPile
	ret

Scavenge_PlayerSelectTrainerEffect: ; 2df46 (b:5f46)
	call CreateTrainerCardListFromDiscardPile
	bank1call Func_5591
	ldtx hl, PleaseSelectCardText
	ldtx de, PlayerDiscardPileText
	bank1call SetCardListHeaderText
.loop_input
	bank1call DisplayCardList
	jr c, .loop_input
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempPlayAreaLocation_ffa1], a
	ret

Scavenge_AddToHandEffect: ; 2df5f (b:5f5f)
	ldh a, [hTempPlayAreaLocation_ffa1]
	call MoveDiscardPileCardToHand
	call AddCardToHand
	call IsPlayerTurn
	ret c
	ldh a, [hTempPlayAreaLocation_ffa1]
	ldtx hl, WasPlacedInTheHandText
	bank1call DisplayCardDetailScreen
	ret

; returns carry if Defending Pokemon has no attacks
SlowpokeAmnesia_CheckAttacks: ; 2df74 (b:5f74)
	call CheckIfDefendingPokemonHasAnyAttack
	ldtx hl, NoAttackMayBeChosenText
	ret

SlowpokeAmnesia_PlayerSelectEffect: ; 2df7b (b:5f7b)
	call PlayerPickAttackForAmnesia
	ret

SlowpokeAmnesia_AISelectEffect: ; 2df7f (b:5f7f)
	call AIPickAttackForAmnesia
	ldh [hTemp_ffa0], a
	ret

SlowpokeAmnesia_DisableEffect: ; 2df85 (b:5f85)
	call ApplyAmnesiaToAttack
	ret

; returns carry if Arena card has no Psychic Energy attached
; or if it doesn't have any damage counters.
KadabraRecover_CheckEnergyHP: ; 2df89 (b:5f89)
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wAttachedEnergies + PSYCHIC]
	ldtx hl, NotEnoughPsychicEnergyText
	cp 1
	ret c ; return if not enough energy
	call GetCardDamageAndMaxHP
	ldtx hl, NoDamageCountersText
	cp 10
	ret ; return carry if no damage

KadabraRecover_PlayerSelectEffect: ; 2dfa0 (b:5fa0)
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	xor a ; PLAY_AREA_ARENA
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ret c
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a ; store card chosen
	ret

KadabraRecover_AISelectEffect: ; 2dfb2 (b:5fb2)
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	ld a, [wDuelTempList] ; pick first card
	ldh [hTemp_ffa0], a
	ret

KadabraRecover_DiscardEffect: ; 2dfbd (b:5fbd)
	ldh a, [hTemp_ffa0]
	call PutCardInDiscardPile
	ret

KadabraRecover_HealEffect: ; 2dfc3 (b:5fc3)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	ld e, a ; all damage for recovery
	ld d, 0
	call ApplyAndAnimateHPRecovery
	ret

JynxDoubleslap_AIEffect: ; 2dfd7 (b:5fd7)
	ld a, 20 / 2
	lb de, 0, 20
	jp SetExpectedAIDamage

JynxDoubleslap_MultiplierEffect: ; 2dfcf (b:5fcf)
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	call ATimes10
	call SetDefiniteDamage
	ret

JynxMeditate_AIEffect: ; 2dff2 (b:5ff2)
	call JynxMeditate_DamageBoostEffect
	jp SetDefiniteAIDamage

JynxMeditate_DamageBoostEffect: ; 2dfec (b:5fec)
; add damage counters of Defending card to damage
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call SwapTurn
	call AddToDamage
	ret

MysteryAttack_AIEffect: ; 2e001 (b:6001)
	ld a, 20
	lb de, 0, 50
	jp SetExpectedAIDamage

MysteryAttack_RandomEffect: ; 2e009 (b:6009)
	ld a, 20
	call SetDefiniteDamage

; chooses a random effect from 8 possible options.
	call UpdateRNGSources
	and %111
	ldh [hTemp_ffa0], a
	ld hl, .random_effect
	jp JumpToFunctionInTable

.random_effect
	dw ParalysisEffect
	dw PoisonEffect
	dw SleepEffect
	dw ConfusionEffect
	dw .no_effect ; this will actually activate recovery effect afterwards
	dw .no_effect
	dw .more_damage
	dw .no_damage

.more_damage
	ld a, 40
	call SetDefiniteDamage
	ret

.no_damage
	ld a, ATK_ANIM_GLOW_EFFECT
	ld [wLoadedAttackAnimation], a
	xor a
	call SetDefiniteDamage
	call SetNoEffectFromStatus
.no_effect
	ret

MysteryAttack_RecoverEffect: ; 2e03e (b:603e)
; in case the 5th option was chosen for random effect,
; trigger recovery effect for 10 HP.
	ldh a, [hTemp_ffa0]
	cp 4
	ret nz
	lb de, 0, 10
	call ApplyAndAnimateHPRecovery
	ret

StoneBarrage_AIEffect: ; 2e04a (b:604a)
	ld a, 10
	lb de, 0, 100
	jp SetExpectedAIDamage

StoneBarrage_MultiplierEffect: ; 2e052 (b:6052)
	xor a
	ldh [hTemp_ffa0], a
.loop_coin_toss
	ldtx de, FlipUntilFailAppears10DamageForEachHeadsText
	xor a
	call TossCoinATimes_BankB
	jr nc, .tails
	ld hl, hTemp_ffa0
	inc [hl] ; increase heads count
	jr .loop_coin_toss

.tails
	ldh a, [hTemp_ffa0]
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
	call DrawCardFromDeck
	call nc, PutCardInDiscardPile
.check_remaining
	dec c
	jr nz, .loop

	pop hl
	call LoadTxRam3
	ldtx hl, DiscardedCardsFromDeckText
	call DrawWideTextBox_PrintText
	call SwapTurn
	ret


OnixHardenEffect: ; 2e075 (b:6075)
	ld a, SUBSTATUS1_HARDEN
	call ApplySubstatus1ToDefendingCard
	ret

PrimeapeFurySwipes_AIEffect: ; 2e07b (b:607b)
	ld a, 60 / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

PrimeapeFurySwipes_MultiplierEffect: ; 2e083 (b:6083)
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 3
	call TossCoinATimes_BankB
	add a
	call ATimes10
	call SetDefiniteDamage
	ret

TantrumEffect: ; 2e099 (b:6099)
	ldtx de, IfTailsYourPokemonBecomesConfusedText
	call TossCoin_BankB
	ret c ; return if heads
; confuse Pokemon
	ld a, ATK_ANIM_MULTIPLE_SLASH
	ld [wLoadedAttackAnimation], a
	call SwapTurn
	call ConfusionEffect
	call SwapTurn
	ret

StrikesBackEffect: ; 2e0af (b:60af)
	scf
	ret

KabutoArmorEffect: ; 2e0b1 (b:60b1)
	scf
	ret

AbsorbEffect: ; 2e0b3 (b:60b3)
	ld hl, wDealtDamage
	ld a, [hli]
	ld h, [hl]
	ld l, a
	srl h
	rr l
	bit 0, l
	jr z, .rounded
	; round up to nearest 10
	ld de, 5
	add hl, de
.rounded
	ld e, l
	ld d, h
	call ApplyAndAnimateHPRecovery
	ret

SnivelEffect: ; 2e0cb (b:60cb)
	ld a, SUBSTATUS2_REDUCE_BY_20
	call ApplySubstatus2ToDefendingCard
	ret

CuboneRage_AIEffect: ; 2e0d1 (b:60d1)
	call CuboneRage_DamageBoostEffect
	jp SetDefiniteAIDamage

CuboneRage_DamageBoostEffect: ; 2e0d7 (b:60d7)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call AddToDamage
	ret

Bonemerang_AIEffect: ; 2e0e0 (b:60e0)
	ld a, 60 / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

Bonemerang_MultiplierEffect: ; 2e0e8 (b:60e8)
	ld hl, 30
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	ld e, a
	add a ; a = 2 * heads
	add e ; a = 3 * heads
	call ATimes10
	call SetDefiniteDamage
	ret

; returns carry if can't add Pokemon from deck
MarowakCallForFamily_CheckDeckAndPlayArea: ; 2e100 (b:6100)
	call CheckIfDeckIsEmpty
	ret c ; no cards in deck
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, NoSpaceOnTheBenchText
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ret

MarowakCallForFamily_PlayerSelectEffect: ; 2e110 (b:6110)
	ld a, $ff
	ldh [hTemp_ffa0], a

	call CreateDeckCardList
	ldtx hl, ChooseBasicFightingPokemonFromDeckText
	ldtx bc, FightingPokemonDeckText
	lb de, SEARCHEFFECT_BASIC_FIGHTING, $00
	call LookForCardsInDeck
	ret c

; draw Deck list interface and print text
	bank1call Func_5591
	ldtx hl, ChooseBasicFightingPokemonText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText

.loop
	bank1call DisplayCardList
	jr c, .pressed_b

	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp FIGHTING
	jr nz, .play_sfx ; is Fighting?
	ld a, [wLoadedCard2Stage]
	or a
	jr nz, .play_sfx ; is Basic?
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
; that is, if the Deck has no Basic Fighting Pokemon.
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop_b_press
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	ld a, l
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard1Type]
	cp FIGHTING
	jr nz, .next ; found, go back to top loop
	ld a, [wLoadedCard1Stage]
	or a
	jr z, .play_sfx ; found, go back to top loop
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_b_press

; no valid card in Deck, can safely exit screen
	ld a, $ff
	ldh [hTemp_ffa0], a
	or a
	ret

MarowakCallForFamily_AISelectEffect: ; 2e177 (b:6177)
	call CreateDeckCardList
	ld hl, wDuelTempList
.loop_deck
	ld a, [hli]
	ldh [hTemp_ffa0], a
	cp $ff
	ret z ; none found
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp FIGHTING
	jr nz, .loop_deck
	ld a, [wLoadedCard2Stage]
	or a
	jr nz, .loop_deck
; found
	ret

MarowakCallForFamily_PutInPlayAreaEffect: ; 2e194 (b:6194)
	ldh a, [hTemp_ffa0]
	cp $ff
	jr z, .shuffle
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	call PutHandPokemonCardInPlayArea
	call IsPlayerTurn
	jr c, .shuffle
	; display card on screen
	ldh a, [hTemp_ffa0]
	ldtx hl, PlacedOnTheBenchText
	bank1call DisplayCardDetailScreen
.shuffle
	call Func_2c0bd
	ret

KarateChop_AIEffect: ; 2e1b4 (b:61b4)
	call KarateChop_DamageSubtractionEffect
	jp SetDefiniteAIDamage

KarateChop_DamageSubtractionEffect: ; 2e1ba (b:61ba)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	ld e, a
	ld hl, wDamage
	ld a, [hl]
	sub e
	ld [hli], a
	ld a, [hl]
	sbc 0
	ld [hl], a
	rla
	ret nc
; cap it to 0 damage
	xor a
	call SetDefiniteDamage
	ret

SubmissionEffect: ; 2e1d1 (b:61d1)
	ld a, 20
	call DealRecoilDamageToSelf
	ret

GolemSelfdestructEffect: ; 2e1d7 (b:61d7)
	ld a, 40
	call DealRecoilDamageToSelf
	ld a, $01
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	xor a
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	ret

GravelerHardenEffect: ; 2e1f6 (b:61f6)
	ld a, SUBSTATUS1_HARDEN
	call ApplySubstatus1ToDefendingCard
	ret

Ram_SelectSwitchEffect: ; 2e1fc (b:61fc)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	jr c, .no_bench
	call DuelistSelectForcedSwitch
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret
.no_bench
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

Ram_RecoilSwitchEffect: ; 2e212 (b:6212)
	ld a, 20
	call DealRecoilDamageToSelf
	ldh a, [hTemp_ffa0]
	call HandleSwitchDefendingPokemonEffect
	ret

LeerEffect: ; 2e21d (b:621d)
	ldtx de, IfHeadsOpponentCannotAttackText
	call TossCoin_BankB
	jp nc, SetWasUnsuccessful
	ld a, ATK_ANIM_LEER
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS2_LEER
	call ApplySubstatus2ToDefendingCard
	ret

; return carry if opponent has no Bench Pokemon.
StretchKick_CheckBench: ; 2e231 (b:6231)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

StretchKick_PlayerSelectEffect: ; 2e23c (b:623c)
	ldtx hl, ChoosePkmnInTheBenchToGiveDamageText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench
.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

StretchKick_AISelectEffect: ; 2e255 (b:6255)
; chooses Bench Pokemon with least amount of remaining HP
	call GetBenchPokemonWithLowestHP
	ldh [hTemp_ffa0], a
	ret

StretchKick_BenchDamageEffect: ; 2e25b (b:625b)
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld b, a
	ld de, 30
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

SandAttackEffect: ; 2e26b (b:626b)
	ld a, SUBSTATUS2_SAND_ATTACK
	call ApplySubstatus2ToDefendingCard
	ret

SandslashFurySwipes_AIEffect: ; 2e271 (b:6271)
	ld a, 60 / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

SandslashFurySwipes_MultiplierEffect: ; 2e279 (b:6279)
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 3
	call TossCoinATimes_BankB
	add a
	call ATimes10
	call SetDefiniteDamage
	ret

EarthquakeEffect: ; 2e28f (b:628f)
	ld a, $01
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	ret

PrehistoricPowerEffect: ; 2e29a (b:629a)
	scf
	ret

; returns carry if Pkmn Power can't be used.
Peek_OncePerTurnCheck: ; 2e29c (b:629c)
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	and USED_PKMN_POWER_THIS_TURN
	jr nz, .already_used
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret
.already_used
	ldtx hl, OnlyOncePerTurnText
	scf
	ret

Peek_SelectEffect: ; 2e2b4 (b:62b4)
; set Pkmn Power used flag
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]

	ld a, DUELVARS_DUELIST_TYPE
	call GetTurnDuelistVariable
	cp DUELIST_TYPE_LINK_OPP
	jr z, .link_opp
	and DUELIST_TYPE_AI_OPP
	jr nz, .ai_opp

; player
	call Func_3b31
	call HandlePeekSelection
	ldh [hAIPkmnPowerEffectParam], a
	call SerialSend8Bytes
	ret

.link_opp
	call SerialRecv8Bytes
	ldh [hAIPkmnPowerEffectParam], a

.ai_opp
	ldh a, [hAIPkmnPowerEffectParam]
	bit AI_PEEK_TARGET_HAND_F, a
	jr z, .prize_or_deck
	and (~AI_PEEK_TARGET_HAND & $ff) ; unset bit to get deck index
; if masked value is higher than $40, then it means
; that AI chose to look at Player's deck.
; all deck indices will be smaller than $40.
	cp $40
	jr c, .hand
	ldh a, [hAIPkmnPowerEffectParam]
	jr .prize_or_deck

.hand
; AI chose to look at random card in hand,
; so display it to the Player on screen.
	call SwapTurn
	ldtx hl, PeekWasUsedToLookInYourHandText
	bank1call DisplayCardDetailScreen
	call SwapTurn
	ret

.prize_or_deck
; AI chose either a prize card or Player's top deck card,
; so show Play Area and draw cursor appropriately.
	call Func_3b31
	call SwapTurn
	ldh a, [hAIPkmnPowerEffectParam]
	xor $80
	call DrawAIPeekScreen
	call SwapTurn
	ldtx hl, CardPeekWasUsedOnText
	call DrawWideTextBox_WaitForInput
	ret

BoneAttackEffect: ; 2e30f (b:630f)
	ldtx de, IfHeadsOpponentCannotAttackText
	call TossCoin_BankB
	ret nc
	ld a, SUBSTATUS2_BONE_ATTACK
	call ApplySubstatus2ToDefendingCard
	ret

; return carry if neither Play Area
; has room for more Bench Pokemon.
Wail_BenchCheck: ; 2e31c (b:631c)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp MAX_PLAY_AREA_POKEMON
	jr c, .no_carry
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp MAX_PLAY_AREA_POKEMON
	jr c, .no_carry
	ldtx hl, NoSpaceOnTheBenchText
	scf
	ret
.no_carry
	or a
	ret

Wail_FillBenchEffect: ; 2e335 (b:6335)
	call SwapTurn
	call .FillBench
	call SwapTurn
	call .FillBench

; display both Play Areas
	ldtx hl, BasicPokemonWasPlacedOnEachBenchText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInPlayArea
	bank1call OpenPlayAreaScreenForSelection
	call SwapTurn
	bank1call HasAlivePokemonInPlayArea
	bank1call OpenPlayAreaScreenForSelection
	call SwapTurn
	ret

.FillBench ; 2e35a (b:635a)
	call CreateDeckCardList
	ret c
	ld hl, wDuelTempList
	call ShuffleCards

; if no more space in the Bench, then return.
.check_bench
	push hl
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	pop hl
	cp MAX_PLAY_AREA_POKEMON
	jr nc, .done

; there's still space, so look for the next
; Basic Pokemon card to put in the Bench.
.loop
	ld a, [hli]
	ldh [hTempCardIndex_ff98], a
	cp $ff
	jr z, .done
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr nc, .loop ; is Pokemon card?
	ld a, [wLoadedCard2Stage]
	or a
	jr nz, .loop ; is Basic?
; place card in Bench
	push hl
	ldh a, [hTempCardIndex_ff98]
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	call PutHandPokemonCardInPlayArea
	pop hl
	jr .check_bench

.done
	call Func_2c0bd
	ret

Thunderpunch_AIEffect: ; 2e399 (b:6399)
	ld a, (30 + 40) / 2
	lb de, 30, 40
	jp SetExpectedAIDamage

Thunderpunch_ModifierEffect: ; 2e3a1 (b:63a1)
	ldtx de, IfHeadPlus10IfTails10ToYourselfText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret nc ; return if got tails
	ld a, 10
	call AddToDamage
	ret

Thunderpunch_RecoilEffect: ; 2e3b0 (b:63b0)
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if got heads
	ld a, 10
	call DealRecoilDamageToSelf
	ret

LightScreenEffect: ; 2e3ba (b:63ba)
	ld a, SUBSTATUS1_HALVE_DAMAGE
	call ApplySubstatus1ToDefendingCard
	ret

ElectabuzzQuickAttack_AIEffect: ; 2e3c0 (b:63c0)
	ld a, (20 + 40) / 2
	lb de, 20, 40
	jp SetExpectedAIDamage

ElectabuzzQuickAttack_DamageBoostEffect: ; 2e3c8 (b:63c8)
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, 20
	call AddToDamage
	ret

MagnemiteSelfdestructEffect: ; 2e3db (b:63db)
	ld a, 40
	call DealRecoilDamageToSelf

	ld a, $01
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	call SwapTurn

	xor a
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	ret

ZapdosThunder_Recoil50PercentEffect: ; 2e3fa (b:63fa)
	ld hl, 30
	call LoadTxRam3
	ldtx de, IfTailsDamageToYourselfTooText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret

ZapdosThunder_RecoilEffect: ; 2e409 (b:6409)
	ld hl, 30
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if got heads
	ld a, 30
	call DealRecoilDamageToSelf
	ret

ThunderboltEffect: ; 2e419 (b:6419)
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

ThunderstormEffect: ; 2e429 (b:6429)
	ld a, 1
	ldh [hCurSelectionItem], a

	call SwapTurn
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld b, 0
	ld e, b
	jr .next_pkmn

.check_damage
	push de
	push bc
	call .DisplayText
	ld de, $0
	call SwapTurn
	call TossCoin_BankB
	call SwapTurn
	push af
	call GetNextPositionInTempList
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
	call GetNextPositionInTempList
	ld [hl], $ff
	ld a, b
	ldh [hTemp_ffa0], a
	call Func_3b21
	call SwapTurn

; tally recoil damage
	ldh a, [hTemp_ffa0]
	or a
	jr z, .skip_recoil
	; deal number of tails times 10 to self
	call ATimes10
	call DealRecoilDamageToSelf
.skip_recoil

; deal damage for Bench Pokemon that got heads
	call SwapTurn
	ld hl, hTempPlayAreaLocation_ffa1
	ld b, PLAY_AREA_BENCH_1
.loop_bench
	ld a, [hli]
	cp $ff
	jr z, .done
	or a
	jr z, .skip_damage ; skip if tails
	ld de, 20
	call DealDamageToPlayAreaPokemon_RegularAnim
.skip_damage
	inc b
	jr .loop_bench

.done
	call SwapTurn
	ret

; displays text for current Bench Pokemon,
; printing its Bench number and name.
.DisplayText ; 2e491 (b:6491)
	ld b, e
	ldtx hl, BenchText
	ld de, wDefaultText
	call CopyText
	ld a, $30 ; 0 FW character
	add b
	ld [de], a
	inc de
	ld a, $20 ; space FW character
	ld [de], a
	inc de

	ld a, DUELVARS_ARENA_CARD
	add b
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer2_FromDeckIndex
	ld hl, wLoadedCard2Name
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyText

	xor a
	ld [wDuelDisplayedScreen], a
	ret

JolteonQuickAttack_AIEffect: ; 2e4bb (b:64bb)
	ld a, (10 + 30) / 2
	lb de, 10, 30
	jp SetExpectedAIDamage

JolteonQuickAttack_DamageBoostEffect: ; 2e4c3 (b:64c3)
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, 20
	call AddToDamage
	ret

PinMissile_AIEffect: ; 2e4d6 (b:64d6)
	ld a, (20 * 4) / 2
	lb de, 0, 80
	jp SetExpectedAIDamage

PinMissile_MultiplierEffect: ; 2e4de (b:64de)
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 4
	call TossCoinATimes_BankB
	add a ; a = 2 * heads
	call ATimes10
	call SetDefiniteDamage
	ret

Fly_AIEffect: ; 2e4f4 (b:64f4)
	ld a, 30 / 2
	lb de, 0, 30
	jp SetExpectedAIDamage

Fly_Success50PercentEffect: ; 2e4fc (b:64fc)
	ldtx de, SuccessCheckIfHeadsAttackIsSuccessfulText
	call TossCoin_BankB
	jr c, .heads
	xor a ; ATK_ANIM_NONE
	ld [wLoadedAttackAnimation], a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret
.heads
	ld a, ATK_ANIM_AGILITY_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_FLY
	call ApplySubstatus1ToDefendingCard
	ret

ThunderJolt_Recoil50PercentEffect: ; 2e51a (b:651a)
	ld hl, 10
	call LoadTxRam3
	ldtx de, IfTailsDamageToYourselfTooText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret

ThunderJolt_RecoilEffect: ; 2e529 (b:6529)
	ld hl, 10
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if was heads
	ld a, 10
	call DealRecoilDamageToSelf
	ret

Spark_PlayerSelectEffect: ; 2e539 (b:6539)
	ld a, $ff
	ldh [hTemp_ffa0], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	ret c ; has no Bench Pokemon

	ldtx hl, ChoosePkmnInTheBenchToGiveDamageText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench

	; the following two instructions can be removed
	; since Player selection will overwrite it.
	ld a, PLAY_AREA_BENCH_1
	ldh [hTempPlayAreaLocation_ff9d], a

.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

Spark_AISelectEffect: ; 2e562 (b:6562)
	ld a, $ff
	ldh [hTemp_ffa0], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	ret c ; has no Bench Pokemon
; AI always picks Pokemon with lowest HP remaining
	call GetBenchPokemonWithLowestHP
	ldh [hTemp_ffa0], a
	ret

Spark_BenchDamageEffect: ; 2e574 (b:6574)
	ldh a, [hTemp_ffa0]
	cp $ff
	ret z
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld b, a
	ld de, 10
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

PikachuLv16GrowlEffect: ; 2e589 (b:6589)
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld b, a
	ld de, 20
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

PikachuAltLv16GrowlEffect: ; 2e58f (b:658f)
	ld a, SUBSTATUS2_GROWL
	call ApplySubstatus2ToDefendingCard
	ret

ChainLightningEffect: ; 2e595 (b:6595)
	ld a, 0
	call SetDefiniteDamage
	call SwapTurn
	call GetArenaCardColor
	call SwapTurn
	ldh [hCurSelectionItem], a
	ret z ; don't damage if colorless

; opponent's Bench
	call SwapTurn
	call .DamageSameColorBench
	call SwapTurn

; own Bench
	ret

.DamageSameColorBench ; 2e5ba (b:65ba)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld e, a
	ld d, PLAY_AREA_ARENA
	jr .next_bench

.check_damage
	ld a, d
	call GetPlayAreaCardColor
	ld c, a
	ldh a, [hCurSelectionItem]
	cp c
	jr nz, .next_bench ; skip if not same color
; apply damage to this Bench card
	push de
	ld b, d
	ld de, 20
	call DealDamageToPlayAreaPokemon_RegularAnim
	pop de

.next_bench
	inc d
	dec e
	jr nz, .check_damage
	ret

RaichuAgilityEffect: ; 2e5dc (b:65dc)
	ldtx de, IfHeadsDoNotReceiveDamageOrEffectText
	call TossCoin_BankB
	ret nc ; skip if got tails
	ld a, ATK_ANIM_AGILITY_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_AGILITY
	call ApplySubstatus1ToDefendingCard
	ret

RaichuThunder_Recoil50PercentEffect: ; 2e5ee (b:65ee)
	ld hl, 30
	call LoadTxRam3
	ldtx de, IfTailsDamageToYourselfTooText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret

RaichuThunder_RecoilEffect: ; 2e5fd (b:65fd)
	ld hl, 30
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if got heads
	ld a, 30
	call DealRecoilDamageToSelf
	ret

Gigashock_PlayerSelectEffect: ; 2e60d (b:660d)
	call SwapTurn
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp 2
	jr nc, .has_bench
	call SwapTurn
	ld a, $ff
	ldh [hTempList], a
	ret

.has_bench
	ldtx hl, ChooseUpTo3PkmnOnBenchToGiveDamageText
	call DrawWideTextBox_WaitForInput

; init number of items in list and cursor position
	xor a
	ldh [hCurSelectionItem], a
	ld [wce72], a
	bank1call Func_61a1
.start
	bank1call PrintPlayAreaCardList_EnableLCD
	push af
	ld a, [wce72]
	ld hl, BenchSelectionMenuParameters
	call InitializeMenuParameters
	pop af

; exclude Arena Pokemon from number of items
	dec a
	ld [wNumMenuItems], a

.loop_input
	call DoFrame
	call HandleMenuInput
	jr nc, .loop_input
	cp -1
	jr z, .try_cancel

	ld [wce72], a
	call .CheckIfChosenAlready
	jr nc, .not_chosen
	; play SFX
	call Func_3794
	jr .loop_input

.not_chosen
; mark this Play Area location
	ldh a, [hCurMenuItem]
	inc a
	ld b, SYM_LIGHTNING
	call DrawSymbolOnPlayAreaCursor
; store it in the list of chosen Bench Pokemon
	call GetNextPositionInTempList
	ldh a, [hCurMenuItem]
	inc a
	ld [hl], a

; check if 3 were chosen already
	ldh a, [hCurSelectionItem]
	ld c, a
	cp 3
	jr nc, .chosen ; check if already chose 3

	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	dec a
	cp c
	jr nz, .start ; if sill more options available, loop back
	; fallthrough if no other options available to choose

.chosen
	ldh a, [hCurMenuItem]
	inc a
	call Func_2c10b
	ldh a, [hKeysPressed]
	and B_BUTTON
	jr nz, .try_cancel
	call SwapTurn
	call GetNextPositionInTempList
	ld [hl], $ff ; terminating byte
	ret

.try_cancel
	ldh a, [hCurSelectionItem]
	or a
	jr z, .start ; none selected, can safely loop back to start

; undo last selection made
	dec a
	ldh [hCurSelectionItem], a
	ld e, a
	ld d, $00
	ld hl, hTempList
	add hl, de
	ld a, [hl]

	push af
	ld b, SYM_SPACE
	call DrawSymbolOnPlayAreaCursor
	call EraseCursor
	pop af

	dec a
	ld [wce72], a
	jr .start

; returns carry if Bench Pokemon
; in register a was already chosen.
.CheckIfChosenAlready: ; 2e6af (b:66af)
	inc a
	ld c, a
	ldh a, [hCurSelectionItem]
	ld b, a
	ld hl, hTempList
	inc b
	jr .next_check
.check_chosen
	ld a, [hli]
	cp c
	scf
	ret z ; return if chosen already
.next_check
	dec b
	jr nz, .check_chosen
	or a
	ret

Gigashock_AISelectEffect: ; 2e6c3 (b:66c3)
; if Bench has 3 Pokemon or less, no need for selection,
; since AI will choose them all.
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp MAX_PLAY_AREA_POKEMON - 1
	jr nc, .start_selection

; select them all
	ld hl, hTempList
	ld b, PLAY_AREA_ARENA
	jr .next_bench
.select_bench
	ld [hl], b
	inc hl
.next_bench
	inc b
	dec a
	jr nz, .select_bench
	ld [hl], $ff ; terminating byte
	ret

.start_selection
; has more than 3 Bench cards, proceed to sort them
; by lowest remaining HP to highest, and pick first 3.
	call SwapTurn
	dec a
	ld c, a
	ld b, PLAY_AREA_BENCH_1

; first select all of the Bench Pokemon and write to list
	ld hl, hTempList
.loop_all
	ld [hl], b
	inc hl
	inc b
	dec c
	jr nz, .loop_all
	ld [hl], $00 ; end list with $00

; then check each of the Bench Pokemon HP
; sort them from lowest remaining HP to highest.
	ld de, hTempList
.loop_outer
	ld a, [de]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	ld c, a
	ld l, e
	ld h, d
	inc hl

.loop_inner
	ld a, [hli]
	or a
	jr z, .next ; reaching $00 means it's end of list

	push hl
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	pop hl
	cp c
	jr c, .loop_inner
	; a Bench Pokemon was found with less HP
	ld c, a ; store its HP

; switch the two
	dec hl
	ld b, [hl]
	ld a, [de]
	ld [hli], a
	ld a, b
	ld [de], a
	jr .loop_inner

.next
	inc de
	ld a, [de]
	or a
	jr nz, .loop_outer

; done
	ld a, $ff ; terminating byte
	ldh [hTempList + 3], a
	call SwapTurn
	ret

Gigashock_BenchDamageEffect: ; 2e71f (b:671f)
	call SwapTurn
	ld hl, hTempList
.loop_selection
	ld a, [hli]
	cp $ff
	jr z, .done
	push hl
	ld b, a
	ld de, 10
	call DealDamageToPlayAreaPokemon_RegularAnim
	pop hl
	jr .loop_selection
.done
	call SwapTurn
	ret

MagnetonLv28SelfdestructEffect: ; 2e739 (b:6739)

; opponent's bench
	call SwapTurn
	xor a
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	ret

MagnetonSonicboom_UnaffectedByColorEffect: ; 2e758 (b:6758)
	ld hl, wDamage + 1
	set UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, [hl]
	ret

MagnetonSonicboom_NullEffect: ; 2e75e (b:675e)
	ret

MagnetonLv35SelfdestructEffect: ; 2e75f (b:675f)
	ld a, 30
	call DealRecoilDamageToSelf

; own bench
	ld a, $01
	ld [wIsDamageToSelf], a
	ld a, 20
	call DealDamageToAllBenchedPokemon

; opponent's bench
	call SwapTurn
	xor a
	ld [wIsDamageToSelf], a
	ld a, 20
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	ret

PealOfThunder_InitialEffect: ; 2e77e (b:677e)
	scf
	ret

PealOfThunder_RandomlyDamageEffect: ; 2e780 (b:6780)
	call ExchangeRNG
	ld de, 30 ; damage to inflict
	call RandomlyDamagePlayAreaPokemon
	bank1call Func_6e49
	ret

; randomly damages a Pokemon in play, except
; card that is in [hTempPlayAreaLocation_ff9d].
; plays thunder animation when Play Area is shown.
; input:
;	de = amount of damage to deal
RandomlyDamagePlayAreaPokemon: ; 2e78d (b:678d)
	xor a
	ld [wNoDamageOrEffect], a

; choose randomly which Play Area to attack
	call UpdateRNGSources
	and 1
	jr nz, .opp_play_area

; own Play Area
	ld a, $01
	ld [wIsDamageToSelf], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	call Random
	ld b, a
	; can't select Zapdos
	ldh a, [hTempPlayAreaLocation_ff9d]
	cp b
	jr z, RandomlyDamagePlayAreaPokemon ; re-roll Pokemon to attack

.damage
	ld a, ATK_ANIM_THUNDER_PLAY_AREA
	ld [wLoadedAttackAnimation], a
	call DealDamageToPlayAreaPokemon
	ret

.opp_play_area
	xor a
	ld [wIsDamageToSelf], a
	call SwapTurn
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	call Random
	ld b, a
	call .damage
	call SwapTurn
	ret

BigThunderEffect: ; 2e7cb (b:67cb)
	call ExchangeRNG
	ld de, 70 ; damage to inflict
	call RandomlyDamagePlayAreaPokemon
	ret

MagneticStormEffect: ; 2e7d5 (b:67d5)
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_DISCARD_PILE
	call GetTurnDuelistVariable
	cp 1
	jr c, .no_cards

	call CreateDiscardPileCardList
	bank1call Func_5591
	ldtx hl, PleaseSelectCardText
	ldtx de, PlayerDiscardPileText
	bank1call SetCardListHeaderText
.read_input
	bank1call DisplayCardList

; Discard Pile card was chosen
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempList], a

; add card to hand and show in screen if
; it wasn't the Player who played the Trainer card.
	call MoveDiscardPileCardToHand
	call AddCardToHand
	ldtx hl, CardWasChosenText
	bank1call DisplayCardDetailScreen
	call IsPlayerTurn
	ret c
	ldh a, [hTempList]
	ldtx hl, CardWasChosenText
	bank1call DisplayCardDetailScreen
	ret

.no_cards
	ldtx hl, ThereAreNoCardsInTheDiscardPileText
	ret

ElectrodeSonicboom_UnaffectedByColorEffect: ; 2e870 (b:6870)
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld e, a
	call SwapArenaWithBenchPokemon
	call SwapTurn
	call ClearDamageReductionSubstatus2
	xor a
	ld [wDuelDisplayedScreen], a
	ret
	
ElectrodeSonicboom_NullEffect: ; 2e876 (b:6876)
	ldh a, [hTemp_ffa0]
	ldtx hl, ThePopWasntSuccessfulText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	jr c, .no_bench
	ret

.no_bench
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret 

; return carry if no cards in Deck
EnergySpike_DeckCheck: ; 2e877 (b:6877)
	call CheckIfDeckIsEmpty
	ret

EnergySpike_PlayerSelectEffect: ; 2e87b (b:687b)
	ld a, $ff
	ldh [hTemp_ffa0], a

; search cards in Deck
	call CreateDeckCardList
	ldtx hl, Choose1BasicEnergyCardFromDeckText
	ldtx bc, BasicEnergyText
	lb de, SEARCHEFFECT_BASIC_ENERGY, 0
	call LookForCardsInDeck
	ret c

	bank1call Func_5591
	ldtx hl, ChooseBasicEnergyCardText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText
.select_card
	bank1call DisplayCardList
	jr c, .try_cancel
	call GetCardIDFromDeckIndex
	call GetCardType
	cp TYPE_ENERGY_DOUBLE_COLORLESS
	jr nc, .select_card ; not a Basic Energy card
	and TYPE_ENERGY
	jr z, .select_card ; not a Basic Energy card
	; Energy card selected

	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	call EmptyScreen
	ldtx hl, ChoosePokemonToAttachEnergyCardText
	call DrawWideTextBox_WaitForInput

; choose a Pokemon in Play Area to attach card
	bank1call HasAlivePokemonInPlayArea
.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTempPlayAreaLocation_ffa1], a
	ret

.play_sfx
	call Func_3794
	jr .select_card

.try_cancel
; Player tried exiting screen, if there are
; any Basic Energy cards, Player is forced to select them.
; otherwise, they can safely exit.
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop_deck
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next_card
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	and TYPE_ENERGY
	jr z, .next_card
	cp TYPE_ENERGY_DOUBLE_COLORLESS
	jr c, .play_sfx
.next_card
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_deck
	; can exit

	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

EnergySpike_AISelectEffect: ; 2e8f1 (b:68f1)
; AI doesn't select any card
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

EnergySpike_AttachEnergyEffect: ; 2e8f6 (b:68f6)
	ldh a, [hTemp_ffa0]
	cp $ff
	jr z, .done

; add card to hand and attach it to the selected Pokemon
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld e, a
	ldh a, [hTemp_ffa0]
	call PutHandCardInPlayArea
	call IsPlayerTurn
	jr c, .done

; not Player, so show detail screen
; and which Pokemon was chosen to attach Energy.
	ldh a, [hTempPlayAreaLocation_ffa1]
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex
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
	call Func_2c0bd
	ret

JolteonDoubleKick_AIEffect: ; 2e930 (b:6930)
	ld a, (30 * 3) / 2
	lb de, 0, 90
	jp SetExpectedAIDamage

JolteonDoubleKick_MultiplierEffect: ; 2e938 (b:6938)
	ld hl, 30
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 3
	call TossCoinATimes_BankB
	ld c, a
	add a
	add c
	call ATimes10
	call SetDefiniteDamage
	ret

TailWagEffect: ; 2e94e (b:694e)
	ldtx de, IfHeadsOpponentCannotAttackText
	call TossCoin_BankB
	jp nc, SetWasUnsuccessful
	ld a, ATK_ANIM_LURE
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS2_TAIL_WAG
	call ApplySubstatus2ToDefendingCard
	ret

EeveeQuickAttack_AIEffect: ; 2e962 (b:5962)
	ld a, (10 + 30) / 2
	lb de, 10, 30
	jp SetExpectedAIDamage

EeveeQuickAttack_DamageBoostEffect: ; 2e96a (b:596a)
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, 20
	call AddToDamage
	ret

SpearowMirrorMove_AIEffect: ; 2e97d (b:697d)
	jr MirrorMoveEffects.AIEffect

SpearowMirrorMove_InitialEffect1: ; 2e97f (b:697f)
	jr MirrorMoveEffects.InitialEffect1

SpearowMirrorMove_InitialEffect2: ; 2e981 (b:6981)
	jr MirrorMoveEffects.InitialEffect2

SpearowMirrorMove_PlayerSelection: ; 2e983 (b:6983)
	jr MirrorMoveEffects.PlayerSelection

SpearowMirrorMove_AISelection: ; 2e985 (b:6985)
	jr MirrorMoveEffects.AISelection

SpearowMirrorMove_BeforeDamage: ; 2e987 (b:6987)
	jr MirrorMoveEffects.BeforeDamage

SpearowMirrorMove_AfterDamage: ; 2e989 (b:6989)
	jp MirrorMoveEffects.AfterDamage

; these are effect commands that Mirror Move uses
; in order to mimic last turn's attack.
; it covers all possible effect steps to perform its commands
; (i.e. selection for Amnesia and Energy discarding attacks, etc)
MirrorMoveEffects: ; 2e98c (b:698c)
.AIEffect
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_DAMAGE
	call GetTurnDuelistVariable
	ld a, [hl]
	ld [wAIMinDamage], a
	ld [wAIMaxDamage], a
	ret

.InitialEffect1
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_DAMAGE
	call GetTurnDuelistVariable
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	ret nz ; return if has last turn damage
	ld a, [hli]
	or a
	ret nz ; return if has last turn status
	; no attack received last turn
	ldtx hl, YouDidNotReceiveAnAttackToMirrorMoveText
	scf
	ret

.InitialEffect2
	ld a, $ff
	ldh [hTemp_ffa0], a
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_EFFECT
	call GetTurnDuelistVariable
	or a
	ret z ; no effect
	cp LAST_TURN_EFFECT_AMNESIA
	jp z, PlayerPickAttackForAmnesia
	or a
	ret

.PlayerSelection
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_EFFECT
	call GetTurnDuelistVariable
	or a
	ret z ; no effect
; handle Energy card discard effect
	cp LAST_TURN_EFFECT_DISCARD_ENERGY
	jp z, HandleEnergyDiscardEffectSelection
	ret

.AISelection
	ld a, $ff
	ldh [hTemp_ffa0], a
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_EFFECT
	call GetTurnDuelistVariable
	or a
	ret z ; no effect
	cp LAST_TURN_EFFECT_DISCARD_ENERGY
	jr z, .discard_energy
	cp LAST_TURN_EFFECT_AMNESIA
	jr z, .pick_amnesia_attack
	ret

.discard_energy
	call AIPickEnergyCardToDiscardFromDefendingPokemon
	ldh [hTemp_ffa0], a
	ret

.pick_amnesia_attack
	call AIPickAttackForAmnesia
	ldh [hTemp_ffa0], a
	ret

.BeforeDamage
; if was attacked with Amnesia, apply it to the selected attack
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_EFFECT
	call GetTurnDuelistVariable
	cp LAST_TURN_EFFECT_AMNESIA
	jr z, .apply_amnesia

; otherwise, check if there was last turn damage,
; and write it to wDamage.
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_DAMAGE
	call GetTurnDuelistVariable
	ld de, wDamage
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hld]
	ld [de], a
	or [hl]
	jr z, .no_damage
	ld a, ATK_ANIM_HIT
	ld [wLoadedAttackAnimation], a
.no_damage
	inc hl
	inc hl ; DUELVARS_ARENA_CARD_LAST_TURN_STATUS
; check if there was a status applied to Defending Pokemon
; from the attack it used.
	push hl
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetNonTurnDuelistVariable
	ld e, l
	ld d, h
	pop hl
	ld a, [hli]
	or a
	jr z, .no_status
	push hl
	push de
	call .ExecuteStatusEffect
	pop de
	pop hl
.no_status
; hl is at DUELVARS_ARENA_CARD_LAST_TURN_SUBSTATUS2
; apply substatus2 to self
	ld e, DUELVARS_ARENA_CARD_SUBSTATUS2
	ld a, [hli]
	ld [de], a
	ret

.apply_amnesia
	call ApplyAmnesiaToAttack
	ret

.AfterDamage: ; 2ea28 (b:6a28)
	ld a, [wNoDamageOrEffect]
	or a
	ret nz ; is unaffected
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_EFFECT
	call GetTurnDuelistVariable
	cp LAST_TURN_EFFECT_DISCARD_ENERGY
	jr nz, .change_weakness

; execute Energy discard effect for card chosen
	call SwapTurn
	ldh a, [hTemp_ffa0]
	call PutCardInDiscardPile
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_EFFECT
	call GetTurnDuelistVariable
	ld [hl], LAST_TURN_EFFECT_DISCARD_ENERGY
	call SwapTurn

.change_weakness
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_CHANGE_WEAK
	call GetTurnDuelistVariable
	ld a, [hl]
	or a
	ret z ; weakness wasn't changed last turn

	push hl
	call SwapTurn
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer2_FromDeckIndex
	call SwapTurn
	pop hl

	ld a, [wLoadedCard2Weakness]
	or a
	ret z ; defending Pokemon has no weakness to change

; apply same color weakness to Defending Pokemon
	ld a, [hl]
	push af
	ld a, DUELVARS_ARENA_CARD_CHANGED_WEAKNESS
	call GetNonTurnDuelistVariable
	pop af
	ld [hl], a

; print message of weakness color change
	ld c, -1
.loop_color
	inc c
	rla
	jr nc, .loop_color
	ld a, c
	call SwapTurn
	push af
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex
	pop af
	call LoadCardNameAndInputColor
	ldtx hl, ChangedTheWeaknessOfPokemonToColorText
	call DrawWideTextBox_PrintText
	call SwapTurn
	ret

.ExecuteStatusEffect: ; 2ea8f (b:6a8f)
	ld c, a
	and PSN_DBLPSN
	jr z, .cnf_slp_prz
	ld b, a
	cp DOUBLE_POISONED
	push bc
	call z, DoublePoisonEffect
	pop bc
	ld a, b
	cp POISONED
	push bc
	call z, PoisonEffect
	pop bc
.cnf_slp_prz
	ld a, c
	and CNF_SLP_PRZ
	ret z
	cp CONFUSED
	jp z, ConfusionEffect
	cp ASLEEP
	jp z, SleepEffect
	cp PARALYZED
	jp z, ParalysisEffect
	ret

FearowAgilityEffect: ; 2eab8 (b:6ab8)
	ldtx de, IfHeadsDoNotReceiveDamageOrEffectText
	call TossCoin_BankB
	ret nc
	ld a, ATK_ANIM_AGILITY_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_AGILITY
	call ApplySubstatus1ToDefendingCard
	ret

; return carry if cannot use Step In
StepIn_BenchCheck: ; 2eaca (b:6aca)
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ldtx hl, CanOnlyBeUsedOnTheBenchText
	or a
	jr z, .set_carry

	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	ldtx hl, OnlyOncePerTurnText
	and USED_PKMN_POWER_THIS_TURN
	jr nz, .set_carry

	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret

.set_carry
	scf
	ret

StepIn_SwitchEffect: ; 2eae8 (b:6ae8)
	ldh a, [hTemp_ffa0]
	ld e, a
	call SwapArenaWithBenchPokemon
	ld a, DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ret

DragoniteLv45Slam_AIEffect: ; 2eaf6 (b:6af6)
	ld a, (40 * 2) / 2
	lb de, 0, 80
	jp SetExpectedAIDamage

DragoniteLv45Slam_MultiplierEffect: ; 2eafe (b:6afe)
	ld hl, 40
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	add a
	add a
	call ATimes10
	call SetDefiniteDamage
	ret

ThickSkinnedEffect: ; 2eb15 (b:6b15)
	scf
	ret

LeekSlap_AIEffect: ; 2eb17 (b:6b17)
	ld a, $ff
	ldh [hTemp_ffa0], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	ret c ; return if no Bench Pokemon
; just pick Pokemon with lowest remaining HP.
	call GetBenchPokemonWithLowestHP
	ldh [hTemp_ffa0], a
	ret

LeekSlap_OncePerDuelCheck: ; 2eb1f (b:6b1f)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	jr nc, .has_bench
; no bench Pokemon to damage.
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

.has_bench
; opens Play Area screen to select Bench Pokemon
; to damage, and store it before returning.
	ldtx hl, ChoosePkmnInTheBenchToGiveDamageText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench
.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

LeekSlap_SetUsedThisDuelFlag: ; 2eb2c (b:6b2c)
	ldh a, [hTemp_ffa0]
	cp $ff
	ret z ; no target chosen
	call SwapTurn
	ld b, a
	ld de, 20
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

LeekSlap_NoDamage50PercentEffect: ; 2eb34 (b:6b34)
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin_BankB
	ret c
	xor a ; 0 damage
	call SetDefiniteDamage
	ret

FetchEffect: ; 2eb40 (b:6b40)
	ldtx hl, Draw1CardFromTheDeckText
	call DrawWideTextBox_WaitForInput
	bank1call DisplayDrawOneCardScreen
	call DrawCardFromDeck
	ret c ; return if deck is empty
	call AddCardToHand
	call LoadCardDataToBuffer1_FromDeckIndex
	ld a, [wDuelistType]
	cp DUELIST_TYPE_PLAYER
	ret nz
	; show card on screen if it was Player
	bank1call OpenCardPage_FromHand
	ret

CometPunch_AIEffect: ; 2eb5d (b:6b5d)
	ld a, (20 * 4) / 2
	lb de, 0, 80
	jp SetExpectedAIDamage

CometPunch_MultiplierEffect: ; 2eb65 (b:6b65)
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 4
	call TossCoinATimes_BankB
	add a
	call ATimes10
	call SetDefiniteDamage
	ret

TaurosStomp_AIEffect: ; 2eb7b (b:6b7b)
	ld a, (20 + 30) / 2
	lb de, 20, 30
	jp SetExpectedAIDamage

TaurosStomp_DamageBoostEffect: ; 2eb83 (b:6b83)
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; tails
	ld a, 10
	call AddToDamage
	ret

Rampage_AIEffect: ; 2eb96 (b:6b96)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call AddToDamage
	jp SetDefiniteAIDamage

Rampage_Confusion50PercentEffect: ; 2eba1 (b:6ba1)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call AddToDamage
	ldtx de, IfTailsYourPokemonBecomesConfusedText
	call TossCoin_BankB
	ret c ; heads
	call SwapTurn
	call ConfusionEffect
	call SwapTurn
	ret

FuryAttack_AIEffect: ; 2ebba (b:6bba)
	ld a, (10 * 2) / 2
	lb de, 0, 20
	jp SetExpectedAIDamage

FuryAttack_MultiplierEffect: ; 2ebc2 (b:6bc2)
	ld hl, 10
	call LoadTxRam3
	ld a, 2
	ldtx de, DamageCheckIfHeadsXDamageText
	call TossCoinATimes_BankB
	call ATimes10
	call SetDefiniteDamage
	ret

RetreatAidEffect: ; 2ebd7 (b:6bd7)
	scf
	ret

DodrioRage_AIEffect: ; 2ebd9 (b:6bd9)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	ldtx hl, NoDamageCountersText
	cp 10
	ret

DodrioRage_DamageBoostEffect: ; 2ebdf (b:6bdf)
	lb de, 0, 20
	call ApplyAndAnimateHPRecovery
	ret

PayDayEffect: ; 2ebe8 (b:6be8)
	ldtx de, IfHeadsDraw1CardFromDeckText
	call TossCoin_BankB
	ret nc ; tails
	ldtx hl, Draw1CardFromTheDeckText
	call DrawWideTextBox_WaitForInput
	bank1call DisplayDrawOneCardScreen
	call DrawCardFromDeck
	ret c ; empty deck
	call AddCardToHand
	call LoadCardDataToBuffer1_FromDeckIndex
	ld a, [wDuelistType]
	cp DUELIST_TYPE_PLAYER
	ret nz
	; show card on screen if it was Player
	bank1call OpenCardPage_FromHand
	ret

DragonairSlam_AIEffect: ; 2ec0c (b:6c0c)
	ld a, (30 * 4) / 2
	lb de, 0, 120
	jp SetExpectedAIDamage

DragonairSlam_MultiplierEffect: ; 2ec14 (b:6c14)
	ld hl, 30
	call LoadTxRam3
	ld a, 4
	ldtx de, DamageCheckIfHeadsXDamageText
	call TossCoinATimes_BankB
	ld e, a
	add a
	add e
	call ATimes10
	call SetDefiniteDamage
	ret

DragonairHyperBeam_PlayerSelectEffect: ; 2ec2c (b:6c2c)
	jp HandleEnergyDiscardEffectSelection

DragonairHyperBeam_AISelectEffect: ; 2ec2f (b:6c2f)
	call AIPickEnergyCardToDiscardFromDefendingPokemon
	ldh [hTemp_ffa0], a
	ret

DragonairHyperBeam_DiscardEffect: ; 2ec35 (b:6c35)
	call HandleNoDamageOrEffect
	ret c ; is unaffected
	ldh a, [hTemp_ffa0]
	cp $ff
	ret z ; no energy card chosen
	call SwapTurn
	call PutCardInDiscardPile
	ld a, DUELVARS_ARENA_CARD_LAST_TURN_EFFECT
	call GetTurnDuelistVariable
	ld [hl], LAST_TURN_EFFECT_DISCARD_ENERGY
	call SwapTurn
	ret

; handles screen for selecting an Energy card to discard
; that is attached to Defending Pokemon,
; and store the Player selection in [hTemp_ffa0].
HandleEnergyDiscardEffectSelection: ; 2ec4f (b:6c4f)
	call SwapTurn
	xor a ; PLAY_AREA_ARENA
	call CreateArenaOrBenchEnergyCardList
	jr c, .no_energy
	ldtx hl, ChooseDiscardEnergyCardFromOpponentText
	call DrawWideTextBox_WaitForInput
	xor a ; PLAY_AREA_ARENA
	bank1call DisplayEnergyDiscardScreen

.loop_input
	bank1call HandleEnergyDiscardMenuInput
	jr c, .loop_input

	call SwapTurn
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a ; store selected card to discard
	ret

.no_energy
	call SwapTurn
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

; return carry if Defending Pokemon has no attacks
ClefableMetronome_CheckAttacks: ; 2ec77 (b:6c77)
	call CheckIfDefendingPokemonHasAnyAttack
	ldtx hl, NoAttackMayBeChosenText
	ret

ClefableMetronome_AISelectEffect: ; 2ec7e (b:6c7e)
	call HandleAIMetronomeEffect
	ret

ClefableMetronome_UseAttackEffect: ; 2ec82 (b:6c82)
	ld a, 1 ; energy cost of this attack
	call HandlePlayerMetronomeEffect
	ret

ClefableMinimizeEffect: ; 2ec88 (b:6c88)
	ld hl, wDealtDamage
	ld a, [hli]
	or a
	ret z ; return if no damage dealt
	ld de, 20
	call ApplyAndAnimateHPRecovery
	ret

HurricaneEffect: ; 2ec8e (b:6c8e)
	call HandleNoDamageOrEffect
	ret c ; is unaffected

	ld a, DUELVARS_ARENA_CARD_HP
	call GetNonTurnDuelistVariable
	or a
	ret z ; return if Pokemon was KO'd

; look at all the card locations and put all cards
; that are in the Arena in the hand.
	call SwapTurn
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop_locations
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .next_card
	; card in Arena found, put in hand
	ld a, l
	call AddCardToHand
.next_card
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_locations

; empty the Arena card slot
	ld l, DUELVARS_ARENA_CARD
	ld a, [hl]
	ld [hl], $ff
	ld l, DUELVARS_ARENA_CARD_HP
	ld [hl], 0
	call LoadCardDataToBuffer1_FromDeckIndex
	ld hl, wLoadedCard1Name
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call LoadTxRam2
	ldtx hl, PokemonAndAllAttachedCardsReturnedToHandText
	call DrawWideTextBox_WaitForInput
	xor a
	ld [wDuelDisplayedScreen], a
	call SwapTurn
	ret

PidgeottoWhirlwind_SelectEffect: ; 2ecd3 (b:6cd3)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	jr nc, .switch
	; no Bench Pokemon
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret
.switch
	call DuelistSelectForcedSwitch
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret

PidgeottoWhirlwind_SwitchEffect: ; 2ece9 (b:6ce9)
	ldh a, [hTemp_ffa0]
	call HandleSwitchDefendingPokemonEffect
	ret

PidgeottoMirrorMove_AIEffect: ; 2ecef (b:6cef)
	jp MirrorMoveEffects.AIEffect

PidgeottoMirrorMove_InitialEffect1: ; 2ecf2 (b:6cf2)
	jp MirrorMoveEffects.InitialEffect1

PidgeottoMirrorMove_InitialEffect2: ; 2ecf5 (b:6cf5)
	jp MirrorMoveEffects.InitialEffect2

PidgeottoMirrorMove_PlayerSelection: ; 2ecf8 (b:6cf8)
	jp MirrorMoveEffects.PlayerSelection

PidgeottoMirrorMove_AISelection: ; 2ecfb (b:6cfb)
	jp MirrorMoveEffects.AISelection

PidgeottoMirrorMove_BeforeDamage: ; 2ecfe (b:6cfe)
	jp MirrorMoveEffects.BeforeDamage

PidgeottoMirrorMove_AfterDamage: ; 2ed01 (b:6d01)
	jp MirrorMoveEffects.AfterDamage

SingEffect: ; 2ed04 (b:6d04)
	ld hl, wDealtDamage
	ld a, [hli]
	or a
	ret z ; return if no damage dealt
	ld a, 5
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
	call LoadTxRam3
	ldtx hl, DiscardedCardsFromDeckText
	call DrawWideTextBox_PrintText
	call SwapTurn
	ret

; return carry if Defending Pokemon has no attacks
ClefairyMetronome_CheckAttacks: ; 2ed0b (b:6d0b)
	call CheckIfDefendingPokemonHasAnyAttack
	ldtx hl, NoAttackMayBeChosenText
	ret

ClefairyMetronome_AISelectEffect: ; 2ed12 (b:6d12)
	call HandleAIMetronomeEffect
	ret

ClefairyMetronome_UseAttackEffect: ; 2ed16 (b:6d16)
	ld a, 3 ; energy cost of this attack
;	fallthrough

; handles Metronome selection, and validates
; whether it can use the selected attack.
; if unsuccessful, returns carry.
; input:
;	a = amount of colorless energy needed for Metronome
HandlePlayerMetronomeEffect: ; 2ed18 (b:6d18)
	ld [wMetronomeEnergyCost], a
	ldtx hl, ChooseOppAttackToBeUsedWithMetronomeText
	call DrawWideTextBox_WaitForInput

	call HandleDefendingPokemonAttackSelection
	ret c ; return if operation cancelled

; store this attack as selected attack to use
	ld hl, wMetronomeSelectedAttack
	ld [hl], d
	inc hl
	ld [hl], e

; compare selected attack's name with
; the attack that is loaded, which is Metronome.
; if equal, then cannot select it.
; (i.e. cannot use Metronome with Metronome.)
	ld hl, wLoadedAttackName
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	call SwapTurn
	call CopyAttackDataAndDamage_FromDeckIndex
	call SwapTurn
	pop de
	ld hl, wLoadedAttackName
	ld a, e
	cp [hl]
	jr nz, .try_use
	inc hl
	ld a, d
	cp [hl]
	jr nz, .try_use
	; cannot select Metronome
	ldtx hl, UnableToSelectText
.failed
	call DrawWideTextBox_WaitForInput
.set_carry
	scf
	ret

.try_use
; run the attack checks to determine
; whether it can be used.
	ld a, EFFECTCMDTYPE_INITIAL_EFFECT_1
	call TryExecuteEffectCommandFunction
	jr c, .failed
	ld a, EFFECTCMDTYPE_INITIAL_EFFECT_2
	call TryExecuteEffectCommandFunction
	jr c, .set_carry
	; successful

; send data to link opponent
	bank1call SendAttackDataToLinkOpponent
	ld a, OPPACTION_USE_METRONOME_ATTACK
	call SetOppAction_SerialSendDuelData
	ld hl, wMetronomeSelectedAttack
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld a, [wMetronomeEnergyCost]
	ld c, a
	call SerialSend8Bytes

	ldh a, [hTempCardIndex_ff9f]
	ld [wPlayerAttackingCardIndex], a
	ld a, [wSelectedAttack]
	ld [wPlayerAttackingAttackIndex], a
	ld a, [wTempCardID_ccc2]
	ld [wPlayerAttackingCardID], a
	or a
	ret

; does nothing for AI.
HandleAIMetronomeEffect: ; 2ed86 (b:6d86)
	ret

DoTheWaveEffect: ; 2ed87 (b:6d87)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	dec a ; don't count arena card
	call ATimes10
	call AddToDamage
	ret

; return carry if no damage counters
FirstAid_DamageCheck: ; 2ed94 (b:6d94)
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	ldtx hl, NoDamageCountersText
	cp 10
	ret

FirstAid_HealEffect: ; 2ed9f (b:6d9f)
	lb de, 0, 10
	call ApplyAndAnimateHPRecovery
	ret

JigglypuffDoubleEdgeEffect: ; 2eda6 (b:6da6)
	ld a, 20
	call DealRecoilDamageToSelf
	ret

PounceEffect: ; 2edac (b:6dac)
	ld a, SUBSTATUS2_POUNCE
	call ApplySubstatus2ToDefendingCard
	ret

LickitungSupersonicEffect: ; 2edb2 (b:6db2)
	call Confusion50PercentEffect
	call nc, SetNoEffectFromStatus
	ret

PidgeyWhirlwind_SelectEffect: ; 2edb9 (b:6db9)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	jr nc, .switch
	; no Bench Pokemon
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret
.switch
	call DuelistSelectForcedSwitch
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret

PidgeyWhirlwind_SwitchEffect: ; 2edcf (b:6dcf)
	ldh a, [hTemp_ffa0]
	call HandleSwitchDefendingPokemonEffect
	ret

; return carry if Defending card has no weakness
Conversion1_WeaknessCheck: ; 2edd5 (b:6dd5)
	call SwapTurn
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer2_FromDeckIndex
	call SwapTurn
	ld a, [wLoadedCard2Weakness]
	or a
	ret nz
	ldtx hl, NoWeaknessText
	scf
	ret

Conversion1_PlayerSelectEffect: ; 2eded (b:6ded)
	ldtx hl, ChooseWeaknessYouWishToChangeText
	xor a ; PLAY_AREA_ARENA
	call HandleColorChangeScreen
	ldh [hTemp_ffa0], a
	ret

Conversion1_AISelectEffect: ; 2edf7 (b:6df7)
	call AISelectConversionColor
	ret

Conversion1_ChangeWeaknessEffect: ; 2edfb (b:6dfb)
	call HandleNoDamageOrEffect
	ret c ; is unaffected

; apply changed weakness
	ld a, DUELVARS_ARENA_CARD_CHANGED_WEAKNESS
	call GetNonTurnDuelistVariable
	ldh a, [hTemp_ffa0]
	call TranslateColorToWR
	ld [hl], a
	ld l, DUELVARS_ARENA_CARD_LAST_TURN_CHANGE_WEAK
	ld [hl], a

; print text box
	call SwapTurn
	ldtx hl, ChangedTheWeaknessOfPokemonToColorText
	call PrintArenaCardNameAndColorText
	call SwapTurn

; apply substatus
	ld a, SUBSTATUS2_CONVERSION2
	call ApplySubstatus2ToDefendingCard
	ret

; returns carry if Active Pokemon has no Resistance.
Conversion2_ResistanceCheck: ; 2ee1f (b:6e1f)
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Resistance]
	or a
	ret nz
	ldtx hl, NoResistanceText
	scf
	ret

Conversion2_PlayerSelectEffect: ; 2ee31 (b:6e31)
	ldtx hl, ChooseResistanceYouWishToChangeText
	ld a, $80
	call HandleColorChangeScreen
	ldh [hTemp_ffa0], a
	ret

Conversion2_AISelectEffect: ; 2ee3c (b:6e3c)
; AI will choose Defending Pokemon's color
; unless it is colorless.
	call SwapTurn
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex
	call SwapTurn
	ld a, [wLoadedCard1Type]
	cp COLORLESS
	jr z, .is_colorless
	ldh [hTemp_ffa0], a
	ret

.is_colorless
	call SwapTurn
	call AISelectConversionColor
	call SwapTurn
	ret

Conversion2_ChangeResistanceEffect: ; 2ee5e (b:6e5e)
; apply changed resistance
	ld a, DUELVARS_ARENA_CARD_CHANGED_RESISTANCE
	call GetTurnDuelistVariable
	ldh a, [hTemp_ffa0]
	call TranslateColorToWR
	ld [hl], a
	ldtx hl, ChangedTheResistanceOfPokemonToColorText
;	fallthrough

; prints text that requires card name and color,
; with the card name of the Turn Duelist's Arena Pokemon
; and color in [hTemp_ffa0].
; input:
;	hl = text to print
PrintArenaCardNameAndColorText: ; 2ee6c (b:6e6c)
	push hl
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex
	ldh a, [hTemp_ffa0]
	call LoadCardNameAndInputColor
	pop hl
	call DrawWideTextBox_PrintText
	ret

; handles AI logic for selecting a new color
; for weakness/resistance.
; - if within the context of Conversion1, looks
; in own Bench for a non-colorless card that can attack.
; - if within the context of Conversion2, looks
; in Player's Bench for a non-colorless card that can attack.
AISelectConversionColor: ; 2ee7f (b:6e7f)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld d, a
	ld e, PLAY_AREA_ARENA
	jr .next_pkmn_atk

; look for a non-colorless Bench Pokemon
; that has enough energy to use an attack.
.loop_atk
	push de
	call GetPlayAreaCardAttachedEnergies
	ld a, e
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	ld d, a
	call LoadCardDataToBuffer1_FromDeckIndex
	ld a, [wLoadedCard1Type]
	cp COLORLESS
	jr z, .skip_pkmn_atk ; skip colorless Pokemon
	ld e, FIRST_ATTACK_OR_PKMN_POWER
	bank1call _CheckIfEnoughEnergiesToAttack
	jr nc, .found
	ld e, SECOND_ATTACK
	bank1call _CheckIfEnoughEnergiesToAttack
	jr nc, .found
.skip_pkmn_atk
	pop de
.next_pkmn_atk
	inc e
	dec d
	jr nz, .loop_atk

; none found in Bench.
; next, look for a non-colorless Bench Pokemon
; that has any Energy cards attached.
	ld d, e ; number of Play Area Pokemon
	ld e, PLAY_AREA_ARENA
	jr .next_pkmn_energy

.loop_energy
	push de
	call GetPlayAreaCardAttachedEnergies
	ld a, [wTotalAttachedEnergies]
	or a
	jr z, .skip_pkmn_energy
	ld a, e
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	ld d, a
	call LoadCardDataToBuffer1_FromDeckIndex
	ld a, [wLoadedCard1Type]
	cp COLORLESS
	jr nz, .found
.skip_pkmn_energy
	pop de
.next_pkmn_energy
	inc e
	dec d
	jr nz, .loop_energy

; otherwise, just select a random energy.
	ld a, NUM_COLORED_TYPES
	call Random
	ldh [hTemp_ffa0], a
	ret

.found
	pop de
	ld a, [wLoadedCard1Type]
	and TYPE_PKMN
	ldh [hTemp_ffa0], a
	ret

ScrunchEffect: ; 2eee7 (b:6ee7)
	ldtx de, IfHeadsNoDamageNextTurnText
	call TossCoin_BankB
	jp nc, SetWasUnsuccessful
	ld a, ATK_ANIM_SCRUNCH
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_NO_DAMAGE_17
	call ApplySubstatus1ToDefendingCard
	ret

ChanseyDoubleEdgeEffect: ; 2eefb (b:6efb)
	ld a, 80
	call DealRecoilDamageToSelf
	ret

SuperFang_AIEffect: ; 2ef01 (b:6f01)
	call SuperFang_HalfHPEffect
	jp SetDefiniteAIDamage

SuperFang_HalfHPEffect: ; 2ef07 (b:6f07)
	ld a, DUELVARS_ARENA_CARD_HP
	call GetNonTurnDuelistVariable
	srl a
	bit 0, a
	jr z, .rounded
	; round up
	add 5
.rounded
	call SetDefiniteDamage
	ld hl, wDamage + 1
	set UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, [hl]
	ret

; return carry if no Pokemon in Bench
TrainerCardAsPokemon_BenchCheck: ; 2ef18 (b:6f18)
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

TrainerCardAsPokemon_PlayerSelectSwitch: ; 2ef27 (b:6f27)
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; no need to switch if it's not Arena card

	ldtx hl, SelectPokemonToPlaceInTheArenaText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInBench
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTempPlayAreaLocation_ffa1], a
	ret

TrainerCardAsPokemon_DiscardEffect: ; 2ef3c (b:6f3c)
	ldh a, [hTemp_ffa0]
	ld e, a
	call MovePlayAreaCardToDiscardPile
	ldh a, [hTemp_ffa0]
	or a
	jr nz, .shift_cards
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld e, a
	call SwapArenaWithBenchPokemon
.shift_cards
	call ShiftAllPokemonToFirstPlayAreaSlots
	ret

HealingWind_InitialEffect: ; 2ef51 (b:6f51)
	scf
	ret

HealingWind_PlayAreaHealEffect: ; 2ef53 (b:6f53)
; play initial animation
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
	ld de, 30
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

	ret

DragoniteLv41Slam_AIEffect: ; 2ef9c (b:6f9c)
	ld a, (30 * 2) / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

DragoniteLv41Slam_MultiplierEffect: ; 2efa4 (b:6fa4)
	ld hl, 30
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	ld c, a
	add a
	add c
	call ATimes10
	call SetDefiniteDamage
	ret

; possibly unreferenced
Func_2efbc: ; 2efbc (b:6fbc)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld l, DUELVARS_ARENA_CARD_HP
	ld de, wce76
.asm_2efc7
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2efc7
	ret

; possibly unreferenced
Func_2efce: ; 2efce (b:6fce)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld l, DUELVARS_ARENA_CARD_HP
	ld de, wce76
.asm_2efd9
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_2efd9
	ret

CatPunchEffect: ; 2efe0 (b:6fe0)
	call SwapTurn
	call PickRandomPlayAreaCard
	ld b, a
	ld a, ATK_ANIM_CAT_PUNCH_PLAY_AREA
	ld [wLoadedAttackAnimation], a
	ld de, 20
	call DealDamageToPlayAreaPokemon
	call SwapTurn
	ret

MorphEffect: ; 2eff6 (b:6ff6)
	ld hl, wDealtDamage
	ld a, [hli]
	or a
	ret z ; return if no damage dealt
	ld a, 3
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
	call LoadTxRam3
	ldtx hl, DiscardedCardsFromDeckText
	call DrawWideTextBox_PrintText
	call SwapTurn
	ret

PickRandomBasicCardFromDeck: ; 2f098 (b:7098)
	call CreateDeckCardList
	ret c ; return if empty deck
	ld hl, wDuelTempList
	call ShuffleCards
.loop_deck
	ld a, [hli]
	ldh [hTempCardIndex_ff98], a
	cp $ff
	jr z, .set_carry
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr nc, .loop_deck ; skip if not Pokemon card
	ld a, [wLoadedCard2Stage]
	or a
	jr nz, .loop_deck ; skip if not Basic stage
	ldh a, [hTempCardIndex_ff98]
	or a
	ret
.set_carry
	scf
	ret

SlicingWindEffect: ; 2f0bf (b:70bf)
	call SwapTurn
	call PickRandomPlayAreaCard
	ld b, a
	ld de, 30
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

Gale_LoadAnimation: ; 2f0d0 (b:70d0)
	ld a, ATK_ANIM_WATER_JETS
	ld [wLoadedAttackAnimation], a
	ret

Gale_SwitchEffect: ; 2f0d6 (b:70d6)
; if Defending card is unaffected by attack
; jump directly to switching this card only.
	call HandleNoDamageOrEffect
	jr c, .SwitchWithRandomBenchPokemon

; handle switching Defending card
	ld a, DUELVARS_ARENA_CARD_HP
	call GetNonTurnDuelistVariable
	or a
	jr nz, .skip_destiny_bond
	bank1call HandleDestinyBondSubstatus
.skip_destiny_bond
	call SwapTurn
	call .SwitchWithRandomBenchPokemon
	jr c, .skip_clear_damage
; clear dealt damage because Pokemon was switched
	xor a
	ld hl, wDealtDamage
	ld [hli], a
	ld [hl], a
.skip_clear_damage
	call SwapTurn
;	fallthrough for attacking card switch

.SwitchWithRandomBenchPokemon
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp 2
	ret c ; return if no Bench Pokemon

; get random Bench location and swap
	dec a
	call Random
	inc a
	ld e, a
	call SwapArenaWithBenchPokemon

	xor a
	ld [wDuelDisplayedScreen], a
	ret

; return carry if Bench is full
FriendshipSong_BenchCheck: ; 2f10d (b:710d)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, NoSpaceOnTheBenchText
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ret

FriendshipSong_AddToBench50PercentEffect: ; 2f119 (b:7119)
	ldtx de, SuccessCheckIfHeadsAttackIsSuccessfulText
	call TossCoin_BankB
	jr c, .successful

.none_came_text
	ldtx hl, NoneCameText
	call DrawWideTextBox_WaitForInput
	ret

.successful
	call PickRandomBasicCardFromDeck
	jr nc, .put_in_bench
	ld a, ATK_ANIM_FRIENDSHIP_SONG
	call Func_2c12e
	call .none_came_text
	call Func_2c0bd
	ret

.put_in_bench
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	call PutHandPokemonCardInPlayArea
	ld a, ATK_ANIM_FRIENDSHIP_SONG
	call Func_2c12e
	ldh a, [hTempCardIndex_ff98]
	ldtx hl, CameToTheBenchText
	bank1call DisplayCardDetailScreen
	call Func_2c0bd
	ret

ExpandEffect: ; 2f153 (b:7153)
	ld a, SUBSTATUS1_REDUCE_BY_10
	call ApplySubstatus1ToDefendingCard
	ret

; returns carry if either there are no damage counters
; or no Energy cards attached in the Play Area.
SuperPotion_DamageEnergyCheck: ; 2f159 (b:7159)
	call CheckIfPlayAreaHasAnyDamage
	ldtx hl, NoPokemonWithDamageCountersText
	ret c ; no damage counters
	call CheckIfThereAreAnyEnergyCardsAttached
	ldtx hl, ThereIsNoEnergyCardAttachedText
	ret

SuperPotion_PlayerSelectEffect: ; 2f167 (b:7167)
	ldtx hl, ChoosePokemonToRemoveDamageCounterFromText
	call DrawWideTextBox_WaitForInput
.start
	bank1call HasAlivePokemonInPlayArea
.read_input
	bank1call OpenPlayAreaScreenForSelection
	ret c ; exit if B is pressed
	ld e, a
	call GetCardDamageAndMaxHP
	or a
	jr z, .read_input ; Pokemon has no damage?
	ldh a, [hCurMenuItem]
	ld e, a
	call GetPlayAreaCardAttachedEnergies
	ld a, [wTotalAttachedEnergies]
	or a
	jr nz, .got_pkmn
	; no energy cards attached
	ldtx hl, NoEnergyCardsText
	call DrawWideTextBox_WaitForInput
	jr .start

.got_pkmn
; Pokemon has damage and Energy cards attached,
; prompt the Player for Energy selection to discard.
	ldh a, [hCurMenuItem]
	bank1call CreateArenaOrBenchEnergyCardList
	ldh a, [hCurMenuItem]
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ret c ; exit if B was pressed

	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTempPlayAreaLocation_ffa1], a
	ld e, a

; cap the healing damage if
; it would make it exceed max HP.
	call GetCardDamageAndMaxHP
	ld c, 60
	cp 60
	jr nc, .heal
	ld c, a
.heal
	ld a, c
	ldh [hPlayAreaEffectTarget], a
	or a
	ret

SuperPotion_HealEffect: ; 2f1b5 (b:71b5)
	ldh a, [hTemp_ffa0]
	call PutCardInDiscardPile
	ldh a, [hTempPlayAreaLocation_ffa1]
	ldh [hTempPlayAreaLocation_ff9d], a
	ldh a, [hPlayAreaEffectTarget]
	call HealPlayAreaCardHP
	ret

; checks if there is at least one Energy card
; attached to some card in the Turn Duelist's Play Area.
; return no carry if one is found,
; and returns carry set if none is found.
CheckIfThereAreAnyEnergyCardsAttached: ; 2f1c4 (b:71c4)
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop_deck
	ld a, [hl]
	bit CARD_LOCATION_PLAY_AREA_F, a
	jr z, .next_card ; skip if not in Play Area
	ld a, l
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_TRAINER
	jr z, .next_card ; skip if it's a Trainer card
	cp TYPE_ENERGY
	jr nc, .found
.next_card
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_deck
	scf
	ret
.found
	or a
	ret

; handles Player selection for Pokemon in Play Area,
; then opens screen to choose one of the energy cards
; attached to that selected Pokemon.
; outputs the selection in:
;	[hTemp_ffa0] = play area location
;	[hTempPlayAreaLocation_ffa1] = index of energy card
HandlePokemonAndEnergySelectionScreen: ; 2f1e7 (b:71e7)
	bank1call HasAlivePokemonInPlayArea
	bank1call OpenPlayAreaScreenForSelection
	ret c ; exit if B is pressed
	ld e, a
	call GetPlayAreaCardAttachedEnergies
	ld a, [wTotalAttachedEnergies]
	or a
	jr nz, .has_energy
	ldtx hl, NoEnergyCardsText
	call DrawWideTextBox_WaitForInput
	jr HandlePokemonAndEnergySelectionScreen ; loop back to start

.has_energy
	ldh a, [hCurMenuItem]
	bank1call CreateArenaOrBenchEnergyCardList
	ldh a, [hCurMenuItem]
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempPlayAreaLocation_ffa1], a
	ret

ImakuniEffect: ; 2f216 (b:7216)
	ld a, [wMetronomeEnergyCost]
	or a
	jr z, .not_metronome
	ld c, a ; amount of colorless needed for Metronome
	ld b, 0 ; no Water energy needed for Metronome

.not_metronome
	push bc
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld e, a
	call GetPlayAreaCardAttachedEnergies
	pop bc

	ld hl, wAttachedEnergies + PSYCHIC
	ld a, c
	or a
	jr z, .check_bonus ; is Energy cost all psychic energy?

	; it's not, so we need to remove the
	; psychic energy cards from calculations
	; if they pay for colorless instead.
	ld a, [wTotalAttachedEnergies]
	cp [hl]
	jr nz, .check_bonus ; skip if at least 1 non-Water energy attached

	; Water is the only energy color attached
	ld a, c
	add b
	ld b, a
	; b += c

.check_bonus
	ld a, [hl]
	sub b
	jr c, .skip_bonus ; is water energy <  b?
	jr z, .skip_bonus ; is water energy == b?

; a holds number of water energy not payed for energy cost
	cp 5
	jr c, .less_than_3
	ld a, 4 ; cap this to 2 for bonus effect
.less_than_3
	call ATimes10
	add a
	call AddToDamage ; add 10 * a to damage

.skip_bonus
	ld a, [wDamage]
	ld [wAIMinDamage], a
	ld [wAIMaxDamage], a
	ret

EnergyRemoval_EnergyCheck: ; 2f252 (b:7252)
	call SwapTurn
	call CheckIfThereAreAnyEnergyCardsAttached
	ldtx hl, NoEnergyAttachedToOpponentsActiveText
	call SwapTurn
	ret

EnergyRemoval_PlayerSelection: ; 2f25f (b:725f)
	
	ldtx hl, ChoosePokemonToRemoveEnergyFromText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	call HandlePokemonAndEnergySelectionScreen
	call SwapTurn
	ret

EnergyRemoval_AISelection: ; 2f26f (b:726f)
	call AIPickEnergyCardToDiscardFromDefendingPokemon
	ret

EnergyRemoval_DiscardEffect: ; 2f273 (b:7273)
	ldtx de, TrainerCardSuccessCheckText
	call Func_2c08a
	jr nc, .tails

	call SwapTurn
	ldh a, [hTempPlayAreaLocation_ffa1]
	call PutCardInDiscardPile
	call SwapTurn
	call IsPlayerTurn
	ret c

; show Player which Pokemon was affected
	call SwapTurn
	ldh a, [hTemp_ffa0]
	call Func_2c10b
	call SwapTurn
	ret

	.tails
	ld a, $ff
	ldh [hTempList], a
	or a
	ret

; return carry if no other card in hand to discard
; or if there are no Basic Energy cards in Discard Pile.
EnergyRetrieval_HandEnergyCheck: ; 2f28e (b:728e)
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	cp 2
	ldtx hl, NotEnoughCardsInHandText
	ret c ; return if doesn't have another card to discard
	call CreateEnergyCardListFromDiscardPile_OnlyBasic
	ldtx hl, ThereAreNoBasicEnergyCardsInDiscardPileText
	ret

EnergyRetrieval_PlayerHandSelection: ; 2f2a0 (b:72a0)
	ldtx hl, ChooseCardToDiscardFromHandText
	call DrawWideTextBox_WaitForInput
	call CreateHandCardList
	ldh a, [hTempCardIndex_ff9f]
	call RemoveCardFromDuelTempList
	bank1call Func_5591
	bank1call DisplayCardList
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempList], a
	ret

EnergyRetrieval_PlayerDiscardPileSelection: ; 2f2b9 (b:72b9)
	ld a, 1 ; start at 1 due to card selected from hand
	ldh [hCurSelectionItem], a
	ldtx hl, Choose2BasicEnergyCardsFromDiscardPileText
	call DrawWideTextBox_WaitForInput
	call CreateEnergyCardListFromDiscardPile_OnlyBasic

.select_card
	bank1call InitAndDrawCardListScreenLayout
	ldtx hl, PleaseSelectCardText
	ldtx de, PlayerDiscardPileText
	bank1call SetCardListHeaderText
	bank1call DisplayCardList
	jr nc, .selected
	; B was pressed
	ld a, 2 + 1 ; includes the card selected from hand
	call AskWhetherToQuitSelectingCards
	jr c, .select_card ; player selected No
	jr .done

.selected
	call GetNextPositionInTempList_TrainerEffects
	ldh a, [hTempCardIndex_ff98]
	ld [hl], a
	call RemoveCardFromDuelTempList
	jr c, .done
	ldh a, [hCurSelectionItem]
	cp 2 + 1 ; includes the card selected from hand
	jr c, .select_card

.done
	call GetNextPositionInTempList_TrainerEffects
	ld [hl], $ff ; terminating byte
	or a
	ret

EnergyRetrieval_DiscardAndAddToHandEffect: ; 2f2f8 (b:72f8)
	ld hl, hTempList
	ld a, [hli]
	call RemoveCardFromHand
	call PutCardInDiscardPile
	ld de, wDuelTempList
.loop
	ld a, [hli]
	ld [de], a
	inc de
	cp $ff
	jr z, .done
	call MoveDiscardPileCardToHand
	call AddCardToHand
	jr .loop
.done
	call IsPlayerTurn
	ret c
	bank1call Func_4b38
	ret

; return carry if no cards left in Deck.
EnergySearch_DeckCheck: ; 2f31c (b:731c)
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	cp DECK_SIZE
	ccf
	ldtx hl, NoCardsLeftInTheDeckText
	ret

EnergySearch_PlayerSelection: ; 2f328 (b:7328)
	ld a, $ff
	ldh [hTemp_ffa0], a
	call CreateDeckCardList
	ldtx hl, Choose1BasicEnergyCardFromDeckText
	lb de, SEARCHEFFECT_BASIC_ENERGY, 0
	ldtx bc, BasicEnergyText
	call LookForCardsInDeck
	ret c ; skip showing deck

	bank1call Func_5591
	ldtx hl, ChooseBasicEnergyCardText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText
.read_input
	bank1call DisplayCardList
	jr c, .try_exit ; B pressed?
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	call CheckIfCardIsBasicEnergy
	jr c, .play_sfx
	or a
	ret
.play_sfx
	call Func_3794
	jr .read_input

.try_exit
; check if Player can exit without selecting anything
	ld hl, wDuelTempList
.next_card
	ld a, [hli]
	cp $ff
	jr z, .exit
	call CheckIfCardIsBasicEnergy
	jr c, .next_card
	jr .read_input ; no, has to select Energy card
.exit
	ld a, $ff
	ldh [hTemp_ffa0], a
	or a
	ret

EnergySearch_AddToHandEffect: ; 2f372 (b:7372)
	ldh a, [hTemp_ffa0]
	cp $ff
	jr z, .done
; add to hand
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	call IsPlayerTurn
	jr c, .done ; done if Player played card
; display card in screen
	ldh a, [hTemp_ffa0]
	ldtx hl, WasPlacedInTheHandText
	bank1call DisplayCardDetailScreen
.done
	call Func_2c0bd
	ret

; check if card index in a is a Basic Energy card.
; returns carry in case it's not.
CheckIfCardIsBasicEnergy: ; 2f38f (b:738f)
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr c, .not_basic_energy
	cp TYPE_ENERGY_DOUBLE_COLORLESS
	jr nc, .not_basic_energy
; is basic energy
	or a
	ret
.not_basic_energy
	scf
	ret

ProfessorOakEffect: ; 2f3a1 (b:73a1)
; discard hand
	call CreateHandCardList
	call SortCardsInDuelTempListByID
	ld hl, wDuelTempList
.discard_loop
	ld a, [hli]
	cp $ff
	jr z, .draw_cards
	call RemoveCardFromHand
	call PutCardInDiscardPile
	jr .discard_loop

.draw_cards
	ld a, 6
	bank1call DisplayDrawNCardsScreen
	ld c, 6
.draw_loop
	call DrawCardFromDeck
	jr c, .done
	call AddCardToHand
	dec c
	jr nz, .draw_loop
.done
	ret

Potion_DamageCheck: ; 2f3ca (b:73ca)
	call CheckIfPlayAreaHasAnyDamage
	ldtx hl, NoPokemonWithDamageCountersText
	ret

Potion_PlayerSelection: ; 2f3d1 (b:73d1)
	bank1call HasAlivePokemonInPlayArea
.read_input
	bank1call OpenPlayAreaScreenForSelection
	ret c ; exit is B was pressed
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ld e, a
	call GetCardDamageAndMaxHP
	or a
	jr z, .read_input ; no damage, loop back to start
; cap damage
	ld c, 30
	cp 30
	jr nc, .skip_cap
	ld c, a
.skip_cap
	ld a, c
	ldh [hTempPlayAreaLocation_ffa1], a
	or a
	ret

Potion_HealEffect: ; 2f3ef (b:73ef)
	ldh a, [hTemp_ffa0]
	ldh [hTempPlayAreaLocation_ff9d], a
	ldh a, [hTempPlayAreaLocation_ffa1]
	call HealPlayAreaCardHP
	ret

GamblerEffect: ; 2f3f9 (b:73f9)
	ldtx de, CardCheckIfHeads8CardsIfTails1CardText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
; discard Gambler card from hand
	ldh a, [hTempCardIndex_ff9f]
	call RemoveCardFromHand
	call PutCardInDiscardPile

; shuffle cards into deck
	call CreateHandCardList
	call SortCardsInDuelTempListByID
	ld hl, wDuelTempList
.loop_return_deck
	ld a, [hli]
	cp $ff
	jr z, .check_coin_toss
	call RemoveCardFromHand
	call ReturnCardToDeck
	jr .loop_return_deck

.check_coin_toss
	call Func_2c0bd
	ld c, 9
	ldh a, [hTemp_ffa0]
	or a
	jr nz, .draw_cards ; coin toss was heads?
	; if tails, number of cards to draw is 1
	ld c, 1

; correct number of cards to draw is in c
.draw_cards
	ld a, c
	bank1call DisplayDrawNCardsScreen
.draw_loop
	call DrawCardFromDeck
	jr c, .done
	call AddCardToHand
	dec c
	jr nz, .draw_loop
.done
	ret

; return carry if not enough cards in hand to discard
; or if there are no cards in the Discard Pile
ItemFinder_HandDiscardPileCheck: ; 2f43b (b:743b)
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	ldtx hl, NotEnoughCardsInHandText
	cp 3
	ret c
	call CreateTrainerCardListFromDiscardPile
	ret

ItemFinder_PlayerSelection: ; 2f44a (b:744a)
	call HandlePlayerSelection2HandCardsToDiscard
	ret c ; was operation cancelled?

; cards were selected to discard from hand.
; now to choose a Trainer card from Discard Pile.
	call CreateTrainerCardListFromDiscardPile
	bank1call Func_5591
	ldtx hl, ChooseCardToPlaceInHandText
	ldtx de, PlayerDiscardPileText
	bank1call SetCardListHeaderText
	bank1call DisplayCardList
	ldh [hTempList + 2], a ; placed after the 2 cards selected to discard
	ret

ItemFinder_DiscardAddToHandEffect: ; 2f463 (b:7463)
; discard cards from hand
	ld hl, hTempList
	ld a, [hli]
	call RemoveCardFromHand
	call PutCardInDiscardPile
	ld a, [hli]
	call RemoveCardFromHand
	call PutCardInDiscardPile

; place card from Discard Pile to hand
	ld a, [hl]
	call MoveDiscardPileCardToHand
	call AddCardToHand
	call IsPlayerTurn
	ret c
; display card in screen
	ldh a, [hTempList + 2]
	ldtx hl, WasPlacedInTheHandText
	bank1call DisplayCardDetailScreen
	ret

Defender_PlayerSelection: ; 2f488 (b:7488)
	ldtx hl, ChoosePokemonToAttachDefenderToText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInPlayArea
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret

Defender_AttachDefenderEffect: ; 2f499 (b:7499)
; attach Trainer card to Play Area Pokemon
	ldh a, [hTemp_ffa0]
	ld e, a
	ldh a, [hTempCardIndex_ff9f]
	call PutHandCardInPlayArea

; increase number of Defender cards of this location by 1
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_ATTACHED_CRYSTAL_SHARD
	call GetTurnDuelistVariable
	inc [hl]
	call IsPlayerTurn
	ret c

	ldh a, [hTemp_ffa0]
	call Func_2c10b
	ret

; return carry if Bench is full.
MysteriousFossil_BenchCheck: ; 2f4b3 (b:74b3)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ldtx hl, NoSpaceOnTheBenchText
	ret

MysteriousFossil_PlaceInPlayAreaEffect: ; 2f4bf (b:74bf)
	ldh a, [hTempCardIndex_ff9f]
	call PutHandPokemonCardInPlayArea
	ret

; return carry if Arena card has no status to heal.
FullHeal_StatusCheck: ; 2f4c5 (b:74c5)
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetTurnDuelistVariable
	or a
	ret nz
	ldtx hl, NotAffectedByPoisonSleepParalysisOrConfusionText
	scf
	ret

FullHeal_ClearStatusEffect: ; 2f4d1 (b:74d1)
	ld a, ATK_ANIM_FULL_HEAL
	call Func_2fea9
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetTurnDuelistVariable
	ld [hl], NO_STATUS
	bank1call DrawDuelHUDs
	ret

ImposterProfessorOakEffect: ; 2f4e1 (b:74e1)
	call SwapTurn
	call CreateHandCardList
	call SortCardsInDuelTempListByID

; first return all cards in hand to the deck.
	ld hl, wDuelTempList
.loop_return_deck
	ld a, [hli]
	cp $ff
	jr z, .done_return
	call RemoveCardFromHand
	call ReturnCardToDeck
	jr .loop_return_deck

; then draw 7 cards from the deck.
.done_return
	call Func_2c0bd
	ld a, 4
	bank1call DisplayDrawNCardsScreen
	ld c, 4
.loop_draw
	call DrawCardFromDeck
	jr c, .done
	call AddCardToHand
	dec c
	jr nz, .loop_draw
.done
	call SwapTurn
	ret

; return carry if not enough cards in hand to discard
; or if there are no cards left in the deck.
ComputerSearch_HandDeckCheck: ; 2f513 (b:7513)
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	ldtx hl, NotEnoughCardsInHandText
	cp 3
	ret c
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ldtx hl, NoCardsLeftInTheDeckText
	cp DECK_SIZE
	ccf
	ret

ComputerSearch_PlayerDiscardHandSelection: ; 2f52a (b:752a)
	call HandlePlayerSelection2HandCardsToDiscard
	ret

ComputerSearch_PlayerDeckSelection: ; 2f52e (b:752e)
	call CreateDeckCardList
	bank1call Func_5591
	ldtx hl, ChooseCardToPlaceInHandText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText
.loop_input
	bank1call DisplayCardList
	jr c, .loop_input ; can't exit with B button
	ldh [hTempList + 2], a
	ret

ComputerSearch_DiscardAddToHandEffect: ; 2f545 (b:7545)
; discard cards from hand
	ld hl, hTempList
	ld a, [hli]
	call RemoveCardFromHand
	call PutCardInDiscardPile
	ld a, [hli]
	call RemoveCardFromHand
	call PutCardInDiscardPile

; add card from deck to hand
	ld a, [hl]
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	call Func_2c0bd
	ret

; return carry if Bench is full.
ClefairyDoll_BenchCheck: ; 2f561 (b:7561)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, NoSpaceOnTheBenchText
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ret

ClefairyDoll_PlaceInPlayAreaEffect: ; 2f56d (b:756d)
	ldh a, [hTempCardIndex_ff9f]
	call PutHandPokemonCardInPlayArea
	ret

; return carry if no Pokemon in the Bench.
MrFuji_BenchCheck: ; 2f573 (b:7573)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

MrFuji_PlayerSelection: ; 2f57e (b:757e)
	ldtx hl, ChoosePokemonToReturnToTheDeckText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInBench
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret

MrFuji_ReturnToDeckEffect: ; 2f58f (b:758f)
; get Play Area location's card index
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	ldh [hTempCardIndex_ff98], a

; find all cards that are in the same location
; (previous evolutions and energy cards attached)
; and return them all to the deck.
	ldh a, [hTemp_ffa0]
	or CARD_LOCATION_PLAY_AREA
	ld e, a
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop_cards
	push de
	push hl
	ld a, [hl]
	cp e
	jr nz, .next_card
	ld a, l
	call ReturnCardToDeck
.next_card
	pop hl
	pop de
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_cards

; clear Play Area location of card
	ldh a, [hTemp_ffa0]
	ld e, a
	call EmptyPlayAreaSlot
	ld l, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	dec [hl]
	call ShiftAllPokemonToFirstPlayAreaSlots

; if Trainer card wasn't played by the Player,
; print the selected Pokemon's name and show card on screen.
	call IsPlayerTurn
	jr c, .done
	ldh a, [hTempCardIndex_ff98]
	call LoadCardDataToBuffer1_FromDeckIndex
	ld hl, wLoadedCard1Name
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call LoadTxRam2
	bank1call DrawLargePictureOfCard
	ldtx hl, PokemonAndAllAttachedCardsWereReturnedToDeckText
	call DrawWideTextBox_WaitForInput
.done
	call Func_2c0bd
	ret

PlusPowerEffect: ; 2f5e0 (b:75e0)
; attach Trainer card to Arena Pokemon
	ld e, PLAY_AREA_ARENA
	ldh a, [hTempCardIndex_ff9f]
	call PutHandCardInPlayArea

; increase number of Defender cards of this location by 1
	ld a, DUELVARS_ARENA_CARD_ATTACHED_STRENGTH_CHARM
	call GetTurnDuelistVariable
	inc [hl]
	ret

; return carry if no Pokemon in the Bench.
Switch_BenchCheck: ; 2f5ee (b:75ee)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

Switch_PlayerSelection: ; 2f5f9 (b:75f9)
	ldtx hl, SelectPkmnOnBenchToSwitchWithActiveText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInBench
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret

Switch_SwitchEffect: ; 2f60a (b:760a)
	ldh a, [hTemp_ffa0]
	ld e, a
	call SwapArenaWithBenchPokemon
	ret

PokemonCenter_DamageCheck: ; 2f611 (b:7611)
	call CheckIfPlayAreaHasAnyDamage
	ldtx hl, NoPokemonWithDamageCountersText
	ret

PokemonCenter_HealDiscardEnergyEffect: ; 2f618 (b:7618)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld d, a
	ld e, PLAY_AREA_ARENA

; go through every Pokemon in the Play Area
; and heal all damage & discard their Energy cards.
.loop_play_area
; check its damage
	ld a, e
	ldh [hTempPlayAreaLocation_ff9d], a
	call GetCardDamageAndMaxHP
	or a
	jr z, .next_pkmn ; if no damage, skip Pokemon

; heal all its damage
	push de
	ld e, a
	ld d, $00
	call HealPlayAreaCardHP

; loop all cards in deck and for all the Energy cards
; that are attached to this Play Area location Pokemon,
; place them in the Discard Pile.
	ldh a, [hTempPlayAreaLocation_ff9d]
	or CARD_LOCATION_PLAY_AREA
	ld e, a
	ld a, $00
	call GetTurnDuelistVariable
.loop_deck
	ld a, [hl]
	cp e
	jr nz, .next_card_deck ; not attached to card, skip
	ld a, l
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	and TYPE_ENERGY
	jr z, .next_card_deck ; not Energy, skip
	ld a, l
	call PutCardInDiscardPile
.next_card_deck
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_deck

	pop de
.next_pkmn
	inc e
	dec d
	jr nz, .loop_play_area
	ret

; return carry if non-Turn Duelist has full Bench
; or if they have no Basic Pokemon cards in Discard Pile.
PokemonFlute_BenchCheck: ; 2f659 (b:7659)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, NoSpaceOnTheBenchText
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ret c ; not enough space in Bench
	; check Discard Pile
	call SwapTurn
	call CreateBasicPokemonCardListFromDiscardPile
	ldtx hl, ThereAreNoPokemonInDiscardPileText
	call SwapTurn
	ret

PokemonFlute_PlayerSelection: ; 2f672 (b:7672)
; create Discard Pile list
	call SwapTurn
	call CreateBasicPokemonCardListFromDiscardPile

; display selection screen and store Player's selection
	bank1call Func_5591
	ldtx hl, ChoosePokemonToPlaceInPlayText
	ldtx de, PlayerDiscardPileText
	bank1call SetCardListHeaderText
	bank1call DisplayCardList
	call SwapTurn
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	ret

PokemonFlute_PlaceInPlayAreaText: ; 2f68f (b:768f)
; place selected card in non-Turn Duelist's Bench
	call SwapTurn
	ldh a, [hTemp_ffa0]
	call MoveDiscardPileCardToHand
	call AddCardToHand
	call PutHandPokemonCardInPlayArea
	call SwapTurn

; unless it was the Player who played the card,
; display the Pokemon card on screen.
	call IsPlayerTurn
	ret c
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ldtx hl, CardWasChosenText
	bank1call DisplayCardDetailScreen
	call SwapTurn
	ret

PokemonBreeder_HandPlayAreaCheck: ; 2f6b3 (b:76b3)
	call CreatePlayableStage2PokemonCardListFromHand
	jr c, .cannot_evolve
	bank1call IsPrehistoricPowerActive
	ret
.cannot_evolve
	ldtx hl, ConditionsForEvolvingToStage2NotFulfilledText
	scf
	ret

PokemonBreeder_PlayerSelection: ; 2f6c1 (b:76c1)
; create hand list of playable Stage2 cards
	call CreatePlayableStage2PokemonCardListFromHand
	bank1call Func_5591

; handle Player selection of Stage2 card
	ldtx hl, PleaseSelectCardText
	ldtx de, DuelistHandText
	bank1call SetCardListHeaderText
	bank1call DisplayCardList
	ret c ; exit if B was pressed

	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	ldtx hl, ChooseBasicPokemonToEvolveText
	call DrawWideTextBox_WaitForInput

; handle Player selection of Basic card to evolve
	bank1call HasAlivePokemonInPlayArea
.read_input
	bank1call OpenPlayAreaScreenForSelection
	ret c ; exit if B was pressed
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTempPlayAreaLocation_ffa1], a
	ld e, a
	ldh a, [hTemp_ffa0]
	ld d, a
	call CheckIfCanEvolveInto_BasicToStage2
	jr c, .read_input ; loop back if cannot evolve this card
	or a
	ret

PokemonBreeder_EvolveEffect: ; 2f6f4 (b:76f4)
	ldh a, [hTempCardIndex_ff9f]
	push af
	ld hl, hTemp_ffa0
	ld a, [hli]
	ldh [hTempCardIndex_ff98], a
	ld a, [hl] ; hTempPlayAreaLocation_ffa1
	ldh [hTempPlayAreaLocation_ff9d], a

; load the Basic Pokemon card name to RAM
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex
	ld hl, wLoadedCard1Name
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call LoadTxRam2

; evolve card and overwrite its stage as STAGE2_WITHOUT_STAGE1
	ldh a, [hTempCardIndex_ff98]
	call EvolvePokemonCard
	ld [hl], STAGE2_WITHOUT_STAGE1

; load Stage2 Pokemon card name to RAM
	ldh a, [hTempCardIndex_ff98]
	call LoadCardDataToBuffer1_FromDeckIndex
	ld a, 18
	call CopyCardNameAndLevel
	xor a
	ld [hl], a ; $0 character
	ld hl, wTxRam2_b
	ld [hli], a
	ld [hl], a

; display Pokemon picture and play sfx,
; print the corresponding card names.
	bank1call DrawLargePictureOfCard
	ld a, $5e
	call PlaySFX
	ldtx hl, PokemonEvolvedIntoPokemonText
	call DrawWideTextBox_WaitForInput
	bank1call Func_161e
	pop af
	ldh [hTempCardIndex_ff9f], a
	ret

; creates list in wDuelTempList of all Stage2 Pokemon cards
; in the hand that can evolve a Basic Pokemon card in Play Area
; through use of Pokemon Breeder.
; returns carry if that list is empty.
CreatePlayableStage2PokemonCardListFromHand: ; 2f73e (b:773e)
	call CreateHandCardList
	ret c ; return if no hand cards

; check if hand Stage2 Pokemon cards can be made
; to evolve a Basic Pokemon in the Play Area and, if so,
; add it to the wDuelTempList.
	ld hl, wDuelTempList
	ld e, l
	ld d, h
.loop_hand
	ld a, [hl]
	cp $ff
	jr z, .done
	call .CheckIfCanEvolveAnyPlayAreaBasicCard
	jr c, .next_hand_card
	ld a, [hl]
	ld [de], a
	inc de
.next_hand_card
	inc hl
	jr .loop_hand

.done
	ld a, $ff ; terminating byte
	ld [de], a
	ld a, [wDuelTempList]
	cp $ff
	scf
	ret z ; return carry if empty
	; not empty
	or a
	ret

; return carry if Stage2 card in a cannot evolve any
; of the Basic Pokemon in Play Area through Pokemon Breeder.
.CheckIfCanEvolveAnyPlayAreaBasicCard
	push de
	ld d, a
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr nc, .set_carry ; skip if not Pokemon card
	ld a, [wLoadedCard2Stage]
	cp STAGE2
	jr nz, .set_carry ; skip if not Stage2

; check if can evolve any Play Area cards
	push hl
	push bc
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld e, PLAY_AREA_ARENA
.loop_play_area
	push bc
	push de
	call CheckIfCanEvolveInto_BasicToStage2
	pop de
	pop bc
	jr nc, .done_play_area
	inc e
	dec c
	jr nz, .loop_play_area
; set carry
	scf
.done_play_area
	pop bc
	pop hl
	pop de
	ret
.set_carry
	pop de
	scf
	ret

; return carry if no cards in the Bench.
ScoopUp_BenchCheck: ; 2f795 (b:7795)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

ScoopUp_PlayerSelection: ; 2f7a0 (b:77a0)
; print text box
	ldtx hl, ChoosePokemonToScoopUpText
	call DrawWideTextBox_WaitForInput

; handle Player selection
	bank1call HasAlivePokemonInPlayArea
	bank1call OpenPlayAreaScreenForSelection
	ret c ; exit if B was pressed

	ldh [hTemp_ffa0], a
	or a
	ret nz ; if it wasn't the Active Pokemon, we are done

; handle switching to a Pokemon in Bench and store location selected.
	call EmptyScreen
	ldtx hl, SelectPokemonToPlaceInTheArenaText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInBench
	bank1call OpenPlayAreaScreenForSelection
	ldh [hTempPlayAreaLocation_ffa1], a
	ret

ScoopUp_ReturnToHandEffect: ; 2f7c3 (b:77c3)
; store chosen card location to Scoop Up
	ldh a, [hTemp_ffa0]
	or CARD_LOCATION_PLAY_AREA
	ld e, a

; find Basic Pokemon card that is in the selected Play Area location
; and add it to the hand, discarding all cards attached.
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp e
	jr nz, .next_card ; skip if not in selected location
	ld a, l
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr nc, .next_card ; skip if not Pokemon card
	ld a, [wLoadedCard2Stage]
	or a
	jr nz, .next_card  ; skip if not Basic stage
; found
	ld a, l
	ldh [hTempCardIndex_ff98], a
	call AddCardToHand
	; optimization: break loop here, since
	; no two Basic Pokemon cards may occupy
	; the same Play Area location.
.next_card
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop

; since the card has been moved to hand,
; MovePlayAreaCardToDiscardPile will take care
; of discarding every higher stage cards and other cards attached.
	ldh a, [hTemp_ffa0]
	ld e, a
	call MovePlayAreaCardToDiscardPile

; if the Pokemon was in the Arena, clear status
	ldh a, [hTemp_ffa0]
	or a
	jr nz, .skip_clear_status
	call ClearAllStatusConditions
.skip_clear_status

; if card was not played by Player, show detail screen
; and print corresponding text.
	call IsPlayerTurn
	jr c, .shift_or_switch
	ldtx hl, PokemonWasReturnedFromArenaToHandText
	ldh a, [hTemp_ffa0]
	or a
	jr z, .display_detail_screen
	ldtx hl, PokemonWasReturnedFromBenchToHandText
.display_detail_screen
	ldh a, [hTempCardIndex_ff98]
	bank1call DisplayCardDetailScreen

.shift_or_switch
; if card was in Bench, simply shift Pokemon slots...
	ldh a, [hTemp_ffa0]
	or a
	jr z, .switch
	call ShiftAllPokemonToFirstPlayAreaSlots
	ret

.switch
; ...if Pokemon was in Arena, then switch it with the selected Bench card.
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld d, a
	ld e, PLAY_AREA_ARENA
	call SwapPlayAreaPokemon
	call ShiftAllPokemonToFirstPlayAreaSlots
	ret

; return carry if no other cards in hand,
; or if there are no Pokemon cards in hand.
PokemonTrader_HandDeckCheck: ; 2f826 (b:7826)
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	ldtx hl, ThereAreNoCardsInHandThatYouCanChangeText
	cp 2
	ret c ; return if no other cards in hand
	call CreatePokemonCardListFromHand
	ldtx hl, ThereAreNoCardsInHandThatYouCanChangeText
	ret

PokemonTrader_PlayerHandSelection: ; 2f838 (b:7838)
; print text box
	ldtx hl, ChooseCardFromYourHandToSwitchText
	call DrawWideTextBox_WaitForInput

; create list with all Pokemon cards in hand
	call CreatePokemonCardListFromHand
	bank1call Func_5591

; handle Player selection
	ldtx hl, ChooseCardToSwitchText
	ldtx de, DuelistHandText
	bank1call SetCardListHeaderText
	bank1call DisplayCardList
	ldh [hTemp_ffa0], a
	ret

PokemonTrader_PlayerDeckSelection: ; 2f853 (b:7853)
; temporarily place chosen hand card in deck
; so it can be potentially chosen to be traded.
	ldh a, [hTemp_ffa0]
	call RemoveCardFromHand
	call ReturnCardToDeck

; display deck card list screen
	ldtx hl, ChooseBasicOrEvolutionPokemonCardFromDeckText
	call DrawWideTextBox_WaitForInput
	call CreateDeckCardList
	bank1call Func_5591
	ldtx hl, ChoosePokemonCardText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText

; handle Player selection
.read_input
	bank1call DisplayCardList
	jr c, .read_input ; pressing B loops back to selection
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr nc, .read_input ; can't select non-Pokemon cards

; a valid card was selected, store its card index and
; place the selected hand card back to the hand.
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempPlayAreaLocation_ffa1], a
	ldh a, [hTemp_ffa0]
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	or a
	ret

PokemonTrader_TradeCardsEffect: ; 2f88d (b:788d)
; place hand card in deck
	ldh a, [hTemp_ffa0]
	call RemoveCardFromHand
	call ReturnCardToDeck

; place deck card in hand
	ldh a, [hTempPlayAreaLocation_ffa1]
	call SearchCardInDeckAndAddToHand
	call AddCardToHand

; display cards if the Pokemon Trader wasn't played by Player
	call IsPlayerTurn
	jr c, .done
	ldh a, [hTemp_ffa0]
	ldtx hl, PokemonWasReturnedToDeckText
	bank1call DisplayCardDetailScreen
	ldh a, [hTempPlayAreaLocation_ffa1]
	ldtx hl, WasPlacedInTheHandText
	bank1call DisplayCardDetailScreen
.done
	call Func_2c0bd
	ret

; makes list in wDuelTempList with all Pokemon cards
; that are in Turn Duelist's hand.
; if list turns out empty, return carry.
CreatePokemonCardListFromHand: ; 2f8b6 (b:78b6)
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	ld c, a
	ld l, DUELVARS_HAND
	ld de, wDuelTempList
.loop
	ld a, [hl]
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr nc, .next_hand_card
	ld a, [hl]
	ld [de], a
	inc de
.next_hand_card
	inc l
	dec c
	jr nz, .loop
	ld a, $ff ; terminating byte
	ld [de], a
	ld a, [wDuelTempList]
	cp $ff
	jr z, .set_carry
	or a
	ret
.set_carry
	scf
	ret

; return carry if no cards in deck
Pokedex_DeckCheck: ; 2f8e1 (b:78e1)
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ldtx hl, NoCardsLeftInTheDeckText
	cp DECK_SIZE
	ccf
	ret

Pokedex_PlayerSelection: ; 2f8ed (b:78ed)
; print text box
	ldtx hl, RearrangeThe5CardsAtTopOfDeckText
	call DrawWideTextBox_WaitForInput

; cap the number of cards to reorder up to
; number of cards left in the deck (maximum of 5)
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ld b, a
	ld a, DECK_SIZE
	sub [hl]
	ld c, 5
	cp c
	jr nc, .no_cap
	ld c, a
.no_cap

; fill wDuelTempList with cards that are going to be sorted
	ld a, c
	inc a
	ld [wNumberOfCardsToOrder], a
	ld a, b
	add DUELVARS_DECK_CARDS
	ld l, a
	ld de, wDuelTempList
.loop_cards_to_order
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_cards_to_order
	ld a, $ff ; terminating byte
	ld [de], a

.clear_list
; wDuelTempList + 10 will be filled with numbers from 1
; to 5 (or whatever the maximum order card is).
; so that the first item in that list corresponds to the first card
; the second item corresponds to the second card, etc.
; and the number in the list corresponds to the ordering number.
	call CountCardsInDuelTempList
	ld b, a
	ld a, 1
; fill order list with zeroes
	ldh [hCurSelectionItem], a
	ld hl, wDuelTempList + 10
	xor a
.loop_init
	ld [hli], a
	dec b
	jr nz, .loop_init
	ld [hl], $ff ; terminating byte

; display card list to order
	bank1call InitAndDrawCardListScreenLayout
	ldtx hl, ChooseTheOrderOfTheCardsText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText
	bank1call Func_5735

.read_input
	bank1call DisplayCardList
	jr c, .undo ; if B is pressed, undo last order selection

; a card was selected, check if it's already been selected
	ldh a, [hCurMenuItem]
	ld e, a
	ld d, $00
	ld hl, wDuelTempList + 10
	add hl, de
	ld a, [hl]
	or a
	jr nz, .read_input ; already has an ordering number

; hasn't been ordered yet, apply to it current ordering number
; and increase it by 1.
	ldh a, [hCurSelectionItem]
	ld [hl], a
	inc a
	ldh [hCurSelectionItem], a

; refresh screen
	push af
	bank1call Func_5744
	pop af

; check if we're done ordering
	ldh a, [hCurSelectionItem]
	ld hl, wNumberOfCardsToOrder
	cp [hl]
	jr c, .read_input ; if still more cards to select, loop back up

; we're done selecting cards
	call EraseCursor
	ldtx hl, IsThisOKText
	call YesOrNoMenuWithText_LeftAligned
	jr c, .clear_list ; "No" was selected, start over
	; selection was confirmed

; now wDuelTempList + 10 will be overwritten with the
; card indices in order of selection.
	ld hl, wDuelTempList + 10
	ld de, wDuelTempList
	ld c, 0
.loop_write_indices
	ld a, [hli]
	cp $ff
	jr z, .done_write_indices
	push hl
	push bc
	ld c, a
	ld b, $00
	ld hl, hTempCardIndex_ff9f
	add hl, bc
	ld a, [de]
	ld [hl], a
	pop bc
	pop hl
	inc de
	inc c
	jr .loop_write_indices

.done_write_indices
	ld b, $00
	ld hl, hTempList
	add hl, bc
	ld [hl], $ff ; terminating byte
	or a
	ret

.undo
; undo last selection and get previous order number
	ld hl, hCurSelectionItem
	ld a, [hl]
	cp 1
	jr z, .read_input ; already at first input, nothing to undo
	dec a
	ld [hl], a
	ld c, a
	ld hl, wDuelTempList + 10
.asm_2f99e
	ld a, [hli]
	cp c
	jr nz, .asm_2f99e
	dec hl
	ld [hl], $00 ; overwrite order number with 0
	bank1call Func_5744
	jr .read_input

Pokedex_OrderDeckCardsEffect: ; 2f9aa (b:79aa)
; place cards in order to the hand.
	ld hl, hTempList
	ld c, 0
.loop_place_hand
	ld a, [hli]
	cp $ff
	jr z, .place_top_deck
	call SearchCardInDeckAndAddToHand
	inc c
	jr .loop_place_hand

.place_top_deck
; go to last card in list and iterate in decreasing order
; placing each card in top of deck.
	dec hl
	dec hl
.loop_place_deck
	ld a, [hld]
	call ReturnCardToDeck
	dec c
	jr nz, .loop_place_deck
	ret

BillEffect: ; 2f9c4 (b:79c4)
	ld a, 2
	bank1call DisplayDrawNCardsScreen
	ld c, 2
.loop_draw
	call DrawCardFromDeck
	jr c, .done
	ldh [hTempCardIndex_ff98], a
	call AddCardToHand
	call IsPlayerTurn
	jr nc, .skip_display_screen
	push bc
	bank1call DisplayPlayerDrawCardScreen
	pop bc
.skip_display_screen
	dec c
	jr nz, .loop_draw
.done
	ret

LassEffect: ; 2f9e3 (b:79e3)
; first discard Lass card that was used
	ldh a, [hTempCardIndex_ff9f]
	call RemoveCardFromHand
	call PutCardInDiscardPile

	ldtx hl, PleaseCheckTheOpponentsHandText
	call DrawWideTextBox_WaitForInput

	call .DisplayLinkOrCPUHand
	; do for non-Turn Duelist
	call SwapTurn
	call .ShuffleDuelistHandTrainerCardsInDeck
	call SwapTurn
	; do for Turn Duelist
;	fallthrough

.ShuffleDuelistHandTrainerCardsInDeck
	call CreateHandCardList
	call SortCardsInDuelTempListByID
	xor a
	ldh [hCurSelectionItem], a
	ld hl, wDuelTempList

; go through all cards in hand
; and any Trainer card is returned to deck.
.loop_hand
	ld a, [hli]
	ldh [hTempCardIndex_ff98], a
	cp $ff
	jr z, .done
	call GetCardIDFromDeckIndex
	call GetCardType
	cp TYPE_TRAINER
	jr nz, .loop_hand
	ldh a, [hTempCardIndex_ff98]
	call RemoveCardFromHand
	call ReturnCardToDeck
	push hl
	ld hl, hCurSelectionItem
	inc [hl]
	pop hl
	jr .loop_hand
.done
; show card list
	ldh a, [hCurSelectionItem]
	or a
	call nz, Func_2c0bd ; only show list if there were any Trainer cards
	ret

.DisplayLinkOrCPUHand ; 2fa31 (b:7a31)
	ld a, [wDuelType]
	or a
	jr z, .cpu_opp

; link duel
	ldh a, [hWhoseTurn]
	push af
	ld a, OPPONENT_TURN
	ldh [hWhoseTurn], a
	call .DisplayOppHand
	pop af
	ldh [hWhoseTurn], a
	ret

.cpu_opp
	call SwapTurn
	call .DisplayOppHand
	call SwapTurn
	ret

.DisplayOppHand ; 2fa4f (b:7a4f)
	call CreateHandCardList
	jr c, .no_cards
	bank1call InitAndDrawCardListScreenLayout
	ldtx hl, ChooseTheCardYouWishToExamineText
	ldtx de, DuelistHandText
	bank1call SetCardListHeaderText
	ld a, A_BUTTON | START
	ld [wNoItemSelectionMenuKeys], a
	bank1call DisplayCardList
	ret
.no_cards
	ldtx hl, DuelistHasNoCardsInHandText
	call DrawWideTextBox_WaitForInput
	ret

; return carry if not enough cards in hand for effect
Maintenance_HandCheck: ; 2fa70 (b:7a70)
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	ldtx hl, NotEnoughCardsInHandText
	cp 3
	ret

Maintenance_PlayerSelection: ; 2fa7b (b:7a7b)
	ldtx hl, Choose2HandCardsFromHandToReturnToDeckText
	ldtx de, ChooseTheCardToPutBackText
	call HandlePlayerSelection2HandCards
	ret

Maintenance_ReturnToDeckAndDrawEffect: ; 2fa85 (b:7a85)
; return both selected cards to the deck
	ldh a, [hTempList]
	call RemoveCardFromHand
	call ReturnCardToDeck
	ldh a, [hTempList + 1]
	call RemoveCardFromHand
	call ReturnCardToDeck
	call Func_2c0bd

; draw one card
	ld a, 2
	bank1call DisplayDrawNCardsScreen
	ld c, 2
.loop_draw
	call DrawCardFromDeck
	jr c, .done
	ldh [hTempCardIndex_ff98], a
	call AddCardToHand
	call IsPlayerTurn
	jr nc, .skip_display_screen
	push bc
	bank1call DisplayPlayerDrawCardScreen
	pop bc
.skip_display_screen
	dec c
	jr nz, .loop_draw
.done
	ret

; return carry if no cards in deck
PokeBall_DeckCheck: ; 2faad (b:7aad)
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ldtx hl, NoCardsLeftInTheDeckText
	cp DECK_SIZE
	ccf
	ret

PokeBall_PlayerSelection: ; 2fab9 (b:7ab9)
	ld de, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call Func_2c08a
	ldh [hTempList], a ; store coin result
	ret nc

; create list of all Pokemon cards in deck to search for
	call CreateDeckCardList
	ldtx hl, ChooseBasicOrEvolutionPokemonCardFromDeckText
	ldtx bc, EvolutionCardText
	lb de, SEARCHEFFECT_POKEMON, 0
	call LookForCardsInDeck
	jr c, .no_pkmn ; return if Player chose not to check deck

; handle input
	bank1call Func_5591
	ldtx hl, ChoosePokemonCardText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText
.read_input
	bank1call DisplayCardList
	jr c, .try_exit ; B was pressed, check if Player can cancel operation
	ldh a, [hTempCardIndex_ff98]
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr nc, .play_sfx ; can't select non-Pokemon card
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempList + 1], a
	or a
	ret

.no_pkmn
	ld a, $ff
	ldh [hTempList + 1], a
	or a
	ret

.play_sfx
	call Func_3794
	jr .read_input

.try_exit
; Player can only exit screen if there are no cards to choose
	ld hl, wDuelTempList
.loop
	ld a, [hli]
	cp $ff
	jr z, .no_pkmn
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr nc, .loop
	jr .read_input

PokeBall_AddToHandEffect: ; 2fb15 (b:7b15)
	ldh a, [hTempList]
	or a
	ret z ; return if coin toss was tails

	ldh a, [hTempList + 1]
	cp $ff
	jr z, .done ; skip if no Pokemon was chosen

; add Pokemon card to hand and show in screen if
; it wasn't the Player who played the Trainer card.
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	call IsPlayerTurn
	jr c, .done
	ldh a, [hTempList + 1]
	ldtx hl, WasPlacedInTheHandText
	bank1call DisplayCardDetailScreen
.done
	call Func_2c0bd
	ret

; return carry if no cards in the Discard Pile
Recycle_DiscardPileCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_DISCARD_PILE
	call GetTurnDuelistVariable
	ldtx hl, ThereAreNoCardsInTheDiscardPileText
	cp 1
	ret

Recycle_PlayerSelection:
	ldtx de, TrainerCardSuccessCheckText
	call Func_2c08a
	jr nc, .tails

	call CreateDiscardPileCardList
	bank1call Func_5591
	ldtx hl, PleaseSelectCardText
	ldtx de, PlayerDiscardPileText
	bank1call SetCardListHeaderText
.read_input
	bank1call DisplayCardList
	jr c, .read_input ; can't cancel with B button

; Discard Pile card was chosen
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempList], a
	ret

.tails
	ld a, $ff
	ldh [hTempList], a
	or a
	ret

Recycle_AddToHandEffect:
	ldh a, [hTempList]
	cp $ff
	ret z ; return if no card was selected

; add card to hand and show in screen if
; it wasn't the Player who played the Trainer card.
	call MoveDiscardPileCardToHand
	call ReturnCardToDeck
	call IsPlayerTurn
	ret c
	ldh a, [hTempList]
	ldtx hl, CardWasChosenText
	bank1call DisplayCardDetailScreen
	ret

Revive_BenchCheck: ; 2fb80 (b:7b80)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, NoSpaceOnTheBenchText
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ret c
	call CreateBasicPokemonCardListFromDiscardPile
	ldtx hl, ThereAreNoPokemonInDiscardPileText
	ret

Revive_PlayerSelection: ; 2fb93 (b:7b93)
; create Basic Pokemon card list from Discard Pile
	ldtx hl, ChooseBasicPokemonToPlaceOnBenchText
	call DrawWideTextBox_WaitForInput
	call CreateBasicPokemonCardListFromDiscardPile
	bank1call Func_5591

; display screen to select Pokemon
	ldtx hl, PleaseSelectCardText
	ldtx de, PlayerDiscardPileText
	bank1call SetCardListHeaderText
	bank1call DisplayCardList

; store selection
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	ret

Revive_PlaceInPlayAreaEffect: ; 2fbb0 (b:7bb0)
; place selected Pokemon in the Bench
	ldh a, [hTemp_ffa0]
	call MoveDiscardPileCardToHand
	call AddCardToHand
	call PutHandPokemonCardInPlayArea

; set HP to half, rounded up
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	srl a
	bit 0, a
	jr z, .rounded
	add 5 ; round up HP to nearest 10
.rounded
	ld [hl], a
	call IsPlayerTurn
	ret c ; done if Player played Revive

; display card
	ldh a, [hTemp_ffa0]
	ldtx hl, PlacedOnTheBenchText
	bank1call DisplayCardDetailScreen
	ret

; makes list in wDuelTempList with all Basic Pokemon cards
; that are in Turn Duelist's Discard Pile.
; if list turns out empty, return carry.
CreateBasicPokemonCardListFromDiscardPile: ; 2fbd6 (b:7bd6)
; gets hl to point at end of Discard Pile cards
; and iterates the cards in reverse order.
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_DISCARD_PILE
	call GetTurnDuelistVariable
	ld b, a
	add DUELVARS_DECK_CARDS
	ld l, a
	ld de, wDuelTempList
	inc b
	jr .next_discard_pile_card

.check_card
	ld a, [hl]
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr nc, .next_discard_pile_card ; if not Pokemon card, skip
	ld a, [wLoadedCard2Stage]
	or a
	jr nz, .next_discard_pile_card ; if not Basic stage, skip

; write this card's index to wDuelTempList
	ld a, [hl]
	ld [de], a
	inc de
.next_discard_pile_card
	dec l
	dec b
	jr nz, .check_card

; done with the loop.
	ld a, $ff ; terminating byte
	ld [de], a
	ld a, [wDuelTempList]
	cp $ff
	jr z, .set_carry
	or a
	ret
.set_carry
	scf
	ret

; return carry if Turn Duelist has no Evolution cards in Play Area
DevolutionSpray_PlayAreaEvolutionCheck: ; 2fc0b (b:7c0b)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld l, DUELVARS_ARENA_CARD
.loop
	ld a, [hli]
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Stage]
	or a
	ret nz ; found an Evolution card
	dec c
	jr nz, .loop

	ldtx hl, ThereAreNoStage1PokemonText
	scf
	ret

DevolutionSpray_PlayerSelection: ; 2fc24 (b:7c24)
; display textbox
	ldtx hl, ChooseEvolutionCardAndPressAButtonToDevolveText
	call DrawWideTextBox_WaitForInput

; have Player select an Evolution card in Play Area
	ld a, 1
	ldh [hCurSelectionItem], a
	bank1call HasAlivePokemonInPlayArea
.read_input
	bank1call OpenPlayAreaScreenForSelection
	ret c ; exit if B was pressed
	bank1call GetCardOneStageBelow
	jr c, .read_input ; can't select Basic cards

; get pre-evolution card data
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	push hl
	push af
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_STAGE
	ld l, a
	ld a, [hl]
	push hl
	push af
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD
	ld l, a
	ld a, [hl]
	push hl
	push af
	jr .update_data

.repeat_devolution
; show Play Area screen with static cursor
; so that the Player either presses A to do one more devolution
; or presses B to finish selection.
	bank1call Func_6194
	jr c, .done_selection ; if B pressed, end selection instead
	; do one more devolution
	bank1call GetCardOneStageBelow

.update_data
; overwrite the card data to new devolved stats
	ld a, d
	call UpdateDevolvedCardHPAndStage
	call GetNextPositionInTempList_TrainerEffects
	ld [hl], e
	ld a, d
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Stage]
	or a
	jr nz, .repeat_devolution ; can do one more devolution

.done_selection
	call GetNextPositionInTempList_TrainerEffects
	ld [hl], $ff ; terminating byte

; store this Play Area location in first item of temp list
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTempList], a

; update Play Area location display of this Pokemon
	call EmptyScreen
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld hl, wHUDEnergyAndHPBarsX
	ld [hli], a
	ld [hl], $00
	bank1call PrintPlayAreaCardInformationAndLocation
	call EnableLCD
	pop bc
	pop hl

; rewrite all duelvars from before the selection was done
; this is so that if "No" is selected in confirmation menu,
; then the Pokemon isn't devolved and remains unchanged.
	ld [hl], b
	ldtx hl, IsThisOKText
	call YesOrNoMenuWithText
	pop bc
	pop hl

	ld [hl], b
	pop bc
	pop hl

	ld [hl], b
	ret

DevolutionSpray_DevolutionEffect: ; 2fc99 (b:7c99)
; first byte in list is Play Area location chosen
	ld hl, hTempList
	ld a, [hli]
	ldh [hTempPlayAreaLocation_ff9d], a
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	push hl
	push af

; loop through devolutions selected
	ld hl, hTempList + 1
.loop_devolutions
	ld a, [hl]
	cp $ff
	jr z, .check_ko ; list is over
	; devolve card to its stage below
	push hl
	bank1call GetCardOneStageBelow
	ld a, d
	call UpdateDevolvedCardHPAndStage
	call ResetDevolvedCardStatus
	pop hl
	ld a, [hli]
	call PutCardInDiscardPile
	jr .loop_devolutions

.check_ko
	pop af
	ld e, a
	pop hl
	ld d, [hl]
	call PrintDevolvedCardNameAndLevelText
	ldh a, [hTempList]
	call PrintPlayAreaCardKnockedOutIfNoHP
	bank1call Func_6e49
	ret

; returns carry if neither duelist has any energy cards attached
SuperEnergyRemoval_EnergyCheck: ; 2fcd0 (b:7cd0)
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ldtx hl, NoCardsLeftInTheDeckText
	cp DECK_SIZE
	ccf
	ret

SuperEnergyRemoval_PlayerSelection: ; 2fce4 (b:7ce4)
ld de, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA

; create list of all Pokemon cards in deck to search for
	call CreateDeckCardList
	ldtx hl, ChooseBasicOrEvolutionPokemonCardFromDeckText
	ldtx bc, EvolutionCardText
	lb de, SEARCHEFFECT_POKEMON, 0
	call LookForCardsInDeck
	jr c, .no_pkmn ; return if Player chose not to check deck

; handle input
	bank1call Func_5591
	ldtx hl, ChoosePokemonCardText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText
.read_input
	bank1call DisplayCardList
	jr c, .try_exit ; B was pressed, check if Player can cancel operation
	ldh a, [hTempCardIndex_ff98]
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr nc, .play_sfx ; can't select non-Pokemon card
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempList + 1], a
	or a
	ret

.no_pkmn
	ld a, $ff
	ldh [hTempList + 1], a
	or a
	ret

.play_sfx
	call Func_3794
	jr .read_input

.try_exit
; Player can only exit screen if there are no cards to choose
	ld hl, wDuelTempList
.loop
	ld a, [hli]
	cp $ff
	jr z, .no_pkmn
	call LoadCardDataToBuffer2_FromDeckIndex
	ld a, [wLoadedCard2Type]
	cp TYPE_ENERGY
	jr nc, .loop
	jr .read_input

SuperEnergyRemoval_DiscardEffect: ; 2fd73 (b:7d73)
	ldh a, [hTempList + 1]
	cp $ff
	jr z, .done ; skip if no Pokemon was chosen

; add Pokemon card to hand and show in screen if
; it wasn't the Player who played the Trainer card.
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	call IsPlayerTurn
	jr c, .done
	ldh a, [hTempList + 1]
	ldtx hl, WasPlacedInTheHandText
	bank1call DisplayCardDetailScreen
.done
	call Func_2c0bd
	ret
SuperEnergyRetrieval_HandEnergyCheck: ; 2fda4 (b:7da4)
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	ldtx hl, NotEnoughCardsInHandText
	cp 3
	ret c
	call CreateEnergyCardListFromDiscardPile_OnlyBasic
	ldtx hl, ThereAreNoBasicEnergyCardsInDiscardPileText
	ret

SuperEnergyRetrieval_PlayerHandSelection: ; 2fdb6 (b:7db6)
	call HandlePlayerSelection2HandCardsToDiscard
	ret

SuperEnergyRetrieval_PlayerDiscardPileSelection: ; 2fdba (b:7dba)
	ldtx hl, ChooseUpTo4FromDiscardPileText
	call DrawWideTextBox_WaitForInput
	call CreateEnergyCardListFromDiscardPile_OnlyBasic

.loop_discard_pile_selection
	bank1call InitAndDrawCardListScreenLayout
	ldtx hl, PleaseSelectCardText
	ldtx de, PlayerDiscardPileText
	bank1call SetCardListHeaderText
	bank1call DisplayCardList
	jr nc, .store_selected_card
	; B pressed
	ld a, 6
	call AskWhetherToQuitSelectingCards
	jr c, .loop_discard_pile_selection ; player selected to continue
	jr .done

.store_selected_card
	ldh a, [hTempCardIndex_ff98]
	call GetTurnDuelistVariable
	call GetNextPositionInTempList_TrainerEffects
	ldh a, [hTempCardIndex_ff98]
	ld [hl], a ; store selected energy card
	call RemoveCardFromDuelTempList
	jr c, .done
	; this shouldn't happen
	ldh a, [hCurSelectionItem]
	cp 6
	jr c, .loop_discard_pile_selection

.done
; insert terminating byte
	call GetNextPositionInTempList_TrainerEffects
	ld [hl], $ff
	or a
	ret

SuperEnergyRetrieval_DiscardAndAddToHandEffect: ; 2fdfa (b:7dfa)
; discard 2 cards selected from the hand
	ld hl, hTemp_ffa0
	ld a, [hli]
	call RemoveCardFromHand
	call PutCardInDiscardPile
	ld a, [hli]
	call RemoveCardFromHand
	call PutCardInDiscardPile

; put selected cards in hand
	ld de, wDuelTempList
.loop
	ld a, [hli]
	ld [de], a
	inc de
	cp $ff
	jr z, .done
	call MoveDiscardPileCardToHand
	call AddCardToHand
	jr .loop

.done
; if Player played the card, exit
	call IsPlayerTurn
	ret c
; if not, show card list selected by Opponent
	bank1call Func_4b38
	ret

; outputs in hl the next position
; in hTempList to place a new card,
; and increments hCurSelectionItem.
; identical to GetNextPositionInTempList.
GetNextPositionInTempList_TrainerEffects: ; 2fe25 (b:7e25)
	push de
	ld hl, hCurSelectionItem
	ld a, [hl]
	inc [hl]
	ld e, a
	ld d, $00
	ld hl, hTempList
	add hl, de
	pop de
	ret

; handles screen for Player to select 2 cards from the hand to discard.
; first prints text informing Player to choose cards to discard
; then runs HandlePlayerSelection2HandCards routine.
HandlePlayerSelection2HandCardsToDiscard: ; 2fe34 (b:7e34)
	ldtx hl, Choose2CardsFromHandToDiscardText
	ldtx de, ChooseTheCardToDiscardText
;	fallthrough

; handles screen for Player to select 2 cards from the hand
; to activate some Trainer card effect.
; assumes Trainer card index being used is in [hTempCardIndex_ff9f].
; stores selection of cards in hTempList.
; returns carry if Player cancels operation.
; input:
;	hl = text to print in text box;
;	de = text to print in screen header.
HandlePlayerSelection2HandCards: ; 2fe3a (b:7e3a)
	push de
	call DrawWideTextBox_WaitForInput

; remove the Trainer card being used from list
; of cards to select from hand.
	call CreateHandCardList
	ldh a, [hTempCardIndex_ff9f]
	call RemoveCardFromDuelTempList

	xor a
	ldh [hCurSelectionItem], a
	pop hl
.loop
	push hl
	bank1call Func_5591
	pop hl
	bank1call SetCardListInfoBoxText
	push hl
	bank1call DisplayCardList
	pop hl
	jr c, .set_carry ; was B pressed?
	push hl
	call GetNextPositionInTempList_TrainerEffects
	ldh a, [hTempCardIndex_ff98]
	ld [hl], a
	call RemoveCardFromDuelTempList
	pop hl
	ldh a, [hCurSelectionItem]
	cp 2
	jr c, .loop ; is selection over?
	or a
	ret
.set_carry
	scf
	ret

; return carry if non-turn duelist has no benched Pokemon
GustOfWind_BenchCheck: ; 2fe6e (b:7e6e)
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

GustOfWind_PlayerSelection: ; 2fe79 (b:7e79)
	ldtx hl, ChooseAPokemonToSwitchWithActivePokemonText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

GustOfWind_SwitchEffect: ; 2fe90 (b:7e90)
; play whirlwind animation
	ld a, ATK_ANIM_POKEMON_REVERSAL
	call Func_2fea9

; switch Arena card
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld e, a
	call SwapArenaWithBenchPokemon
	call SwapTurn
	call ClearDamageReductionSubstatus2
	xor a
	ld [wDuelDisplayedScreen], a
	ret

.tails
	ld a, $ff
	ldh [hTempList], a
	or a
	ret

; input:
;	a = attack animation to play
Func_2fea9: ; 2fea9 (b:7ea9)
	ld [wLoadedAttackAnimation], a
	bank1call Func_7415
	ld bc, $0
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
	ret

; heals amount of damage in register e for card in
; Play Area location in [hTempPlayAreaLocation_ff9d].
; plays healing animation and prints text with card's name.
; input:
;	e = amount of HP to heal
;	[hTempPlayAreaLocation_ff9d] = Play Area location of card to heal
HealPlayAreaCardHP: ; 2febc (b:7ebc)
	ld e, a
	ld d, $00

; play heal animation
	push de
	bank1call Func_7415
	ld a, ATK_ANIM_HEALING_WIND_PLAY_AREA
	ld [wLoadedAttackAnimation], a
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $01
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
	pop hl

; print Pokemon card name and damage healed
	push hl
	call LoadTxRam3
	ld hl, $0000
	call LoadTxRam2
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex
	ld a, 18
	call CopyCardNameAndLevel
	ld [hl], $00 ; terminating character on end of the name
	ldtx hl, PokemonHealedDamageText
	call DrawWideTextBox_WaitForInput
	pop de

; heal the target Pokemon
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	add e
	ld [hl], a
	ret
