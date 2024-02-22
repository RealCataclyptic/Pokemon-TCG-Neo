Poison50PercentEffect:
	ldtx de, PoisonCheckText
	call TossCoin_BankB
	ret nc

PoisonEffect:
	lb bc, CNF_SLP_PRZ, POISONED
	jr QueueStatusCondition

DoublePoisonEffect:
	lb bc, CNF_SLP_PRZ, DOUBLE_POISONED
	jr QueueStatusCondition

Paralysis50PercentEffect:
	ldtx de, ParalysisCheckText
	call TossCoin_BankB
	ret nc

ParalysisEffect:
	lb bc, PSN_DBLPSN, PARALYZED
	jr QueueStatusCondition

Confusion50PercentEffect:
	ldtx de, ConfusionCheckText
	call TossCoin_BankB
	ret nc

ConfusionEffect:
	lb bc, PSN_DBLPSN, CONFUSED
	jr QueueStatusCondition

Sleep50PercentEffect:
	ldtx de, SleepCheckText
	call TossCoin_BankB
	ret nc

SleepEffect:
	lb bc, PSN_DBLPSN, ASLEEP
	jr QueueStatusCondition

QueueStatusCondition:
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
	ld hl, wStatusConditionQueueIndex
	push hl
	ld e, [hl]
	ld d, $0
	ld hl, wStatusConditionQueue
	add hl, de
	call SwapTurn
	ldh a, [hWhoseTurn]
	ld [hli], a
	call SwapTurn
	ld [hl], b ; mask of status conditions not to discard on the target
	inc hl
	ld [hl], c ; status condition to inflict to the target
	pop hl
	; advance wStatusConditionQueueIndex
	inc [hl]
	inc [hl]
	inc [hl]
	scf
	ret

TossCoin_BankB:
	call TossCoin
	ret

TossCoinATimes_BankB:
	call TossCoinATimes
	ret

CommentedOut_2c086:
	ret

Func_2c087:
	xor a
	jr Func_2c08c

Func_2c08a:
	ld a, $1

Func_2c08c:
	push de
	push af
	ld a, OPPACTION_TOSS_COIN_A_TIMES
	call SetOppAction_SerialSendDuelData
	pop af
	pop de
	call SerialSend8Bytes
	call TossCoinATimes
	ret

SetNoEffectFromStatus:
	ld a, EFFECT_FAILED_NO_EFFECT
	ld [wEffectFailed], a
	ret

SetWasUnsuccessful:
	ld a, EFFECT_FAILED_UNSUCCESSFUL
	ld [wEffectFailed], a
	ret

Func_2c0a8:
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

Func_2c0bd:
	call ExchangeRNG
	bank1call Func_4f2d
	call ShuffleDeck
	ret

; return carry if Player is the Turn Duelist
IsPlayerTurn:
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
UpdateExpectedAIDamage_AccountForPoison:
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
UpdateExpectedAIDamage:
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
SetExpectedAIDamage:
	ld [wDamage], a
	xor a
	ld [wDamage + 1], a
	ld a, d
	ld [wAIMinDamage], a
	ld a, e
	ld [wAIMaxDamage], a
	ret

Func_2c10b:
	ldh [hTempPlayAreaLocation_ff9d], a
	bank1call Func_61a1
	bank1call PrintPlayAreaCardList_EnableLCD
	bank1call Func_6194
	ret

; deal damage to all the turn holder's benched Pokemon
; input: a = amount of damage to deal to each Pokemon
DealDamageToAllBenchedPokemon:
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

Func_2c12e:
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
ApplySubstatus1ToDefendingCard:
	push af
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS1
	call GetTurnDuelistVariable
	pop af
	ld [hli], a
	ret

ApplySubstatus1ToSelf: 
	push af
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS1
	call GetNonTurnDuelistVariable
	pop af
	ld [hli], a
	ret

; apply a status condition of type 2 identified by register a to the target,
; unless prevented by wNoDamageOrEffect
ApplySubstatus2ToDefendingCard:
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
SetDefiniteDamage:
	ld [wDamage], a
	ld [wAIMinDamage], a
	ld [wAIMaxDamage], a
	xor a
	ld [wDamage + 1], a
	ret

; overwrites wAIMinDamage and wAIMaxDamage
; with value in wDamage.
SetDefiniteAIDamage:
	ld a, [wDamage]
	ld [wAIMinDamage], a
	ld [wAIMaxDamage], a
	ret

; returns in a some random occupied Play Area location
; in Turn Duelist's Play Area.
PickRandomPlayAreaCard:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	call Random
	or a
	ret

; outputs in hl the next position
; in hTempList to place a new card,
; and increments hCurSelectionItem.
GetNextPositionInTempList:
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
CreateListOfFireEnergyAttachedToArena:
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
CreateListOfEnergyAttachedToArena:
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
PrintDevolvedCardNameAndLevelText:
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

HandleSwitchDefendingPokemonEffect:
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
	ld [wDefendingWasForcedToSwitch], a
	ret

; returns carry if Defending has No Damage or Effect
; if so, print its appropriate text.
HandleNoDamageOrEffect:
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
ApplyAndAnimateHPRecovery:
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
	lb bc, PLAY_AREA_ARENA, $1 ; arrow
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
CheckIfPlayAreaHasAnyDamage:
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
CreateTrainerCardListFromDiscardPile:
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
CreateEnergyCardListFromDiscardPile_OnlyBasic:
	ld c, $01
	jr CreateEnergyCardListFromDiscardPile

; makes a list in wDuelTempList with the deck indices
; of all energy cards (including Double Colorless)
; found in Turn Duelist's Discard Pile.
CreateEnergyCardListFromDiscardPile_AllEnergy:
	ld c, $00
;	fallthrough

; makes a list in wDuelTempList with the deck indices
; of energy cards found in Turn Duelist's Discard Pile.
; if (c == 0), all energy cards are allowed;
; if (c != 0), double colorless energy cards are not included.
; returns carry if no energy cards were found.
CreateEnergyCardListFromDiscardPile:
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
CheckIfDeckIsEmpty:
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
;	 = search for either NidoranM or NidoranF
;	SEARCHEFFECT_BASIC_FIGHTING = search for any Basic Fighting Pokemon
;	SEARCHEFFECT_BASIC_ENERGY = search for any Basic Energy
;	SEARCHEFFECT_POKEMON = search for any Pokemon card
; input:
;	d = SEARCHEFFECT_* constant
;	e = (optional) card ID to search for in deck
;	hl = text to print if Deck has card(s)
; output:
;	carry set if refused to look at deck
LookForCardsInDeck:
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

.set_carry
	scf
	ret

; returns carry if no card with
; same card ID as e is found in Deck
.SearchDeckForCardID
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
.SearchDeckForNidoran
	ld hl, wDuelTempList
.loop_deck_nidoran
	ld a, [hli]
	cp $ff
	jr z, .set_carry
	call GetCardIDFromDeckIndex
	ld a, e
	cp FLAREON
	jr z, .found_nidoran
	ld a, e
	cp JOLTEON
	jr z, .found_nidoran
	ld a, e
	cp VAPOREON
	jr z, .found_nidoran
	ld a, e
	cp ESPEON1
	jr z, .found_nidoran
	ld a, e
	cp ESPEON2
	jr z, .found_nidoran
	ld a, e
	cp UMBREON
	jr z, .found_nidoran
	jr nz, .loop_deck_nidoran
.found_nidoran
	or a
	ret

; returns carry if no Basic Fighting Pokemon is found in Deck
.SearchDeckForBasicFighting
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
.SearchDeckForBasicEnergy
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
.SearchDeckForPokemon
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
HandleDefendingPokemonAttackSelection:
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
GetAttackName:
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
CheckIfDefendingPokemonHasAnyAttack:
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
UpdateDevolvedCardHPAndStage:
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
ResetDevolvedCardStatus:
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
AskWhetherToQuitSelectingCards:
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
DuelistSelectForcedSwitch:
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
AIPickEnergyCardToDiscardFromDefendingPokemon:
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
AIPickAttackForAmnesia:
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
GetBenchPokemonWithLowestHP:
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
HandleColorChangeScreen:
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

.DrawScreen:
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
LoadCardNameAndInputColor:
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

ShiftMenuData:
	; x, y, text id
	textitem 10,  9, TypeText
	textitem 10, 10, WeaknessText
	textitem 10, 11, ResistanceText
	db $ff

ColorTileAndBGP:
	; tile, BG
	db $e4, $02
	db $e0, $01
	db $eC, $02
	db $e8, $01
	db $f0, $03
	db $f4, $03

ShiftListItemToColor:
	db GRASS
	db FIRE
	db WATER
	db LIGHTNING
	db FIGHTING
	db PSYCHIC

ColorToTextSymbol:
	tx FireSymbolText
	tx GrassSymbolText
	tx LightningSymbolText
	tx WaterSymbolText
	tx FightingSymbolText
	tx PsychicSymbolText

DrawSymbolOnPlayAreaCursor:
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
Func_2c6d9:
	ldtx hl, IncompleteText
	call DrawWideTextBox_WaitForInput
	ret

PlayAreaSelectionMenuParameters:
	db 0, 0 ; cursor x, cursor y
	db 3 ; y displacement between items
	db MAX_PLAY_AREA_POKEMON ; number of items
	db SYM_CURSOR_R ; cursor tile number
	db SYM_SPACE ; tile behind cursor
	dw NULL ; function pointer if non-0

BenchSelectionMenuParameters:
	db 0, 3 ; cursor x, cursor y
	db 3 ; y displacement between items
	db MAX_PLAY_AREA_POKEMON ; number of items
	db SYM_CURSOR_R ; cursor tile number
	db SYM_SPACE ; tile behind cursor
	dw NULL ; function pointer if non-0

; If heads, defending Pokemon becomes poisoned
SpitPoison_Poison50PercentEffect:
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
TerrorStrike_50PercentSelectSwitchPokemon:
	ld a, (20 * 2) / 2
	lb de, 30, 70
	jp SetExpectedAIDamage
	

TerrorStrike_SwitchDefendingPokemon:
	ld hl, 20 ; This number is for the damagecheck text directly below
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	add a
	call ATimes10
	call AddToDamage
	ret

PoisonFang_AIEffect:
	ld a, 10
	lb de, 10, 10
	jp UpdateExpectedAIDamage_AccountForPoison

WeepinbellPoisonPowder_AIEffect:
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

; return carry if there are no Pokemon cards in the non-turn holder's bench
VictreebelLure_AssertPokemonInBench:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

; return in hTempPlayAreaLocation_ffa1 the PLAY_AREA_* location
; of the Bench Pokemon that was selected for switch
VictreebelLure_SelectSwitchPokemon:
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
VictreebelLure_GetBenchPokemonWithLowestHP:
	call GetBenchPokemonWithLowestHP
	ldh [hTemp_ffa0], a
	ret

; Defending Pokemon is swapped out for the one with the PLAY_AREA_* at hTemp_ffa0
; unless Mew's Neutralizing Shield or Haunter's Transparency prevents it.
VictreebelLure_SwitchDefendingPokemon:
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
AcidEffect:
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 4
	call TossCoinATimes_BankB
	call ATimes10
	call SetDefiniteDamage
	ret

GloomPoisonPowder_AIEffect:
	ld a, 40 / 2
	lb de, 0, 40
	jp SetExpectedAIDamage

; Defending Pokemon and user become confused
FoulOdorEffect:
	call CreateHandCardList
	call SortCardsInDuelTempListByID
	ld hl, wDuelTempList
.loop_return_deck
	ld a, [hli]
	cp $ff
	jr z, .draw_cards
	call RemoveCardFromHand
	call ReturnCardToDeck
	jr .loop_return_deck

.draw_cards
	call Func_2c0bd
	ld a, 7
	bank1call DisplayDrawNCardsScreen
	ld c, 7
.draw_loop
	call DrawCardFromDeck
	jr c, .done
	call AddCardToHand
	dec c
	jr nz, .draw_loop
.done
	ret

KakunaStiffenEffect:
	ldtx de, CFMill5Somebody
	call TossCoin_BankB
	jr nz, .OpponentMill5
	call YouMill5Effect
	ret

.OpponentMill5
	call SwapTurn
	ld a, 5
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
	call DealDamageToPlayAreaPokemon ; IDK why but this is needed for the anim to work even though it does nothing.
	call SwapTurn
	ret

YouMill5Effect:
	ld a, 5
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
	call DealDamageToPlayAreaPokemon ; IDK why but this is needed for the anim to work even though it does nothing.
	ret

KakunaPoisonPowder_AIEffect:
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

VenonatLeechLifeEffect:
	ld hl, wDealtDamage
	ld e, [hl]
	inc hl ; wDamageEffectiveness
	ld d, [hl]
	call ApplyAndAnimateHPRecovery
	ret

; During your next turn, double damage
SwordsDanceEffect:
	ld a, [wTempTurnDuelistCardID]
	cp MACHOKE
	ret nz
	ld a, SUBSTATUS1_NEXT_TURN_DOUBLE_DAMAGE
	call ApplySubstatus1ToDefendingCard
	ret

NightEyesEffect:
	ld a, [wTempTurnDuelistCardID]
	cp MISDREAVUS
	ret nz
	ld a, SUBSTATUS1_NEXT_TURN_DOUBLE_DAMAGE
	call ApplySubstatus1ToDefendingCard
	
	ret

; If heads, defending Pokemon becomes confused
ZubatSupersonicEffect:
	call Confusion50PercentEffect
	call nc, SetNoEffectFromStatus
	ret

ZubatLeechLifeEffect:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld d, a
	ld e, PLAY_AREA_ARENA

; go through every Pokemon in the Play Area, add 10 per injured mon.
.loop_play_area
; check its damage
	ld a, e
	ldh [hTempPlayAreaLocation_ff9d], a
	call GetCardDamageAndMaxHP
	or a
	jr z, .next_pkmn ; if no damage, skip Pokemon

; add to damage
	ld a, 10
	call AddToDamage

.next_pkmn
	inc e
	dec d
	jr nz, .loop_play_area
	ret

Twineedle_AIEffect:
	ld a, 40 / 2
	lb de, 0, 40
	jp SetExpectedAIDamage

Twineedle_MultiplierEffect:
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	add a ; a = 2 * heads
	call ATimes10
	call SetDefiniteDamage
	ret

CF10X2_AIEffect:
	ld a, 20 / 2
	lb de, 0, 20
	jp SetExpectedAIDamage

CF10X2_MultiplierEffect:
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	call ATimes10
	call SetDefiniteDamage
	ret

BeedrillPoisonSting_AIEffect:
	call ZubatLeechLifeEffect
	jp SetDefiniteAIDamage

ExeggcuteLeechSeedEffect:
	farcall TrampleEffect2
	farcall TrampleEffect3
	ret
	
BBTailsEffect:
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if got heads
	ld a, 10
	call DealRecoilDamageToSelf
	ld a, ATK_ANIM_THUNDER
	ld [wLoadedAttackAnimation], a
	ret

BBCoinFlipDecideEffect:
	ldtx de, BatteriesHaveLostTheirChargeText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret nc ; return if got tails
	call ParalysisEffect
	ret

FoulGas_AIEffect:
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage

; If heads, defending Pokemon becomes poisoned. If tails, defending Pokemon becomes confused
FoulGas_PoisonOrConfusionEffect:
	ldtx de, PoisonedIfHeadsConfusedIfTailsText
	call TossCoin_BankB
	jp c, PoisonEffect
	jp ConfusionEffect

MetapodStiffenEffect:
	ldtx de, IfHeadsNoDamageNextTurnText
	call TossCoin_BankB
	jp nc, SetWasUnsuccessful
	ld a, ATK_ANIM_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_NO_DAMAGE_STIFFEN
	call ApplySubstatus1ToDefendingCard
	ret

CurveAttackEffect:
	ldtx de, IfHeadsNoDamageNextTurnText
	call TossCoin_BankB
	ret nc
	ld a, ATK_ANIM_STRETCH_KICK
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_NO_DAMAGE_STIFFEN
	call ApplySubstatus1ToDefendingCard
	ret

SurroundEffect:
	ldtx de, SurroundText
	call TossCoin_BankB
	jp c, SleepEffect
	jp NewAcidEffect

Teleport_CheckBench:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, ThereAreNoPokemonOnBenchText
	cp 2
	ret

Teleport_PlayerSelectEffect:
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

Teleport_AISelectEffect:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	call Random
	ldh [hTemp_ffa0], a
	ret

Teleport_SwitchEffect:
	ldh a, [hTemp_ffa0]
	ld e, a
	call SwapArenaWithBenchPokemon
	xor a
	ld [wDuelDisplayedScreen], a
	ret


BatonPass_SelectionEffect:
	ldtx hl, DiscardOppDeckAsManyFireEnergyCardsText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInBench
	ld a, $01
	ld [wcbd4], a
.loop
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	jr z, .next

.next
	ldtx hl, ProcedureForEnergyTransferText
	bank1call DrawWholeScreenTextBox
	or a
	ret

BigEggsplosion_AIEffect:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	call SetDamageToATimes20
	ret

; Flip coins equal to attached energies; deal 20x number of heads
BigEggsplosion_MultiplierEffect:
	
	ld hl, 20 ;This is just for text purposes
	call LoadTxRam3
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx de, DamageCheckIfHeadsXDamageText
	call TossCoinATimes_BankB
;	fallthrough

; set damage to 20*a. Also return result in hl ; Altered to 30 in my hack
SetDamageToATimes20:
	ld l, a
	ld h, $00
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, hl
	add hl, hl
	ld a, l
	ld [wDamage], a
	ld a, h
	ld [wDamage + 1], a
	ret

Thrash_AIEffect:
	ld a, (30 + 40) / 2
	lb de, 30, 40
	jp SetExpectedAIDamage

; If heads 10 more damage; if tails, 10 damage to itself
Thrash_ModifierEffect:
	ld hl, 20
	call LoadTxRam3
	ldtx de, IfTailsDamageToYourselfTooText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret

Thrash_RecoilEffect:
	ld hl, 20
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if got heads
	ld a, 20
	call DealRecoilDamageToSelf
	ret

Toxic_AIEffect:
	ld a, 20
	lb de, 20, 20
	jp UpdateExpectedAIDamage

; Defending Pok??mon becomes double poisoned (takes 20 damage per turn rather than 10)
Toxic_DoublePoisonEffect:
	call DoublePoisonEffect
	ret

Deal10DamageToTargetPerEnergy_DamageEffect:
	ldh a, [hTempPlayAreaLocation_ffa1]
	cp $ff
	ret z
	call SwapTurn
	ld e, a
	call GetPlayAreaCardAttachedEnergies
	ld a, [wTotalAttachedEnergies]
	call ATimes10
	ld e, a
	ld d, 0
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, a
	call DealDamageToPlayAreaPokemon_SpecialAnim
	call SwapTurn
	ret

FlashingEyesEffect:
	farcall FlashingEyesEffect2
	ret

CrossAttack_AIEffect:
	ld a, (60 * 2) / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

CrossAttackEffect:
	ldtx de, CrossAttackEffectText
	call TossCoin_BankB
	jr c, .OneH
	jr nc, .OneT
	xor a
	ret
.OneH
	ldtx de, CrossAttackEffectText
	call TossCoin_BankB
	jr c, .TwoH
	jr nc, .OneHOneT
	xor a
	ret
.OneT
	ldtx de, CrossAttackEffectText
	call TossCoin_BankB
	jr c, .OneHOneT
	jr nc, .TwoT
	xor a
	ret
.OneHOneT
	ldtx de, CrossAttackEffectText
	call TossCoin_BankB
	jr c, .TwoHOneT
	jr nc, .OneHTwoT
	xor a
	ret
.TwoT
	ldtx de, CrossAttackEffectText
	call TossCoin_BankB
	jr c, .OneHTwoT
	call SwapTurn
	lb de, 0, 120
	call ApplyAndAnimateHPRecovery
	call SwapTurn
	ret
.TwoH
	ldtx de, CrossAttackEffectText
	call TossCoin_BankB
	jr nc, .TwoHOneT
	ld a, 60
	call SetDefiniteDamage
	ld a, ATK_ANIM_BIG_HIT
	ld [wLoadedAttackAnimation], a
	ret
.TwoHOneT
	call SwapTurn
	lb de, 0, 30
	call ApplyAndAnimateHPRecovery
	call SwapTurn
	ret
.OneHTwoT
	ld a, 40
	call SetDefiniteDamage
	ld a, ATK_ANIM_BIG_HIT
	ld [wLoadedAttackAnimation], a
	ret

AuroraWaveEffect:
	ldtx de, AuroraWaveText
	call TossCoin_BankB
	jr c, .heads1
	jr nc, .tails1
	xor a
	ret
.heads1
	ldtx de, AuroraWaveText
	call TossCoin_BankB
	jr c, .heads2
	call SleepEffect
	ld a, 30
	call SetDefiniteDamage
	ld a, ATK_ANIM_BEAM
	ld [wLoadedAttackAnimation], a
	ret

.tails1
	ldtx de, AuroraWaveText
	call TossCoin_BankB
	jr nc, .tails2
	call SleepEffect
	ld a, 30
	call SetDefiniteDamage
	ld a, ATK_ANIM_BEAM
	ld [wLoadedAttackAnimation], a
	ret

.heads2
	call ParalysisEffect
	ld a, 30
	call SetDefiniteDamage
	ld a, ATK_ANIM_BEAM
	ld [wLoadedAttackAnimation], a
	ret

.tails2
	ld a, 30
	call SetDefiniteDamage
	ld a, ATK_ANIM_BEAM
	ld [wLoadedAttackAnimation], a
	ret

AnyTargetEffect:
	farcall AnyTargetEffect2
	ret

AnyTargetAIEffect:
	farcall AnyTargetAIEffect2
	ret

DealDamageToTargetEffect:
	ldh a, [hTempPlayAreaLocation_ffa1]
	cp $ff
	ret z ; no target chosen
	call SwapTurn
	ld b, a
	ld de, 20
	call DealDamageToPlayAreaPokemon_SpecialAnim ; Special animation found below to make it look good.
	call SwapTurn
	ret

DealDamageToTargetEffect2:
	ldh a, [hTempPlayAreaLocation_ffa1]
	cp $ff
	ret z ; no target chosen
	call SwapTurn
	ld b, a
	ld de, 30
	call DealDamageToPlayAreaPokemon_SpecialAnim ; Special animation found below to make it look good.
	call SwapTurn
	ret

DealDamageToPlayAreaPokemon_SpecialAnim:
	ld a, ATK_ANIM_DRACO_METEOR ; Loads this animation for the proper selected pkmn, then jumps to normal damage calc.
	ld [wLoadedAttackAnimation], a
	jp DealDamageToPlayAreaPokemon

LessDamageifDFPDamagedEffect:
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	or a
	jr nz, .LessDamage
	call SwapTurn
	ret
	
.LessDamage
	call SwapTurn
	ld a, 20
	call SubtractFromDamage
	ret

LessDamageifDFPDamagedAIEffect:
	call LessDamageifDFPDamagedEffect
	jp SetDefiniteAIDamage

BoostDamageifLowHPAIEffect:
	ld a, 120 / 2
	lb de, 0, 120
	jp SetExpectedAIDamage

SpecialParalysisEffect:
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin_BankB
	jr c, .heads
	xor a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret
.heads
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	jr nz, .MoreThan21HP

	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	cp 21
	jr c, .LessThan21HP
	jr nc, .MoreThan21HP 
	ret

.LessThan21HP
	ld a, ATK_ANIM_DRILL
	ld [wLoadedAttackAnimation], a
	ld a, 120
	call SetDefiniteDamage
	ret

.MoreThan21HP
	ld a, ATK_ANIM_DRILL
	ld [wLoadedAttackAnimation], a
	ld a, 60
	call SetDefiniteDamage
	ret

SLPHealEffect:
	lb de, 0, 10 ; heal 10 damage
	call ApplyAndAnimateHPRecovery
	call SwapTurn
	call SleepEffect ; cause self sleep
	call SwapTurn
	ret

Tumble_AIEffect:
	ld a, 30
	lb de, 0, 300
	jp SetExpectedAIDamage

Tumble_MultiplierEffect:
	xor a
	ldh [hTemp_ffa0], a
.loop_coin_toss
	ldtx de, TumbleText
	xor a
	call TossCoinATimes_BankB
	jr nc, .tails
	ld hl, hTemp_ffa0
	inc [hl] ; increase heads count
	jr .loop_coin_toss

.tails
; store resulting damage
	ldh a, [hTemp_ffa0]
	ld l, a
	ld h, 30
	call HtimesL
	ld de, wDamage
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	ret

BoyfriendsEffect:
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	ld c, PLAY_AREA_ARENA
.loop
	ld a, [hl]
	cp $ff
	jr z, .done
	call GetCardIDFromDeckIndex
	ld a, e
	cp BELLOSSOM
	jr nz, .next
	ld a, d
	cp $00 ; why check d? Card IDs are only 1 byte long
	jr nz, .next
	inc c
.next
	inc hl
	jr .loop
.done
; c holds number of Nidoking found in Play Area ; it's now bellossom
	ld a, c
	add a
	add c
	call ATimes10
	call SetDefiniteDamage ; adds 2 * 10 * c
	ret

BoyfriendsAIEffect:
	call BoyfriendsEffect
	call SetDefiniteAIDamage
	ret 

FlockAIEffect:
	ld a, 40 / 2
	lb de, 0, 40
	jp SetExpectedAIDamage

FlockEffect:
	farcall FlockEffect2
	ret

SweetNectarSelectionEffect:
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
	ld c, 120
	cp 120
	jr nc, .skip_cap
	ld c, a
.skip_cap
	ld a, c
	ldh [hTempPlayAreaLocation_ffa1], a
	or a
	ret

NidoranFFurySwipes_AIEffect:
	ld a, 30 / 2
	lb de, 0, 30
	jp SetExpectedAIDamage

NidoranFFurySwipes_MultiplierEffect:
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 3
	call TossCoinATimes_BankB
	call ATimes10
	call SetDefiniteDamage
	ret
PsyDamage_MultiplierEffect:
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 3
	call TossCoinATimes_BankB
	call ATimes10
	call SetDefiniteDamage
	ld hl, wDamage + 1
	set UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, [hl]
	ret

NidoranFCallForFamily_CheckDeckAndPlayArea:
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

NidoranFCallForFamily_PlayerSelectEffect: ; Self trainer lock test
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS3
	call GetTurnDuelistVariable
	set SUBSTATUS3_HEADACHE, [hl]
	ret

MurkrowCallForFamily_CheckDeckAndPlayArea:
	farcall MurkrowCallForFamily_CheckDeckAndPlayArea2
	ret

MurkrowCallForFamily_PlayerSelectEffect:
	farcall MurkrowCallForFamily_PlayerSelectEffect2
	ret

MurkrowCallForFamily_AISelectEffect:
	farcall MurkrowCallForFamily_AISelectEffect2
	ret

MurkrowCallForFamily_PutInPlayAreaEffect:
	farcall MurkrowCallForFamily_PutInPlayAreaEffect2
	ret

HornHazard_AIEffect:
	ld a, 90 / 2
	lb de, 0, 90
	jp SetExpectedAIDamage

HornHazard_NoDamage50PercentEffect:
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin_BankB
	jr c, .heads
	xor a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret
.heads
	ld a, ATK_ANIM_DIVE_BOMB
	ld [wLoadedAttackAnimation], a
	ret

GiantWave_AIEffect:
	ld a, 40 / 2
	lb de, 0, 40
	jp SetExpectedAIDamage

GiantWave_NoDamage50PercentEffect:
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin_BankB
	jr c, .heads
	xor a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret
.heads
	ld a, ATK_ANIM_WATER_JETS
	ld [wLoadedAttackAnimation], a
	ret

MilkDrinkEffect:
	ldtx de, MilkDrinkText
	call TossCoin_BankB
	jr c, .OneH
	jr nc, .OneT
	xor a
	ret

.OneH
	ldtx de, MilkDrinkText
	call TossCoin_BankB
	jr nc, .OneHOneT
	xor a
	lb de, 0, 40
	call ApplyAndAnimateHPRecovery
	ret

.OneT
	ldtx de, MilkDrinkText
	call TossCoin_BankB
	jr c, .OneHOneT
	xor a
	call SetWasUnsuccessful
	ret

.OneHOneT
	lb de, 0, 20
	call ApplyAndAnimateHPRecovery
	ret
	
SmashPunchEffect:
	farcall SmashPunchEffect2
	ret

SmashPunchAIEffect:
	ld a, 30 / 2
	lb de, 0, 30
	jp SetExpectedAIDamage

MagmarSmog_AIEffect:
	ld a, 60 / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

GiantTail_AIEffect:
	ld a, 100 / 2
	lb de, 0, 100
	jp SetExpectedAIDamage
	
PP_AIEffect:
	ld a, 20 / 2
	lb de, 0, 20
	jp SetExpectedAIDamage
	ret

PP_NoDamage50PercentEffect:
	farcall PP_NoDamage50PercentEffect2
	ret

NidorinaSupersonicEffect:
	call Confusion50PercentEffect
	call nc, SetNoEffectFromStatus
	ret

NidorinaDoubleKick_AIEffect:
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage

NidorinaDoubleKick_MultiplierEffect:
	ldtx de, UnableToRetreatDueToAcidText
	call TossCoin_BankB
	jp c, ParalysisEffect
	jp ConfusionEffect

ConfusionOrSleepEffect:
	ldtx de, UnusedText008e
	call TossCoin_BankB
	jp c, ConfusionEffect
	jp SleepEffect

MoreDamageAndNoRetreatEffect:
	farcall MoreDamageAndNoRetreatEffect2
	ret

MoreDamageAndNoRetreatAIEffect:
	ld a, (20 + 10) / 2
	lb de, 20, 30
	jp SetExpectedAIDamage

MoreDamageAndCFNEffect:
	farcall MoreDamageAndCFNEffect2
	ret

PerishSongCheckEffect:
	farcall PerishSongCheckEffect2
	ret

PerishSongDamageEffect:
	ld a, 240
	call SetDefiniteDamage
	ret

PerishSongAIEffect:
	lb de, 240, 240
	jp SetExpectedAIDamage

NidorinoDoubleKick_AIEffect:
	call NidorinoDoubleKick_MultiplierEffect
	jp SetExpectedAIDamage

NidorinoDoubleKick_MultiplierEffect:
	call GetEnergyAttachedMultiplierDamage
	ld hl, wDamage
	ld [hl], e
	inc hl
	ld [hl], d
	call SwapTurn
	call GetEnergyAttachedMultiplierDamage
	ld hl, wDamage
	ld a, e
	add [hl]
	ld [hli], a
	ld a, d
	adc [hl]
	ld [hl], a
	call SwapTurn
	ret

ButterfreeMegaDrainEffect:
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardRetreatCost
	call SwapTurn
	call ATimes10
	call AddToDamage
	ret

WeedlePoisonSting_AIEffect:
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

IvysaurPoisonPowder_AIEffect:
	ld a, 10
	lb de, 10, 10
	jp UpdateExpectedAIDamage_AccountForPoison

BulbasaurLeechSeedEffect:
	ld hl, wDealtDamage
	ld a, [hli]
	or [hl]
	ret z ; return if no damage dealt
	lb de, 0, 10
	call ApplyAndAnimateHPRecovery
	ret

GrimerMinimizeEffect:
	ld a, SUBSTATUS1_REDUCE_BY_20
	call ApplySubstatus1ToDefendingCard
	ret

ToxicGasEffect:
	scf
	ret

NewAcidEffect:
	ld a, SUBSTATUS2_UNABLE_RETREAT
	call ApplySubstatus2ToDefendingCard
	ret

NewAcidCFEffect:
	ldtx de, NoRetreatCFCheckText
	call TossCoin_BankB
	jr c, .heads
	xor a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret

.heads
	ld a, ATK_ANIM_WEB
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS2_UNABLE_RETREAT
	call ApplySubstatus2ToDefendingCard
	ret

PoisonAcidEffect:
	ld a, SUBSTATUS2_UNABLE_RETREAT
	call ApplySubstatus2ToDefendingCard
	call PoisonEffect
	ret

; returns carry if no cards in Deck
; or if Play Area is full already.
BellsproutCallForFamily_CheckDeckAndPlayArea:
	ldtx de, IfHeadsDoNotReceiveDamageOrEffectText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, ATK_ANIM_STONE_BARRAGE
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_AGILITY
	call ApplySubstatus1ToDefendingCard
	ret

BellsproutCallForFamily_PlayerSelectEffect:
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if got heads
	call ParalysisEffect
	ret

BellsproutCallForFamily_AISelectEffect:
	ld a, (40 + 60) / 2
	lb de, 40, 60
	jp SetExpectedAIDamage

BellsproutCallForFamily_PutInPlayAreaEffect:
	ldtx de, BatteriesHaveLostTheirChargeText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret nc ; return if got tails
	ld a, 20
	call AddToDamage
	ld a, ATK_ANIM_THUNDER
	ld [wLoadedAttackAnimation], a
	ret

WeezingSmog_AIEffect:
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage_AccountForPoison

WeezingSelfdestructEffect:
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

Recoil30ToSelfEffect:
	ld a, 30
	call DealRecoilDamageToSelf
	ret

SweetScentCFHealEffect:
	ldtx de, TrainerCardSuccessCheckText
	call TossCoin_BankB
	jr c, .heads
	xor a
	jp HealOpponentFor20
	ret
.heads
	
	ldh a, [hTemp_ffa0]
	ldh [hTempPlayAreaLocation_ff9d], a
	ldh a, [hTempPlayAreaLocation_ffa1]
	call HealPlayAreaCardHP
	ret

HealOpponentFor20:
	call SwapTurn
	lb de, 0, 20
	call ApplyAndAnimateHPRecovery
	call SwapTurn
	ret

StrangeScent_PlayerSelection:
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

StrangeScentCFHealEffect:
	ldtx de, TrainerCardSuccessCheckText
	call TossCoin_BankB
	jr c, .heads
	xor a
	jp HealOpponentFor30
	ret
.heads
	
	ldh a, [hTemp_ffa0]
	ldh [hTempPlayAreaLocation_ff9d], a
	ldh a, [hTempPlayAreaLocation_ffa1]
	call HealPlayAreaCardHP
	ret

HealOpponentFor30:
	call SwapTurn
	lb de, 0, 30
	call ApplyAndAnimateHPRecovery
	call SwapTurn
	ret

VenomPowder_AIEffect:
	ld a, 5
	lb de, 0, 10
	jp UpdateExpectedAIDamage

VenomPowder_PoisonConfusion50PercentEffect:
	ldtx de, VenomPowderCheckText
	call TossCoin_BankB
	ret nc ; return if tails

; heads
	call PoisonEffect
	call ParalysisEffect
	ret c
	ld a, POISONED | PARALYZED
	ld [wNoEffectFromWhichStatus], a
	ret

JetStreamCheck:
	call SwapTurn
	xor a ; PLAY_AREA_ARENA
	call CreateArenaOrBenchEnergyCardList
	call SwapTurn
	jr z, .no_energy
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
.no_energy
	ldtx hl, NoEnergyAttachedToOpponentsActiveText
	ret

Heal_OncePerTurnCheck:
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

Heal_RemoveDamageEffect:
	ldtx de, PoisonCheckText
	call TossCoin_BankB
	ldh [hAIPkmnPowerEffectParam], a
	jr nc, .done
.done
; flag Pkmn Power as being used regardless of coin outcome
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ldh a, [hAIPkmnPowerEffectParam]
	or a
	ret z ; return if coin was tails
	call PoisonEffect
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	ld a, ATK_ANIM_PKMN_POWER_2
	ld [wLoadedAttackAnimation], a
	bank1call PlayAttackAnimation
	bank1call PlayStatusConditionQueueAnimations
	bank1call WaitAttackAnimation
	bank1call ApplyStatusConditionQueue
	bank1call DrawDuelHUDs
	bank1call PrintFailedEffectText
	call c, WaitForWideTextBoxInput
	ret

PetalDance_AIEffect:
	ld a, 90 / 2
	lb de, 0, 90
	jp SetExpectedAIDamage

PetalDance_MultiplierEffect:
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
	call SwapTurn
	call ConfusionEffect
	call SwapTurn
	ret

DriveOffCheck:
	ldh a, [hTempPlayAreaLocation_ff9d]
	or a
	jr nz, .not_arcanine
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call GetCardIDFromDeckIndex
	ld a, e
	cp ARCANINE
	jr nz, .not_arcanine
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret c
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	and USED_PKMN_POWER_THIS_TURN
	jr nz, .already_used
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret

.not_arcanine
	ldtx hl, ArcNoActiveText
	scf
	ret

.already_used
	ldtx hl, OnlyOncePerTurnText
	scf
	ret


DriveOffSetFlag:
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	ld a, ATK_ANIM_DRIVE_OFF
	ld [wLoadedAttackAnimation], a
	bank1call PlayAttackAnimation
	bank1call PlayStatusConditionQueueAnimations
	bank1call WaitAttackAnimation
	bank1call ApplyStatusConditionQueue
	bank1call DrawDuelHUDs
	bank1call PrintFailedEffectText
	call c, WaitForWideTextBoxInput
	ldh a, [hTempPlayAreaLocation_ffa1]
	jp HandleSwitchDefendingPokemonEffect

ShockWaveSelectEffect:
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
	ret

ShockwaveEffect:
	ldtx de, ShockwaveText
	call TossCoin_BankB
	jr c, .heads
	xor a
	call SetDefiniteDamage
	ret
.heads
	call SwapTurn
	xor a
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	ldh a, [hTemp_ffa0]
	call HandleSwitchDefendingPokemonEffect
	ret

SolarPower_CheckUse:
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

SolarPower_RemoveStatusEffect:
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

; applies the damage bonus for attacks that get bonus
; from extra Water energy cards.
; this bonus is always 10 more damage for each extra Water energy
; and is always capped at a maximum of 20 damage.
; input:
;	b = number of Water energy cards needed for paying Energy Cost
;	c = number of colorless energy cards needed for paying Energy Cost
ApplyExtraWaterEnergyDamageBonus:
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

OmastarWaterGunEffect:
	lb bc, 1, 1
	jr ApplyExtraWaterEnergyDamageBonus

OmastarSpikeCannon_AIEffect:
	ld a, 60 / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

OmastarSpikeCannon_MultiplierEffect:
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

ClairvoyanceEffect:
	scf
	ret

OmanyteWaterGunEffect:
	lb bc, 1, 0
	jp ApplyExtraWaterEnergyDamageBonus

WartortleWithdrawEffect:
	call LoadTxRam3
	ldtx de, BubbleShowerText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	jr c, .heads
	jr nc, .tails
.heads 
	call ParalysisEffect
	ret

.tails
	ret

BubbleShowerBenchEffect:
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	jp z, .noeffect
	jp MagnetonLv28SelfdestructEffect
.noeffect
	ret

RainDanceEffect:
	scf
	ret

HydroPumpEffect:
	lb bc, 3, 0
	jp ApplyExtraWaterEnergyDamageBonus

KinglerFlail_AIEffect:
	call KinglerFlail_HPCheck
	jp SetDefiniteAIDamage

KinglerFlail_HPCheck:
	; opponent's bench
	call SwapTurn
	xor a
	ld [wIsDamageToSelf], a
	ld a, 120
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	call PoisonEffect
	ret

MagikarpFlail_AIEffect:
	call MagikarpFlail_HPCheck
	jp SetDefiniteAIDamage

MagikarpFlail_HPCheck:
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call SetDefiniteDamage
	ret

HeadacheEffect:
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS3
	call GetNonTurnDuelistVariable
	set SUBSTATUS3_HEADACHE, [hl]
	ret

HeadacheCFEffect:
	ldtx de, IfHNoTrainersText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS3
	call GetNonTurnDuelistVariable
	set SUBSTATUS3_HEADACHE, [hl]
	ret

WaterSlashEffect:
	ld hl, wDamage + 1
	set UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, [hl]
	lb bc, 2, 2
	jp ImakuniEffect
	ret

WwaterSlashAIEffect:
	ld hl, wDamage + 1
	set UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, [hl]
	jp ImakuniEffect
	ret

PsyduckFurySwipes_MultiplierEffect:
	ldtx de, Do10MorePerWText
	call TossCoin_BankB
	ret nc ; return if tails
	jp SeadraWaterGunEffect
	ret

SeadraWaterGunEffect:
	lb bc, 0, 0
	jp ImakuniEffect

FloodlightCheckEffect:
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	jr nz, .NoBoost
	jp FloodlightEffect
.NoBoost
	ret

FloodlightEffect:
	lb bc, 0, 2
	jp ImakuniEffect

SeadraAgilityEffect:
	ldtx de, IfHeadsDoNotReceiveDamageOrEffectText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, ATK_ANIM_STONE_BARRAGE
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_AGILITY
	call ApplySubstatus1ToDefendingCard
	ret

ShellderSupersonicEffect:
	; can only use attack if it was never used before this duel
	ld a, DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	and USED_LEEK_SLAP_THIS_DUEL
	ret z
	ldtx hl, ThisAttackCannotBeUsedTwiceText
	scf
	ret

HideInShellEffect:
	ld a, DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_LEEK_SLAP_THIS_DUEL_F, [hl]
	ret

VaporeonWaterGunEffect:
	lb bc, 2, 1
	jp ApplyExtraWaterEnergyDamageBonus

FossilEggSearch_CheckDeckAndPlayArea:
	farcall FossilEggSearch_CheckDeckAndPlayArea2
	ret

FossilEggSearch_PutInPlayAreaEffect:
	farcall FossilEggSearch_PutInPlayAreaEffect2
	ret

FossilEggSearch_PlayerSelectEffect:
	farcall FossilEggSearch_PlayerSelectEffect2
	ret

FossilEggSearch_AISelectEffect:
	farcall FossilEggSearch_AISelectEffect2
	ret

SearchGyaradosPlayerSelectEffect:
	farcall SearchGyaradosEffect
	ret

SearchGyaradosAISelectEffect:
	farcall SearchGyaradosAIEffect
	ret

; returns carry if Arena card has no Water Energy attached
; or if it doesn't have any damage counters.
StarmieRecover_CheckEnergyHP:
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

StarmieRecover_PlayerSelectEffect:
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

StarmieRecover_AISelectEffect:
	ld a, TYPE_ENERGY_WATER
	call CreateListOfEnergyAttachedToArena
	ld a, [wDuelTempList] ; pick first card
	ldh [hTemp_ffa0], a
	ret

StarmieRecover_DiscardEffect:
	ldh a, [hTemp_ffa0]
	call PutCardInDiscardPile
	ret

StarmieRecover_HealEffect:
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	ld e, a ; all damage for recovery
	ld d, 0
	call ApplyAndAnimateHPRecovery
	ret

; returns carry if Defending Pokemon has no attacks
PoliwhirlAmnesia_CheckAttacks:
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

PoliwhirlAmnesia_PlayerSelectEffect:
	call PlayerPickAttackForAmnesia
	ret

PoliwhirlAmnesia_AISelectEffect:
	call AIPickAttackForAmnesia
	ldh [hTemp_ffa0], a
	ret

PoliwhirlAmnesia_DisableEffect:
	call ApplyAmnesiaToAttack
	ret

PlayerPickAttackForAmnesia:
	ldtx hl, ChooseAttackOpponentWillNotBeAbleToUseText
	call DrawWideTextBox_WaitForInput
	call HandleDefendingPokemonAttackSelection
	ld a, e
	ldh [hTemp_ffa0], a
	ret

; applies the Amnesia effect on the defending Pokemon,
; for the attack index in hTemp_ffa0.
ApplyAmnesiaToAttack:
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

Whirlpool_PlayerSelectEffect:
	ldtx de, IfHDiscardEnergyText
	call TossCoin_BankB
	ret nc
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

Whirlpool_AISelectEffect:
	ldtx de, IfHDiscardEnergyText
	call TossCoin_BankB
	ret nc
	call AIPickEnergyCardToDiscardFromDefendingPokemon
	ldh [hTemp_ffa0], a
	ret

Whirlpool_DiscardEffect:
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

Jetstream_PlayerSelectEffect:
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ldh a, [hAIPkmnPowerEffectParam]
	or a
	ldtx de, IfHDiscardEnergyText
	call TossCoin_BankB
	ret nc
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

ClampEffect: 
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardRetreatCost
	call SwapTurn
	call ATimes10
	call SetDefiniteDamage
	ret 

Blizzard_BenchDamage50PercentEffect:
	ldtx de, DamageToOppBenchIfHeadsDamageToYoursIfTailsText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a ; store coin result
	ret

Blizzard_BenchDamageEffect:
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

; return carry if can't use Cowardice
Cowardice_Check:
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

Cowardice_PlayerSelectEffect:
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

Cowardice_RemoveFromPlayAreaEffect:
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable

; put card in Discard Pile temporarily, so that
; all cards attached are discarded as well.
	push af
	ldh a, [hTemp_ffa0]
	ld e, a
	call MovePlayAreaCardToDiscardPile
	ldh a, [hTemp_ffa0]
	or a
	jr nz, .skip_switch
	ldh a, [hAIPkmnPowerEffectParam]
	ld e, a
	call SwapArenaWithBenchPokemon

.skip_switch
	pop af
	call MoveDiscardPileCardToHand
	call ReturnCardToDeck
	call ShiftAllPokemonToFirstPlayAreaSlots
	xor a
	call Func_2c0bd
	ld [wDuelDisplayedScreen], a
	ret

Quickfreeze_InitialEffect:
	scf
	ret

Quickfreeze_Paralysis50PercentEffect:
	ldtx de, ParalysisCheckText
	call TossCoin_BankB
	jr c, .heads

; tails
	call SetWasUnsuccessful
	bank1call DrawDuelMainScene
	bank1call PrintFailedEffectText
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
	bank1call PlayStatusConditionQueueAnimations
	bank1call WaitAttackAnimation
	bank1call ApplyStatusConditionQueue
	bank1call DrawDuelHUDs
	bank1call PrintFailedEffectText
	call c, WaitForWideTextBoxInput
	ret

FocusEnergyEffect:
	ret

PlayerPickFireEnergyCardToDiscard:
	call CreateListOfFireEnergyAttachedToArena
	xor a
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempList], a
	ret

PlayerPickLEnergyCardToReturn:
	farcall PlayerPickLEnergyCardToReturn2
	ret

AIPickFireEnergyCardToDiscard:
	call CreateListOfFireEnergyAttachedToArena
	ld a, [wDuelTempList]
	ldh [hTempList], a ; pick first in list
	ret

; returns carry if Arena card has no Fire Energy cards
ArcanineFlamethrower_CheckEnergy:
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wAttachedEnergies]
	ldtx hl, NotEnoughFireEnergyText
	cp 1
	ret

ArcanineFlamethrower_PlayerSelectEffect:
	call PlayerPickFireEnergyCardToDiscard
	ret

ArcanineFlamethrower_AISelectEffect:
	call AIPickFireEnergyCardToDiscard
	ret

ArcanineFlamethrower_DiscardEffect:
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

Magcargo_PlayerSelectEffect:
	bank1call DrawDuelMainScene
	ldtx hl, YesOrNoTextCLText
	call TwoItemHorizontalMenu
	ldh a, [hKeysHeld]
	and B_BUTTON
	ldh a, [hCurMenuItem]
	ldh [hTempList], a ; store selection in first position in list
	or a
	jr z, .Yes
	ret
.Yes
	farcall PlayerPickFightingEnergyCardToDiscard
	ret

Magcargo_AISelectEffect:
	farcall AIPickFightingEnergyCardToDiscard
	ret

Magcargo_DiscardEffect:
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ld a, 20
	call AddToDamage
	ret

TakeDownEffect: ; 2d37f (b:537f)
	ldtx de, IfT30RecoilText
	call TossCoin_BankB
	ret c
	ld a, 30
	call DealRecoilDamageToSelf
	ret

ArcanineQuickAttack_AIEffect: ; 2d385 (b:5385)
	ld a, (30 + 20) / 2
	lb de, 30, 50
	jp SetExpectedAIDamage

ArcanineQuickAttack_DamageBoostEffect:
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, 20
	call AddToDamage
	ret

; return carry if has less than 2 Fire Energy cards
FlamesOfRage_CheckEnergy:
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ldtx hl, NotEnoughFireEnergyText
	ld a, [wAttachedEnergies]
	cp 1
	ret

FlamesOfRage_PlayerSelectEffect:
	call PlayerPickFireEnergyCardToDiscard
	ret

FlamesOfRage_AISelectEffect:
	call AIPickFireEnergyCardToDiscard
	ret

FlamesOfRage_DiscardEffect:
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

FlamesOfRage_AIEffect:
	call FlamesOfRage_DamageBoostEffect
	jp SetDefiniteAIDamage

FlamesOfRage_DamageBoostEffect:
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call AddToDamage
	ret

Prevent30PlusDamageEffect:
	ld a,SUBSTATUS1_NO_DAMAGE_11
	call ApplySubstatus1ToDefendingCard
	ret

; returns carry if Opponent has no Pokemon in bench
NinetalesLure_CheckBench:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

NinetalesLure_PlayerSelectEffect:
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

NinetalesLure_AISelectEffect:
	call GetBenchPokemonWithLowestHP
	ldh [hTemp_ffa0], a
	ret

NinetalesLure_SwitchEffect:
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
FireBlast_CheckEnergy:
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ldtx hl, NotEnoughFireEnergyText
	ld a, [wAttachedEnergies]
	cp 1
	ret

FireBlast_PlayerSelectEffect:
	call PlayerPickFireEnergyCardToDiscard
	ret

FireBlast_AISelectEffect:
	call AIPickFireEnergyCardToDiscard
	ret

FireBlast_DiscardEffect:
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

; return carry if no Fire energy cards
Ember_CheckEnergy:
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ldtx hl, NotEnoughFireEnergyText
	ld a, [wAttachedEnergies]
	cp 1
	ret

Ember_PlayerSelectEffect:
	call PlayerPickFireEnergyCardToDiscard
	ret

Ember_AISelectEffect:
	call AIPickFireEnergyCardToDiscard
	ret

Ember_DiscardEffect:
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

LSelectEffect:
	call PlayerPickLEnergyCardToReturn
	ret

LAISelectEffect:
	farcall CreateListOfElectricEnergyAttachedToArena
	ld a, [wDuelTempList]
	ldh [hTempList], a ; pick first in list
	ret

Discard_ReturnEnergyEffect:
	ldh a, [hTempList]
	call AddCardToHand
	ret

; return carry if no Fire energy cards
Wildfire_CheckEnergy:
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ldtx hl, NotEnoughFireEnergyText
	ld a, [wAttachedEnergies]
	cp 1
	ret

Wildfire_PlayerSelectEffect:
	ldtx hl, IfHeadsHealIsSuccessfulText
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

Wildfire_AISelectEffect:
; AI always chooses 1 card to discard
	ld a, 1
	ldh [hTempList], a
	ret

Wildfire_DiscardEnergyEffect:
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

Wildfire_DiscardDeckEffect:
	ld hl, 40 ;This is just for text purposes
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	ldtx de, DamageCheckIfHeadsXDamageText
	call TossCoinATimes_BankB
	add a
	add a
	call ATimes10
	call SetDefiniteDamage
	ret

Wildfire_AIEffect:
	ld a, 40 / 2
	lb de, 0, 40
	jp SetExpectedAIDamage

BurningFlameEffect:
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
	ld a, 20
	call AddToDamage
.check_remaining
	dec c
	jr nz, .loop
	ret

BurningFlameAIEffect:
	ld a, 50
	lb de, 50, 50
	jp SetExpectedAIDamage

MoltresLv35DiveBomb_AIEffect:
	ld a, 80 / 2
	lb de, 0, 80
	jp SetExpectedAIDamage

MoltresLv35DiveBomb_Success50PercentEffect:
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

MagmarSmokescreenEffect:
	ld a, SUBSTATUS2_SMOKESCREEN
	call ApplySubstatus2ToDefendingCard
	ret

; return carry if no Fire Energy attached
CharmeleonFlamethrower_CheckEnergy:
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ldtx hl, NotEnoughFireEnergyText
	ld a, [wAttachedEnergies]
	cp 1
	ret

CharmeleonFlamethrower_DiscardEffect:
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret

EnergyBurnEffect:
	scf
	ret

SuctionCupsEffect:
	scf
	ret

; return carry if has less than 2 Fire Energy cards
FireSpin_CheckEnergy:
	xor a ; PLAY_AREA_ARENA
	call CreateArenaOrBenchEnergyCardList
	call CountCardsInDuelTempList
	ldtx hl, NotEnoughEnergyCardsText
	cp 3
	ret

FireSpin_PlayerSelectEffect:
	ldtx hl, ChooseAndDiscard2EnergyCardsText
	call DrawWideTextBox_WaitForInput

	xor a
	ldh [hCurSelectionItem], a
	xor a
	call CreateArenaOrBenchEnergyCardList
	call SortCardsInDuelTempListByID
	xor a
	bank1call DisplayEnergyDiscardScreen

	ld a, 3
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
	cp 3
	jr nc, .done
	ldh a, [hTempCardIndex_ff98]
	call RemoveCardFromDuelTempList
	bank1call DisplayEnergyDiscardMenu
	jr .loop_input
.done
; return when 3 have been chosen
	or a
	ret

FireSpin_AISelectEffect:
	xor a ; PLAY_AREA_ARENA
	call CreateArenaOrBenchEnergyCardList
	ld hl, wDuelTempList
	ld a, [hli]
	ldh [hTempList], a
	ld a, [hl]
	ldh [hTempList + 1], a
	ret

FireSpin_DiscardEffect:
	ld hl, hTempList
	ld a, [hli]
	call PutCardInDiscardPile
	ld a, [hli]
	call PutCardInDiscardPile
	ret
	
FireSpinReal_CheckEnergy:
	xor a ; PLAY_AREA_ARENA
	call CreateArenaOrBenchEnergyCardList
	call CountCardsInDuelTempList
	ldtx hl, NotEnoughEnergyCardsText
	cp 2
	ret

FireSpinReal_PlayerSelectEffect:
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

FireSpinReal_DiscardEffect:
	ld hl, hTempList
	ld a, [hli]
	call PutCardInDiscardPile
	ld a, [hli]
	call PutCardInDiscardPile
	ret

FireSpinReal_AISelectEffect:
	xor a ; PLAY_AREA_ARENA
	call CreateArenaOrBenchEnergyCardList
	ld hl, wDuelTempList
	ld a, [hli]
	ldh [hTempList], a
	ld a, [hl]
	ldh [hTempList + 1], a
	ret
	
DancingEmbers_AIEffect:
	ld a, 90 / 2
	lb de, 0, 90
	jp SetExpectedAIDamage

DancingEmbers_MultiplierEffect:
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 9
	call TossCoinATimes_BankB
	call ATimes10
	call SetDefiniteDamage
	ret

Firegiver_InitialEffect:
	scf
	ret

Firegiver_AddToHandEffect:
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
	ld a, c

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
	lb bc, PLAY_AREA_ARENA, $0
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
	pop bc
	pop hl

; load Fire Energy card index and add to hand
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

; output in de the number of energy cards
; attached to the Defending Pokemon times 10.
; used for attacks that deal 10x number of energy
; cards attached to the Defending card.
GetEnergyAttachedMultiplierDamage:
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

HealingWaterEffect:
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

	ld c, a ; store damage taken
	push bc
	ld a, TYPE_ENERGY_WATER
	call CreateListOfEnergyAttachedToArena
	
	pop bc
	or a
	ret z
	call ATimes10
	cp c
	jr c, .skip_cap
	ld a, c

.skip_cap
	ldh [hTempPlayAreaLocation_ffa1], a
	or a
	ret

; draws list of Energy Cards in Discard Pile
; for Player to select from.
; the Player can select up to 2 cards from the list.
; these cards are given in $ff-terminated list
; in hTempList.
HandleTwoEnergyCardsInDiscardPileSelection:
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

HandleFiveEnergyCardsInDiscardPileSelection:
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
	ld a, 5
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
	cp 5
	jr c, .loop ; already selected 2 cards?

.finish
; place terminating byte on list
	call GetNextPositionInTempList
	ld [hl], $ff
	or a
	ret



HandleOneEnergyCardInDiscardPileSelection:
	push hl
	xor a
	ldh [hCurSelectionItem], a
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	and FIRE
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
; but can select up to 1 cards total.
; prompt Player to confirm exiting screen.
	ld a, 1
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
	cp 1
	jr c, .loop ; already selected 1 cards?

.finish
; place terminating byte on list
	call GetNextPositionInTempList
	ld [hl], $ff
	or a
	ret

; returns carry if Pkmn Power cannot be used, and
; sets the correct text in hl for failure.
Curse_CheckDamageAndBench:
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

Curse_PlayerSelectEffect:
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

Curse_TransferDamageEffect:
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

GengarDarkMind_PlayerSelectEffect:
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

GengarDarkMind_AISelectEffect:
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

GengarDarkMind_DamageBenchEffect:
	ldh a, [hTemp_ffa0]
	cp $ff
	ret z ; no target chosen
	call SwapTurn
	ld b, a
	ld de, 10
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

FireWindDamageEffect:
	
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	
	ld d, a

	ldh a, [hTemp_ffa0]
	cp $ff
	ret z ; no target chosen
	call SwapTurn
	ld b, a
	ld a, d
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

OverrunDamageEffect:
	ldh a, [hTemp_ffa0]
	cp $ff
	ret z ; no target chosen
	ldtx de, TrainerCardSuccessCheckText
	call Func_2c08a
	jr nc, .tails
	call SwapTurn
	ld b, a
	ld de, 10
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret
.tails
	ret

SleepingGasEffect:
	call Sleep50PercentEffect
	call nc, SetNoEffectFromStatus
	ret

EnergyConversion_CheckEnergy:
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	ldtx hl, ThereAreNoEnergyCardsInDiscardPileText
	ret

EnergyConversion_PlayerSelectEffect:
	ldtx hl, Choose2EnergyCardsFromDiscardPileForHandText
	call HandleTwoEnergyCardsInDiscardPileSelection
	ret

EnergyConversion_AISelectEffect:
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

EnergyConversion_AddToHandEffect:

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

DreamEaterEffect:
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

TransparencyEffect:
	scf
	ret

DreamEaterAIEffect:
	ld a, (30 + 20) / 2
	lb de, 30, 50
	jp SetExpectedAIDamage

Do20MoreIfStatusedAIEffect:
	ld a, (10 + 20) / 2
	lb de, 10, 30
	jp SetExpectedAIDamage

PlayerYesOrNoSelectionRaichu1Effect:
	bank1call DrawDuelMainScene
	ldtx hl, YesOrNoTextNEOtext
	call TwoItemHorizontalMenu
	ldh a, [hKeysHeld]
	and B_BUTTON
	ldh a, [hCurMenuItem]
	jr nz, PlayerYesOrNoSelectionRaichu1Effect ; loop back if nothing selected
	ldh a, [hCurMenuItem]
	ldh [hTemp_ffa0], a
	ret

RaichuLS_DamageEffect:
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; = no selected
	call DiscardAllLEffect ; otherwise yes selected
	ld a, 80
	jp SetDefiniteDamage

RaichuLS_AISelectEffect:
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetNonTurnDuelistVariable ; checks enemy active pkmn
	cp 41
	jr c, .LessThan41HP
	jr nc, .MoreThan41HP 

.LessThan41HP
	ld a, 1 ; =no
	ldh [hTemp_ffa0], a
	ret

.MoreThan41HP
	ld a, 0 ; =yes
	ldh [hTemp_ffa0], a
	ret

RaichuLS_AIEffect:
	ld a, 40
	lb de, 40, 80
	jp SetExpectedAIDamage

AiRandomDecideEffectExample:
	ld a, 2
	call Random
	ldh [hTemp_ffa0], a
	ret
	
; returns carry if neither the Turn Duelist or
; the non-Turn Duelist have any deck cards.
Prophecy_CheckDeck:
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

Prophecy_PlayerSelectEffect:
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

Prophecy_AISelectEffect:
; AI doesn't ever choose this attack
; so this it does no sorting.
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

Prophecy_ReorderDeckEffect:
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
HandleProphecyScreen:
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

HypnoDarkMind_PlayerSelectEffect:
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

HypnoDarkMind_AISelectEffect:
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

HypnoDarkMind_DamageBenchEffect:
	ldh a, [hTemp_ffa0]
	cp $ff
	ret z ; no target chosen

	ldtx de, TrainerCardSuccessCheckText
	call Func_2c08a
	jr nc, .tails

	call SwapTurn
	ld b, a
	ld de, 20
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret
.tails
	ld a, 10
	call DealRecoilDamageToSelf
	ret

InvisibleWallEffect:
	scf
	ret

MrMimeMeditate_AIEffect:
	call MrMimeMeditate_DamageBoostEffect
	jp SetDefiniteAIDamage

MrMimeMeditate_DamageBoostEffect:
; add damage counters of Defending card to damage
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call SwapTurn
	call AddToDamage
	ret

PsywaveEffect:
	call GetEnergyAttachedMultiplierDamage
	ld hl, wDamage
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wDamage + 1
	set UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, [hl]
	ret

PsywaveAIEffect:
	call PsywaveEffect
	ld hl, wDamage + 1
	set UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, [hl]
	ret

DevolutionBeam_CheckPlayArea:
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
DevolutionBeam_PlayerSelectEffect:
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

DevolutionBeam_AISelectEffect:
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

DevolutionBeam_LoadAnimation:
	xor a ; ATK_ANIM_NONE
	ld [wLoadedAttackAnimation], a
	ret

DevolutionBeam_DevolveEffect:
	ldtx de, IfHeadsDevolveText
	call TossCoin_BankB
	jr c, .heads
	xor a
	call SetWasUnsuccessful
	ret

.heads
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
	call ReturnCardToDeck
	call Func_2c0bd

; check if this devolution KO's card
	ldh a, [hTempPlayAreaLocation_ffa1]
	call PrintPlayAreaCardKnockedOutIfNoHP

	xor a
	ld [wDuelDisplayedScreen], a
	ret

; returns carry if Turn Duelist
; has no Stage1 or Stage2 cards in Play Area.
CheckIfTurnDuelistHasEvolvedCards:
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
HandleEvolvedCardSelection:
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
FindFirstNonBasicCardInPlayArea:
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

NeutralizingShieldEffect:
	scf
	ret

Psychic_AIEffect:
	call Psychic_DamageBoostEffect
	jp SetDefiniteAIDamage

Psychic_DamageBoostEffect:
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
	call Psychic_DamageBoostEffect2
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
Barrier_CheckEnergy:
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wAttachedEnergies + PSYCHIC]
	ldtx hl, NotEnoughPsychicEnergyText
	cp 1
	ret

Barrier_PlayerSelectEffect:
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	xor a ; PLAY_AREA_ARENA
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ret c
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	ret

Barrier_AISelectEffect:
; AI picks the first energy in list
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	ld a, [wDuelTempList]
	ldh [hTemp_ffa0], a
	ret

Barrier_DiscardEffect:
	ldh a, [hTemp_ffa0]
	call PutCardInDiscardPile
	ret

Barrier_BarrierEffect:
	ld a, SUBSTATUS1_BARRIER
	call ApplySubstatus1ToDefendingCard
	ret

MewtwoLv60EnergyAbsorption_CheckDiscardPile:
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	ldtx hl, ThereAreNoEnergyCardsInDiscardPileText
	ret

MewtwoLv60EnergyAbsorption_PlayerSelectEffect:
	ldtx hl, Choose2EnergyCardsFromDiscardPileToAttachText
	call HandleTwoEnergyCardsInDiscardPileSelection
	ret

MewtwoLv60EnergyAbsorption_AISelectEffect:
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

MewtwoLv60EnergyAbsorption_AddToHandEffect:
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

EeveelutionCheckDeckEffect:
	farcall EeveelutionCheckDeckEffect2
	ret
EeveelutionPlayerSelectEffect:
	farcall EeveelutionPlayerSelectEffect2
	ret

EeveelutionAISelectEffect:
	farcall EeveelutionAISelectEffect2
	ret

EeveelutionAddToHandEffect:
	farcall EeveelutionAddToHandEffect2
	ret

ThunderNeedleEffect:
	ldtx de, ThunderNeedleText
	call TossCoin_BankB
	jr c, .OneH
	jr nc, .OneT
	xor a
	ret
.OneH
	ldtx de, ThunderNeedleText
	call TossCoin_BankB
	jr c, .TwoH
	jr nc, .OneHOneT
	xor a
	ret

.OneT
	ldtx de, ThunderNeedleText
	call TossCoin_BankB
	jr c, .OneHOneT
	jr nc, .TwoT
	xor a
	ret

.TwoH
	ldtx de, ThunderNeedleText
	call TossCoin_BankB
	jr c, .ThreeH
	jr nc, .TwoHOneT
	xor a
	ret

.TwoT
	ldtx de, ThunderNeedleText
	call TossCoin_BankB
	jr c, .OneHTwoT
	jr nc, .ThreeT
	xor a
	ret

.ThreeH
	ld a, 60
	call SetDefiniteDamage
	ld a, ATK_ANIM_NEEDLES
	ld [wLoadedAttackAnimation], a
	call ParalysisEffect
	ret

.ThreeT
	ld a, 0
	call SetDefiniteDamage
	ld a, ATK_ANIM_NEEDLES
	ld [wLoadedAttackAnimation], a
	ret

.OneHOneT
	ldtx de, ThunderNeedleText
	call TossCoin_BankB
	jr c, .TwoHOneT
	jr nc, .OneHTwoT
	xor a
	ret

.TwoHOneT
	ld a, 40
	call SetDefiniteDamage
	ld a, ATK_ANIM_NEEDLES
	ld [wLoadedAttackAnimation], a
	call ParalysisEffect
	ret

.OneHTwoT
	ld a, 20
	call SetDefiniteDamage
	ld a, ATK_ANIM_NEEDLES
	ld [wLoadedAttackAnimation], a
	ret

ThunderNeedleAIEffect:
	ld a, (60 * 2) / 2
	lb de, 0, 60
	jp SetExpectedAIDamage


ScavengeOPTCheck:
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	ret
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

Scavenge_CheckDiscardPile:
	call CreateTrainerCardListFromDiscardPile
	ldtx hl, ThereAreNoTrainerCardsInDiscardPileText ; this is redundant
	ret

Scavenge_PlayerSelectTrainerEffect:
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ldh a, [hAIPkmnPowerEffectParam]
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

Scavenge_AddToHandEffect:
	ldtx de, GetATrainerCFText
	call TossCoin_BankB
	ret nc
	ldh a, [hTempPlayAreaLocation_ffa1]
	call MoveDiscardPileCardToHand
	call AddCardToHand
	call IsPlayerTurn
	ldh a, [hTempPlayAreaLocation_ffa1]
	ldtx hl, WasPlacedInTheHandText
	bank1call DisplayCardDetailScreen
	ret

KadabraRecover_CheckEnergyHP:
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wAttachedEnergies + PSYCHIC]
	ldtx hl, NotEnoughPsychicEnergyText
	cp 1
	ret c ; return if not enough energy

KadabraRecover_PlayerSelectEffect:
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	xor a ; PLAY_AREA_ARENA
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ret c
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a ; store card chosen
	ret

KadabraRecover_AISelectEffect:
	ld a, TYPE_ENERGY_PSYCHIC
	call CreateListOfEnergyAttachedToArena
	ld a, [wDuelTempList] ; pick first card
	ldh [hTemp_ffa0], a
	ret

KadabraRecover_DiscardEffect:
	ldh a, [hTemp_ffa0]
	call PutCardInDiscardPile
	ret

CF2ForConfusionEffect:
	call LoadTxRam3
	ldtx de, ConfusionIfAnyHeadsText
	ld a, 2
	call TossCoinATimes_BankB
	jp nc, SetWasUnsuccessful
	call ConfusionEffect
	ret

RandomStatusEffect:
	ld a, 10
	call SetDefiniteDamage
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	cp 1
	call SwapTurn
	ret c
	call LoadTxRam3
	ld a, [wTotalAttachedEnergies]
	ldtx de, RandomStatusText
	call TossCoinATimes_BankB
	ret nc ; return if tails

	call UpdateRNGSources
	and %111
	ldh [hTemp_ffa0], a
	ld hl, .random_effect
	jp JumpToFunctionInTable

.random_effect ; NOTE: NEED 8 OPTIONS FOR THIS SORT OF EFFECT TO WORK.
	dw PoisonEffect
	dw PoisonEffect
	dw SleepEffect
	dw ConfusionEffect
	dw ConfusionEffect
	dw PoisonEffect
	dw SleepEffect
	dw ConfusionEffect

.noeffect
	call SwapTurn
	ret

RandomStatusEffect_AI:
	ld a, 20
	lb de, 20, 20
	jp SetExpectedAIDamage


MysteryAttack_AIEffect:
	ld a, 20
	lb de, 0, 40
	jp SetExpectedAIDamage

MysteryAttack_RandomEffect:
	ld a, 20
	call SetDefiniteDamage

; chooses a random effect from 8 possible options. NOTE: NEED 8 OPTIONS FOR THIS SORT OF EFFECT TO WORK.
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

MysteryAttack_RecoverEffect:
; in case the 5th option was chosen for random effect,
; trigger recovery effect for 10 HP.
	ldh a, [hTemp_ffa0]
	cp 4
	ret nz
	lb de, 0, 10
	call ApplyAndAnimateHPRecovery
	ret

StoneBarrage_AIEffect:
	ld a, 10
	lb de, 0, 100
	jp SetExpectedAIDamage

StoneBarrage_MultiplierEffect:
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
	; discard top 1 card from deck
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

StrikesBackEffect:
	scf
	ret

KabutoArmorEffect:
	scf
	ret

AbsorbEffect:
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

SnivelEffect:
	ld a, SUBSTATUS2_REDUCE_BY_20
	call ApplySubstatus2ToDefendingCard
	ret

CuboneRage_AIEffect:
	call CuboneRage_DamageBoostEffect
	jp SetDefiniteAIDamage

CuboneRage_DamageBoostEffect:
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call AddToDamage
	ret

CFRageEffect:
	ldtx de, IfHRageEffectText
	call TossCoin_BankB
	ret nc
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call AddToDamage
	ret

CFRageOrNothingEffect:
	farcall CFRageOrNothingEffect2
	ret

; returns carry if can't add Pokemon from deck
MarowakCallForFamily_CheckDeckAndPlayArea:
	call CheckIfDeckIsEmpty
	ret c ; no cards in deck
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, NoSpaceOnTheBenchText
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ret

MarowakCallForFamily_PlayerSelectEffect:
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

MarowakCallForFamily_AISelectEffect:
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

MarowakCallForFamily_PutInPlayAreaEffect:
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

KarateChop_AIEffect:
	call KarateChop_DamageSubtractionEffect
	jp SetDefiniteAIDamage

KarateChop_DamageSubtractionEffect:
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

SubmissionEffect:
	ld a, 20
	call DealRecoilDamageToSelf
	ret

Maydo20ToSelfEffect:
	farcall Maydo20ToSelfEffect2
	ret

GolemSelfdestructEffect:
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

GravelerHardenEffect:
	ld a, SUBSTATUS1_HARDEN
	call ApplySubstatus1ToDefendingCard
	ret

LeerEffect:
	ldtx de, IfHeadsOpponentCannotAttackText
	call TossCoin_BankB
	jp nc, SetWasUnsuccessful
	ld a, ATK_ANIM_LEER
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS2_LEER
	call ApplySubstatus2ToDefendingCard
	ret

StretchKick_CheckBench:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

StretchKick_PlayerSelectEffect:
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

StretchKick_AISelectEffect:
; chooses Bench Pokemon with least amount of remaining HP
	call GetBenchPokemonWithLowestHP
	ldh [hTemp_ffa0], a
	ret

StretchKick_BenchDamageEffect:
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld b, a
	ld de, 30
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

SandAttackEffect:
	ld a, ATK_ANIM_HIT_EFFECT
	ld [wLoadedAttackAnimation], a
	ldtx de, SuccessCheckIfHeadsAttackIsSuccessfulText
	call TossCoin_BankB
	jp c, ParalysisEffect
	xor a ; ATK_ANIM_NONE
	ld [wLoadedAttackAnimation], a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret

SandslashFurySwipes_AIEffect:
	ld a, 60 / 2
	lb de, 0, 60
	jp SetExpectedAIDamage

SandslashFurySwipes_MultiplierEffect:
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 3
	call TossCoinATimes_BankB
	add a
	call ATimes10
	call SetDefiniteDamage
	ret

EarthquakeEffect:
	ld a, $01
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	ret

PrehistoricPowerEffect:
	scf
	ret

Choose1EnergyPlaySelectEffect:
	ldtx hl, UnusedText014f
	call HandleOneEnergyCardInDiscardPileSelection
	ret

Choose1EnergyAISelectEffect:
; AI picks first 1 energy cards
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	ld hl, wDuelTempList
	ld de, hTempList
	ld c, 1
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

SelfConfusionEffect:
	call SwapTurn
	call ConfusionEffect
	call SwapTurn
	ret

MewtwoAltLV60EnergyAbsorption_CheckDiscardPile:
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	ldtx hl, ThereAreNoEnergyCardsInDiscardPileText
	ret nc

MewtwoAltLV60EnergyAbsorption_PlayerSelectEffect:
	ldtx hl, Choose2EnergyCardsFromDiscardPileToAttachText
	call HandleTwoEnergyCardsInDiscardPileSelection
	ret

CFGet1Energy_PlayerSelectEffect:
	ldtx hl, UnusedText0154
	call HandleOneEnergyCardInDiscardPileSelection
	ret

MewtwoAltLV60EnergyAbsorption_AISelectEffect:
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

MewtwoAltLV60EnergyAbsorption_AddToHandEffect:
	ldtx de, SuccessCheckIfHeadsAttackIsSuccessfulText
	call TossCoin_BankB
	jp nc, SetWasUnsuccessful
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

Wail_BenchCheck:
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

Wail_FillBenchEffect:
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

.FillBench
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

ButterfreeWhirlwind_CheckBench:
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

ButterfreeWhirlwind_SwitchEffect:
	ldtx de, IfHeadSwitchPKMNText
	call TossCoin_BankB
	ret nc
	ldh a, [hTemp_ffa0]
	call HandleSwitchDefendingPokemonEffect
	ret

Thunderpunch_AIEffect:
	ld a, (30 + 40) / 2
	lb de, 30, 40
	jp SetExpectedAIDamage

Thunderpunch_ModifierEffect:
	ldtx de, IfHeadPlus10IfTails10ToYourselfText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret nc ; return if got tails
	ld a, 10
	call AddToDamage
	ret

Thunderpunch_RecoilEffect:
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if got heads
	ld a, 10
	call DealRecoilDamageToSelf
	ret

LightScreenEffect:
	ld a, SUBSTATUS1_HALVE_DAMAGE
	call ApplySubstatus1ToDefendingCard
	ret

ElectabuzzQuickAttack_AIEffect:
	ld a, (20 + 40) / 2
	lb de, 20, 40
	jp SetExpectedAIDamage

ElectabuzzQuickAttack_DamageBoostEffect:
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, 20
	call AddToDamage
	ret

ZapdosThunder_Recoil50PercentEffect:
	ld hl, 30
	call LoadTxRam3
	ldtx de, IfTailsDamageToYourselfTooText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret

ZapdosThunder_RecoilEffect:
	ld hl, 30
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if got heads
	ld a, 30
	call DealRecoilDamageToSelf
	ret

ThunderboltEffect:
	xor a
	call CreateListOfFireEnergyAttachedToArena
	ld hl, wDuelTempList
; put all energy cards in Discard Pile
.loop
	ld a, [hli]
	cp $ff
	ret z
	call PutCardInDiscardPile
	ld a, 20
	call AddToDamage
	jr .loop

DiscardAllLEffect:
	farcall DiscardAllLEffect2
	ret

DischargeEffect:
	farcall DischargeEffect2
	ret

DevastateDiscardEffect:
	xor a
	call CreateListOfFireEnergyAttachedToArena
	ld hl, wDuelTempList
; put all energy cards in Discard Pile
.loop
	ld a, [hli]
	cp $ff
	ret z
	call PutCardInDiscardPile
	ret
DevastateDamageAndEnergyDiscardEffect:
; opponent's bench
	call SwapTurn
	xor a
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	jp Whirlpool_DiscardEffect

BatonPassEnergyEffect:
	xor a
	call CreateArenaOrBenchEnergyCardList
	ld hl, wDuelTempList
; put all energy cards in Discard Pile
.loop
	ld a, [hli]
	cp $ff
	ret z
	call AddCardToHand
	jr .loop
	call PutHandCardInPlayArea
	ret

Fly_AIEffect:
	ld a, 30 / 2
	lb de, 0, 30
	jp SetExpectedAIDamage

Fly_Success50PercentEffect:
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

ThunderJolt_Recoil50PercentEffect:
	ld hl, 10
	call LoadTxRam3
	ldtx de, IfTailsDamageToYourselfTooText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret

Zapdos_Recoil50PercentEffect:
	ld hl, 20
	call LoadTxRam3
	ldtx de, IfTailsDamageToYourselfTooText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret

ThunderJolt_RecoilEffect:
	ld hl, 10
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if was heads
	ld a, 10
	call DealRecoilDamageToSelf
	ret

Lure_CheckBench:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

Lure_SwitchEffect:
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld e, a
	call HandleNShieldAndTransparency
	call nc, SwapArenaWithBenchPokemon
	call SwapTurn
	xor a
	ld [wDuelDisplayedScreen], a
	ret

Lure_PlayerSelectEffect:
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

Lure_AISelectEffect:
	call GetBenchPokemonWithLowestHP
	ldh [hTemp_ffa0], a
	ret

Discard1FDiscardEffect:
	ldtx de, TailsDiscard1FText
	call TossCoin_BankB
	ret c
	ldh a, [hTempList]
	call PutCardInDiscardPile
	ret
	
PikachuLv16GrowlEffect:
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld b, a
	ld de, 10
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

PikachuAltLv16GrowlEffect:
	ld a, SUBSTATUS2_GROWL
	call ApplySubstatus2ToDefendingCard
	ret

ChainLightningEffect:
	call SwapTurn
	call .DamageSameColorBench
	call SwapTurn
	ret

.DamageSameColorBench
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld e, a
	ld d, PLAY_AREA_ARENA
	jr .next_bench

.check_damage
	push de
	ld e, d
	ld b, d
 	call GetPlayAreaCardAttachedEnergies
 	ld a, [wTotalAttachedEnergies]
 	call ATimes10
	ld e, a ; Switch this to e, a for real damage
 	ld d, 0
 	call DealDamageToPlayAreaPokemon_RegularAnim
	pop de

.next_bench
	inc d
	dec e
	jr nz, .check_damage
	ret

RaichuAgilityEffect:
	ldtx de, IfHeadsDoNotReceiveDamageOrEffectText
	call TossCoin_BankB
	ret nc ; skip if got tails
	ld a, ATK_ANIM_BOYFRIENDS_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_AGILITY
	call ApplySubstatus1ToDefendingCard
	ret

RaichuThunder_Recoil50PercentEffect:
	ld hl, 30
	call LoadTxRam3
	ldtx de, IfTailsDamageToYourselfTooText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	ret

RaichuThunder_RecoilEffect:
	ld hl, 30
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if got heads
	ld a, 30
	call DealRecoilDamageToSelf
	ret

Gigashock_PlayerSelectEffect:
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
	ld [wCurGigashockItem], a
	bank1call Func_61a1
.start
	bank1call PrintPlayAreaCardList_EnableLCD
	push af
	ld a, [wCurGigashockItem]
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

	ld [wCurGigashockItem], a
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
	ld [wCurGigashockItem], a
	jr .start

; returns carry if Bench Pokemon
; in register a was already chosen.
.CheckIfChosenAlready:
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

Gigashock_AISelectEffect:
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

Gigashock_BenchDamageEffect:
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

MagnetonLv28SelfdestructEffect:
	; opponent's bench
	call SwapTurn
	xor a
	ld [wIsDamageToSelf], a
	ld a, 10
	call DealDamageToAllBenchedPokemon
	call SwapTurn
	ret

MagnetonSonicboom_UnaffectedByColorEffect:
	ld hl, wDamage + 1
	set UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, [hl]
	ret

MagnetonSonicboom_NullEffect:
	ret

LCutEffect:
	call LoadTxRam3
	ldtx de, LCutText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	jr c, .heads
	jr nc, .tails
	
.heads
	ld a, 10
	call AddToDamage
	ret

.tails
	ret

LCutBenchEffect:
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	jp z, JigglypuffDoubleEdgeEffect
	jp MagnetonLv28SelfdestructEffect
	

CrushingEarthEffect:
	call LoadTxRam3
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin_BankB
	ldh [hTemp_ffa0], a
	jr c, .heads
	jr nc, .tails
	
.heads
	ld a, ATK_ANIM_EARTHQUAKE
	ld [wLoadedAttackAnimation], a
	ret

.tails
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret

CrushingEarthBenchEffect:
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	ret z ; return if got tails
	jp MagnetonLv35SelfdestructEffect
	

MagnetonLv35SelfdestructEffect:
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

Damage20AllBenchEffect:
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

BountyOPTCheck:
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckCannotUseDueToStatus_OnlyToxicGasIfANon0

	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	and USED_PKMN_POWER_THIS_TURN
	jr nz, .already_used

	ldh [hAIPkmnPowerEffectParam], a
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ldh a, [hAIPkmnPowerEffectParam]
	ret

.already_used
	ldtx hl, OnlyOncePerTurnText
	scf
	ret

Bounty_PlayerSelectEffect:
	ldh [hAIPkmnPowerEffectParam], a
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ldh a, [hAIPkmnPowerEffectParam]

; search cards in hand
	ld a, $ff
	ldh [hTemp_ffa0], a
	call CreateHandCardList
	ldtx hl, Choose1BasicEnergyCardFromHandText
	ldtx bc, BasicEnergyText
	lb de, SEARCHEFFECT_BASIC_ENERGY, 0
	call LookForCardsInDeck
	ret c
	bank1call Func_5591
	ldtx hl, ChooseBasicEnergyCardText
	ldtx de, DuelistHandText
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
	farcall Func_3794
	jr .select_card

.try_cancel
; Player tried exiting screen, if there are
; any Basic Energy cards, Player is forced to select them.
; otherwise, they can safely exit.
	ld a, DUELVARS_CARD_LOCATIONS
	farcall GetTurnDuelistVariable
.loop_deck
	ld a, [hl]
	cp CARD_LOCATION_HAND
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
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

Bounty_AISelectEffect:
	farcall Bounty_AISelectEffect2
	ret

Bounty_AttachEnergyEffect:
	farcall Bounty_AttachEnergyEffect2
	ret

GolbatLeechLifeEffect:
	ld hl, wDealtDamage
	ld e, [hl]
	inc hl ; wDamageEffectiveness
	ld d, [hl]
	call ApplyAndAnimateHPRecovery
	ret

SpitPoison_AIEffect:
	farcall SpitPoison_AIEffect_2
	ret

ElectrodeSonicboom_UnaffectedByColorEffect:
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld e, a
	call SwapArenaWithBenchPokemon
	call SwapTurn
	call ClearDamageReductionSubstatus2
	xor a
	ld [wDuelDisplayedScreen], a
	ret

ElectrodeSonicboom_NullEffect:
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
EnergySpike_DeckCheck:
	call CheckIfDeckIsEmpty
	ret

EnergySpike_PlayerSelectEffect:
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

EnergySpike_AISelectEffect:
; AI doesn't select any card
	ld a, $ff
	ldh [hTemp_ffa0], a
	ret

EnergySpike_AttachEnergyEffect:
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

JolteonDoubleKick_AIEffect:
	ld a, (30 * 3) / 2
	lb de, 0, 90
	jp SetExpectedAIDamage

JolteonDoubleKick_MultiplierEffect:
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

TailWagEffect:
	ldtx de, IfHeadsOpponentCannotAttackText
	call TossCoin_BankB
	jp nc, SetWasUnsuccessful
	ld a, ATK_ANIM_LURE
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS2_TAIL_WAG
	call ApplySubstatus2ToDefendingCard
	ret

Gale_LoadAnimation:
	farcall Gale_LoadAnimation2
	ret

Gale_SwitchEffect:
	farcall Gale_SwitchEffect2
	ret

EeveeQuickAttack_AIEffect:
	ld a, (20 + 30) / 2
	lb de, 20, 30
	jp SetExpectedAIDamage

EeveeQuickAttack_DamageBoostEffect:
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; return if tails
	ld a, 10
	call AddToDamage
	ret

SpearowMirrorMove_AIEffect:
	jr MirrorMoveEffects.AIEffect

SpearowMirrorMove_InitialEffect1:
	jr MirrorMoveEffects.InitialEffect1

SpearowMirrorMove_InitialEffect2:
	jr MirrorMoveEffects.InitialEffect2

SpearowMirrorMove_PlayerSelection:
	jr MirrorMoveEffects.PlayerSelection

SpearowMirrorMove_AISelection:
	jr MirrorMoveEffects.AISelection

SpearowMirrorMove_BeforeDamage:
	jr MirrorMoveEffects.BeforeDamage

SpearowMirrorMove_AfterDamage:
	jp MirrorMoveEffects.AfterDamage

; these are effect commands that Mirror Move uses
; in order to mimic last turn's attack.
; it covers all possible effect steps to perform its commands
; (i.e. selection for Amnesia and Energy discarding attacks, etc)
MirrorMoveEffects:
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

.AfterDamage:
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

.ExecuteStatusEffect:
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

FearowAgilityEffect:
	ldtx de, IfHeadsDoNotReceiveDamageOrEffectText
	call TossCoin_BankB
	ret nc
	ld a, ATK_ANIM_AGILITY_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_AGILITY
	call ApplySubstatus1ToDefendingCard
	ret

; return carry if cannot use Step In
StepIn_BenchCheck:
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

StepIn_SwitchEffect:
	ldh a, [hTemp_ffa0]
	ld e, a
	call SwapArenaWithBenchPokemon
	ld a, DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ret

DragoniteLv45Slam_AIEffect:
	ld a, (40 * 2) / 2
	lb de, 0, 80
	jp SetExpectedAIDamage

DragoniteLv45Slam_MultiplierEffect:
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

ScaldingSteamAISelectionEffect:
	call AIPickFireEnergyCardToDiscard
	call AIPickEnergyCardToDiscardFromDefendingPokemon
	ldh [hTemp_ffa0], a
	ret

CharizardC_AIEffect:
	ld a, (50 * 2) / 2
	lb de, 0, 100
	jp SetExpectedAIDamage

CharizardC_MultiplierEffect:
	ld hl, 50
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	call TossCoinATimes_BankB
	ld c, a
	add a
	add a
	add c
	call ATimes10
	call SetDefiniteDamage
	ret

ThickSkinnedEffect:
	scf
	ret

LeekSlap_AIEffect:
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

; return carry if already used attack in this duel
LeekSlap_OncePerDuelCheck:
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

LeekSlap_SetUsedThisDuelFlag:
	ldh a, [hTemp_ffa0]
	cp $ff
	ret z ; no target chosen
	call SwapTurn
	ld b, a
	ld de, 20
	call DealDamageToPlayAreaPokemon_RegularAnim
	call SwapTurn
	ret

LeekSlap_NoDamage50PercentEffect:
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin_BankB
	ret c
	xor a ; 0 damage
	call SetDefiniteDamage
	ret

FetchEffect:
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

FetchOppEffect:
	ld hl, wDealtDamage
	ld a, [hli]
	or [hl]
	ret z ; return if no damage dealt
	call SwapTurn
	ldtx hl, Draw1CardFromTheDeckText
	call DrawWideTextBox_WaitForInput
	bank1call DisplayDrawOneCardScreen
	call DrawCardFromDeck
	ret c ; return if deck is empty
	call AddCardToHand
	call SwapTurn
	ret

CometPunch_AIEffect:
	ld a, (20 * 4) / 2
	lb de, 0, 80
	jp SetExpectedAIDamage

CometPunch_MultiplierEffect:
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 4
	call TossCoinATimes_BankB
	add a
	call ATimes10
	call SetDefiniteDamage
	ret

AiEffect10plus10:
	ld a, (10 + 20) / 2
	lb de, 10, 20
	jp SetExpectedAIDamage
	
TaurosStomp_AIEffect:
	ld a, (20 + 30) / 2
	lb de, 20, 30
	jp SetExpectedAIDamage

TaurosStomp_DamageBoostEffect:
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin_BankB
	ret nc ; tails
	ld a, 10
	call AddToDamage
	ret

Rampage_AIEffect:
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	call AddToDamage
	jp SetDefiniteAIDamage

Rampage_Confusion50PercentEffect:
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

StreamingMantleEffect:
	farcall StreamingMantleEffect2
	ret

RetreatAidEffect:
	scf
	ret

DodrioRage_AIEffect:
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	ldtx hl, NoDamageCountersText
	cp 10
	ret

DodrioRage_DamageBoostEffect:
	lb de, 0, 20
	call ApplyAndAnimateHPRecovery
	ret

DragonairSlam_AIEffect:
	ld a, (30 * 4) / 2
	lb de, 0, 120
	jp SetExpectedAIDamage

DragonairSlam_MultiplierEffect:
	ld hl, 30
	call LoadTxRam3
	ld a, 4
	ldtx de, DamageCheckIfHeadsXDamageText
	call TossCoinATimes_BankB
	ld e, a
	add a
	add a
	call ATimes10
	call SetDefiniteDamage
	ret

Hydrocutter_AIEffect:
	ld a, (40 * 3) / 2
	lb de, 0, 120
	jp SetExpectedAIDamage

Hydrocutter_MultiplierEffect:
	ld hl, 40
	call LoadTxRam3
	ld a, 3
	ldtx de, DamageCheckIfHeadsXDamageText
	call TossCoinATimes_BankB
	ld e, a
	add a
	add a
	call ATimes10
	call SetDefiniteDamage
	ret

DragonairHyperBeam_PlayerSelectEffect:
	jp HandleEnergyDiscardEffectSelection

DragonairHyperBeam_AISelectEffect:
	call AIPickEnergyCardToDiscardFromDefendingPokemon
	ldh [hTemp_ffa0], a
	ret

DragonairHyperBeam_DiscardEffect:
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

HandleEnergyDiscardEffectSelection:
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

ClefableMetronome_CheckAttacks:
	call CheckIfDefendingPokemonHasAnyAttack
	ldtx hl, NoAttackMayBeChosenText
	ret

ClefableMetronome_AISelectEffect:
	call HandleAIMetronomeEffect
	ret

ClefableMetronome_UseAttackEffect:
	ldtx de, SuperMText
	call TossCoin_BankB
	jr c, .heads
	xor a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret
.heads

	ld a, 1 ; energy cost of this attack
	call HandlePlayerMetronomeEffect
	ret

ClefableMinimizeEffect:
	ld hl, wDealtDamage
	ld a, [hli]
	or a
	ret z ; return if no damage dealt
	ld de, 20
	call ApplyAndAnimateHPRecovery
	ret

HurricaneEffect:
	ldtx de, TuskTossText
	call TossCoin_BankB
	jr c, .heads
	jp TuskTossSelectEffect

.heads

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

PidgeottoWhirlwind_SelectEffect:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	jr nc, .switch
	; no Bench Pokemon
	ld a, $ff
	ldh [hTempPlayAreaLocation_ffa1], a
	ret
.switch
	ldh a, [hTempPlayAreaLocation_ff9d]
	or a
	push af
	call DuelistSelectForcedSwitch
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTempPlayAreaLocation_ffa1], a
	pop af
	ldh [hTempPlayAreaLocation_ff9d], a
	ldh [hTemp_ffa0], a
	ret

PidgeottoWhirlwind_SwitchEffect:
	ldh a, [hTemp_ffa0]
	call HandleSwitchDefendingPokemonEffect
	ret

PidgeottoMirrorMove_AIEffect:
	jp MirrorMoveEffects.AIEffect

PidgeottoMirrorMove_InitialEffect1:
	jp MirrorMoveEffects.InitialEffect1

PidgeottoMirrorMove_InitialEffect2:
	jp MirrorMoveEffects.InitialEffect2

PidgeottoMirrorMove_PlayerSelection:
	jp MirrorMoveEffects.PlayerSelection

PidgeottoMirrorMove_AISelection:
	jp MirrorMoveEffects.AISelection

PidgeottoMirrorMove_BeforeDamage:
	jp MirrorMoveEffects.BeforeDamage

PidgeottoMirrorMove_AfterDamage:
	jp MirrorMoveEffects.AfterDamage

SingEffect:
	ld a, 5
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
	ret

HowlSelectEffect:
	call CreateEnergyCardListFromDiscardPile_AllEnergy
	ldtx hl, ThereAreNoEnergyCardsInDiscardPileText
	ldtx hl, UnusedText014f
	call HandleFiveEnergyCardsInDiscardPileSelection
	jp MewtwoLv60EnergyAbsorption_AddToHandEffect

EnergyTransAttackEffect:
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
	ldh a, [hAIPkmnPowerEffectParam]
	ld b, SYM_GRASS
	call DrawSymbolOnPlayAreaCursor

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

EnergyTrans_AIEffect:
	ldh a, [hAIEnergyTransPlayAreaLocation]
	ld e, a
	ldh a, [hAIEnergyTransEnergyCard]
	call AddCardToHand
	call PutHandCardInPlayArea
	bank1call PrintPlayAreaCardList_EnableLCD
	ret

CheckIfCardHasGrassEnergyAttached:
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

WaterTransAttackEffect:
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
	call CheckIfCardHasWaterEnergyAttached
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
	ldh a, [hAIPkmnPowerEffectParam]
	ld b, SYM_WATER
	call DrawSymbolOnPlayAreaCursor

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

CheckIfCardHasWaterEnergyAttached:
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
	cp TYPE_ENERGY_WATER
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

EnergyTrans_PrintProcedure:
	ldtx hl, ProcedureForEnergyTransferText
	bank1call DrawWholeScreenTextBox
	or a
	ret

; return carry if Defending Pokemon has no attacks
ClefairyMetronome_CheckAttacks:
	call CheckIfDefendingPokemonHasAnyAttack
	ldtx hl, NoAttackMayBeChosenText
	ret

ClefairyMetronome_AISelectEffect:
	call HandleAIMetronomeEffect
	ret

ClefairyMetronome_UseAttackEffect:
	ld a, 2 ; energy cost of this attack
;	fallthrough

; handles Metronome selection, and validates
; whether it can use the selected attack.
; if unsuccessful, returns carry.
; input:
;	a = amount of colorless energy needed for Metronome
HandlePlayerMetronomeEffect:
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
HandleAIMetronomeEffect:
	ret

Recycle_DiscardPileCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_DISCARD_PILE
	call GetTurnDuelistVariable
	ldtx hl, ThereAreNoCardsInTheDiscardPileText
	cp 1
	ret

Recycle_AddToHandEffect:
	ldh a, [hTempList]
	cp $ff
	ret z ; return if no card was selected

; add card to hand and show in screen if
; it wasn't the Player who played the Trainer card.
	call MoveDiscardPileCardToHand
	call AddCardToHand
	call IsPlayerTurn
	ret c
	ldh a, [hTempList]
	ldtx hl, CardWasChosenText
	bank1call DisplayCardDetailScreen
	ret

Recycle_PlayerSelection:
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

DoTheWaveEffect:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	dec a ; don't count arena card
	call ATimes10
	call AddToDamage
	ret

MagneticWaveEffect:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	dec a 
	call ATimes10
	ld e, a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	dec a
	call ATimes10
	add 30
	sub e
	jr nc, .no_underflow
	xor a
.no_underflow
	jp SetDefiniteDamage
	ret

PokemonFlute_PlayerSelection:
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

PokemonFlute_PlaceInPlayAreaText:
; place selected card in non-Turn Duelist's Bench
	call SwapTurn
	ldh a, [hTemp_ffa0]
	call MoveDiscardPileCardToHand
	call AddCardToHand
	call PutHandPokemonCardInPlayArea
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	srl a
	bit 0, a
	jr z, .rounded
	add 5 ; round up HP to nearest 10
.rounded
	ld [hl], a
	call IsPlayerTurn
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

PokemonFlute_BenchCheck:
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

CreateBasicPokemonCardListFromDiscardPile:
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

FirstAid_DamageCheck:
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	ldtx hl, NoDamageCountersText
	cp 10
	ret

FirstAid_HealEffect:
	lb de, 0, 10
	call ApplyAndAnimateHPRecovery
	ret

JigglypuffDoubleEdgeEffect:
	ld a, 10
	call DealRecoilDamageToSelf
	ret

Chansey40DoubleEdgeEffect:
	ld a, 40
	call DealRecoilDamageToSelf
	ret

PidgeyWhirlwind_SelectEffect:
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

TuskTossSelectEffect:
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
	;fallthrough

PidgeyWhirlwind_SwitchEffect:
	ldh a, [hTemp_ffa0]
	call HandleSwitchDefendingPokemonEffect
	ret
; prints text that requires card name and color,
; with the card name of the Turn Duelist's Arena Pokemon
; and color in [hTemp_ffa0].
; input:
;	hl = text to print
PrintArenaCardNameAndColorText:
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
AISelectConversionColor:
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

ScrunchEffect:
	ldtx de, IfHeadsDoNotReceiveDamageOrEffectText
	call TossCoin_BankB
	ret nc
	ld a, ATK_ANIM_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_AGILITY
	call ApplySubstatus1ToDefendingCard
	ret

ChanseyDoubleEdgeEffect:
	ld a, 80
	call DealRecoilDamageToSelf
	ret

; return carry if no Pokemon in Bench
TrainerCardAsPokemon_BenchCheck:
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

TrainerCardAsPokemon_PlayerSelectSwitch:
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

TrainerCardAsPokemon_DiscardEffect:
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

BlisseySoftboiledEffect:
	ldtx de, SoftboiledText
	call TossCoin_BankB
	jr c, .heads
	jr nc, .tails
	xor a
.tails
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
	ld a, ATK_ANIM_HEALING_WIND_PLAY_AREA
	ld [wLoadedAttackAnimation], a
	lb de, 0, 40
	call ApplyAndAnimateHPRecovery
	ret

.heads
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
	ld a, ATK_ANIM_HEALING_WIND_PLAY_AREA
	ld [wLoadedAttackAnimation], a
	lb de, 0, 80
	call ApplyAndAnimateHPRecovery
	ret

HealingWind_InitialEffect:
	scf
	ret

HealingWind_PlayAreaHealEffect:
	ldtx de, IfHHealAllDamageFromGText
	call TossCoin_BankB
	jr c, .heads
	xor a
	call SetWasUnsuccessful
	ret
.heads
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
	call GetPlayAreaCardColor
	cp TYPE_PKMN_GRASS
	jr nz, .next_pkmn
	call GetCardDamageAndMaxHP
	or a
	jr z, .next_pkmn ; skip if no damage

; if less than 20 damage, cap recovery at 10 damage
	ld de, 120
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

Heal20FromAllEffect:
	farcall Heal20FromAllEffect2
	ret

Heal10FromAllEffect:
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
	ret

HypnoShowerEffect:
	farcall HypnoShowerEffect2
	ret

PickRandomBasicCardFromDeck:
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

ExpandEffect:
	ld a, SUBSTATUS1_REDUCE_BY_10
	call ApplySubstatus1ToDefendingCard
	ret

; returns carry if either there are no damage counters
; or no Energy cards attached in the Play Area.
SuperPotion_DamageEnergyCheck:
	call CheckIfPlayAreaHasAnyDamage
	ldtx hl, NoPokemonWithDamageCountersText
	ret c ; no damage counters
	call CheckIfThereAreAnyEnergyCardsAttached
	ldtx hl, ThereIsNoEnergyCardAttachedText
	ret

SuperPotion_PlayerSelectEffect:
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
	ld c, 40
	cp 40
	jr nc, .heal
	ld c, a
.heal
	ld a, c
	ldh [hPlayAreaEffectTarget], a
	or a
	ret

SuperPotion_HealEffect:
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
CheckIfThereAreAnyEnergyCardsAttached:
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
HandlePokemonAndEnergySelectionScreen:
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

ImakuniEffect:
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
	cp 59
	jr c, .less_than_3
	ld a, 58 ; cap this to 2 for bonus effect
.less_than_3
	call ATimes10
	call AddToDamage ; add 10 * a to damage

.skip_bonus
	ld a, [wDamage]
	ld [wAIMinDamage], a
	ld [wAIMaxDamage], a
	ret

ElectricTackleEffect:
	lb bc, 0, 0
	jp Doplus10PerLEffect

Doplus10PerLEffect:
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

	ld hl, wAttachedEnergies + LIGHTNING
	ld a, c
	or a
	jr z, .check_bonus ; is Energy cost all L energy?

	ld a, [wTotalAttachedEnergies]
	cp [hl]
	jr nz, .check_bonus ; skip if at least 1 non-Water energy attached

	ld a, c
	add b
	ld b, a
	; b += c

.check_bonus
	ld a, [hl]
	sub b
	jr c, .skip_bonus ; is water energy <  b?
	jr z, .skip_bonus ; is water energy == b?
	cp 59
	jr c, .less_than_3
	ld a, 58 ; cap this to 2 for bonus effect
.less_than_3
	call ATimes10
	call AddToDamage ; add 10 * a to damage

.skip_bonus
	ld a, [wDamage]
	ld [wAIMinDamage], a
	ld [wAIMaxDamage], a
	ret

ElectricTackleRecoilEffect:
	ldtx de, ETRecoilText
	call TossCoin_BankB
	ret c
	push bc
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld e, a
	call GetPlayAreaCardAttachedEnergies
	pop bc
	ld hl, wAttachedEnergies + LIGHTNING
	call ATimes10
	call DealRecoilDamageToSelf
	ret

EnergyRemoval_EnergyCheck:
	call SwapTurn
	call CheckIfThereAreAnyEnergyCardsAttached
	ldtx hl, NoEnergyAttachedToOpponentsActiveText
	call SwapTurn
	ret

EnergyRemoval_PlayerSelection:
	ldtx hl, ChoosePokemonToRemoveEnergyFromText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	call HandlePokemonAndEnergySelectionScreen
	call SwapTurn
	ret

EnergyRemoval_AISelection:
	call AIPickEnergyCardToDiscardFromDefendingPokemon
	ret

EnergyRemoval_DiscardEffect:
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

; return carry if no other card in hand to discard
; or if there are no Basic Energy cards in Discard Pile.
EnergyRetrieval_HandEnergyCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	cp 2
	ldtx hl, NotEnoughCardsInHandText
	ret c ; return if doesn't have another card to discard
	call CreateEnergyCardListFromDiscardPile_OnlyBasic
	ldtx hl, ThereAreNoBasicEnergyCardsInDiscardPileText
	ret

EnergyRetrieval_PlayerHandSelection:
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

EnergyRetrieval_PlayerDiscardPileSelection:
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

EnergyRetrieval_DiscardAndAddToHandEffect:
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
EnergySearch_DeckCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	cp DECK_SIZE
	ccf
	ldtx hl, NoCardsLeftInTheDeckText
	ret

EnergySearch_PlayerSelection:
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

EnergySearch_AddToHandEffect:
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
CheckIfCardIsBasicEnergy:
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

ProfessorOakEffect:
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
	ld a, 7
	bank1call DisplayDrawNCardsScreen
	ld c, 7
.draw_loop
	call DrawCardFromDeck
	jr c, .done
	call AddCardToHand
	dec c
	jr nz, .draw_loop
.done
	ret

Potion_DamageCheck:
	call CheckIfPlayAreaHasAnyDamage
	ldtx hl, NoPokemonWithDamageCountersText
	ret

Potion_PlayerSelection:
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
	ld c, 20
	cp 20
	jr nc, .skip_cap
	ld c, a
.skip_cap
	ld a, c
	ldh [hTempPlayAreaLocation_ffa1], a
	or a
	ret

Potion_HealEffect:
	ldh a, [hTemp_ffa0]
	ldh [hTempPlayAreaLocation_ff9d], a
	ldh a, [hTempPlayAreaLocation_ffa1]
	call HealPlayAreaCardHP
	ret

GamblerEffect:
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
	ld c, 7
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
ItemFinder_HandDiscardPileCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	ldtx hl, NotEnoughCardsInHandText
	cp 3
	ret c
	call CreateTrainerCardListFromDiscardPile
	ret

ItemFinder_PlayerSelection:
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

ItemFinder_DiscardAddToHandEffect:
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

Defender_PlayerSelection:
	ldtx hl, ChoosePokemonToAttachDefenderToText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInPlayArea
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret

Defender_AttachDefenderEffect:
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
MysteriousFossil_BenchCheck:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ldtx hl, NoSpaceOnTheBenchText
	ret

MysteriousFossil_PlaceInPlayAreaEffect:
	ldh a, [hTempCardIndex_ff9f]
	call PutHandPokemonCardInPlayArea
	ret

; return carry if Arena card has no status to heal.
FullHeal_StatusCheck:
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetTurnDuelistVariable
	or a
	ret nz
	ldtx hl, NotAffectedByPoisonSleepParalysisOrConfusionText
	scf
	ret

FullHeal_ClearStatusEffect:
	ld a, ATK_ANIM_FULL_HEAL
	call Func_2fea9
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetTurnDuelistVariable
	ld [hl], NO_STATUS
	bank1call DrawDuelHUDs
	ret

ImposterProfessorOakEffect:
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
	ld a, 7
	bank1call DisplayDrawNCardsScreen
	ld c, 7
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
ComputerSearch_HandDeckCheck:
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

ComputerSearch_PlayerDiscardHandSelection:
	call HandlePlayerSelection2HandCardsToDiscard
	ret

ComputerSearch_PlayerDeckSelection:
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

ComputerSearch_DiscardAddToHandEffect:
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
ClefairyDoll_BenchCheck:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, NoSpaceOnTheBenchText
	cp MAX_PLAY_AREA_POKEMON
	ccf
	ret

ClefairyDoll_PlaceInPlayAreaEffect:
	ldh a, [hTempCardIndex_ff9f]
	call PutHandPokemonCardInPlayArea
	ret

; return carry if no Pokemon in the Bench.
MrFuji_BenchCheck:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

MrFuji_PlayerSelection:
	ldtx hl, ChoosePokemonToReturnToTheDeckText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInBench
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret

MrFuji_ReturnToDeckEffect:
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
	call Func_2c0bd ; Is anim for deck shuffling
	ret

PlusPowerEffect:
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
Switch_BenchCheck:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

Switch_PlayerSelection:
	ldtx hl, SelectPkmnOnBenchToSwitchWithActiveText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInBench
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret

Switch_SwitchEffect:
	ldh a, [hTemp_ffa0]
	ld e, a
	call SwapArenaWithBenchPokemon
	ret

PokemonCenter_DamageCheck:
	call CheckIfPlayAreaHasAnyDamage
	ldtx hl, NoPokemonWithDamageCountersText
	ret

PokemonCenter_HealDiscardEnergyEffect:
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

PokemonBreeder_HandPlayAreaCheck:
	call CreatePlayableStage2PokemonCardListFromHand
	jr c, .cannot_evolve
	bank1call IsPrehistoricPowerActive
	ret
.cannot_evolve
	ldtx hl, ConditionsForEvolvingToStage2NotFulfilledText
	scf
	ret

PokemonBreeder_PlayerSelection:
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

PokemonBreeder_EvolveEffect:
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
	ld a, SFX_5E
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
CreatePlayableStage2PokemonCardListFromHand:
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
ScoopUp_BenchCheck:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

ScoopUp_PlayerSelection:
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

ScoopUp_ReturnToHandEffect:
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
PokemonTrader_HandDeckCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	ldtx hl, ThereAreNoCardsInHandThatYouCanChangeText
	cp 2
	ret c ; return if no other cards in hand
	call CreatePokemonCardListFromHand
	ldtx hl, ThereAreNoCardsInHandThatYouCanChangeText
	ret

PokemonTrader_PlayerHandSelection:
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

PokemonTrader_PlayerDeckSelection:
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

PokemonTrader_TradeCardsEffect:
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
CreatePokemonCardListFromHand:
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
Pokedex_DeckCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ldtx hl, NoCardsLeftInTheDeckText
	cp DECK_SIZE
	ccf
	ret

Pokedex_PlayerSelection:
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

Pokedex_OrderDeckCardsEffect:
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

BillEffect:
	farcall BillEffect2
	ret

BillEffectOpp:
	farcall BillEffectOpp
	ret

EveryoneDrawTwo:
	farcall EveryoneDrawTwo2
	ret

AttackDraw2Effect:
	ld a, 3
	bank1call DisplayDrawNCardsScreen
	ld c, 3
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

OneSidedLassEffect:
	ldtx de, TrainerCardSuccessCheckText
	call TossCoin_BankB
	jr c, .heads
	xor a
	call SetDefiniteDamage
	call SetWasUnsuccessful
	ret
.heads
	ldtx hl, PleaseCheckTheOpponentsHandText
	call DrawWideTextBox_WaitForInput

	call .DisplayLinkOrCPUHand
	; do for non-Turn Duelist
	call SwapTurn
	call .ShuffleDuelistHandTrainerCardsInDeck
	call SwapTurn
	ret

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

.DisplayLinkOrCPUHand
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

.DisplayOppHand
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

LassEffect:
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

.DisplayLinkOrCPUHand
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

.DisplayOppHand
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

ScoutEffect:
	ldtx hl, PleaseCheckTheOpponentsHandText
	call DrawWideTextBox_WaitForInput
	call .DisplayLinkOrCPUHand
.DisplayLinkOrCPUHand
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
.DisplayOppHand
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

Maintenance_HandCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	ldtx hl, NotEnoughCardsInHandText
	cp 3
	ret

Maintenance_PlayerSelection:
	ldtx hl, Choose2HandCardsFromHandToReturnToDeckText
	ldtx de, ChooseTheCardToPutBackText
	call HandlePlayerSelection2HandCards
	ret

Maintenance_ReturnToDeckAndDrawEffect:
; return both selected cards to the deck
	ldh a, [hTempList]
	call RemoveCardFromHand
	call ReturnCardToDeck
	ldh a, [hTempList + 1]
	call RemoveCardFromHand
	call ReturnCardToDeck
	call Func_2c0bd

; draw one card
	ld a, 1
	bank1call DisplayDrawNCardsScreen
	ld c, 1
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
PokeBall_DeckCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ldtx hl, NoCardsLeftInTheDeckText
	cp DECK_SIZE
	ccf
	ret

PokeBall_PlayerSelection:
	ldtx de, TrainerCardSuccessCheckText
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

PokeBall_AddToHandEffect:
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

; return carry if Turn Duelist has no Evolution cards in Play Area
DevolutionSpray_PlayAreaEvolutionCheck:
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

DevolutionSpray_PlayerSelection:
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

DevolutionSpray_DevolutionEffect:
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

; Is now master ball code
SuperEnergyRemoval_EnergyCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_NOT_IN_DECK
	call GetTurnDuelistVariable
	ldtx hl, NoCardsLeftInTheDeckText
	cp DECK_SIZE
	ccf
	ret

SuperEnergyRemoval_PlayerSelection:
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

SuperEnergyRemoval_DiscardEffect:
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

; return carry if not enough cards in hand to
; discard for Super Energy Retrieval effect
; or if the Discard Pile has no basic Energy cards
SuperEnergyRetrieval_HandEnergyCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	ldtx hl, NotEnoughCardsInHandText
	cp 3
	ret c
	call CreateEnergyCardListFromDiscardPile_OnlyBasic
	ldtx hl, ThereAreNoBasicEnergyCardsInDiscardPileText
	ret

SuperEnergyRetrieval_PlayerHandSelection:
	call HandlePlayerSelection2HandCardsToDiscard
	ret

SuperEnergyRetrieval_PlayerDiscardPileSelection:
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

SuperEnergyRetrieval_DiscardAndAddToHandEffect:
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
GetNextPositionInTempList_TrainerEffects:
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
HandlePlayerSelection2HandCardsToDiscard:
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
HandlePlayerSelection2HandCards:
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
GustOfWind_BenchCheck:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

GustOfWind_PlayerSelection:
	ldtx hl, ChooseAPokemonToSwitchWithActivePokemonText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench
	bank1call OpenPlayAreaScreenForSelection
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

GustOfWind_SwitchEffect:
; play whirlwind animation
	ld a, ATK_ANIM_GUST_OF_WIND
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

; input:
;	a = attack animation to play
Func_2fea9:
	ld [wLoadedAttackAnimation], a
	bank1call Func_7415
	lb bc, PLAY_AREA_ARENA, $0
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
HealPlayAreaCardHP:
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
