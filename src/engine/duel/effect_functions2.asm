FlyImmunityEffect2:	
	ldtx de, IfHeadsDoNotReceiveDamageOrEffectText
	farcall TossCoin_BankB
	ret nc
	ld a, ATK_ANIM_AGILITY_PROTECT
	ld [wLoadedAttackAnimation], a
	ld a, SUBSTATUS1_FLY
	farcall ApplySubstatus1ToDefendingCard
	ret

CrossAttackEffect2:
	ld hl, 40
	farcall LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	farcall TossCoinATimes_BankB
	jp nc, .NoDamage
	add a
	add a
	farcall ATimes10
	farcall SetDefiniteDamage
	ret
.NoDamage
	ld a, 0
	farcall SetDefiniteDamage
	farcall ConfusionEffect
	farcall PoisonEffect
	ret

FinalBlowEffect2:
	farcall CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	jr nz, .MoreThan31HP ; is this line bugged?
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	farcall GetTurnDuelistVariable
	cp 31
	jr c, .LessThan31HP
	jr nc, .MoreThan31HP 
	ret

.LessThan31HP
	ld a, ATK_ANIM_DRILL
	ld [wLoadedAttackAnimation], a
	ld a, 80
	farcall SetDefiniteDamage
	ret

.MoreThan31HP
	ld a, ATK_ANIM_DRILL
	ld [wLoadedAttackAnimation], a
	ld a, 40
	farcall SetDefiniteDamage
	ret

FinalBlowAIEffect2:
	farcall CheckCannotUseDueToStatus_OnlyToxicGasIfANon0
	jr nz, .MoreThan31HP
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	farcall GetTurnDuelistVariable
	cp 31
	jr c, .LessThan31HP
	jr nc, .MoreThan31HP 
	ret

.LessThan31HP
	ld a, 80
	farcall SetDefiniteAIDamage
	ret

.MoreThan31HP
	ld a, 40
	farcall SetDefiniteAIDamage
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

SpecialParalysisEffect2:
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	farcall GetTurnDuelistVariable
	cp 31
	jr c, .LessThan31HP
	jr nc, .MoreThan31HP 
	ret

.LessThan31HP
	farcall LoadTxRam3
	ldtx de, ParalysisIfAnyHeadsText
	ld a, 2
	farcall TossCoinATimes_BankB
	jp nc, .NoParalysis
	farcall ParalysisEffect
.NoParalysis
	ld a, ATK_ANIM_THUNDERBOLT
	ld [wLoadedAttackAnimation], a
	ld a, 50
	farcall SetDefiniteDamage
	ret

.MoreThan31HP
	farcall Paralysis50PercentEffect
	ld a, ATK_ANIM_THUNDER
	ld [wLoadedAttackAnimation], a
	ld a, 40
	farcall SetDefiniteDamage
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

PsysplashEffect:
	farcall SwapTurn
	call .DamageSameColorBench
	farcall SwapTurn
	ret

.DamageSameColorBench
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	farcall GetTurnDuelistVariable
	ld e, a
	ld d, PLAY_AREA_ARENA
	jr .next_bench

.check_damage
	push de
	ld e, d
	ld b, d
 	farcall GetPlayAreaCardAttachedEnergies
 	ld a, [wTotalAttachedEnergies]
 	farcall ATimes10
	ld e, a ; Switch this to e, a for real damage
 	ld d, 0
 	farcall DealDamageToPlayAreaPokemon_PsysplashAnim
	pop de

.next_bench
	inc d
	dec e
	jr nz, .check_damage
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
	ldtx hl, ChooseEeveelutionFromDeckText
	ldtx bc, Eeveelutiontext
	lb de, SEARCHEFFECT_EEVEELUTION, $00
	farcall LookForCardsInDeck
	ret c

; draw Deck list interface and print text
	bank1call Func_5591
	ldtx hl, ChooseAnEeveelutionText
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
	jr nz, .loop 

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

PresentEffect2:
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr c, .OneH
	jr nc, .OneT
	xor a
	ret
.OneH
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr c, .TwoH
	jr nc, .OneHOneT
	xor a
	ret
.OneT
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr c, .OneHOneT
	jr nc, .TwoT
	xor a
	ret
.OneHOneT
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr c, .TwoHOneT
	jr nc, .OneHTwoT
	xor a
	ret
.TwoT
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr c, .OneHTwoT
	farcall SwapTurn
	lb de, 0, 120
	call PresentHPRecovery
	farcall SwapTurn
	ret
.TwoH
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr nc, .TwoHOneT
	ld a, 70
	farcall SetDefiniteDamage
	ld a, ATK_ANIM_BIG_HIT
	ld [wLoadedAttackAnimation], a
	ret
.TwoHOneT
	farcall SwapTurn
	lb de, 0, 30
	call PresentHPRecovery
	farcall SwapTurn
	ret
.OneHTwoT
	ld a, 40
	farcall SetDefiniteDamage
	ld a, ATK_ANIM_HIT
	ld [wLoadedAttackAnimation], a
	ret

PresentHPRecovery:
	push de
	ld hl, wccbd
	ld [hl], e
	inc hl
	ld [hl], d

; get Arena card's damage
	ld e, PLAY_AREA_ARENA
	farcall GetCardDamageAndMaxHP
	pop de
	or a
	ret z ; return if no damage

; load correct animation
	push de
	ld a, ATK_ANIM_HEAL_OPP
	ld [wLoadedAttackAnimation], a
	lb bc, PLAY_AREA_ARENA, $1 ; arrow
	bank1call PlayAttackAnimation

; compare HP to be restored with max HP
; if HP to be restored would cause HP to
; be larger than max HP, cap it accordingly
	ld e, PLAY_AREA_ARENA
	farcall GetCardDamageAndMaxHP
	ld b, $00
	pop de
	ld a, DUELVARS_ARENA_CARD_HP
	farcall GetTurnDuelistVariable
	add e
	ld e, a
	ld a, 0
	adc d
	ld d, a
	; de = damage dealt + current HP
	; bc = max HP of card
	farcall CompareDEtoBC
	jr c, .skip_cap
	; cap de to value in bc
	ld e, c
	ld d, b

.skip_cap
	ld [hl], e ; apply new HP to arena card
	bank1call WaitAttackAnimation
	ret

NidorinaDoubleKick_MultiplierEffect2:
	ldtx de, PsyshockText
	farcall TossCoin_BankB
	ret nc
	ld a, 10
	farcall AddToDamage
	farcall ConfusionEffect
	ret

NidorinoDoubleKick_AIEffect2:
	ld a, (30 + 10) / 2
	lb de, 30, 40
	ret

PlayerForLSelectionHoohCEffect2:
	bank1call DrawDuelMainScene
	ldtx hl, HoohFLText
	farcall TwoItemHorizontalMenu
	ldh a, [hKeysHeld]
	and B_BUTTON
	ldh a, [hCurMenuItem]
	jr nz, PlayerForLSelectionHoohCEffect2
	ldh a, [hCurMenuItem]
	ldh [hTemp_ffa0], a
	;fallthrough

HoohSelectedFEffect2:
	ldh a, [hTemp_ffa0]
	or a
	jp z, FireSelected
	jp nz, LightningSelected
	ret

FireSelected:
	farcall PlayerPickFireEnergyCardToDiscard
	farcall Ember_DiscardEffect
	ld a, 0 ; =yes, loaded again for the after damage effect.
	ldh [hTemp_ffa0], a
	ret

LightningSelected:
	call PlayerPickLightningEnergyCardToDiscard
	farcall Ember_DiscardEffect
	ld a, 1 ; =no, loaded again for the after damage effect.
	ldh [hTemp_ffa0], a
	ret 

HoohMoreDamageEffect2:
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if no
	ld a, 20
	farcall AddToDamage
	ret

HoohRecoverEffect2:
	ldh a, [hTemp_ffa0]
	or a
	ret z ; return if yes
	ld de, 20
	farcall ApplyAndAnimateHPRecovery
	ret 

PlayerPickLightningEnergyCardToDiscard:
	call CreateListOfElectricEnergyAttachedToArena
	xor a
	bank1call DisplayEnergyDiscardScreen
	bank1call HandleEnergyDiscardMenuInput
	ldh a, [hTempCardIndex_ff98]
	ldh [hTempList], a
	ret

AIPickLightningEnergyCardToDiscard:
	call CreateListOfElectricEnergyAttachedToArena
	ld a, [wDuelTempList]
	ldh [hTempList], a ; pick first in list
	ret

Hooh_AISelectEffect2:
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	farcall GetTurnDuelistVariable ; checks self for hp
	cp 41
	jr c, .LessThan41HP ;reversed until testing done
	jr nc, .MoreThan41HP 

.LessThan41HP
	call AIPickLightningEnergyCardToDiscard
	farcall Ember_DiscardEffect
	ld a, 1
	ldh [hTemp_ffa0], a
	ret

.MoreThan41HP
	farcall AIPickFireEnergyCardToDiscard
	farcall Ember_DiscardEffect
	ld a, ATK_ANIM_DIVE_BOMB
	ld [wLoadedAttackAnimation], a
	ld a, 20
	farcall AddToDamage
	ld a, 0 ; =yes, loaded again for the after damage effect.
	ldh [hTemp_ffa0], a
	ret
