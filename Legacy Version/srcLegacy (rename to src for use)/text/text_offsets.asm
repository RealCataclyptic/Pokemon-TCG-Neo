	const_def 1

TextOffsets::
	dwb $0000, $00                                                 ; 0x0000
	textpointer HandText                                           ; 0x0001
	textpointer CheckText                                          ; 0x0002
	textpointer AttackText                                         ; 0x0003
	textpointer PKMNPowerText                                      ; 0x0004
	textpointer DoneText                                           ; 0x0005
	textpointer TypeText                                           ; 0x0006
	textpointer RetreatText                                        ; 0x0007
	textpointer WeaknessText                                       ; 0x0008
	textpointer ResistanceText                                     ; 0x0009
	textpointer PKMNPWRText                                        ; 0x000a
	textpointer RivalText                                     ; 0x000b
	textpointer LengthText                                         ; 0x000c
	textpointer WeightText                                         ; 0x000d
	textpointer PokemonText                                        ; 0x000e
	textpointer MetresText                                         ; 0x000f
	textpointer LbsText                                            ; 0x0010
	textpointer PromostarRarityText                                ; 0x0011
	textpointer CircleRarityText                                   ; 0x0012
	textpointer DiamondRarityText                                  ; 0x0013
	textpointer StarRarityText                                     ; 0x0014
	textpointer AllCardsOwnedText                                  ; 0x0015
	textpointer TotalNumberOfCardsText                             ; 0x0016
	textpointer TypesOfCardsText                                   ; 0x0017
	textpointer GrassPokemonText                                   ; 0x0018
	textpointer FirePokemonText                                    ; 0x0019
	textpointer WaterPokemonText                                   ; 0x001a
	textpointer LightningPokemonText                               ; 0x001b
	textpointer FightingPokemonText                                ; 0x001c
	textpointer PsychicPokemonText                                 ; 0x001d
	textpointer ColorlessPokemonText                               ; 0x001e
	textpointer TrainerCardText                                    ; 0x001f
	textpointer EnergyCardText                                     ; 0x0020
	textpointer DeckPrinterText                                    ; 0x0021
	textpointer CFNoTrainersorCFNtext                                     ; 0x0022
	textpointer NoPokemonOnTheBenchText                            ; 0x0023
	textpointer UnableDueToSleepText                               ; 0x0024
	textpointer UnableDueToParalysisText                           ; 0x0025
	textpointer Received10DamageDueToPoisonText                    ; 0x0026
	textpointer Received20DamageDueToPoisonText                    ; 0x0027
	textpointer IsStillAsleepText                                  ; 0x0028
	textpointer IsCuredOfSleepText                                 ; 0x0029
	textpointer IsCuredOfParalysisText                             ; 0x002a
	textpointer BetweenTurnsText                                   ; 0x002b
	textpointer UnableToUseItText                                  ; 0x002c
	textpointer NoEnergyCardsText                                  ; 0x002d
	textpointer IsThisOKText                                       ; 0x002e
	textpointer YesOrNoText                                        ; 0x002f
	textpointer DiscardName                                        ; 0x0030
	textpointer IncompleteText                                     ; 0x0031
	textpointer UnusedText0032                                     ; 0x0032
	textpointer UsedText                                           ; 0x0033
	textpointer DeepSleepText                                     ; 0x0034
	textpointer PokemonsAttackText                                 ; 0x0035
	textpointer ResistanceLessDamageText                           ; 0x0036
	textpointer WeaknessMoreDamageText                             ; 0x0037
	textpointer WeaknessMoreDamage2Text                            ; 0x0038
	textpointer ResistanceNoDamageText                             ; 0x0039
	textpointer AttackDamageText                                   ; 0x003a
	textpointer NoDamageText                                       ; 0x003b
	textpointer NoSelectableAttackText                             ; 0x003c
	textpointer UnableToRetreatText                                ; 0x003d
	textpointer MayOnlyAttachOneEnergyCardText                     ; 0x003e
	textpointer UseThisPokemonPowerText                            ; 0x003f
	textpointer PokemonPowerSelectNotRequiredText                  ; 0x0040
	textpointer DiscardDescription                                 ; 0x0041
	textpointer WillDrawNPrizesText                                ; 0x0042
	textpointer DrewNPrizesText                                    ; 0x0043
	textpointer DuelistPlacedACardText                             ; 0x0044
	textpointer UnableToSelectText                                 ; 0x0045
	textpointer ColorListText                                      ; 0x0046
	textpointer GrassSymbolText                                    ; 0x0047
	textpointer FireSymbolText                                     ; 0x0048
	textpointer WaterSymbolText                                    ; 0x0049
	textpointer LightningSymbolText                                ; 0x004a
	textpointer FightingSymbolText                                 ; 0x004b
	textpointer PsychicSymbolText                                  ; 0x004c
	textpointer BenchText                                          ; 0x004d
	textpointer KnockOutText                                       ; 0x004e
	textpointer DamageToSelfDueToConfusionText                     ; 0x004f
	textpointer ChooseEnergyCardToDiscardText                      ; 0x0050
	textpointer ChooseNextActivePokemonText                        ; 0x0051
	textpointer PressStartWhenReadyText                            ; 0x0052
	textpointer YouPlayFirstText                                   ; 0x0053
	textpointer YouPlaySecondText                                  ; 0x0054
	textpointer TransmissionErrorText                              ; 0x0055
	textpointer ChooseTheCardYouWishToExamineText                  ; 0x0056
	textpointer TransmittingDataText                               ; 0x0057
	textpointer WaitingHandExamineText                             ; 0x0058
	textpointer SelectingBenchPokemonHandExamineBackText           ; 0x0059
	textpointer RetreatedToTheBenchText                            ; 0x005a
	textpointer RetreatWasUnsuccessfulText                         ; 0x005b
	textpointer WillUseThePokemonPowerText                         ; 0x005c
	textpointer FinishedTurnWithoutAttackingText                   ; 0x005d
	textpointer DuelistTurnText                                    ; 0x005e
	textpointer AttachedEnergyToPokemonText                        ; 0x005f
	textpointer PokemonEvolvedIntoPokemonText                      ; 0x0060
	textpointer PlacedOnTheBenchText                               ; 0x0061
	textpointer PlacedInTheArenaText                               ; 0x0062
	textpointer ShufflesTheDeckText                                ; 0x0063
	textpointer ThisIsJustPracticeDoNotShuffleText                 ; 0x0064
	textpointer EachPlayerShuffleOpponentsDeckText                 ; 0x0065
	textpointer EachPlayerDraw7CardsText                           ; 0x0066
	textpointer Drew7CardsText                                     ; 0x0067
	textpointer DeckHasXCardsText                                  ; 0x0068
	textpointer ChooseBasicPkmnToPlaceInArenaText                  ; 0x0069
	textpointer ThereAreNoBasicPokemonInHand                       ; 0x006a
	textpointer NeitherPlayerHasBasicPkmnText                      ; 0x006b
	textpointer ReturnCardsToDeckAndDrawAgainText                  ; 0x006c
	textpointer ChooseUpTo5BasicPkmnToPlaceOnBenchText             ; 0x006d
	textpointer PleaseChooseAnActivePokemonText                    ; 0x006e
	textpointer ChooseYourBenchPokemonText                         ; 0x006f
	textpointer YouDrewText                                        ; 0x0070
	textpointer YouCannotSelectThisCardText                        ; 0x0071
	textpointer PlacingThePrizesText                               ; 0x0072
	textpointer PleasePlacePrizesText                              ; 0x0073
	textpointer IfHeadsDuelistPlaysFirstText                       ; 0x0074
	textpointer CoinTossToDecideWhoPlaysFirstText                  ; 0x0075
	textpointer DecisionText                                       ; 0x0076
	textpointer DuelWasADrawText                                   ; 0x0077
	textpointer WonDuelText                                        ; 0x0078
	textpointer LostDuelText                                       ; 0x0079
	textpointer StartSuddenDeathMatchText                          ; 0x007a
	textpointer PrizesLeftActivePokemonCardsInDeckText             ; 0x007b
	textpointer NoneText                                           ; 0x007c
	textpointer YesText                                            ; 0x007d
	textpointer CardsText                                          ; 0x007e
	textpointer TookAllThePrizesText                               ; 0x007f
	textpointer ThereAreNoPokemonInPlayAreaText                    ; 0x0080
	textpointer WasKnockedOutText                                  ; 0x0081
	textpointer HavePokemonPowerText                               ; 0x0082
	textpointer UnableToUsePkmnPowerDueToToxicGasText              ; 0x0083
	textpointer PlayCheck1Text                                     ; 0x0084
	textpointer PlayCheck2Text                                     ; 0x0085
	textpointer SelectCheckText                                    ; 0x0086
	textpointer CrossAttackEffectText                                     ; 0x0087
	textpointer DuelistIsThinkingText                              ; 0x0088
	textpointer ClearOpponentNameText                              ; 0x0089
	textpointer SelectComputerOpponentText                         ; 0x008a
	textpointer NumberOfPrizesText                                 ; 0x008b
	textpointer NoRetreatCFCheckText                                     ; 0x008c
	textpointer CantRetreatText                                      ; 0x008d
	textpointer UnusedText008e                                     ; 0x008e
	textpointer UnusedText008f                                     ; 0x008f
	textpointer UnusedText0090                                     ; 0x0090
	textpointer UnusedText0091                                     ; 0x0091
	textpointer Player2Text                                        ; 0x0092
	textpointer RandomStatusText                                     ; 0x0093
	textpointer UnusedText0094                                     ; 0x0094
	textpointer UnusedText0095                                     ; 0x0095
	textpointer UnusedText0096                                     ; 0x0096
	textpointer UnusedText0097                                     ; 0x0097
	textpointer UnusedText0098                                     ; 0x0098
	textpointer UnusedText0099                                     ; 0x0099
	textpointer UnusedText009a                                     ; 0x009a
	textpointer UnusedText009b                                     ; 0x009b
	textpointer UnusedText009c                                     ; 0x009c
	textpointer UnusedText009d                                     ; 0x009d
	textpointer UnusedText009e                                     ; 0x009e
	textpointer UnusedText009f                                     ; 0x009f
	textpointer UnusedText00a0                                     ; 0x00a0
	textpointer UnusedText00a1                                     ; 0x00a1
	textpointer ResetBackUpRamText                                 ; 0x00a2
	textpointer YourDataWasDestroyedSomehowText                    ; 0x00a3
	textpointer NoCardsInHandText                                  ; 0x00a4
	textpointer TheDiscardPileHasNoCardsText                       ; 0x00a5
	textpointer PlayerDiscardPileText                              ; 0x00a6
	textpointer DuelistHandText                                    ; 0x00a7
	textpointer DuelistPlayAreaText                                ; 0x00a8
	textpointer DuelistDeckText                                    ; 0x00a9
	textpointer PleaseSelectHandText                               ; 0x00aa
	textpointer PleaseSelectCardText                               ; 0x00ab
	textpointer NoPokemonWithDamageCountersText                    ; 0x00ac
	textpointer NoDamageCountersText                               ; 0x00ad
	textpointer NoEnergyAttachedToOpponentsActiveText              ; 0x00ae
	textpointer ThereAreNoEnergyCardsInDiscardPileText             ; 0x00af
	textpointer ThereAreNoBasicEnergyCardsInDiscardPileText        ; 0x00b0
	textpointer NoCardsLeftInTheDeckText                           ; 0x00b1
	textpointer NoSpaceOnTheBenchText                              ; 0x00b2
	textpointer NoPokemonCapableOfEvolvingText                     ; 0x00b3
	textpointer CantEvolvePokemonInSameTurnItsPlacedText           ; 0x00b4
	textpointer NotAffectedByPoisonSleepParalysisOrConfusionText   ; 0x00b5
	textpointer NotEnoughCardsInHandText                           ; 0x00b6
	textpointer EffectNoPokemonOnTheBenchText                      ; 0x00b7
	textpointer ThereAreNoPokemonInDiscardPileText                 ; 0x00b8
	textpointer ConditionsForEvolvingToStage2NotFulfilledText      ; 0x00b9
	textpointer ThereAreNoCardsInHandThatYouCanChangeText          ; 0x00ba
	textpointer ThereAreNoCardsInTheDiscardPileText                ; 0x00bb
	textpointer ThereAreNoStage1PokemonText                        ; 0x00bc
	textpointer NoEnergyCardsAttachedToPokemonInYourPlayAreaText   ; 0x00bd
	textpointer NoEnergyCardsAttachedToPokemonInOppPlayAreaText    ; 0x00be
	textpointer EnergyCardsRequiredToRetreatText                   ; 0x00bf
	textpointer NotEnoughEnergyCardsText                           ; 0x00c0
	textpointer NotEnoughFireEnergyText                            ; 0x00c1
	textpointer NotEnoughPsychicEnergyText                         ; 0x00c2
	textpointer NotEnoughWaterEnergyText                           ; 0x00c3
	textpointer ThereAreNoTrainerCardsInDiscardPileText            ; 0x00c4
	textpointer NoAttackMayBeChosenText                           ; 0x00c5
	textpointer YouDidNotReceiveAnAttackToMirrorMoveText           ; 0x00c6
	textpointer ThisAttackCannotBeUsedTwiceText                    ; 0x00c7
	textpointer NoWeaknessText                                     ; 0x00c8
	textpointer NoResistanceText                                   ; 0x00c9
	textpointer OnlyOncePerTurnText                                ; 0x00ca
	textpointer CannotUseDueToStatusText                           ; 0x00cb
	textpointer CannotBeUsedInTurnWhichWasPlayedText               ; 0x00cc
	textpointer ThereIsNoEnergyCardAttachedText                    ; 0x00cd
	textpointer NoGrassEnergyText                                  ; 0x00ce
	textpointer CannotUseSinceTheresOnly1PkmnText                  ; 0x00cf
	textpointer CannotUseBecauseItWillBeKnockedOutText             ; 0x00d0
	textpointer CanOnlyBeUsedOnTheBenchText                        ; 0x00d1
	textpointer ThereAreNoPokemonOnBenchText                       ; 0x00d2
	textpointer OpponentIsNotAsleepText                            ; 0x00d3
	textpointer UnableDueToToxicGasText                            ; 0x00d4
	textpointer UnusedText00d5                                     ; 0x00d5
	textpointer BackUpIsBrokenText                                 ; 0x00d6
	textpointer PrinterIsNotConnectedText                          ; 0x00d7
	textpointer BatteriesHaveLostTheirChargeText                   ; 0x00d8
	textpointer PrinterPaperIsJammedText                           ; 0x00d9
	textpointer CheckCableOrPrinterSwitchText                      ; 0x00da
	textpointer PrinterPacketErrorText                             ; 0x00db
	textpointer PrintingWasInterruptedText                         ; 0x00dc
	textpointer CardPopCannotBePlayedWithTheGameBoyText            ; 0x00dd
	textpointer SandAttackCheckText                                ; 0x00de
	textpointer SmokescreenCheckText                               ; 0x00df
	textpointer ParalysisCheckText                                 ; 0x00e0
	textpointer SleepCheckText                                     ; 0x00e1
	textpointer PoisonCheckText                                    ; 0x00e2
	textpointer ConfusionCheckText                                 ; 0x00e3
	textpointer VenomPowderCheckText                               ; 0x00e4
	textpointer IfTailsYourPokemonBecomesConfusedText              ; 0x00e5
	textpointer DamageCheckIfTailsNoDamageText                     ; 0x00e6
	textpointer IfHeadsDraw1CardFromDeckText                       ; 0x00e7
	textpointer FlipUntilFailAppears10DamageForEachHeadsText       ; 0x00e8
	textpointer IfHeadPlus10IfTails10ToYourselfText                ; 0x00e9
	textpointer DamageToOppBenchIfHeadsDamageToYoursIfTailsText    ; 0x00ea
	textpointer IfHeadsChangeOpponentsActivePokemonText            ; 0x00eb
	textpointer IfHeadsHealIsSuccessfulText                        ; 0x00ec
	textpointer IfTailsDamageToYourselfTooText                     ; 0x00ed
	textpointer SuccessCheckIfHeadsAttackIsSuccessfulText          ; 0x00ee
	textpointer TrainerCardSuccessCheckText                        ; 0x00ef
	textpointer CardCheckIfHeads8CardsIfTails1CardText             ; 0x00f0
	textpointer IfHeadsNoDamageNextTurnText                        ; 0x00f1
	textpointer UnusedText00f2                                     ; 0x00f2
	textpointer DamageCheckIfHeadsPlusDamageText                   ; 0x00f3
	textpointer DamageCheckIfHeadsXDamageText                      ; 0x00f4
	textpointer AcidCheckText                                      ; 0x00f5
	textpointer TransparencyCheckText                              ; 0x00f6
	textpointer ConfusionCheckDamageText                           ; 0x00f7
	textpointer ConfusionCheckRetreatText                          ; 0x00f8
	textpointer PokemonsSleepCheckText                             ; 0x00f9
	textpointer PoisonedIfHeadsConfusedIfTailsText                 ; 0x00fa
	textpointer IfHeadsDoNotReceiveDamageOrEffectText              ; 0x00fb
	textpointer IfHeadsOpponentCannotAttackText                    ; 0x00fc
	textpointer AttackUnsuccessfulText                             ; 0x00fd
	textpointer UnableToRetreatDueToAcidText                       ; 0x00fe
	textpointer UnableToUseTrainerDueToHeadacheText                ; 0x00ff
	textpointer UnableToAttackDueToTailWagText                     ; 0x0100
	textpointer UnableToAttackDueToLeerText                        ; 0x0101
	textpointer UnableToAttackDueToBoneAttackText                  ; 0x0102
	textpointer UnableToUseAttackDueToAmnesiaText                  ; 0x0103
	textpointer KnockedOutDueToDestinyBondText                     ; 0x0104
	textpointer ReceivesDamageDueToStrikesBackText                 ; 0x0105
	textpointer UnableToEvolveDueToPrehistoricPowerText            ; 0x0106
	textpointer NoDamageOrEffectDueToFlyText                       ; 0x0107
	textpointer NoDamageOrEffectDueToBarrierText                   ; 0x0108
	textpointer NoDamageOrEffectDueToAgilityText                   ; 0x0109
	textpointer UnableToUseAttackDueToNShieldText                  ; 0x010a
	textpointer NoDamageOrEffectDueToNShieldText                   ; 0x010b
	textpointer NoDamageOrEffectDueToTransparencyText              ; 0x010c
	textpointer MetamorphsToText                                   ; 0x010d
	textpointer SelectPkmnOnBenchToSwitchWithActiveText            ; 0x010e
	textpointer SelectPokemonToPlaceInTheArenaText                 ; 0x010f
	textpointer DuelistIsSelectingPokemonToPlaceInArenaText        ; 0x0110
	textpointer ChooseWeaknessYouWishToChangeText                  ; 0x0111
	textpointer ChooseResistanceYouWishToChangeText                ; 0x0112
	textpointer ChoosePokemonWishToColorChangeText                 ; 0x0113
	textpointer ChangedTheWeaknessOfPokemonToColorText             ; 0x0114
	textpointer ChangedTheResistanceOfPokemonToColorText           ; 0x0115
	textpointer ChangedTheColorOfText                              ; 0x0116
	textpointer Draw1CardFromTheDeckText                           ; 0x0117
	textpointer DrawCardsFromTheDeckText                           ; 0x0118
	textpointer CannotDrawCardBecauseNoCardsInDeckText             ; 0x0119
	textpointer ChoosePkmnInTheBenchToGiveDamageText               ; 0x011a
	textpointer ChooseUpTo3PkmnOnBenchToGiveDamageText             ; 0x011b
	textpointer Choose1BasicEnergyCardFromDeckText                 ; 0x011c
	textpointer ChoosePokemonToAttachEnergyCardText                ; 0x011d
	textpointer UnusedText011e                                     ; 0x011e
	textpointer ChooseAndDiscard2FireEnergyCardsText               ; 0x011f
	textpointer DiscardOppDeckAsManyFireEnergyCardsText            ; 0x0120
	textpointer ChooseAndDiscard2EnergyCardsText                   ; 0x0121
	textpointer ChooseAKrabbyFromDeckText                          ; 0x0122
	textpointer ChooseDiscardEnergyCardFromOpponentText            ; 0x0123
	textpointer ChooseAttackOpponentWillNotBeAbleToUseText         ; 0x0124
	textpointer ChooseBasicFightingPokemonFromDeckText             ; 0x0125
	textpointer ChooseAnOddishFromDeckText                         ; 0x0126
	textpointer ChooseAnOddishText                                 ; 0x0127
	textpointer ChooseAKrabbyText                                  ; 0x0128
	textpointer ChooseBasicEnergyCardText                          ; 0x0129
	textpointer ChooseNidoranFromDeckText                          ; 0x012a
	textpointer ChooseNidoranText                                  ; 0x012b
	textpointer ChooseBasicFightingPokemonText                     ; 0x012c
	textpointer ProcedureForEnergyTransferText                     ; 0x012d
	textpointer ChooseABellsproutFromDeckText                      ; 0x012e
	textpointer ChooseABellsproutText                              ; 0x012f
	textpointer ChoosePkmnToRemoveDamageCounterText                ; 0x0130
	textpointer ProcedureForCurseText                              ; 0x0131
	textpointer Choose2EnergyCardsFromDiscardPileToAttachText      ; 0x0132
	textpointer Choose2EnergyCardsFromDiscardPileForHandText       ; 0x0133
	textpointer ChooseAnEnergyCardText                             ; 0x0134
	textpointer ProcedureForProphecyText                           ; 0x0135
	textpointer ChooseTheOrderOfTheCardsText                       ; 0x0136
	textpointer ProcedureForDamageSwapText                         ; 0x0137
	textpointer ProcedureForDevolutionBeamText                     ; 0x0138
	textpointer ProcedureForStrangeBehaviorText                    ; 0x0139
	textpointer ChooseOppAttackToBeUsedWithMetronomeText           ; 0x013a
	textpointer ThereIsNoInTheDeckText                             ; 0x013b
	textpointer WouldYouLikeToCheckTheDeckText                     ; 0x013c
	textpointer PleaseSelectTheDeckText                            ; 0x013d
	textpointer PleaseSelectThePlayAreaText                        ; 0x013e
	textpointer NidoranMNidoranFText                               ; 0x013f
	textpointer OddishText                                         ; 0x0140
	textpointer BellsproutText                                     ; 0x0141
	textpointer KrabbyText                                         ; 0x0142
	textpointer FightingPokemonDeckText                            ; 0x0143
	textpointer BasicEnergyText                                    ; 0x0144
	textpointer PeekWasUsedToLookInYourHandText                    ; 0x0145
	textpointer CardPeekWasUsedOnText                              ; 0x0146
	textpointer PokemonAndAllAttachedCardsReturnedToHandText       ; 0x0147
	textpointer WasChosenForTheEffectOfAmnesiaText                 ; 0x0148
	textpointer BasicPokemonWasPlacedOnEachBenchText               ; 0x0149
	textpointer WasUnsuccessfulText                                ; 0x014a
	textpointer ThereWasNoEffectFromTxRam2Text                     ; 0x014b
	textpointer TheEnergyCardFromPlayAreaWasMovedText              ; 0x014c
	textpointer DrewFireEnergyFromTheHandText                      ; 0x014d
	textpointer ThePkmnCardsInHandAndDeckWereShuffledText          ; 0x014e
	textpointer UnusedText014f                                     ; 0x014f
	textpointer ChoosePokemonToRemoveDamageCounterFromText         ; 0x0150
	textpointer ChooseCardToDiscardFromHandText                    ; 0x0151
	textpointer ChoosePokemonToRemoveEnergyFromText                ; 0x0152
	textpointer Choose2BasicEnergyCardsFromDiscardPileText         ; 0x0153
	textpointer UnusedText0154                                     ; 0x0154
	textpointer Choose2CardsFromHandToDiscardText                  ; 0x0155
	textpointer Choose2HandCardsFromHandToReturnToDeckText         ; 0x0156
	textpointer ChooseCardToPlaceInHandText                        ; 0x0157
	textpointer ChoosePokemonToAttachDefenderToText                ; 0x0158
	textpointer UnusedText0159                                     ; 0x0159
	textpointer ChoosePokemonToReturnToTheDeckText                 ; 0x015a
	textpointer ChoosePokemonToPlaceInPlayText                     ; 0x015b
	textpointer ChooseBasicPokemonToEvolveText                     ; 0x015c
	textpointer ChoosePokemonToScoopUpText                         ; 0x015d
	textpointer ChooseCardFromYourHandToSwitchText                 ; 0x015e
	textpointer ChooseCardToSwitchText                             ; 0x015f
	textpointer ChooseBasicOrEvolutionPokemonCardFromDeckText      ; 0x0160
	textpointer ChoosePokemonCardText                              ; 0x0161
	textpointer RearrangeThe5CardsAtTopOfDeckText                  ; 0x0162
	textpointer PleaseCheckTheOpponentsHandText                    ; 0x0163
	textpointer EvolutionCardText                                  ; 0x0164
	textpointer CardWasChosenText                                  ; 0x0165
	textpointer ChooseBasicPokemonToPlaceOnBenchText               ; 0x0166
	textpointer ChooseEvolutionCardAndPressAButtonToDevolveText    ; 0x0167
	textpointer ChoosePokemonInYourAreaThenPokemonInYourOppText    ; 0x0168
	textpointer ChooseUpTo4FromDiscardPileText                     ; 0x0169
	textpointer ChooseAPokemonToSwitchWithActivePokemonText        ; 0x016a
	textpointer PokemonAndAllAttachedCardsWereReturnedToDeckText   ; 0x016b
	textpointer PokemonWasReturnedFromArenaToHandText              ; 0x016c
	textpointer PokemonWasReturnedFromBenchToHandText              ; 0x016d
	textpointer PokemonWasReturnedToDeckText                       ; 0x016e
	textpointer WasPlacedInTheHandText                             ; 0x016f
	textpointer TheCardYouReceivedText                             ; 0x0170
	textpointer YouReceivedTheseCardsText                          ; 0x0171
	textpointer ChooseTheCardToPutBackText                         ; 0x0172
	textpointer ChooseTheCardToDiscardText                         ; 0x0173
	textpointer DiscardedCardsFromDeckText                         ; 0x0174
	textpointer UnusedText0175                                     ; 0x0175
	textpointer NoneCameText                                       ; 0x0176
	textpointer CameToTheBenchText                                 ; 0x0177
	textpointer DuelistHasNoCardsInHandText                        ; 0x0178
	textpointer PokemonHealedDamageText                            ; 0x0179
	textpointer PokemonDevolvedToText                              ; 0x017a
	textpointer ThereWasNoFireEnergyText                           ; 0x017b
	textpointer YouCanSelectMoreCardsQuitText                      ; 0x017c
	textpointer ThereWasNoEffectText                               ; 0x017d
	textpointer ThereWasNoEffectFromToxicText                      ; 0x017e
	textpointer ThereWasNoEffectFromPoisonText                     ; 0x017f
	textpointer ThereWasNoEffectFromSleepText                      ; 0x0180
	textpointer ThereWasNoEffectFromParalysisText                  ; 0x0181
	textpointer ThereWasNoEffectFromConfusionText                  ; 0x0182
	textpointer ThereWasNoEffectFromPoisonConfusionText            ; 0x0183
	textpointer ExchangedCardsInDuelistsHandText                   ; 0x0184
	textpointer UnusedText0185                                     ; 0x0185
	textpointer PrizesCardsText                                    ; 0x0186
	textpointer ChooseTheNumberOfPrizesText                        ; 0x0187
	textpointer PleaseWaitDecidingNumberOfPrizesText               ; 0x0188
	textpointer BeginAPrizeDuelWithText                            ; 0x0189
	textpointer AreYouBothReadyToCardPopText                       ; 0x018a
	textpointer ThePopWasntSuccessfulText                          ; 0x018b
	textpointer CannotCardPopWithFriendPreviouslyPoppedWithText    ; 0x018c
	textpointer PositionGameBoyColorsAndPressAButtonText           ; 0x018d
	textpointer ReceivedThroughCardPopText                         ; 0x018e
	textpointer ReceivedCardText                                   ; 0x018f
	textpointer ReceivedPromotionalCardText                        ; 0x0190
	textpointer ReceivedLegendaryCardText                          ; 0x0191
	textpointer ReceivedPromotionalFlyingPikachuText               ; 0x0192
	textpointer ReceivedPromotionalSurfingPikachuText              ; 0x0193
	textpointer UnusedText0194                                     ; 0x0194
	textpointer NowPrintingPleaseWaitText                          ; 0x0195
	textpointer BoosterPackText                                    ; 0x0196
	textpointer WouldYouLikeToTryAgainText                         ; 0x0197
	textpointer UnusedText0198                                     ; 0x0198
	textpointer UnusedText0199                                     ; 0x0199
	textpointer SendingACardText                                   ; 0x019a
	textpointer ReceivingACardText                                 ; 0x019b
	textpointer SendingADeckConfigurationText                      ; 0x019c
	textpointer ReceivingDeckConfigurationText                     ; 0x019d
	textpointer CardTransferWasntSuccessful1Text                   ; 0x019e
	textpointer CardTransferWasntSuccessful2Text                   ; 0x019f
	textpointer DeckConfigurationTransferWasntSuccessful1Text      ; 0x01a0
	textpointer DeckConfigurationTransferWasntSuccessful2Text      ; 0x01a1
	textpointer NowPrintingText                                    ; 0x01a2
	textpointer DrMasonText                                        ; 0x01a3
	textpointer DrawSevenCardsPracticeDuelText                     ; 0x01a4
	textpointer ChooseGoldeenPracticeDuelText                      ; 0x01a5
	textpointer PutPokemonOnBenchPracticeDuelText                  ; 0x01a6
	textpointer ChooseStaryuPracticeDuelText                       ; 0x01a7
	textpointer PressBToFinishPracticeDuelText                     ; 0x01a8
	textpointer Turn1Instr1PracticeDuelText                        ; 0x01a9
	textpointer Turn1Instr2PracticeDuelText                        ; 0x01aa
	textpointer Turn1Instr3PracticeDuelText                        ; 0x01ab
	textpointer Turn2Instr1PracticeDuelText                        ; 0x01ac
	textpointer Turn2Instr2PracticeDuelText                        ; 0x01ad
	textpointer Turn2Instr3PracticeDuelText                        ; 0x01ae
	textpointer Turn3Instr1PracticeDuelText                        ; 0x01af
	textpointer Turn3Instr2PracticeDuelText                        ; 0x01b0
	textpointer Turn3Instr3PracticeDuelText                        ; 0x01b1
	textpointer Turn4Instr1PracticeDuelText                        ; 0x01b2
	textpointer Turn4Instr2PracticeDuelText                        ; 0x01b3
	textpointer Turn4Instr3PracticeDuelText                        ; 0x01b4
	textpointer Turn5Instr1PracticeDuelText                        ; 0x01b5
	textpointer Turn5Instr2PracticeDuelText                        ; 0x01b6
	textpointer Turn6Instr1PracticeDuelText                        ; 0x01b7
	textpointer Turn6Instr2PracticeDuelText                        ; 0x01b8
	textpointer Turn6Instr3PracticeDuelText                        ; 0x01b9
	textpointer Turn7Instr1PracticeDuelText                        ; 0x01ba
	textpointer Turn7Instr2PracticeDuelText                        ; 0x01bb
	textpointer Turn8Instr1PracticeDuelText                        ; 0x01bc
	textpointer Turn8Instr2PracticeDuelText                        ; 0x01bd
	textpointer SamTurn4Instr1PracticeDuelText                     ; 0x01be
	textpointer SamTurn4Instr2PracticeDuelText                     ; 0x01bf
	textpointer Turn1DrMason1PracticeDuelText                      ; 0x01c0
	textpointer Turn1DrMason2PracticeDuelText                      ; 0x01c1
	textpointer Turn1DrMason3PracticeDuelText                      ; 0x01c2
	textpointer Turn2DrMason1PracticeDuelText                      ; 0x01c3
	textpointer Turn2DrMason2PracticeDuelText                      ; 0x01c4
	textpointer Turn2DrMason3PracticeDuelText                      ; 0x01c5
	textpointer Turn3DrMason1PracticeDuelText                      ; 0x01c6
	textpointer Turn3DrMason2PracticeDuelText                      ; 0x01c7
	textpointer Turn3DrMason3PracticeDuelText                      ; 0x01c8
	textpointer Turn4DrMason1PracticeDuelText                      ; 0x01c9
	textpointer Turn4DrMason2PracticeDuelText                      ; 0x01ca
	textpointer Turn4DrMason3PracticeDuelText                      ; 0x01cb
	textpointer Turn5DrMason1PracticeDuelText                      ; 0x01cc
	textpointer Turn5DrMason2PracticeDuelText                      ; 0x01cd
	textpointer Turn6DrMason1PracticeDuelText                      ; 0x01ce
	textpointer Turn6DrMason2PracticeDuelText                      ; 0x01cf
	textpointer Turn6DrMason3PracticeDuelText                      ; 0x01d0
	textpointer Turn7DrMason1PracticeDuelText                      ; 0x01d1
	textpointer Turn7DrMason2PracticeDuelText                      ; 0x01d2
	textpointer Turn8DrMason1PracticeDuelText                      ; 0x01d3
	textpointer Turn8DrMason2PracticeDuelText                      ; 0x01d4
	textpointer SamTurn4DrMason1PracticeDuelText                   ; 0x01d5
	textpointer SamTurn4DrMason2PracticeDuelText                   ; 0x01d6
	textpointer SelectStaryuPracticeDuelText                       ; 0x01d7
	textpointer LetsPlayTheGamePracticeDuelText                    ; 0x01d8
	textpointer NeedPracticeAgainPracticeDuelText                  ; 0x01d9
	textpointer FollowMyGuidancePracticeDuelText                   ; 0x01da
	textpointer PlayersTurnPracticeDuelText                        ; 0x01db
	textpointer ReplaceDueToKnockoutPracticeDuelText               ; 0x01dc
	textpointer UnusedText01dd                                     ; 0x01dd
	textpointer PracticePlayerDeckName                             ; 0x01de
	textpointer SamsPracticeDeckName                               ; 0x01df
	textpointer CharmanderAndFriendsDeckName                       ; 0x01e0
	textpointer CharmanderExtraDeckName                            ; 0x01e1
	textpointer SquirtleAndFriendsDeckName                         ; 0x01e2
	textpointer SquirtleExtraDeckName                              ; 0x01e3
	textpointer BulbasaurAndFriendsDeckName                        ; 0x01e4
	textpointer BulbasaurExtraDeckName                             ; 0x01e5
	textpointer FirstStrikeDeckName                                ; 0x01e6
	textpointer RockCrusherDeckName                                ; 0x01e7
	textpointer GoGoRainDanceDeckName                              ; 0x01e8
	textpointer ZappingSelfdestructDeckName                        ; 0x01e9
	textpointer FlowerPowerDeckName                                ; 0x01ea
	textpointer StrangePsyshockDeckName                            ; 0x01eb
	textpointer WondersofScienceDeckName                           ; 0x01ec
	textpointer FireChargeDeckName                                 ; 0x01ed
	textpointer LegendaryMoltresDeckName                           ; 0x01ee
	textpointer LegendaryZapdosDeckName                            ; 0x01ef
	textpointer LegendaryArticunoDeckName                          ; 0x01f0
	textpointer LegendaryDragoniteDeckName                         ; 0x01f1
	textpointer ImRonaldDeckName                                   ; 0x01f2
	textpointer PowerfulRonaldDeckName                             ; 0x01f3
	textpointer InvincibleRonaldDeckName                           ; 0x01f4
	textpointer LegendaryRonaldDeckName                            ; 0x01f5
	textpointer WaterfrontPokemonDeckName                          ; 0x01f6
	textpointer LonelyFriendsDeckName                              ; 0x01f7
	textpointer SoundoftheWavesDeckName                            ; 0x01f8
	textpointer AngerDeckName                                      ; 0x01f9
	textpointer FlamethrowerDeckName                               ; 0x01fa
	textpointer ReshuffleDeckName                                  ; 0x01fb
	textpointer ExcavationDeckName                                 ; 0x01fc
	textpointer BlisteringPokemonDeckName                          ; 0x01fd
	textpointer HardPokemonDeckName                                ; 0x01fe
	textpointer EtceteraDeckName                                   ; 0x01ff
	textpointer FlowerGardenDeckName                               ; 0x0200
	textpointer KaleidoscopeDeckName                               ; 0x0201
	textpointer MusclesforBrainsDeckName                           ; 0x0202
	textpointer HeatedBattleDeckName                               ; 0x0203
	textpointer LovetoBattleDeckName                               ; 0x0204
	textpointer PikachuDeckName                                    ; 0x0205
	textpointer BoomBoomSelfdestructDeckName                       ; 0x0206
	textpointer PowerGeneratorDeckName                             ; 0x0207
	textpointer GhostDeckName                                      ; 0x0208
	textpointer NapTimeDeckName                                    ; 0x0209
	textpointer StrangePowerDeckName                               ; 0x020a
	textpointer FlyinPokemonDeckName                               ; 0x020b
	textpointer LovelyNidoranDeckName                              ; 0x020c
	textpointer PoisonDeckName                                     ; 0x020d
	textpointer ImakuniDeckName                                    ; 0x020e
	textpointer LightningAndFireDeckName                           ; 0x020f
	textpointer WaterAndFightingDeckName                           ; 0x0210
	textpointer GrassAndPsychicDeckName                            ; 0x0211
	textpointer RetreatCostText                                    ; 0x0212
	textpointer UnusedText0213                                     ; 0x0213
	textpointer UnusedText0214                                     ; 0x0214
	textpointer FeetText                                           ; 0x0215
	textpointer InchesText                                         ; 0x0216
	textpointer YourDiscardPileText                                ; 0x0217
	textpointer OpponentsDiscardPileText                           ; 0x0218
	textpointer DeckText                                           ; 0x0219
	textpointer UnusedText021a                                     ; 0x021a
	textpointer UnusedText021b                                     ; 0x021b
	textpointer UnusedText021c                                     ; 0x021c
	textpointer EndText                                            ; 0x021d
	textpointer WhatIsYourNameText                                 ; 0x021e
	textpointer UnusedText021f                                     ; 0x021f
	textpointer UnusedText0220                                     ; 0x0220
	textpointer PlayerNameKeyboardText                             ; 0x0221
	textpointer DeckNameKeyboardText                               ; 0x0222
	textpointer NewDeckText                                        ; 0x0223
	textpointer PleaseSelectDeckText                               ; 0x0224
	textpointer ModifyDeckText                                     ; 0x0225
	textpointer ChangeNameText                                     ; 0x0226
	textpointer SelectDeckText                                     ; 0x0227
	textpointer CancelText                                         ; 0x0228
	textpointer UnusedText0229                                     ; 0x0229
	textpointer ChosenAsDuelingDeckText                            ; 0x022a
	textpointer Deck1Text                                          ; 0x022b
	textpointer Deck2Text                                          ; 0x022c
	textpointer Deck3Text                                          ; 0x022d
	textpointer Deck4Text                                          ; 0x022e
	textpointer ThereIsNoDeckHereText                              ; 0x022f
	textpointer ConfirmText                                        ; 0x0230
	textpointer DismantleText                                      ; 0x0231
	textpointer ModifyText                                         ; 0x0232
	textpointer SaveText                                           ; 0x0233
	textpointer NameText                                           ; 0x0234
	textpointer ThereIsOnly1DeckSoCannotBeDismantledText           ; 0x0235
	textpointer ThereAreNoBasicPokemonInThisDeckText               ; 0x0236
	textpointer YouMustIncludeABasicPokemonInTheDeckText           ; 0x0237
	textpointer ThisIsntA60CardDeckText                            ; 0x0238
	textpointer TheDeckMustInclude60CardsText                      ; 0x0239
	textpointer ReturnToOriginalConfigurationText                  ; 0x023a
	textpointer SaveThisDeckText                                   ; 0x023b
	textpointer QuitModifyingTheDeckText                           ; 0x023c
	textpointer DismantleThisDeckText                              ; 0x023d
	textpointer NoCardsChosenText                                  ; 0x023e
	textpointer YourPokemonText                                    ; 0x023f
	textpointer YourDiscardPileText2                               ; 0x0240
	textpointer YourHandText                                       ; 0x0241
	textpointer UnusedText0242                                     ; 0x0242
	textpointer OpponentsPokemonText                               ; 0x0243
	textpointer OpponentsDiscardPileText2                          ; 0x0244
	textpointer OpponentsHandText                                  ; 0x0245
	textpointer UnusedText0246                                     ; 0x0246
	textpointer DuelistsPlayAreaText                               ; 0x0247
	textpointer YourPlayAreaText                                   ; 0x0248
	textpointer OppPlayAreaText                                    ; 0x0249
	textpointer InPlayAreaText                                     ; 0x024a
	textpointer GlossaryText                                       ; 0x024b
	textpointer WhichCardWouldYouLikeToSeeText                     ; 0x024c
	textpointer PleaseChooseAPrizeText                             ; 0x024d
	textpointer HandText_2                                         ; 0x024e
	textpointer DuelistHandText_2                                  ; 0x024f
	textpointer DuelistDiscardPileText                             ; 0x0250
	textpointer EmptyLineText                                      ; 0x0251
	textpointer BoosterPackTitleText                               ; 0x0252
	textpointer Item1ColosseumText                                 ; 0x0253
	textpointer Item2EvolutionText                                 ; 0x0254
	textpointer Item3MysteryText                                   ; 0x0255
	textpointer Item4LaboratoryText                                ; 0x0256
	textpointer Item5PromotionalCardText                           ; 0x0257
	textpointer ViewWhichCardFileText                              ; 0x0258
	textpointer EmptyPromotionalCardText                           ; 0x0259
	textpointer SCardsText                                         ; 0x025a
	textpointer EmptyDeckNameText                                  ; 0x025b
	textpointer DeckSaveMachineText                                ; 0x025c
	textpointer SaveADeckText                                      ; 0x025d
	textpointer DeleteADeckText                                    ; 0x025e
	textpointer BuildADeckText                                     ; 0x025f
	textpointer ChooseADeckToSaveText                              ; 0x0260
	textpointer UnusedText0261                                     ; 0x0261
	textpointer UnusedText0262                                     ; 0x0262
	textpointer SavedTheConfigurationForText                       ; 0x0263
	textpointer NoDeckIsSavedText                                  ; 0x0264
	textpointer UnusedText0265                                     ; 0x0265
	textpointer DoYouReallyWishToDeleteText                        ; 0x0266
	textpointer DeletedTheConfigurationForText                     ; 0x0267
	textpointer YouMayOnlyCarry4DecksText                          ; 0x0268
	textpointer ChooseADeckToDismantleText                         ; 0x0269
	textpointer DismantledDeckText                                 ; 0x026a
	textpointer UnusedText026b                                     ; 0x026b
	textpointer ThisDeckCanOnlyBeBuiltIfYouDismantleText           ; 0x026c
	textpointer YouDoNotOwnAllCardsNeededToBuildThisDeckText       ; 0x026d
	textpointer BuiltDeckText                                      ; 0x026e
	textpointer TheseCardsAreNeededToBuildThisDeckText             ; 0x026f
	textpointer DismantleTheseDecksText                            ; 0x0270
	textpointer DismantledTheDeckText                              ; 0x0271
	textpointer OKIfFileDeletedText                                ; 0x0272
	textpointer ReadTheInstructionsText                            ; 0x0273
	textpointer PrintThisCardYesNoText                             ; 0x0274
	textpointer PleaseChooseDeckConfigurationToPrintText           ; 0x0275
	textpointer PrintThisDeckText                                  ; 0x0276
	textpointer PrintTheCardListText                               ; 0x0277
	textpointer PrintMenuItemsText                                 ; 0x0278
	textpointer WhatWouldYouLikeToPrintText                        ; 0x0279
	textpointer PleaseSetTheContrastText                           ; 0x027a
	textpointer PleaseMakeSureToTurnGameBoyPrinterOffText          ; 0x027b
	textpointer ProceduresForSendingCardsText                      ; 0x027c
	textpointer CardSendingProceduresText                          ; 0x027d
	textpointer PleaseReadTheProceduresForSendingCardsText         ; 0x027e
	textpointer SendText                                           ; 0x027f
	textpointer CardReceivedText                                   ; 0x0280
	textpointer CardToSendText                                     ; 0x0281
	textpointer SendTheseCardsText                                 ; 0x0282
	textpointer ReceivedTheseCardsFromText                         ; 0x0283
	textpointer PleaseChooseADeckConfigurationToSendText           ; 0x0284
	textpointer PleaseChooseASaveSlotText                          ; 0x0285
	textpointer UnusedText0286                                     ; 0x0286
	textpointer ReceivedADeckConfigurationFromText                 ; 0x0287
	textpointer FightingMachineText                                ; 0x0288
	textpointer RockMachineText                                    ; 0x0289
	textpointer WaterMachineText                                   ; 0x028a
	textpointer LightningMachineText                               ; 0x028b
	textpointer GrassMachineText                                   ; 0x028c
	textpointer PsychicMachineText                                 ; 0x028d
	textpointer ScienceMachineText                                 ; 0x028e
	textpointer FireMachineText                                    ; 0x028f
	textpointer AutoMachineText                                    ; 0x0290
	textpointer LegendaryMachineText                               ; 0x0291
	textpointer AllFightingPokemonText                             ; 0x0292
	textpointer BenchAttackText                                    ; 0x0293
	textpointer BattleContestText                                  ; 0x0294
	textpointer HeatedBattleText                                   ; 0x0295
	textpointer FirstStrikeText                                    ; 0x0296
	textpointer SqueakingMouseText                                 ; 0x0297
	textpointer GreatQuakeText                                     ; 0x0298
	textpointer BoneAttackText                                     ; 0x0299
	textpointer ExcavationText                                     ; 0x029a
	textpointer RockCrusherText                                    ; 0x029b
	textpointer BlueWaterText                                      ; 0x029c
	textpointer OnTheBeachText                                     ; 0x029d
	textpointer ParalyzeText                                       ; 0x029e
	textpointer EnergyRemovalText                                  ; 0x029f
	textpointer RainDancerText                                     ; 0x02a0
	textpointer CutePokemonText                                    ; 0x02a1
	textpointer PokemonFluteText                                   ; 0x02a2
	textpointer YellowFlashText                                    ; 0x02a3
	textpointer ElectricShockText                                  ; 0x02a4
	textpointer ZappingSelfdestructText                            ; 0x02a5
	textpointer InsectCollectionText                               ; 0x02a6
	textpointer JungleText                                         ; 0x02a7
	textpointer FlowerGardenText                                   ; 0x02a8
	textpointer KaleidoscopeText                                   ; 0x02a9
	textpointer FlowerPowerText                                    ; 0x02aa
	textpointer PsychicPowerText                                   ; 0x02ab
	textpointer DreamEaterHaunterText                              ; 0x02ac
	textpointer ScavengingSlowbroText                              ; 0x02ad
	textpointer StrangePowerText                                   ; 0x02ae
	textpointer StrangePsyshockText                                ; 0x02af
	textpointer LovelyNidoranText                                  ; 0x02b0
	textpointer ScienceCorpsText                                   ; 0x02b1
	textpointer FlyinPokemonText                                   ; 0x02b2
	textpointer PoisonText                                         ; 0x02b3
	textpointer WondersOfScienceText                               ; 0x02b4
	textpointer ReplaceEmAllText                                   ; 0x02b5
	textpointer ChariSaurText                                      ; 0x02b6
	textpointer TrafficLightText                                   ; 0x02b7
	textpointer FirePokemonDeckText                                ; 0x02b8
	textpointer FireChargeText                                     ; 0x02b9
	textpointer CharmanderAndFriendsText                           ; 0x02ba
	textpointer SquirtleAndFriendsText                             ; 0x02bb
	textpointer BulbasaurAndFriendsText                            ; 0x02bc
	textpointer PsychicMachampText                                 ; 0x02bd
	textpointer WaterBeetleText                                    ; 0x02be
	textpointer LegendaryMoltresText                               ; 0x02bf
	textpointer LegendaryZapdosText                                ; 0x02c0
	textpointer LegendaryArticunoText                              ; 0x02c1
	textpointer LegendaryDragoniteText                             ; 0x02c2
	textpointer MysteriousPokemonText                              ; 0x02c3
	textpointer AllFightingPokemonDescriptionText                  ; 0x02c4
	textpointer BenchAttackDescriptionText                         ; 0x02c5
	textpointer BattleContestDescriptionText                       ; 0x02c6
	textpointer HeatedBattleDescriptionText                        ; 0x02c7
	textpointer FirstStrikeDescriptionText                         ; 0x02c8
	textpointer SqueakingMouseDescriptionText                      ; 0x02c9
	textpointer GreatQuakeDescriptionText                          ; 0x02ca
	textpointer AttackRetreatDescriptionText                       ; 0x02cb
	textpointer ExcavationDescriptionText                          ; 0x02cc
	textpointer RockCrusherDescriptionText                         ; 0x02cd
	textpointer BlueWaterDescriptionText                           ; 0x02ce
	textpointer OnTheBeachDescriptionText                          ; 0x02cf
	textpointer ParalyzeDescriptionText                            ; 0x02d0
	textpointer EnergyRemovalDescriptionText                       ; 0x02d1
	textpointer RainDancerDescriptionText                          ; 0x02d2
	textpointer CutePokemonDescriptionText                         ; 0x02d3
	textpointer PokemonFluteDescriptionText                        ; 0x02d4
	textpointer YellowFlashDescriptionText                         ; 0x02d5
	textpointer ElectricShockDescriptionText                       ; 0x02d6
	textpointer ZappingSelfdestructDescriptionText                 ; 0x02d7
	textpointer InsectCollectionDescriptionText                    ; 0x02d8
	textpointer JungleDescriptionText                              ; 0x02d9
	textpointer FlowerGardenDescriptionText                        ; 0x02da
	textpointer KaleidoscopeDescriptionText                        ; 0x02db
	textpointer FlowerPowerDescriptionText                         ; 0x02dc
	textpointer PsychicPowerDescriptionText                        ; 0x02dd
	textpointer DreamEaterHaunterDescriptionText                   ; 0x02de
	textpointer ScavengingSlowbroDescriptionText               ; 0x02df
	textpointer StrangePowerDescriptionText                        ; 0x02e0
	textpointer StrangePsyshockDescriptionText                     ; 0x02e1
	textpointer LovelyNidoranDescriptionText                       ; 0x02e2
	textpointer ScienceCorpsDescriptionText                        ; 0x02e3
	textpointer FlyinPokemonDescriptionText                        ; 0x02e4
	textpointer PoisonDescriptionText                              ; 0x02e5
	textpointer WondersOfScienceDescriptionText                    ; 0x02e6
	textpointer ReplaceEmAllDescriptionText                        ; 0x02e7
	textpointer ChariSaurDescriptionText                           ; 0x02e8
	textpointer TrafficLightDescriptionText                        ; 0x02e9
	textpointer FirePokemonDescriptionText                         ; 0x02ea
	textpointer FireChargeDescriptionText                          ; 0x02eb
	textpointer CharmanderAndFriendsDescriptionText                ; 0x02ec
	textpointer SquirtleAndFriendsDescriptionText                  ; 0x02ed
	textpointer BulbasaurAndFriendsDescriptionText                 ; 0x02ee
	textpointer PsychicMachampDescriptionText                      ; 0x02ef
	textpointer WaterBeetleDescriptionText                         ; 0x02f0
	textpointer LegendaryMoltresDescriptionText                    ; 0x02f1
	textpointer LegendaryZapdosDescriptionText                     ; 0x02f2
	textpointer LegendaryArticunoDescriptionText                   ; 0x02f3
	textpointer LegendaryDragoniteDescriptionText                  ; 0x02f4
	textpointer MysteriousPokemonDescriptionText                   ; 0x02f5
	textpointer PokemonCardGlossaryText                            ; 0x02f6
	textpointer GlossaryMenuPage1Text                              ; 0x02f7
	textpointer GlossaryMenuPage2Text                              ; 0x02f8
	textpointer ChooseWordAndPressAButtonText                      ; 0x02f9
	textpointer AboutTheDeckText                                   ; 0x02fa
	textpointer AboutTheDiscardPileText                            ; 0x02fb
	textpointer AboutTheHandText                                   ; 0x02fc
	textpointer AboutTheArenaText                                  ; 0x02fd
	textpointer AboutTheBenchText                                  ; 0x02fe
	textpointer AboutTheActivePokemonText                          ; 0x02ff
	textpointer AboutBenchPokemonText                              ; 0x0300
	textpointer AboutPrizesText                                    ; 0x0301
	textpointer AboutDamageCountersText                            ; 0x0302
	textpointer AboutEnergyCardsText                               ; 0x0303
	textpointer AboutTrainerCardsText                              ; 0x0304
	textpointer AboutBasicPokemonText                              ; 0x0305
	textpointer AboutEvolutionCardsText                            ; 0x0306
	textpointer AboutAttackingText                                 ; 0x0307
	textpointer AboutPokemonPowerText                              ; 0x0308
	textpointer AboutWeaknessText                                  ; 0x0309
	textpointer AboutResistanceText                                ; 0x030a
	textpointer AboutRetreatingText                                ; 0x030b
	textpointer DeckDescriptionText                                ; 0x030c
	textpointer DiscardPileDescriptionText                         ; 0x030d
	textpointer HandDescriptionText                                ; 0x030e
	textpointer ArenaDescriptionText                               ; 0x030f
	textpointer BenchDescriptionText                               ; 0x0310
	textpointer ActivePokemonDescriptionText                       ; 0x0311
	textpointer BenchPokemonDescriptionText                        ; 0x0312
	textpointer PrizesDescriptionText                              ; 0x0313
	textpointer DamageCountersDescriptionText                      ; 0x0314
	textpointer EnergyCardsDescriptionText                         ; 0x0315
	textpointer TrainerCardsDescriptionText                        ; 0x0316
	textpointer BasicPokemonDescriptionText                        ; 0x0317
	textpointer EvolutionCardsDescriptionText                      ; 0x0318
	textpointer AttackingDescriptionText                           ; 0x0319
	textpointer PokemonPowerDescriptionText                        ; 0x031a
	textpointer WeaknessDescriptionText                            ; 0x031b
	textpointer ResistanceDescriptionText                          ; 0x031c
	textpointer RetreatingDescriptionText                          ; 0x031d
	textpointer UnusedText031e                                     ; 0x031e
	textpointer UnusedText031f                                     ; 0x031f
	textpointer EeeekDescription                                     ; 0x0320
	textpointer UnusedText0321                                     ; 0x0321
	textpointer UnusedText0322                                     ; 0x0322
	textpointer OverworldMapMasonLaboratoryText                    ; 0x0323
	textpointer OverworldMapIshiharasHouseText                     ; 0x0324
	textpointer OverworldMapFightingClubText                       ; 0x0325
	textpointer OverworldMapRockClubText                           ; 0x0326
	textpointer OverworldMapWaterClubText                          ; 0x0327
	textpointer OverworldMapLightningClubText                      ; 0x0328
	textpointer OverworldMapGrassClubText                          ; 0x0329
	textpointer OverworldMapPsychicClubText                        ; 0x032a
	textpointer OverworldMapScienceClubText                        ; 0x032b
	textpointer OverworldMapFireClubText                           ; 0x032c
	textpointer OverworldMapChallengeHallText                      ; 0x032d
	textpointer OverworldMapPokemonDomeText                        ; 0x032e
	textpointer OverworldMapMysteryHouseText                       ; 0x032f
	textpointer MasonLaboratoryMapName                             ; 0x0330
	textpointer MrIshiharasHouseMapName                            ; 0x0331
	textpointer FightingClubMapName                                ; 0x0332
	textpointer RockClubMapName                                    ; 0x0333
	textpointer WaterClubMapName                                   ; 0x0334
	textpointer LightningClubMapName                               ; 0x0335
	textpointer GrassClubMapName                                   ; 0x0336
	textpointer PsychicClubMapName                                 ; 0x0337
	textpointer ScienceClubMapName                                 ; 0x0338
	textpointer FireClubMapName                                    ; 0x0339
	textpointer ChallengeHallMapName                               ; 0x033a
	textpointer PokemonDomeMapName                                 ; 0x033b
	textpointer UnusedText033c                                     ; 0x033c
	textpointer PauseMenuOptionsText                               ; 0x033d
	textpointer DebugPauseMenuOptionsText                          ; 0x033e
	textpointer PlayerStatusNameText                               ; 0x033f
	textpointer PlayerStatusAlbumText                              ; 0x0340
	textpointer PlayerStatusPlayTimeText                           ; 0x0341
	textpointer PlayerDiaryTitleText                               ; 0x0342
	textpointer PlayerDiaryMedalsWonText                           ; 0x0343
	textpointer PlayerDiarySaveQuestionText                        ; 0x0344
	textpointer PlayerDiarySaveConfirmText                         ; 0x0345
	textpointer PlayerDiarySaveCancelText                          ; 0x0346
	textpointer PlayerStatusMedalsTitleText                        ; 0x0347
	textpointer ConfigMenuTitleText                                ; 0x0348
	textpointer ConfigMenuMessageSpeedText                         ; 0x0349
	textpointer ConfigMenuDuelAnimationText                        ; 0x034a
	textpointer ConfigMenuExitText                                 ; 0x034b
	textpointer UnusedText034c                                     ; 0x034c
	textpointer UnusedText034d                                     ; 0x034d
	textpointer UnusedText034e                                     ; 0x034e
	textpointer UnusedText034f                                     ; 0x034f
	textpointer UnusedText0350                                     ; 0x0350
	textpointer PCMenuOptionsText                                  ; 0x0351
	textpointer TurnedPCOnText                                     ; 0x0352
	textpointer TurnedPCOffText                                    ; 0x0353
	textpointer GiftCenterMenuText                                 ; 0x0354
	textpointer SendCardText                                       ; 0x0355
	textpointer ReceiveCardText                                    ; 0x0356
	textpointer SendDeckConfigurationText                          ; 0x0357
	textpointer ReceiveDeckConfigurationText                       ; 0x0358
	textpointer MailText                                           ; 0x0359
	textpointer WhichMailWouldYouLikeToReadText                    ; 0x035a
	textpointer MailNumbersText                                    ; 0x035b
	textpointer EmptyMailNameText                                  ; 0x035c
	textpointer Mail1Text                                          ; 0x035d
	textpointer Mail2Text                                          ; 0x035e
	textpointer Mail3Text                                          ; 0x035f
	textpointer Mail4Text                                          ; 0x0360
	textpointer Mail5Text                                          ; 0x0361
	textpointer Mail6Text                                          ; 0x0362
	textpointer Mail7Text                                          ; 0x0363
	textpointer Mail8Text                                          ; 0x0364
	textpointer Mail9Text                                          ; 0x0365
	textpointer Mail10Text                                         ; 0x0366
	textpointer Mail11Text                                         ; 0x0367
	textpointer Mail12Text                                         ; 0x0368
	textpointer Mail13Text                                         ; 0x0369
	textpointer Mail14Text                                         ; 0x036a
	textpointer Mail15Text                                         ; 0x036b
	textpointer NewGameText                                        ; 0x036c
	textpointer CardPopContinueDiaryNewGameText                    ; 0x036d
	textpointer CardPopContinueDiaryNewGameContinueDuelText        ; 0x036e
	textpointer WhenYouCardPopWithFriendText                       ; 0x036f
	textpointer ContinueFromDiarySummaryText                       ; 0x0370
	textpointer StartANewGameText                                  ; 0x0371
	textpointer TheGameWillContinueFromThePointInTheDuelText       ; 0x0372
	textpointer SavedDataAlreadyExistsText                         ; 0x0373
	textpointer OKToDeleteTheDataText                              ; 0x0374
	textpointer AllDataWasDeletedText                              ; 0x0375
	textpointer DataExistsWhenPowerWasTurnedOFFDuringDuelText      ; 0x0376
	textpointer ContinueFromDiaryText                              ; 0x0377
	textpointer YouCanAccessCardPopOnlyWithGameBoyColorsText       ; 0x0378
	textpointer IsCrazyAboutPokemonAndPokemonCardCollectingText    ; 0x0379
	textpointer DebugMenuText                                      ; 0x037a
	textpointer DebugDuelModeMenuText                              ; 0x037b
	textpointer DebugBoosterPackMenuText                           ; 0x037c
	textpointer DebugBoosterPackColosseumEvolutionMenuText         ; 0x037d
	textpointer DebugBoosterPackMysteryMenuText                    ; 0x037e
	textpointer DebugBoosterPackLaboratoryMenuText                 ; 0x037f
	textpointer DebugBoosterPackEnergyMenuText                     ; 0x0380
	textpointer UnusedText0381                                     ; 0x0381
	textpointer UnusedText0382                                     ; 0x0382
	textpointer UnusedText0383                                     ; 0x0383
	textpointer SPRText                                            ; 0x0384
	textpointer WinLosePrizesDuelWithText                          ; 0x0385
	textpointer UseDuelistsDeckText                                ; 0x0386
	textpointer ReceivedBoosterPackText                            ; 0x0387
	textpointer AndAnotherBoosterPackText                          ; 0x0388
	textpointer CheckedCardsInBoosterPackText                      ; 0x0389
	textpointer UnusedText038a                                     ; 0x038a
	textpointer WonTheMedalText                                    ; 0x038b
	textpointer UnusedText038c                                     ; 0x038c
	textpointer UnusedText038d                                     ; 0x038d
	textpointer UnusedText038e                                     ; 0x038e
	textpointer UnusedText038f                                     ; 0x038f
	textpointer UnusedText0390                                     ; 0x0390
	textpointer UnusedText0391                                     ; 0x0391
	textpointer UnusedText0392                                     ; 0x0392
	textpointer UnusedText0393                                     ; 0x0393
	textpointer UnusedText0394                                     ; 0x0394
	textpointer OpponentTitleAndNameText                           ; 0x0395
	textpointer OpponentDeckNameText                               ; 0x0396
	textpointer FightingClubMemberText                             ; 0x0397
	textpointer RockClubMemberText                                 ; 0x0398
	textpointer WaterClubMemberText                                ; 0x0399
	textpointer LightningClubMemberText                            ; 0x039a
	textpointer GrassClubMemberText                                ; 0x039b
	textpointer PsychicClubMemberText                              ; 0x039c
	textpointer ScienceClubMemberText                              ; 0x039d
	textpointer FireClubMemberText                                 ; 0x039e
	textpointer FightingClubMasterText                             ; 0x039f
	textpointer RockClubMasterText                                 ; 0x03a0
	textpointer WaterClubMasterText                                ; 0x03a1
	textpointer LightningClubMasterText                            ; 0x03a2
	textpointer GrassClubMasterText                                ; 0x03a3
	textpointer PsychicClubMasterText                              ; 0x03a4
	textpointer ScienceClubMasterText                              ; 0x03a5
	textpointer FireClubMasterText                                 ; 0x03a6
	textpointer EmptyText                                          ; 0x03a7
	textpointer ColosseumBoosterText                               ; 0x03a8
	textpointer EvolutionBoosterText                               ; 0x03a9
	textpointer MysteryBoosterText                                 ; 0x03aa
	textpointer LaboratoryBoosterText                              ; 0x03ab
	textpointer DrMasonNPCName                                     ; 0x03ac
	textpointer RonaldNPCName                                      ; 0x03ad
	textpointer IshiharaNPCName                                    ; 0x03ae
	textpointer ImakuniNPCName                                     ; 0x03af
	textpointer ClerkNPCName                                       ; 0x03b0
	textpointer SamNPCName                                         ; 0x03b1
	textpointer TechNPCName                                        ; 0x03b2
	textpointer ClerkNPCName2                                      ; 0x03b3
	textpointer ChrisNPCName                                       ; 0x03b4
	textpointer MichaelNPCName                                     ; 0x03b5
	textpointer JessicaNPCName                                     ; 0x03b6
	textpointer MitchNPCName                                       ; 0x03b7
	textpointer MatthewNPCName                                     ; 0x03b8
	textpointer RyanNPCName                                        ; 0x03b9
	textpointer AndrewNPCName                                      ; 0x03ba
	textpointer GeneNPCName                                        ; 0x03bb
	textpointer SaraNPCName                                        ; 0x03bc
	textpointer AmandaNPCName                                      ; 0x03bd
	textpointer JoshuaNPCName                                      ; 0x03be
	textpointer AmyNPCName                                         ; 0x03bf
	textpointer JenniferNPCName                                    ; 0x03c0
	textpointer NicholasNPCName                                    ; 0x03c1
	textpointer BrandonNPCName                                     ; 0x03c2
	textpointer IsaacNPCName                                       ; 0x03c3
	textpointer BrittanyNPCName                                    ; 0x03c4
	textpointer KristinNPCName                                     ; 0x03c5
	textpointer HeatherNPCName                                     ; 0x03c6
	textpointer NikkiNPCName                                       ; 0x03c7
	textpointer RobertNPCName                                      ; 0x03c8
	textpointer DanielNPCName                                      ; 0x03c9
	textpointer StephanieNPCName                                   ; 0x03ca
	textpointer MurrayNPCName                                      ; 0x03cb
	textpointer JosephNPCName                                      ; 0x03cc
	textpointer DavidNPCName                                       ; 0x03cd
	textpointer ErikNPCName                                        ; 0x03ce
	textpointer RickNPCName                                        ; 0x03cf
	textpointer JohnNPCName                                        ; 0x03d0
	textpointer AdamNPCName                                        ; 0x03d1
	textpointer JonathanNPCName                                    ; 0x03d2
	textpointer KenNPCName                                         ; 0x03d3
	textpointer CourtneyNPCName                                    ; 0x03d4
	textpointer SteveNPCName                                       ; 0x03d5
	textpointer JackNPCName                                        ; 0x03d6
	textpointer RodNPCName                                         ; 0x03d7
	textpointer ManNPCName                                         ; 0x03d8
	textpointer WomanNPCName                                       ; 0x03d9
	textpointer ChapNPCName                                        ; 0x03da
	textpointer GalNPCName                                         ; 0x03db
	textpointer LassNPCName                                        ; 0x03dc
	textpointer PappyNPCName                                       ; 0x03dd
	textpointer LadNPCName                                         ; 0x03de
	textpointer HostNPCName                                        ; 0x03df
	textpointer SpecsNPCName                                       ; 0x03e0
	textpointer ButchNPCName                                       ; 0x03e1
	textpointer HoodNPCName                                        ; 0x03e2
	textpointer ChampNPCName                                       ; 0x03e3
	textpointer ManiaNPCName                                       ; 0x03e4
	textpointer GrannyNPCName                                      ; 0x03e5
	textpointer GuideNPCName                                       ; 0x03e6
	textpointer AaronNPCName                                       ; 0x03e7
	textpointer MewtwoTradeCardName                                ; 0x03e8
	textpointer MewTradeCardName                                   ; 0x03e9
	textpointer ArcanineTradeCardName                              ; 0x03ea
	textpointer PikachuTradeCardName                               ; 0x03eb
	textpointer SurfingPikachuTradeCardName                        ; 0x03ec
	textpointer ElectabuzzTradeCardName                            ; 0x03ed
	textpointer SlowpokeTradeCardName                              ; 0x03ee
	textpointer JigglypuffTradeCardName                            ; 0x03ef
	textpointer ZapdosLegendaryCardName                            ; 0x03f0
	textpointer MoltresLegendaryCardName                           ; 0x03f1
	textpointer ArticunoLegendaryCardName                          ; 0x03f2
	textpointer DragoniteLegendaryCardName                         ; 0x03f3
	textpointer SuperEnergyRetrievalTradeCardName                  ; 0x03f4
	textpointer FlyingPikachuTradeCardName                         ; 0x03f5
	textpointer LightningAndFireDeckChoiceText                     ; 0x03f6
	textpointer WaterAndFightingDeckChoiceText                     ; 0x03f7
	textpointer GrassAndPsychicDeckChoiceText                      ; 0x03f8
	textpointer SelectDeckToDuelText                               ; 0x03f9
	textpointer CharmanderAndFriendsDeckChoiceText                 ; 0x03fa
	textpointer SquirtleAndFriendsDeckChoiceText                   ; 0x03fb
	textpointer BulbasaurAndFriendsDeckChoiceText                  ; 0x03fc
	textpointer SelectDeckToTakeText                               ; 0x03fd
	textpointer HowCanIHelpText                                    ; 0x03fe
	textpointer SamNormalMenuText                                  ; 0x03ff
	textpointer SamRulesMenuText                                   ; 0x0400
	textpointer Mail1Part1Text                                     ; 0x0401
	textpointer Mail1Part2Text                                     ; 0x0402
	textpointer Mail2Part1Text                                     ; 0x0403
	textpointer Mail2Part2Text                                     ; 0x0404
	textpointer Mail3Part1Text                                     ; 0x0405
	textpointer Mail3Part2Text                                     ; 0x0406
	textpointer Mail4Part1Text                                     ; 0x0407
	textpointer Mail4Part2Text                                     ; 0x0408
	textpointer Mail5Part1Text                                     ; 0x0409
	textpointer Mail5Part2Text                                     ; 0x040a
	textpointer Mail6Part1Text                                     ; 0x040b
	textpointer Mail6Part2Text                                     ; 0x040c
	textpointer Mail7Part1Text                                     ; 0x040d
	textpointer Mail7Part2Text                                     ; 0x040e
	textpointer Mail8Part1Text                                     ; 0x040f
	textpointer Mail8Part2Text                                     ; 0x0410
	textpointer Mail9Part1Text                                     ; 0x0411
	textpointer Mail9Part2Text                                     ; 0x0412
	textpointer Mail10Part1Text                                    ; 0x0413
	textpointer Mail11Part1Text                                    ; 0x0414
	textpointer Mail12Part1Text                                    ; 0x0415
	textpointer Mail13Part1Text                                    ; 0x0416
	textpointer Mail14Part1Text                                    ; 0x0417
	textpointer Mail15Part1Text                                    ; 0x0418
	textpointer MailBoosterPackAlreadyOpenedText                   ; 0x0419
	textpointer PokemonTradingCards101Text                         ; 0x041a
	textpointer PlaceholderMessageText                             ; 0x041b
	textpointer Clerk3Text                                         ; 0x041c
	textpointer Gal1WantToTrade1Text                               ; 0x041d
	textpointer Gal1WantToTrade2Text                               ; 0x041e
	textpointer Gal1WouldYouLikeToTradeText                        ; 0x041f
	textpointer Gal1DeclinedTradeText                              ; 0x0420
	textpointer Gal1DontOwnCardText                                ; 0x0421
	textpointer Gal1CardInDeckText                                 ; 0x0422
	textpointer Gal1LetsTradeText                                  ; 0x0423
	textpointer Gal1TradeCompleteText                              ; 0x0424
	textpointer Gal1ThanksText                                     ; 0x0425
	textpointer Gal1AfterTradeText                                 ; 0x0426
	textpointer Lass1NormalText                                    ; 0x0427
	textpointer Lass1ImakuniHereText                               ; 0x0428
	textpointer Lass1ImakuniLeftText                               ; 0x0429
	textpointer Man2Text                                           ; 0x042a
	textpointer Pappy2Text                                         ; 0x042b
	textpointer SaraWantsToDuelText                                ; 0x042c
	textpointer SaraWouldYouLikeToDuelText                         ; 0x042d
	textpointer SaraDeclinedDuelText                               ; 0x042e
	textpointer SaraStartDuelText                                  ; 0x042f
	textpointer SaraPlayerWon1Text                                 ; 0x0430
	textpointer SaraPlayerWon2Text                                 ; 0x0431
	textpointer SaraPlayerLostText                                 ; 0x0432
	textpointer AmandaWantsToDuelText                              ; 0x0433
	textpointer AmandaWouldYouLikeToDuelText                       ; 0x0434
	textpointer AmandaDeclinedDuelText                             ; 0x0435
	textpointer AmandaDuelStartText                                ; 0x0436
	textpointer AmandaPlayerWon1Text                               ; 0x0437
	textpointer AmandaPlayerWon2Text                               ; 0x0438
	textpointer AmandaPlayerLostText                               ; 0x0439
	textpointer JoshuaAmyIsRestingText                             ; 0x043a
	textpointer JoshuaGoDefeatSaraAndAmandaText                    ; 0x043b
	textpointer JoshuaSaraAndAmandaDefeatedText                    ; 0x043c
	textpointer JoshuaWantsToDuelInitialText                       ; 0x043d
	textpointer JoshuaWantsToDuelRepeatText                        ; 0x043e
	textpointer JoshuaWouldYouLikeToDuelText                       ; 0x043f
	textpointer JoshuaDeclinedDuelInitialText                      ; 0x0440
	textpointer JoshuaDeclinedDuelRepeatText                       ; 0x0441
	textpointer JoshuaDuelStartText                                ; 0x0442
	textpointer JoshuaPlayerLostInitialText                        ; 0x0443
	textpointer JoshuaPlayerLostRepeatText                         ; 0x0444
	textpointer JoshuaPlayerWonInitial1Text                        ; 0x0445
	textpointer JoshuaPlayerWonRepeat1Text                         ; 0x0446
	textpointer JoshuaPlayerWonInitial2Text                        ; 0x0447
	textpointer JoshuaPlayerWonRepeat2Text                         ; 0x0448
	textpointer JoshuaWakesAmy1Text                                ; 0x0449
	textpointer JoshuaWakesAmy2Text                                ; 0x044a
	textpointer AmyMeetsPlayer1Text                                ; 0x044b
	textpointer JoshuaWakesAmy3Text                                ; 0x044c
	textpointer AmyMeetsPlayer2Text                                ; 0x044d
	textpointer AmyMeetsPlayer3Text                                ; 0x044e
	textpointer AmyWantsToDuelInitialText                          ; 0x044f
	textpointer AmyWouldYouLikeToDuelText                          ; 0x0450
	textpointer AmyDeclinedDuelInitialText                         ; 0x0451
	textpointer AmyDuelStartInitialText                            ; 0x0452
	textpointer AmyPlayerWon1Text                                  ; 0x0453
	textpointer AmyGivesMedal1Text                                 ; 0x0454
	textpointer AmyGivesMedal2Text                                 ; 0x0455
	textpointer AmyPlayerWon2Text                                  ; 0x0456
	textpointer AmyPlayerLostText                                  ; 0x0457
	textpointer AmyWantsToDuelRepeatText                           ; 0x0458
	textpointer AmyDuelStartRepeatText                             ; 0x0459
	textpointer Clerk1Text                                         ; 0x045a
	textpointer Man1FirstRequestCardText                           ; 0x045b
	textpointer Man1WaitingForCardText                             ; 0x045c
	textpointer Man1NewRequestCardText                             ; 0x045d
	textpointer Man1GiveAwayCardText                               ; 0x045e
	textpointer Man1DeclineText                                    ; 0x045f
	textpointer Man1DontHaveText                                   ; 0x0460
	textpointer Man1CardInDeckText                                 ; 0x0461
	textpointer Man1GiveCardText                                   ; 0x0462
	textpointer Man1PlayerReceivePikachuAltLv16Text                ; 0x0463
	textpointer Man1ThankYouText                                   ; 0x0464
	textpointer Man1GaveCardText                                   ; 0x0465
	textpointer Man1GaveAllCardsText                               ; 0x0466
	textpointer ImakuniWouldLikeToDuelInitialText                  ; 0x0467
	textpointer ImakuniWouldLikeToDuelRepeatText                   ; 0x0468
	textpointer ImakuniWouldYouLikeToDuelText                      ; 0x0469
	textpointer ImakuniDeclinedDuelText                            ; 0x046a
	textpointer ImakuniDuelStartText                               ; 0x046b
	textpointer ImakuniPlayerWonNormalText                         ; 0x046c
	textpointer ImakuniPlayerWonThreeWinsText                      ; 0x046d
	textpointer ImakuniPlayerWonSixWinsText                        ; 0x046e
	textpointer ImakuniGivesImakuniText                            ; 0x046f
	textpointer ImakuniPlayerWonEndText                            ; 0x0470
	textpointer ImakuniPlayerLostText                              ; 0x0471
	textpointer Specs1NormalText                                   ; 0x0472
	textpointer Specs1PlayerIsChampionText                         ; 0x0473
	textpointer ButchNormalText                                    ; 0x0474
	textpointer ButchPlayerIsChampionText                          ; 0x0475
	textpointer Granny1Text                                        ; 0x0476
	textpointer MitchFirstInteractionText                          ; 0x0477
	textpointer Mitch3PupilsRemainingText                          ; 0x0478
	textpointer Mitch2PupilsRemainingText                          ; 0x0479
	textpointer Mitch1PupilRemainingText                           ; 0x047a
	textpointer MitchWouldLikeToDuelInitialText                    ; 0x047b
	textpointer MitchWouldYouLikeToDuelText                        ; 0x047c
	textpointer MitchDeclinedInitialText                           ; 0x047d
	textpointer MitchDuelStartInitialText                          ; 0x047e
	textpointer MitchPlayerWonInitial1Text                         ; 0x047f
	textpointer MitchPlayerWonInitial2Text                         ; 0x0480
	textpointer MitchPlayerWonInitial3Text                         ; 0x0481
	textpointer MitchPlayerLostInitialText                         ; 0x0482
	textpointer MitchWouldLikeToDuelRepeatText                     ; 0x0483
	textpointer MitchDeclinedDuelRepeatText                        ; 0x0484
	textpointer MitchDuelStartRepeatText                           ; 0x0485
	textpointer MitchPlayerWonRepeat1Text                          ; 0x0486
	textpointer MitchPlayerWonRepeat2Text                          ; 0x0487
	textpointer MitchPlayerLostRepeatText                          ; 0x0488
	textpointer ChrisFightingClubWantsToDuelInitialText            ; 0x0489
	textpointer ChrisFightingClubWantsToDuelRepeatText             ; 0x048a
	textpointer ChrisFightingClubWouldYouLikeToDuelText            ; 0x048b
	textpointer ChrisFightingClubDeclinedDuelText                  ; 0x048c
	textpointer ChrisFightingClubDuelStartText                     ; 0x048d
	textpointer ChrisFightingClubPlayerWon1Text                    ; 0x048e
	textpointer ChrisFightingClubPlayerWon2Text                    ; 0x048f
	textpointer ChrisFightingClubPlayerLostText                    ; 0x0490
	textpointer MichaelFightingClubWantsToDuelText                 ; 0x0491
	textpointer MichaelFightingClubWouldYouLikeToDuelText          ; 0x0492
	textpointer MichaelFightingClubDeclinedDuelText                ; 0x0493
	textpointer MichaelFightingClubDuelStartText                   ; 0x0494
	textpointer MichaelFightingClubPlayerWon1Text                  ; 0x0495
	textpointer MichaelFightingClubPlayerWon2Text                  ; 0x0496
	textpointer MichaelFightingClubPlayerLostText                  ; 0x0497
	textpointer JessicaFightingClubWantsToDuelText                 ; 0x0498
	textpointer JessicaFightingClubWouldYouLikeToDuelText          ; 0x0499
	textpointer JessicaFightingClubDeclinedDuelText                ; 0x049a
	textpointer JessicaFightingClubDuelStartText                   ; 0x049b
	textpointer JessicaFightingClubPlayerWon1Text                  ; 0x049c
	textpointer JessicaFightingClubPlayerWon2Text                  ; 0x049d
	textpointer JessicaFightingClubPlayerLostText                  ; 0x049e
	textpointer WhatIsADeckBookName                                ; 0x049f
	textpointer WhatIsADeckBookText                                ; 0x04a0
	textpointer CardsVol1BookName                                  ; 0x04a1
	textpointer CardsVol1BookText                                  ; 0x04a2
	textpointer CardsVol2BookName                                  ; 0x04a3
	textpointer CardsVol2BookText                                  ; 0x04a4
	textpointer CardsVol3BookName                                  ; 0x04a5
	textpointer CardsVol3BookText                                  ; 0x04a6
	textpointer WinOrLossOfAMatchVol1BookName                      ; 0x04a7
	textpointer WinOrLossOfAMatchVol1BookText                      ; 0x04a8
	textpointer WinOrLossOfAMatchVol2BookName                      ; 0x04a9
	textpointer WinOrLossOfAMatchVol2BookText                      ; 0x04aa
	textpointer WinOrLossOfAMatchVol3BookName                      ; 0x04ab
	textpointer WinOrLossOfAMatchVol3BookText                      ; 0x04ac
	textpointer CombosBookName                                     ; 0x04ad
	textpointer CombosBookText                                     ; 0x04ae
	textpointer EnergyTransBookName                                ; 0x04af
	textpointer EnergyTransBookText                                ; 0x04b0
	textpointer ToxicGasBookName                                   ; 0x04b1
	textpointer ToxicGasBookText                                   ; 0x04b2
	textpointer RainDanceBookName                                  ; 0x04b3
	textpointer RainDanceBookText                                  ; 0x04b4
	textpointer SelfdestructBookName                               ; 0x04b5
	textpointer SelfdestructBookText                               ; 0x04b6
	textpointer DamageSwapBookName                                 ; 0x04b7
	textpointer DamageSwapBookText                                 ; 0x04b8
	textpointer HyperBeamBookName                                  ; 0x04b9
	textpointer HyperBeamBookText                                  ; 0x04ba
	textpointer PrehistoricPowerBookName                           ; 0x04bb
	textpointer PrehistoricPowerBookText                           ; 0x04bc
	textpointer PhantomCardsBookName                               ; 0x04bd
	textpointer PhantomCardsBookText                               ; 0x04be
	textpointer WeaknessAndResistanceBookName                      ; 0x04bf
	textpointer WeaknessAndResistanceBookText                      ; 0x04c0
	textpointer DrawingDesiredCardsBookName                        ; 0x04c1
	textpointer DrawingDesiredCardsBookText                        ; 0x04c2
	textpointer RetreatingBookName                                 ; 0x04c3
	textpointer RetreatingBookText                                 ; 0x04c4
	textpointer FightingPokemonBookName                            ; 0x04c5
	textpointer FightingPokemonBookText                            ; 0x04c6
	textpointer FightingPokemonAndCombosBookName                   ; 0x04c7
	textpointer FightingPokemonAndCombosBookText                   ; 0x04c8
	textpointer DoubleColorlessEnergyBookName                      ; 0x04c9
	textpointer DoubleColorlessEnergyBookText                      ; 0x04ca
	textpointer RockPokemonBookName                                ; 0x04cb
	textpointer RockPokemonBookText                                ; 0x04cc
	textpointer WinningWithFightingPokemonBookName                 ; 0x04cd
	textpointer WinningWithFightingPokemonBookText                 ; 0x04ce
	textpointer BasicPokemonBookName                               ; 0x04cf
	textpointer BasicPokemonBookText                               ; 0x04d0
	textpointer WaterPokemonBookName                               ; 0x04d1
	textpointer WaterPokemonBookText                               ; 0x04d2
	textpointer WaterPokemonAttacksBookName                        ; 0x04d3
	textpointer WaterPokemonAttacksBookText                        ; 0x04d4
	textpointer ParalyzeBookName                                   ; 0x04d5
	textpointer ParalyzeBookText                                   ; 0x04d6
	textpointer LightningPokemonBookName                           ; 0x04d7
	textpointer LightningPokemonBookText                           ; 0x04d8
	textpointer EnergyCardsBookName                                ; 0x04d9
	textpointer EnergyCardsBookText                                ; 0x04da
	textpointer CardPopBookName                                    ; 0x04db
	textpointer CardPopBookText                                    ; 0x04dc
	textpointer GrassPokemonBookName                               ; 0x04dd
	textpointer GrassPokemonBookText                               ; 0x04de
	textpointer PoisonBookName                                     ; 0x04df
	textpointer PoisonBookText                                     ; 0x04e0
	textpointer GrassPokemonPokemonBreederBookName                 ; 0x04e1
	textpointer GrassPokemonPokemonBreederBookText                 ; 0x04e2
	textpointer PsychicPokemonBookName                             ; 0x04e3
	textpointer PsychicPokemonBookText                             ; 0x04e4
	textpointer SleepBookName                                      ; 0x04e5
	textpointer SleepBookText                                      ; 0x04e6
	textpointer PokemonPowerBookName                               ; 0x04e7
	textpointer PokemonPowerBookText                               ; 0x04e8
	textpointer ScienceClubPokemonBookName                         ; 0x04e9
	textpointer ScienceClubPokemonBookText                         ; 0x04ea
	textpointer ConfusionBookName                                  ; 0x04eb
	textpointer ConfusionBookText                                  ; 0x04ec
	textpointer UsefulButtonsBookName                              ; 0x04ed
	textpointer UsefulButtonsBookText                              ; 0x04ee
	textpointer FirePokemonBookName                                ; 0x04ef
	textpointer FirePokemonBookText                                ; 0x04f0
	textpointer FirePokemonAttacksBookName                         ; 0x04f1
	textpointer FirePokemonAttacksBookText                         ; 0x04f2
	textpointer OriginalGameBoyCardsBookName                       ; 0x04f3
	textpointer OriginalGameBoyCardsBookText                       ; 0x04f4
	textpointer ColorlessPokemonBookName                           ; 0x04f5
	textpointer ColorlessPokemonBookText                           ; 0x04f6
	textpointer DragonPokemonBookName                              ; 0x04f7
	textpointer DragonPokemonBookText                              ; 0x04f8
	textpointer BirdPokemonBookName                                ; 0x04f9
	textpointer BirdPokemonBookText                                ; 0x04fa
	textpointer LegendaryPokemonCardsVol1BookName                  ; 0x04fb
	textpointer LegendaryPokemonCardsVol1BookText                  ; 0x04fc
	textpointer LegendaryPokemonCardsVol2BookName                  ; 0x04fd
	textpointer LegendaryPokemonCardsVol2BookText                  ; 0x04fe
	textpointer LegendaryPokemonCardsVol3BookName                  ; 0x04ff
	textpointer LegendaryPokemonCardsVol3BookText                  ; 0x0500
	textpointer LegendaryPokemonCardsVol4BookName                  ; 0x0501
	textpointer LegendaryPokemonCardsVol4BookText                  ; 0x0502
	textpointer TheGrandMastersBookName                            ; 0x0503
	textpointer TheGrandMastersBookText                            ; 0x0504
	textpointer MasterMedalsBookName                               ; 0x0505
	textpointer MasterMedalsBookText                               ; 0x0506
	textpointer PlateOfLegendsName                                 ; 0x0507
	textpointer PlateOfLegendsText                                 ; 0x0508
	textpointer MysteriousVoiceDoorName                            ; 0x0509
	textpointer Clerk9DefaultText                                  ; 0x050a
	textpointer Clerk9ChallengeCupOverText                         ; 0x050b
	textpointer Clerk9ChallengeCupReadyText                        ; 0x050c
	textpointer Clerk9ChallengeCupLostText                         ; 0x050d
	textpointer Clerk9ChallengeCupWonText                          ; 0x050e
	textpointer Pappy3Text                                         ; 0x050f
	textpointer Gal4Text                                           ; 0x0510
	textpointer ChampText                                          ; 0x0511
	textpointer Hood2Text                                          ; 0x0512
	textpointer Lass5Text                                          ; 0x0513
	textpointer Chap5Text                                          ; 0x0514
	textpointer RonaldChallengeCup1NotStarted1Text                 ; 0x0515
	textpointer RonaldChallengeCup1NotStarted2Text                 ; 0x0516
	textpointer RonaldChallengeCup1LostActive1Text                 ; 0x0517
	textpointer RonaldChallengeCup1LostActive2Text                 ; 0x0518
	textpointer RonaldChallengeCup1LostInactive1Text               ; 0x0519
	textpointer RonaldChallengeCup1LostInactive2Text               ; 0x051a
	textpointer RonaldChallengeCup1Missed1Text                     ; 0x051b
	textpointer RonaldChallengeCup1Missed2Text                     ; 0x051c
	textpointer RonaldChallengeCup2NotStarted1Text                 ; 0x051d
	textpointer RonaldChallengeCup2NotStarted2Text                 ; 0x051e
	textpointer RonaldChallengeCup2LostActive1Text                 ; 0x051f
	textpointer RonaldChallengeCup2LostActive2Text                 ; 0x0520
	textpointer RonaldChallengeCup2LostInactive1Text               ; 0x0521
	textpointer RonaldChallengeCup2LostInactive2Text               ; 0x0522
	textpointer RonaldChallengeCup2Missed1Text                     ; 0x0523
	textpointer RonaldChallengeCup2Missed2Text                     ; 0x0524
	textpointer Clerk13Text                                        ; 0x0525
	textpointer GuideChallengeCupActiveText                        ; 0x0526
	textpointer GuideChallengeCupOverText                          ; 0x0527
	textpointer GuideChallengeCupPreparingText                     ; 0x0528
	textpointer Clerk12ChallengeCupWonText                         ; 0x0529
	textpointer Clerk12ChallengeCupLostText                        ; 0x052a
	textpointer Clerk12ChallengeCup1ActiveText                     ; 0x052b
	textpointer Clerk12ChallengeCup2ActiveText                     ; 0x052c
	textpointer Clerk12ChallengeCup3ActiveText                     ; 0x052d
	textpointer Clerk12ChallengeCupInviteText                      ; 0x052e
	textpointer Clerk12WillYouEnterText                            ; 0x052f
	textpointer Clerk12DeclinedText                                ; 0x0530
	textpointer Clerk12AcceptedText                                ; 0x0531
	textpointer Clerk12ChallengeCupIntroText                       ; 0x0532
	textpointer Clerk12ChallengeCupContenderText                   ; 0x0533
	textpointer Clerk12ChallengeCupRound1ChallengerText            ; 0x0534
	textpointer Clerk12ChallengeCupRound1DuelStartText             ; 0x0535
	textpointer Clerk12ChallengeCupRound2PlayerLostText            ; 0x0536
	textpointer Clerk12ChallengeCupLostContinuedText               ; 0x0537
	textpointer Clerk12ChallengeCupRound1PlayerLostText            ; 0x0538
	textpointer Clerk12ChallengeCupPlayerLostToRonaldText          ; 0x0539
	textpointer RonaldChallengeCup2Or3PlayerLostText               ; 0x053a
	textpointer RonaldChallengeCup1PlayerLostText                  ; 0x053b
	textpointer Clerk12ChallengeCupRound1PlayerWonText             ; 0x053c
	textpointer Clerk12ChallengeCupRound2PlayerWonText             ; 0x053d
	textpointer Clerk12ChallengeCupPlayerWonContinuedText          ; 0x053e
	textpointer Clerk12ChallengeCupNextChallengerText              ; 0x053f
	textpointer Clerk12ChallengeCupRound2ChallengerText            ; 0x0540
	textpointer Clerk12ChallengeCupRound3ChallengerText            ; 0x0541
	textpointer RonaldChallengeCup2BeforeDuelText                  ; 0x0542
	textpointer RonaldChallengeCup1BeforeDuelText                  ; 0x0543
	textpointer Clerk12ChallengeCupRound3DuelReadyText             ; 0x0544
	textpointer Clerk12AreYourDecksReadyText                       ; 0x0545
	textpointer Clerk12PrepareYourDeckText                         ; 0x0546
	textpointer Clerk12ChallengeCupRound2DuelStartText             ; 0x0547
	textpointer Clerk12ChallengeCupRound3DuelStartText             ; 0x0548
	textpointer Clerk12MakeYourPreparationsText                    ; 0x0549
	textpointer Clerk12ChallengeCupRound3PlayerWon1Text            ; 0x054a
	textpointer Clerk12ChallengeCupRound3PlayerWon2Text            ; 0x054b
	textpointer RonaldChallengeCup1PlayerWon1Text                  ; 0x054c
	textpointer RonaldChallengeCup2Or3PlayerWon1Text               ; 0x054d
	textpointer RonaldChallengeCup1PlayerWon2Text                  ; 0x054e
	textpointer RonaldChallengeCup2Or3PlayerWon2Text               ; 0x054f
	textpointer Clerk12ChallengeCupRound3PlayerWon3Text            ; 0x0550
	textpointer Clerk12ChallengeCupRound3PlayerWon4Text            ; 0x0551
	textpointer Clerk12ChallengeCupRound3PlayerWon5Text            ; 0x0552
	textpointer Text0553                                           ; 0x0553
	textpointer Text0554                                           ; 0x0554
	textpointer Text0555                                           ; 0x0555
	textpointer Text0556                                           ; 0x0556
	textpointer Text0557                                           ; 0x0557
	textpointer MysteriousVoiceDoorNotEnoughMedalsText             ; 0x0558
	textpointer Text0559                                           ; 0x0559
	textpointer Text055a                                           ; 0x055a
	textpointer Text055b                                           ; 0x055b
	textpointer Text055c                                           ; 0x055c
	textpointer Text055d                                           ; 0x055d
	textpointer Text055e                                           ; 0x055e
	textpointer Text055f                                           ; 0x055f
	textpointer Text0560                                           ; 0x0560
	textpointer Text0561                                           ; 0x0561
	textpointer Text0562                                           ; 0x0562
	textpointer Text0563                                           ; 0x0563
	textpointer Text0564                                           ; 0x0564
	textpointer Text0565                                           ; 0x0565
	textpointer Text0566                                           ; 0x0566
	textpointer Text0567                                           ; 0x0567
	textpointer Text0568                                           ; 0x0568
	textpointer Text0569                                           ; 0x0569
	textpointer Text056a                                           ; 0x056a
	textpointer Text056b                                           ; 0x056b
	textpointer Text056c                                           ; 0x056c
	textpointer Text056d                                           ; 0x056d
	textpointer Text056e                                           ; 0x056e
	textpointer Text056f                                           ; 0x056f
	textpointer Text0570                                           ; 0x0570
	textpointer Text0571                                           ; 0x0571
	textpointer Text0572                                           ; 0x0572
	textpointer Text0573                                           ; 0x0573
	textpointer Text0574                                           ; 0x0574
	textpointer Text0575                                           ; 0x0575
	textpointer Text0576                                           ; 0x0576
	textpointer Text0577                                           ; 0x0577
	textpointer Text0578                                           ; 0x0578
	textpointer Text0579                                           ; 0x0579
	textpointer Text057a                                           ; 0x057a
	textpointer Text057b                                           ; 0x057b
	textpointer Text057c                                           ; 0x057c
	textpointer Text057d                                           ; 0x057d
	textpointer Text057e                                           ; 0x057e
	textpointer Text057f                                           ; 0x057f
	textpointer Text0580                                           ; 0x0580
	textpointer Text0581                                           ; 0x0581
	textpointer Text0582                                           ; 0x0582
	textpointer Text0583                                           ; 0x0583
	textpointer Text0584                                           ; 0x0584
	textpointer Text0585                                           ; 0x0585
	textpointer Text0586                                           ; 0x0586
	textpointer Text0587                                           ; 0x0587
	textpointer Text0588                                           ; 0x0588
	textpointer Text0589                                           ; 0x0589
	textpointer Text058a                                           ; 0x058a
	textpointer Text058b                                           ; 0x058b
	textpointer Text058c                                           ; 0x058c
	textpointer Text058d                                           ; 0x058d
	textpointer Text058e                                           ; 0x058e
	textpointer Text058f                                           ; 0x058f
	textpointer Text0590                                           ; 0x0590
	textpointer Text0591                                           ; 0x0591
	textpointer Text0592                                           ; 0x0592
	textpointer Text0593                                           ; 0x0593
	textpointer Text0594                                           ; 0x0594
	textpointer Text0595                                           ; 0x0595
	textpointer Text0596                                           ; 0x0596
	textpointer Text0597                                           ; 0x0597
	textpointer Text0598                                           ; 0x0598
	textpointer Text0599                                           ; 0x0599
	textpointer Text059a                                           ; 0x059a
	textpointer Text059b                                           ; 0x059b
	textpointer Text059c                                           ; 0x059c
	textpointer Text059d                                           ; 0x059d
	textpointer Text059e                                           ; 0x059e
	textpointer Text059f                                           ; 0x059f
	textpointer Text05a0                                           ; 0x05a0
	textpointer Text05a1                                           ; 0x05a1
	textpointer Text05a2                                           ; 0x05a2
	textpointer Text05a3                                           ; 0x05a3
	textpointer Text05a4                                           ; 0x05a4
	textpointer Text05a5                                           ; 0x05a5
	textpointer Text05a6                                           ; 0x05a6
	textpointer Text05a7                                           ; 0x05a7
	textpointer Text05a8                                           ; 0x05a8
	textpointer Text05a9                                           ; 0x05a9
	textpointer Text05aa                                           ; 0x05aa
	textpointer Text05ab                                           ; 0x05ab
	textpointer Text05ac                                           ; 0x05ac
	textpointer Text05ad                                           ; 0x05ad
	textpointer Text05ae                                           ; 0x05ae
	textpointer Text05af                                           ; 0x05af
	textpointer Text05b0                                           ; 0x05b0
	textpointer Text05b1                                           ; 0x05b1
	textpointer Text05b2                                           ; 0x05b2
	textpointer Text05b3                                           ; 0x05b3
	textpointer Text05b4                                           ; 0x05b4
	textpointer Text05b5                                           ; 0x05b5
	textpointer Text05b6                                           ; 0x05b6
	textpointer Text05b7                                           ; 0x05b7
	textpointer Text05b8                                           ; 0x05b8
	textpointer Text05b9                                           ; 0x05b9
	textpointer Text05ba                                           ; 0x05ba
	textpointer Text05bb                                           ; 0x05bb
	textpointer Text05bc                                           ; 0x05bc
	textpointer ItsTheChallengeMachineText                         ; 0x05bd
	textpointer Tech1MasterMedalExplanationText                    ; 0x05be
	textpointer Tech1AutoDeckMachineExplanationText                ; 0x05bf
	textpointer Tech1FewEnergyCardsText                            ; 0x05c0
	textpointer Tech1ReceivedEnergyCardsText                       ; 0x05c1
	textpointer Tech1GoodbyeText                                   ; 0x05c2
	textpointer Tech2LegendaryCardsExplanationText                 ; 0x05c3
	textpointer Tech2LegendaryCardsCongratsText                    ; 0x05c4
	textpointer Tech3BoosterPackExplanationText                    ; 0x05c5
	textpointer Tech3LegendaryCardsCongratsText                    ; 0x05c6
	textpointer Tech4ClubsExplanationText                          ; 0x05c7
	textpointer Tech4DefeatedTheGrandMastersText                   ; 0x05c8
	textpointer Tech5DiaryAndEmailExplanationText                  ; 0x05c9
	textpointer Tech5ChallengeMachineExplanationText               ; 0x05ca
	textpointer Text05cb                                           ; 0x05cb
	textpointer Text05cc                                           ; 0x05cc
	textpointer Text05cd                                           ; 0x05cd
	textpointer Text05ce                                           ; 0x05ce
	textpointer Text05cf                                           ; 0x05cf
	textpointer Text05d0                                           ; 0x05d0
	textpointer Text05d1                                           ; 0x05d1
	textpointer Text05d2                                           ; 0x05d2
	textpointer Text05d3                                           ; 0x05d3
	textpointer Text05d4                                           ; 0x05d4
	textpointer Text05d5                                           ; 0x05d5
	textpointer Text05d6                                           ; 0x05d6
	textpointer Text05d7                                           ; 0x05d7
	textpointer Text05d8                                           ; 0x05d8
	textpointer Text05d9                                           ; 0x05d9
	textpointer Text05da                                           ; 0x05da
	textpointer Text05db                                           ; 0x05db
	textpointer Text05dc                                           ; 0x05dc
	textpointer Text05dd                                           ; 0x05dd
	textpointer Text05de                                           ; 0x05de
	textpointer Text05df                                           ; 0x05df
	textpointer Text05e0                                           ; 0x05e0
	textpointer Text05e1                                           ; 0x05e1
	textpointer Text05e2                                           ; 0x05e2
	textpointer Text05e3                                           ; 0x05e3
	textpointer Text05e4                                           ; 0x05e4
	textpointer Text05e5                                           ; 0x05e5
	textpointer Text05e6                                           ; 0x05e6
	textpointer Text05e7                                           ; 0x05e7
	textpointer Text05e8                                           ; 0x05e8
	textpointer Text05e9                                           ; 0x05e9
	textpointer Text05ea                                           ; 0x05ea
	textpointer Text05eb                                           ; 0x05eb
	textpointer Text05ec                                           ; 0x05ec
	textpointer Text05ed                                           ; 0x05ed
	textpointer Text05ee                                           ; 0x05ee
	textpointer Text05ef                                           ; 0x05ef
	textpointer Text05f0                                           ; 0x05f0
	textpointer Text05f1                                           ; 0x05f1
	textpointer Text05f2                                           ; 0x05f2
	textpointer Text05f3                                           ; 0x05f3
	textpointer Text05f4                                           ; 0x05f4
	textpointer Text05f5                                           ; 0x05f5
	textpointer Text05f6                                           ; 0x05f6
	textpointer Text05f7                                           ; 0x05f7
	textpointer Text05f8                                           ; 0x05f8
	textpointer Text05f9                                           ; 0x05f9
	textpointer Text05fa                                           ; 0x05fa
	textpointer Text05fb                                           ; 0x05fb
	textpointer Text05fc                                           ; 0x05fc
	textpointer Text05fd                                           ; 0x05fd
	textpointer Text05fe                                           ; 0x05fe
	textpointer Text05ff                                           ; 0x05ff
	textpointer Text0600                                           ; 0x0600
	textpointer Text0601                                           ; 0x0601
	textpointer Text0602                                           ; 0x0602
	textpointer Text0603                                           ; 0x0603
	textpointer Text0604                                           ; 0x0604
	textpointer Text0605                                           ; 0x0605
	textpointer Text0606                                           ; 0x0606
	textpointer Text0607                                           ; 0x0607
	textpointer Text0608                                           ; 0x0608
	textpointer Text0609                                           ; 0x0609
	textpointer Text060a                                           ; 0x060a
	textpointer Text060b                                           ; 0x060b
	textpointer Text060c                                           ; 0x060c
	textpointer Text060d                                           ; 0x060d
	textpointer Text060e                                           ; 0x060e
	textpointer Text060f                                           ; 0x060f
	textpointer Text0610                                           ; 0x0610
	textpointer Text0611                                           ; 0x0611
	textpointer Text0612                                           ; 0x0612
	textpointer Text0613                                           ; 0x0613
	textpointer Text0614                                           ; 0x0614
	textpointer Text0615                                           ; 0x0615
	textpointer Text0616                                           ; 0x0616
	textpointer Text0617                                           ; 0x0617
	textpointer Text0618                                           ; 0x0618
	textpointer Text0619                                           ; 0x0619
	textpointer Text061a                                           ; 0x061a
	textpointer Text061b                                           ; 0x061b
	textpointer Text061c                                           ; 0x061c
	textpointer Text061d                                           ; 0x061d
	textpointer Text061e                                           ; 0x061e
	textpointer Text061f                                           ; 0x061f
	textpointer Text0620                                           ; 0x0620
	textpointer Text0621                                           ; 0x0621
	textpointer Text0622                                           ; 0x0622
	textpointer Text0623                                           ; 0x0623
	textpointer Text0624                                           ; 0x0624
	textpointer Text0625                                           ; 0x0625
	textpointer Text0626                                           ; 0x0626
	textpointer Text0627                                           ; 0x0627
	textpointer Text0628                                           ; 0x0628
	textpointer Text0629                                           ; 0x0629
	textpointer Text062a                                           ; 0x062a
	textpointer Text062b                                           ; 0x062b
	textpointer Text062c                                           ; 0x062c
	textpointer Text062d                                           ; 0x062d
	textpointer Text062e                                           ; 0x062e
	textpointer Text062f                                           ; 0x062f
	textpointer Text0630                                           ; 0x0630
	textpointer Text0631                                           ; 0x0631
	textpointer Text0632                                           ; 0x0632
	textpointer Text0633                                           ; 0x0633
	textpointer Text0634                                           ; 0x0634
	textpointer Text0635                                           ; 0x0635
	textpointer Text0636                                           ; 0x0636
	textpointer Text0637                                           ; 0x0637
	textpointer Text0638                                           ; 0x0638
	textpointer Text0639                                           ; 0x0639
	textpointer Text063a                                           ; 0x063a
	textpointer Text063b                                           ; 0x063b
	textpointer Text063c                                           ; 0x063c
	textpointer Text063d                                           ; 0x063d
	textpointer Text063e                                           ; 0x063e
	textpointer Text063f                                           ; 0x063f
	textpointer Text0640                                           ; 0x0640
	textpointer Text0641                                           ; 0x0641
	textpointer Text0642                                           ; 0x0642
	textpointer Text0643                                           ; 0x0643
	textpointer Text0644                                           ; 0x0644
	textpointer Text0645                                           ; 0x0645
	textpointer Text0646                                           ; 0x0646
	textpointer Text0647                                           ; 0x0647
	textpointer Text0648                                           ; 0x0648
	textpointer Text0649                                           ; 0x0649
	textpointer Text064a                                           ; 0x064a
	textpointer Text064b                                           ; 0x064b
	textpointer Text064c                                           ; 0x064c
	textpointer Text064d                                           ; 0x064d
	textpointer Text064e                                           ; 0x064e
	textpointer Text064f                                           ; 0x064f
	textpointer Text0650                                           ; 0x0650
	textpointer Text0651                                           ; 0x0651
	textpointer Text0652                                           ; 0x0652
	textpointer Text0653                                           ; 0x0653
	textpointer Text0654                                           ; 0x0654
	textpointer Text0655                                           ; 0x0655
	textpointer Text0656                                           ; 0x0656
	textpointer Text0657                                           ; 0x0657
	textpointer Text0658                                           ; 0x0658
	textpointer Text0659                                           ; 0x0659
	textpointer Text065a                                           ; 0x065a
	textpointer Text065b                                           ; 0x065b
	textpointer Text065c                                           ; 0x065c
	textpointer Text065d                                           ; 0x065d
	textpointer Text065e                                           ; 0x065e
	textpointer Text065f                                           ; 0x065f
	textpointer Text0660                                           ; 0x0660
	textpointer Text0661                                           ; 0x0661
	textpointer Text0662                                           ; 0x0662
	textpointer Text0663                                           ; 0x0663
	textpointer Text0664                                           ; 0x0664
	textpointer Text0665                                           ; 0x0665
	textpointer Text0666                                           ; 0x0666
	textpointer Text0667                                           ; 0x0667
	textpointer Text0668                                           ; 0x0668
	textpointer Text0669                                           ; 0x0669
	textpointer Text066a                                           ; 0x066a
	textpointer Text066b                                           ; 0x066b
	textpointer Text066c                                           ; 0x066c
	textpointer Text066d                                           ; 0x066d
	textpointer Text066e                                           ; 0x066e
	textpointer Text066f                                           ; 0x066f
	textpointer Text0670                                           ; 0x0670
	textpointer Text0671                                           ; 0x0671
	textpointer Text0672                                           ; 0x0672
	textpointer Text0673                                           ; 0x0673
	textpointer Text0674                                           ; 0x0674
	textpointer Text0675                                           ; 0x0675
	textpointer Text0676                                           ; 0x0676
	textpointer Text0677                                           ; 0x0677
	textpointer Text0678                                           ; 0x0678
	textpointer Text0679                                           ; 0x0679
	textpointer Text067a                                           ; 0x067a
	textpointer Text067b                                           ; 0x067b
	textpointer Text067c                                           ; 0x067c
	textpointer Text067d                                           ; 0x067d
	textpointer Text067e                                           ; 0x067e
	textpointer Text067f                                           ; 0x067f
	textpointer Text0680                                           ; 0x0680
	textpointer Text0681                                           ; 0x0681
	textpointer Text0682                                           ; 0x0682
	textpointer Text0683                                           ; 0x0683
	textpointer Text0684                                           ; 0x0684
	textpointer Text0685                                           ; 0x0685
	textpointer Text0686                                           ; 0x0686
	textpointer Text0687                                           ; 0x0687
	textpointer Text0688                                           ; 0x0688
	textpointer Text0689                                           ; 0x0689
	textpointer Text068a                                           ; 0x068a
	textpointer Text068b                                           ; 0x068b
	textpointer Text068c                                           ; 0x068c
	textpointer Text068d                                           ; 0x068d
	textpointer Text068e                                           ; 0x068e
	textpointer Text068f                                           ; 0x068f
	textpointer Text0690                                           ; 0x0690
	textpointer Text0691                                           ; 0x0691
	textpointer Text0692                                           ; 0x0692
	textpointer Text0693                                           ; 0x0693
	textpointer Text0694                                           ; 0x0694
	textpointer Text0695                                           ; 0x0695
	textpointer Text0696                                           ; 0x0696
	textpointer Text0697                                           ; 0x0697
	textpointer Text0698                                           ; 0x0698
	textpointer Text0699                                           ; 0x0699
	textpointer Text069a                                           ; 0x069a
	textpointer Text069b                                           ; 0x069b
	textpointer Text069c                                           ; 0x069c
	textpointer Text069d                                           ; 0x069d
	textpointer Text069e                                           ; 0x069e
	textpointer Text069f                                           ; 0x069f
	textpointer Text06a0                                           ; 0x06a0
	textpointer Text06a1                                           ; 0x06a1
	textpointer FoundLv9SlowpokeText                               ; 0x06a2
	textpointer Text06a3                                           ; 0x06a3
	textpointer Text06a4                                           ; 0x06a4
	textpointer Text06a5                                           ; 0x06a5
	textpointer Text06a6                                           ; 0x06a6
	textpointer Text06a7                                           ; 0x06a7
	textpointer Text06a8                                           ; 0x06a8
	textpointer Text06a9                                           ; 0x06a9
	textpointer Text06aa                                           ; 0x06aa
	textpointer Text06ab                                           ; 0x06ab
	textpointer Text06ac                                           ; 0x06ac
	textpointer Text06ad                                           ; 0x06ad
	textpointer Text06ae                                           ; 0x06ae
	textpointer Text06af                                           ; 0x06af
	textpointer Text06b0                                           ; 0x06b0
	textpointer Text06b1                                           ; 0x06b1
	textpointer Text06b2                                           ; 0x06b2
	textpointer Text06b3                                           ; 0x06b3
	textpointer Text06b4                                           ; 0x06b4
	textpointer Text06b5                                           ; 0x06b5
	textpointer Text06b6                                           ; 0x06b6
	textpointer Text06b7                                           ; 0x06b7
	textpointer Text06b8                                           ; 0x06b8
	textpointer Text06b9                                           ; 0x06b9
	textpointer Text06ba                                           ; 0x06ba
	textpointer Text06bb                                           ; 0x06bb
	textpointer Text06bc                                           ; 0x06bc
	textpointer Text06bd                                           ; 0x06bd
	textpointer Text06be                                           ; 0x06be
	textpointer Text06bf                                           ; 0x06bf
	textpointer Text06c0                                           ; 0x06c0
	textpointer Text06c1                                           ; 0x06c1
	textpointer Text06c2                                           ; 0x06c2
	textpointer Text06c3                                           ; 0x06c3
	textpointer Text06c4                                           ; 0x06c4
	textpointer Text06c5                                           ; 0x06c5
	textpointer Text06c6                                           ; 0x06c6
	textpointer Text06c7                                           ; 0x06c7
	textpointer Text06c8                                           ; 0x06c8
	textpointer Text06c9                                           ; 0x06c9
	textpointer Text06ca                                           ; 0x06ca
	textpointer Text06cb                                           ; 0x06cb
	textpointer Text06cc                                           ; 0x06cc
	textpointer Text06cd                                           ; 0x06cd
	textpointer Text06ce                                           ; 0x06ce
	textpointer Text06cf                                           ; 0x06cf
	textpointer Text06d0                                           ; 0x06d0
	textpointer Text06d1                                           ; 0x06d1
	textpointer Text06d2                                           ; 0x06d2
	textpointer Text06d3                                           ; 0x06d3
	textpointer Text06d4                                           ; 0x06d4
	textpointer Text06d5                                           ; 0x06d5
	textpointer Text06d6                                           ; 0x06d6
	textpointer Text06d7                                           ; 0x06d7
	textpointer Text06d8                                           ; 0x06d8
	textpointer Text06d9                                           ; 0x06d9
	textpointer Text06da                                           ; 0x06da
	textpointer Text06db                                           ; 0x06db
	textpointer Text06dc                                           ; 0x06dc
	textpointer Text06dd                                           ; 0x06dd
	textpointer Text06de                                           ; 0x06de
	textpointer Text06df                                           ; 0x06df
	textpointer Text06e0                                           ; 0x06e0
	textpointer Text06e1                                           ; 0x06e1
	textpointer Text06e2                                           ; 0x06e2
	textpointer Text06e3                                           ; 0x06e3
	textpointer Text06e4                                           ; 0x06e4
	textpointer Text06e5                                           ; 0x06e5
	textpointer Text06e6                                           ; 0x06e6
	textpointer Text06e7                                           ; 0x06e7
	textpointer Text06e8                                           ; 0x06e8
	textpointer Text06e9                                           ; 0x06e9
	textpointer Text06ea                                           ; 0x06ea
	textpointer Text06eb                                           ; 0x06eb
	textpointer Text06ec                                           ; 0x06ec
	textpointer Text06ed                                           ; 0x06ed
	textpointer Text06ee                                           ; 0x06ee
	textpointer Text06ef                                           ; 0x06ef
	textpointer Text06f0                                           ; 0x06f0
	textpointer Text06f1                                           ; 0x06f1
	textpointer Text06f2                                           ; 0x06f2
	textpointer Text06f3                                           ; 0x06f3
	textpointer Text06f4                                           ; 0x06f4
	textpointer Text06f5                                           ; 0x06f5
	textpointer Text06f6                                           ; 0x06f6
	textpointer Text06f7                                           ; 0x06f7
	textpointer Text06f8                                           ; 0x06f8
	textpointer Text06f9                                           ; 0x06f9
	textpointer Text06fa                                           ; 0x06fa
	textpointer Text06fb                                           ; 0x06fb
	textpointer Text06fc                                           ; 0x06fc
	textpointer Text06fd                                           ; 0x06fd
	textpointer Text06fe                                           ; 0x06fe
	textpointer Text06ff                                           ; 0x06ff
	textpointer Text0700                                           ; 0x0700
	textpointer Text0701                                           ; 0x0701
	textpointer Text0702                                           ; 0x0702
	textpointer Text0703                                           ; 0x0703
	textpointer Text0704                                           ; 0x0704
	textpointer Text0705                                           ; 0x0705
	textpointer Text0706                                           ; 0x0706
	textpointer Text0707                                           ; 0x0707
	textpointer Text0708                                           ; 0x0708
	textpointer Text0709                                           ; 0x0709
	textpointer Text070a                                           ; 0x070a
	textpointer Text070b                                           ; 0x070b
	textpointer Text070c                                           ; 0x070c
	textpointer Text070d                                           ; 0x070d
	textpointer Text070e                                           ; 0x070e
	textpointer Text070f                                           ; 0x070f
	textpointer Text0710                                           ; 0x0710
	textpointer Text0711                                           ; 0x0711
	textpointer Text0712                                           ; 0x0712
	textpointer Text0713                                           ; 0x0713
	textpointer Text0714                                           ; 0x0714
	textpointer Text0715                                           ; 0x0715
	textpointer Text0716                                           ; 0x0716
	textpointer Text0717                                           ; 0x0717
	textpointer Text0718                                           ; 0x0718
	textpointer Text0719                                           ; 0x0719
	textpointer Text071a                                           ; 0x071a
	textpointer Text071b                                           ; 0x071b
	textpointer Text071c                                           ; 0x071c
	textpointer Text071d                                           ; 0x071d
	textpointer Text071e                                           ; 0x071e
	textpointer Text071f                                           ; 0x071f
	textpointer Text0720                                           ; 0x0720
	textpointer Text0721                                           ; 0x0721
	textpointer Text0722                                           ; 0x0722
	textpointer Text0723                                           ; 0x0723
	textpointer Text0724                                           ; 0x0724
	textpointer Text0725                                           ; 0x0725
	textpointer Text0726                                           ; 0x0726
	textpointer Text0727                                           ; 0x0727
	textpointer Text0728                                           ; 0x0728
	textpointer Text0729                                           ; 0x0729
	textpointer Text072a                                           ; 0x072a
	textpointer Text072b                                           ; 0x072b
	textpointer Text072c                                           ; 0x072c
	textpointer Text072d                                           ; 0x072d
	textpointer Text072e                                           ; 0x072e
	textpointer Text072f                                           ; 0x072f
	textpointer Text0730                                           ; 0x0730
	textpointer Text0731                                           ; 0x0731
	textpointer Text0732                                           ; 0x0732
	textpointer Text0733                                           ; 0x0733
	textpointer Text0734                                           ; 0x0734
	textpointer Text0735                                           ; 0x0735
	textpointer Text0736                                           ; 0x0736
	textpointer Text0737                                           ; 0x0737
	textpointer Text0738                                           ; 0x0738
	textpointer Text0739                                           ; 0x0739
	textpointer Text073a                                           ; 0x073a
	textpointer Text073b                                           ; 0x073b
	textpointer Text073c                                           ; 0x073c
	textpointer Text073d                                           ; 0x073d
	textpointer Text073e                                           ; 0x073e
	textpointer Text073f                                           ; 0x073f
	textpointer Text0740                                           ; 0x0740
	textpointer Text0741                                           ; 0x0741
	textpointer Text0742                                           ; 0x0742
	textpointer Text0743                                           ; 0x0743
	textpointer Text0744                                           ; 0x0744
	textpointer Text0745                                           ; 0x0745
	textpointer Text0746                                           ; 0x0746
	textpointer Text0747                                           ; 0x0747
	textpointer Text0748                                           ; 0x0748
	textpointer Text0749                                           ; 0x0749
	textpointer Text074a                                           ; 0x074a
	textpointer Text074b                                           ; 0x074b
	textpointer Text074c                                           ; 0x074c
	textpointer Text074d                                           ; 0x074d
	textpointer Text074e                                           ; 0x074e
	textpointer Text074f                                           ; 0x074f
	textpointer Text0750                                           ; 0x0750
	textpointer Text0751                                           ; 0x0751
	textpointer Text0752                                           ; 0x0752
	textpointer Text0753                                           ; 0x0753
	textpointer Text0754                                           ; 0x0754
	textpointer Text0755                                           ; 0x0755
	textpointer Text0756                                           ; 0x0756
	textpointer Text0757                                           ; 0x0757
	textpointer Text0758                                           ; 0x0758
	textpointer Text0759                                           ; 0x0759
	textpointer Text075a                                           ; 0x075a
	textpointer Text075b                                           ; 0x075b
	textpointer Text075c                                           ; 0x075c
	textpointer Text075d                                           ; 0x075d
	textpointer Text075e                                           ; 0x075e
	textpointer Text075f                                           ; 0x075f
	textpointer Text0760                                           ; 0x0760
	textpointer Text0761                                           ; 0x0761
	textpointer Text0762                                           ; 0x0762
	textpointer Text0763                                           ; 0x0763
	textpointer Text0764                                           ; 0x0764
	textpointer Text0765                                           ; 0x0765
	textpointer Text0766                                           ; 0x0766
	textpointer Text0767                                           ; 0x0767
	textpointer Text0768                                           ; 0x0768
	textpointer Text0769                                           ; 0x0769
	textpointer Text076a                                           ; 0x076a
	textpointer Text076b                                           ; 0x076b
	textpointer Text076c                                           ; 0x076c
	textpointer Text076d                                           ; 0x076d
	textpointer Text076e                                           ; 0x076e
	textpointer Text076f                                           ; 0x076f
	textpointer Text0770                                           ; 0x0770
	textpointer Text0771                                           ; 0x0771
	textpointer Text0772                                           ; 0x0772
	textpointer Text0773                                           ; 0x0773
	textpointer Text0774                                           ; 0x0774
	textpointer Text0775                                           ; 0x0775
	textpointer Text0776                                           ; 0x0776
	textpointer Text0777                                           ; 0x0777
	textpointer Text0778                                           ; 0x0778
	textpointer Text0779                                           ; 0x0779
	textpointer Text077a                                           ; 0x077a
	textpointer Text077b                                           ; 0x077b
	textpointer Text077c                                           ; 0x077c
	textpointer Text077d                                           ; 0x077d
	textpointer Text077e                                           ; 0x077e
	textpointer Text077f                                           ; 0x077f
	textpointer Text0780                                           ; 0x0780
	textpointer Text0781                                           ; 0x0781
	textpointer Text0782                                           ; 0x0782
	textpointer Text0783                                           ; 0x0783
	textpointer Text0784                                           ; 0x0784
	textpointer Text0785                                           ; 0x0785
	textpointer Text0786                                           ; 0x0786
	textpointer Text0787                                           ; 0x0787
	textpointer Text0788                                           ; 0x0788
	textpointer Text0789                                           ; 0x0789
	textpointer Text078a                                           ; 0x078a
	textpointer Text078b                                           ; 0x078b
	textpointer Text078c                                           ; 0x078c
	textpointer Text078d                                           ; 0x078d
	textpointer Text078e                                           ; 0x078e
	textpointer Text078f                                           ; 0x078f
	textpointer Text0790                                           ; 0x0790
	textpointer Text0791                                           ; 0x0791
	textpointer Text0792                                           ; 0x0792
	textpointer Text0793                                           ; 0x0793
	textpointer Text0794                                           ; 0x0794
	textpointer Text0795                                           ; 0x0795
	textpointer Text0796                                           ; 0x0796
	textpointer Text0797                                           ; 0x0797
	textpointer Text0798                                           ; 0x0798
	textpointer Text0799                                           ; 0x0799
	textpointer Text079a                                           ; 0x079a
	textpointer Text079b                                           ; 0x079b
	textpointer Text079c                                           ; 0x079c
	textpointer Text079d                                           ; 0x079d
	textpointer Text079e                                           ; 0x079e
	textpointer Text079f                                           ; 0x079f
	textpointer Text07a0                                           ; 0x07a0
	textpointer Text07a1                                           ; 0x07a1
	textpointer Text07a2                                           ; 0x07a2
	textpointer Text07a3                                           ; 0x07a3
	textpointer Text07a4                                           ; 0x07a4
	textpointer Text07a5                                           ; 0x07a5
	textpointer Text07a6                                           ; 0x07a6
	textpointer Text07a7                                           ; 0x07a7
	textpointer Text07a8                                           ; 0x07a8
	textpointer Text07a9                                           ; 0x07a9
	textpointer Text07aa                                           ; 0x07aa
	textpointer Text07ab                                           ; 0x07ab
	textpointer Text07ac                                           ; 0x07ac
	textpointer Text07ad                                           ; 0x07ad
	textpointer Text07ae                                           ; 0x07ae
	textpointer Text07af                                           ; 0x07af
	textpointer Text07b0                                           ; 0x07b0
	textpointer PokemonTradingCardGameStaffText                    ; 0x07b1
	textpointer ProducersText                                      ; 0x07b2
	textpointer DirectorText                                       ; 0x07b3
	textpointer ProgrammersText                                    ; 0x07b4
	textpointer GBGraphicDesigners1Text                            ; 0x07b5
	textpointer GBGraphicDesigners2Text                            ; 0x07b6
	textpointer GBGraphicDesigners3Text                            ; 0x07b7
	textpointer MusicText                                          ; 0x07b8
	textpointer SoundEffectsText                                   ; 0x07b9
	textpointer SoundDirectorText                                  ; 0x07ba
	textpointer SoundSystemSupportText                             ; 0x07bb
	textpointer CardGameCreator1Text                               ; 0x07bc
	textpointer CardGameCreator2Text                               ; 0x07bd
	textpointer CardGameCreator3Text                               ; 0x07be
	textpointer CardIllustrators1Text                              ; 0x07bf
	textpointer CardIllustrators2Text                              ; 0x07c0
	textpointer SpecialAppearances1Text                            ; 0x07c1
	textpointer SpecialAppearances2Text                            ; 0x07c2
	textpointer USCoordination1Text                                ; 0x07c3
	textpointer USCoordination2Text                                ; 0x07c4
	textpointer USCoordination3Text                                ; 0x07c5
	textpointer USCoordination4Text                                ; 0x07c6
	textpointer TranslationDraftText                               ; 0x07c7
	textpointer MasteringText                                      ; 0x07c8
	textpointer ManualCreationText                                 ; 0x07c9
	textpointer ManualIllustrationsText                            ; 0x07ca
	textpointer PokemonOriginalStoryText                           ; 0x07cb
	textpointer CreatedInCooperationWithText                       ; 0x07cc
	textpointer WithCooperation1Text                               ; 0x07cd
	textpointer WithCooperation2Text                               ; 0x07ce
	textpointer WithCooperation3Text                               ; 0x07cf
	textpointer ProjectManagerText                                 ; 0x07d0
	textpointer SupervisorText                                     ; 0x07d1
	textpointer ExecutiveProducerText                              ; 0x07d2
	textpointer CreatedByText                                      ; 0x07d3
	textpointer ChallengeMachineText                               ; 0x07d4
	textpointer PlayersScoreText                                   ; 0x07d5
	textpointer Defeated5OpponentsXTimesText                       ; 0x07d6
	textpointer PresentConsecutiveWinsText                         ; 0x07d7
	textpointer MaximumConsecutiveWinsText                         ; 0x07d8
	textpointer WinsText                                           ; 0x07d9
	textpointer XConsecutiveWinsNthOpponentIsText                  ; 0x07da
	textpointer NthOpponentIsText                                  ; 0x07db
	textpointer WouldYouLikeToBeginTheDuelText                     ; 0x07dc
	textpointer IfYouQuitTheDuelText                               ; 0x07dd
	textpointer WouldYouLikeToQuitTheDuelText                      ; 0x07de
	textpointer PlayTheChallengeMachineText                        ; 0x07df
	textpointer LetUsChooseYourOpponentText                        ; 0x07e0
	textpointer LostToTheNthOpponentText                           ; 0x07e1
	textpointer ConsecutiveWinsEndedAtText                         ; 0x07e2
	textpointer WeAwaitYourNextChallengeText                       ; 0x07e3
	textpointer YourOpponentsForThisGameText                       ; 0x07e4
	textpointer WonAgainstXOpponentsText                           ; 0x07e5
	textpointer Defeated5OpponentsText                             ; 0x07e6
	textpointer SuccessfullyDefeated5OpponentsText                 ; 0x07e7
	textpointer ConsecutiveWinRecordIncreasedText                  ; 0x07e8
	textpointer ClubMemberText                                     ; 0x07e9
	textpointer ClubMasterText                                     ; 0x07ea
	textpointer TechText                                           ; 0x07eb
	textpointer StrangeLifeformText                                ; 0x07ec
	textpointer GrandMasterText                                    ; 0x07ed
	textpointer ChallengeMachineOpponent1Text                      ; 0x07ee
	textpointer ChallengeMachineOpponent2Text                      ; 0x07ef
	textpointer ChallengeMachineOpponent3Text                      ; 0x07f0
	textpointer ChallengeMachineOpponent4Text                      ; 0x07f1
	textpointer ChallengeMachineOpponent5Text                      ; 0x07f2
	textpointer ChallengeMachineNotDuelledIconText                 ; 0x07f3
	textpointer ChallengeMachineDuelWonIconText                    ; 0x07f4
	textpointer ChallengeMachineDuelLostIconText                   ; 0x07f5
	textpointer ChallengeMachineFireIconText                       ; 0x07f6
	textpointer ChallengeMachineLightningIconText                  ; 0x07f7
	textpointer ChallengeMachineWaterIconText                      ; 0x07f8
	textpointer ChallengeMachineFightingIconText                   ; 0x07f9
	textpointer ChallengeMachinePsychicIconText                    ; 0x07fa
	textpointer ChallengeMachineGrassIconText                      ; 0x07fb
	textpointer GrassEnergyName                                    ; 0x07fc
	textpointer GrassEnergyDescription                             ; 0x07fd
	textpointer FireEnergyName                                     ; 0x07fe
	textpointer FireEnergyDescription                              ; 0x07ff
	textpointer WaterEnergyName                                    ; 0x0800
	textpointer WaterEnergyDescription                             ; 0x0801
	textpointer LightningEnergyName                                ; 0x0802
	textpointer LightningEnergyDescription                         ; 0x0803
	textpointer FightingEnergyName                                 ; 0x0804
	textpointer FightingEnergyDescription                          ; 0x0805
	textpointer PsychicEnergyName                                  ; 0x0806
	textpointer PsychicEnergyDescription                           ; 0x0807
	textpointer DoubleColorlessEnergyName                          ; 0x0808
	textpointer DoubleColorlessEnergyDescription                   ; 0x0809
	textpointer ChikoritaName                                      ; 0x080a
	textpointer LeechSeedName                                      ; 0x080b
	textpointer Heal20IfSuccessDesc                     ; 0x080c
	textpointer SeedName                                           ; 0x080d
	textpointer Chikorita1Description                               ; 0x080e
	textpointer BayleefName                                        ; 0x080f
	textpointer TailGrabName                                       ; 0x0810
	textpointer PoisonPowderName                                   ; 0x0811
	textpointer InflictPoisonDescription                           ; 0x0812
	textpointer Chikorita2Description                                 ; 0x0813
	textpointer MeganiumName                                       ; 0x0814
	textpointer AromatherapyName                                     ; 0x0815
	textpointer AromatherapyDescription                              ; 0x0816
	textpointer AromatherapyDescriptionCont                          ; 0x0817
	textpointer MegaDrainName                                      ; 0x0818
	textpointer QuadrupleAttackX10Description                      ; 0x0819
	textpointer UnownJDescription                  ; 0x081a
	textpointer Bayleef1Description                           ; 0x081b
	textpointer EnergyTransName                                    ; 0x081c
	textpointer EnergyTransDescription                             ; 0x081d
	textpointer SolarBeamName                                      ; 0x081e
	textpointer Bayleef2Description                           ; 0x081f
	textpointer TotodileName                                       ; 0x0820
	textpointer StringShotName                                     ; 0x0821
	textpointer MayInflictParalysisDescription                     ; 0x0822
	textpointer DarkName                                           ; 0x0823
	textpointer Meganium1Description                                ; 0x0824
	textpointer QuilavaName                                        ; 0x0825
	textpointer CurlUpName                                        ; 0x0826
	textpointer PreventDamageButNotEffectsDesc                         ; 0x0827
	textpointer StunSporeName                                      ; 0x0828
	textpointer RainbowName                                         ; 0x0829
	textpointer Meganium2Description                                 ; 0x082a
	textpointer CyndaquilName                                     ; 0x082b
	textpointer AncientpowerName                                      ; 0x082c
	textpointer SwitchAfterDamageDesc                               ; 0x082d
	textpointer ButterfreesMegaDrainDescription                    ; 0x082e
	textpointer UTurnName                ; 0x082f
	textpointer AquamouseName                                      ; 0x0830
	textpointer LedybaDescription                              ; 0x0831
	textpointer MareepName                                         ; 0x0832
	textpointer PoisonStingName                                    ; 0x0833
	textpointer MayInflictPoisonDescription                        ; 0x0834
	textpointer HandstandName                                       ; 0x0835
	textpointer LedianDescription                                  ; 0x0836
	textpointer TogepiName                                         ; 0x0837
	textpointer CFH30Plus20DamageDesc                          ; 0x0838
	textpointer SpinarakDescription                                  ; 0x0839
	textpointer PolitoedName                                       ; 0x083a
	textpointer EruptionName                                      ; 0x083b
	textpointer DoubleAttackX30Description                         ; 0x083c
	textpointer AquarabbitName                                      ; 0x083d
	textpointer AriadosDescription                                ; 0x083e
	textpointer NatuName                                          ; 0x083f
	textpointer RapidSpinName                                     ; 0x0840
	textpointer WrapName                                           ; 0x0841
	textpointer ArmorName                                          ; 0x0842
	textpointer ZubattDescription                                   ; 0x0843
	textpointer HoohName                                          ; 0x0844
	textpointer FuryCutterName                                   ; 0x0845
	textpointer TerrorStrikeDescription                            ; 0x0846
	textpointer PoisonFangName                                     ; 0x0847
	textpointer CoralName                                          ; 0x0848
	textpointer GolbatDescription                                   ; 0x0849
	textpointer LarvitarName                                       ; 0x084a
	textpointer FurySwipesName                                     ; 0x084b
	textpointer TripleAttackX10Description                         ; 0x084c
	textpointer ShadowBlastName                                  ; 0x084d
	textpointer CFHPlus20orTPARDesc                  ; 0x084e
	textpointer ArmorBirdName                                      ; 0x084f
	textpointer CrobatDescription                                ; 0x0850
	textpointer CroconawName                                                  ; 0x0851
	textpointer SupersonicName                                     ; 0x0852
	textpointer MayInflictConfusionDescription                     ; 0x0853
	textpointer TripleKickName                                     ; 0x0854
	textpointer OddishDescription                                ; 0x0855
	textpointer GranbullName                                      ; 0x0856
	textpointer MegahornName                                     ; 0x0857
	textpointer BoyfriendsDescription                              ; 0x0858
	textpointer MegaPunchName                                      ; 0x0859
	textpointer LightName                                          ; 0x085a
	textpointer GloomDescription                               ; 0x085b
	textpointer HoundoomName                                       ; 0x085c
	textpointer GreatTuskName                                     ; 0x085d
	textpointer MayDoNothingDescription                            ; 0x085e
	textpointer VileplumeDescription                                ; 0x085f
	textpointer QuagsireName                                       ; 0x0860
	textpointer RockSkinName                                      ; 0x0861
	textpointer BellossomDescription                                ; 0x0862
	textpointer HoothootName                                       ; 0x0863
	textpointer ThrashName                                         ; 0x0864
	textpointer MayDo20Plus20Desc                                  ; 0x0865
	textpointer ToxicName                                          ; 0x0866
	textpointer ToxicDescription                                   ; 0x0867
	textpointer HoppipDescription                                ; 0x0868
	textpointer ZubatName                                          ; 0x0869
	textpointer LeechLifeName                                      ; 0x086a
	textpointer ZubatsLeechLifeDescription                         ; 0x086b
	textpointer BatName                                            ; 0x086c
	textpointer SkiploomDescription                                   ; 0x086d
	textpointer GolbatName                                         ; 0x086e
	textpointer WingAttackName                                     ; 0x086f
	textpointer HealEqualToDamageDesc                        ; 0x0870
	textpointer JumpluffDescription                                  ; 0x0871
	textpointer OddishName                                         ; 0x0872
	textpointer EeekName                                         ; 0x0873
	textpointer SproutDescription                                  ; 0x0874
	textpointer WeedName                                           ; 0x0875
	textpointer SunkernDescription                                  ; 0x0876
	textpointer GloomName                                          ; 0x0877
	textpointer IronTailName                                       ; 0x0878
	textpointer FoulOdorDescription                                ; 0x0879
	textpointer SunfloraDescription                                   ; 0x087a
	textpointer VileplumeName                                      ; 0x087b
	textpointer HealingLightName                                           ; 0x087c
	textpointer HealingLightDescription                                    ; 0x087d
	textpointer HayFeverName                                     ; 0x087e
	textpointer TripleAttackX40AndCFNDesc                              ; 0x087f
	textpointer FlowerName                                         ; 0x0880
	textpointer YanmaDescription                               ; 0x0881
	textpointer LugiaName                                          ; 0x0882
	textpointer ScratchName                                        ; 0x0883
	textpointer DarkDescentName                                          ; 0x0884
	textpointer InflictSleepDescription                            ; 0x0885
	textpointer BigHornName                                       ; 0x0886
	textpointer PinecoDescription                                   ; 0x0887
	textpointer SpinarakName                                       ; 0x0888
	textpointer SlashName                                          ; 0x0889
	textpointer ForretressDescription                                ; 0x088a
	textpointer SentretName                                        ; 0x088b
	textpointer VenonatLeechLifeDescription                        ; 0x088c
	textpointer AnglerName                                         ; 0x088d
	textpointer ScytherDescription                                 ; 0x088e
	textpointer DeliBirdName                                       ; 0x088f
	textpointer ScareName                                          ; 0x0890
	textpointer WhirlwindName                                   ; 0x0891
	textpointer DragonTornadoName                                    ; 0x0892
	textpointer IfHeadsCFNAndPSNDesc                             ; 0x0893
	textpointer ClearWingName                                     ; 0x0894
	textpointer ScizorDescription                                ; 0x0895
	textpointer TyranitarName                                     ; 0x0896
	textpointer Mill3IfSuccessDesc                ; 0x0897
	textpointer HeracrossDescription                              ; 0x0898
	textpointer TyphlosionName                                     ; 0x0899
	textpointer RazorLeafName                                      ; 0x089a
	textpointer CottonweedName                                     ; 0x089b
	textpointer CelebiSDescription                              ; 0x089c
	textpointer GirafarigName                                     ; 0x089d
	textpointer ToxicWebName                                           ; 0x089e
	textpointer CFHbothSLPandCFNDesc                         ; 0x089f
	textpointer BurnName                                           ; 0x08a0
	textpointer RisingLungeName                         ; 0x08a1
	textpointer MagbyDescription                              ; 0x08a2
	textpointer MarillName                                         ; 0x08a3
	textpointer DunsparceName                                       ; 0x08a4
	textpointer DataSortName                                       ; 0x08a5
	textpointer ReduceDamageby20Desc                         ; 0x08a6
	textpointer SnipeName                                         ; 0x08a7
	textpointer MagmarDescription                                  ; 0x08a8
	textpointer SunName                                            ; 0x08a9
	textpointer PureBodyName                                       ; 0x08aa
	textpointer ScareDescription                                ; 0x08ab
	textpointer Cyndaquil1Description                                     ; 0x08ac
	textpointer BellossomName                                      ; 0x08ad
	textpointer HypnosisName                                       ; 0x08ae
	textpointer NightEyesName                     ; 0x08af
	textpointer EggName                                            ; 0x08b0
	textpointer Cyndaquil2Description                               ; 0x08b1
	textpointer AzumarillName                                      ; 0x08b2
	textpointer AltruismName                                       ; 0x08b3
	textpointer CanSwitchSelfAfterDamageDesc                                ; 0x08b4
	textpointer DrainingSlashName                                 ; 0x08b5
	textpointer CF30PerSelfEnergyDesc                          ; 0x08b6
	textpointer BagwormName                                        ; 0x08b7
	textpointer Quilava1Description                               ; 0x08b8
	textpointer NoctowlName                                        ; 0x08b9
	textpointer ScuffleName                                        ; 0x08ba
	textpointer PinecoCard                                 ; 0x08bb
	textpointer GigavoltName                                      ; 0x08bc
	textpointer Quilava2Description                                 ; 0x08bd
	textpointer AriadosName                                        ; 0x08be
	textpointer SmogName                                           ; 0x08bf
	textpointer SelfdestructName                                   ; 0x08c0
	textpointer Do20ToAllBench50ToSelfDesc                    ; 0x08c1
	textpointer Typhlosion1Description                                 ; 0x08c2
	textpointer LanturnName                                        ; 0x08c3
	textpointer RoarName                                           ; 0x08c4
	textpointer FrogName                                           ; 0x08c5
	textpointer Typhlosion2Description                             ; 0x08c6
	textpointer FeintAttackName                                     ; 0x08c7
	textpointer SlugmaDescription                            ; 0x08c8
	textpointer ScytherName                                        ; 0x08c9
	textpointer FocusEnergyName                                    ; 0x08ca
	textpointer HeracrossDoubleDamageDesc                             ; 0x08cb
	textpointer MantisName                                         ; 0x08cc
	textpointer MagcargoDescription                                 ; 0x08cd
	textpointer WooperName                                         ; 0x08ce
	textpointer PullInName                                       ; 0x08cf
	textpointer MoonlightName                                     ; 0x08d0
	textpointer FireMouseName                                     ; 0x08d1
	textpointer Houndour1Description                                  ; 0x08d2
	textpointer CharmanderName                                     ; 0x08d3
	textpointer EmberName                                          ; 0x08d4
	textpointer Discard1FDescription                                   ; 0x08d5
	textpointer LizardName                                         ; 0x08d6
	textpointer Houndour2Description                              ; 0x08d7
	textpointer CharmeleonName                                     ; 0x08d8
	textpointer FlamethrowerName                                   ; 0x08d9
	textpointer CharmeleonsFlamethrowerDescription                 ; 0x08da
	textpointer FlameName                                          ; 0x08db
	textpointer HoundoomDescription                              ; 0x08dc
	textpointer CharizardName                                      ; 0x08dd
	textpointer EnergyBurnName                                     ; 0x08de
	textpointer EnergyBurnDescription                              ; 0x08df
	textpointer FireSpinName                                       ; 0x08e0
	textpointer Discard2EnergyDescription                                ; 0x08e1
	textpointer Entei1Description                               ; 0x08e2
	textpointer EspeonName                                         ; 0x08e3
	textpointer ConfuseRayName                                     ; 0x08e4
	textpointer JetName                                            ; 0x08e5
	textpointer Entei2Description                                  ; 0x08e6
	textpointer SudowoodoName                                      ; 0x08e7
	textpointer CFNoRetreatDesc                           ; 0x08e8
	textpointer FireBlastName                                      ; 0x08e9
	textpointer Mareep2Description                               ; 0x08ea
	textpointer HoohDescription                          ; 0x08eb
	textpointer TrampleName                                          ; 0x08ec
	textpointer CanSwitchDPThenSLPDesc                                   ; 0x08ed
	textpointer Flaaffy2Description                               ; 0x08ee
	textpointer MidnightBlazeName                                  ; 0x08ef
	textpointer CF10X9Desc                           ; 0x08f0
	textpointer GrowlitheDescription                          ; 0x08f1
	textpointer GrowlitheName                                      ; 0x08f2
	textpointer FlareName                                          ; 0x08f3
	textpointer PuppyName                                          ; 0x08f4
	textpointer ArcanineDescription                               ; 0x08f5
	textpointer ArcanineName                                       ; 0x08f6
	textpointer QuickAttackName                                    ; 0x08f7
	textpointer MayDo10Plus20Desc                             ; 0x08f8
	textpointer RushingFlamesName                                   ; 0x08f9
	textpointer Discard2FThenPlus10PerSelfDamageDesc                            ; 0x08fa
	textpointer LegendaryName                                      ; 0x08fb
	textpointer FlareonDescription                           ; 0x08fc
	textpointer HexDescription                   ; 0x08fd
	textpointer TakeDownName                                       ; 0x08fe
	textpointer Do40ToSelfDesc                                ; 0x08ff
	textpointer CharmanderDescription                           ; 0x0900
	textpointer PINECOName                                         ; 0x0901
	textpointer SmashKickName                                      ; 0x0902
	textpointer FlameTailName                                      ; 0x0903
	textpointer HardShellName                                      ; 0x0904
	textpointer CharmeleonDescription                                  ; 0x0905
	textpointer JumpluffName                                       ; 0x0906
	textpointer StompName                                          ; 0x0907
	textpointer MayDo20Plus10Description                                   ; 0x0908
	textpointer AgilityName                                        ; 0x0909
	textpointer RonaldNewWinText                        ; 0x090a
	textpointer CharizardSDescription                                ; 0x090b
	textpointer MagmarName                                         ; 0x090c
	textpointer FirePunchName                                      ; 0x090d
	textpointer ElementalBlastName                               ; 0x090e
	textpointer SpitfireName                                       ; 0x090f
	textpointer OmanyteDescription                             ; 0x0910
	textpointer SmokescreenName                                    ; 0x0911
	textpointer DPMayDoNothingDesc                      ; 0x0912
	textpointer OmastarDescription                             ; 0x0913
	textpointer FlareonName                                        ; 0x0914
	textpointer EeveeName                                          ; 0x0915
	textpointer BiteName                                           ; 0x0916
	textpointer RageName                                           ; 0x0917
	textpointer Mill1CardIfSuccessDesc                            ; 0x0918
	textpointer KabutoDescription                            ; 0x0919
	textpointer FlameWheelName                    ; 0x091a
	textpointer KabotopsDescription                            ; 0x091b
	textpointer FlaaffyName                                        ; 0x091c
	textpointer TectonicRiftName                                       ; 0x091d
	textpointer Mill5CardsIfSuccessDesc                                ; 0x091e
	textpointer DiveBombName                                       ; 0x091f
	textpointer VaporeonDescription                            ; 0x0920
	textpointer FireBoostName                                      ; 0x0921
	textpointer FireBoostDescription                               ; 0x0922
	textpointer Totodile1Description                            ; 0x0923
	textpointer SmoochumName                                       ; 0x0924
	textpointer BubbleName                                         ; 0x0925
	textpointer WithdrawName                                       ; 0x0926
	textpointer ExtremespeedName                       ; 0x0927
	textpointer FlyScorpionName                                     ; 0x0928
	textpointer Totodile2Description                                ; 0x0929
	textpointer SmeargleName                                      ; 0x092a
	textpointer CanSwitchDPBeforeDamageDesc                      ; 0x092b
	textpointer AuroraName                                         ; 0x092c
	textpointer Croconaw1Description                               ; 0x092d
	textpointer Porygon2Name                                      ; 0x092e
	textpointer RainDanceName                                      ; 0x092f
	textpointer RainDanceDescription                               ; 0x0930
	textpointer RainDanceDescriptionCont                           ; 0x0931
	textpointer HydroPumpName                                      ; 0x0932
	textpointer Do10MorePerWaterEnergyMax20Desc                               ; 0x0933
	textpointer ShellfishName                                      ; 0x0934
	textpointer Croconaw2Description                               ; 0x0935
	textpointer TogeticName                                        ; 0x0936
	textpointer ThreatenName                                       ; 0x0937
	textpointer NoTrainersDesc                                ; 0x0938
	textpointer HerbName                                           ; 0x0939
	textpointer Feraligatr1Description                                 ; 0x093a
	textpointer SunkernName                                        ; 0x093b
	textpointer PsyshockName                                       ; 0x093c
	textpointer HyperBeamName                                      ; 0x093d
	textpointer Discard1EnergyFromTargetDescription                ; 0x093e
	textpointer Feraligatr2Description                                 ; 0x093f
	textpointer PoliwagName                                        ; 0x0940
	textpointer WaterGunName                                       ; 0x0941
	textpointer RushingFlamesDesc                        ; 0x0942
	textpointer TadpoleName                                        ; 0x0943
	textpointer Marill1Description                                 ; 0x0944
	textpointer PoliwhirlName                                      ; 0x0945
	textpointer AmnesiaName                                        ; 0x0946
	textpointer CantUse1AttackDesc                       ; 0x0947
	textpointer DoubleSlapName                                     ; 0x0948
	textpointer Marill2Description                              ; 0x0949
	textpointer PoliwrathName                                      ; 0x094a
	textpointer FreeText7                      ; 0x094b
	textpointer WhirlpoolName                                      ; 0x094c
	textpointer Azumarill1Description                               ; 0x094d
	textpointer TeddiursaName                                      ; 0x094e
	textpointer TimeLoopName                                      ; 0x094f
	textpointer TimeLoopDescription                               ; 0x0950
	textpointer FiveStarName                                      ; 0x0951
	textpointer Azumarill2Description                               ; 0x0952
	textpointer FeraligatrName                                     ; 0x0953
	textpointer SurprisePresentName                                 ; 0x0954
	textpointer PoliwagDescription                              ; 0x0955
	textpointer XatuName                                           ; 0x0956
	textpointer HeadbuttName                                       ; 0x0957
	textpointer DarknessName                                        ; 0x0958
	textpointer PoliwhirlDescription                                    ; 0x0959
	textpointer UmbreonName                                        ; 0x095a
	textpointer AuroraBeamName                                     ; 0x095b
	textpointer PsykissName                                        ; 0x095c
	textpointer PolitoedDescription                                 ; 0x095d
	textpointer AmpharosName                                       ; 0x095e
	textpointer SearingFlameName                                    ; 0x095f
	textpointer MayDo20ToSelfDesc                             ; 0x0960
	textpointer BigJawName                                        ; 0x0961
	textpointer WooperDescription                                ; 0x0962
	textpointer SkarmoryName                                       ; 0x0963
	textpointer ClampName                                          ; 0x0964
	textpointer Togepi2Description                                   ; 0x0965
	textpointer SpikeCannonName                                    ; 0x0966
	textpointer QuagsireDescription                                ; 0x0967
	textpointer SlugmaName                                         ; 0x0968
	textpointer AeroblastDescription                    ; 0x0969
	textpointer HibernatorName                                      ; 0x096a
	textpointer QwilfishDescription                                  ; 0x096b
	textpointer MurkrowName                                        ; 0x096c
	textpointer FlailName                                          ; 0x096d
	textpointer KinglersFlailDescription                           ; 0x096e
	textpointer DevastateName                                     ; 0x096f
	textpointer PincerName                                         ; 0x0970
	textpointer SneaselDescription                                 ; 0x0971
	textpointer HorseaName                                         ; 0x0972
	textpointer OpponentAttackMayDoNothingDescription              ; 0x0973
	textpointer DragonName                                         ; 0x0974
	textpointer RemoraidDescription                                  ; 0x0975
	textpointer SeadraName                                         ; 0x0976
	textpointer Do20morePerSelfPsychicEnergyDesc                         ; 0x0977
	textpointer BubbleShowerText                          ; 0x0978
	textpointer OctilleryDescription                                  ; 0x0979
	textpointer QwilfishName                                        ; 0x097a
	textpointer StringSpitName                                     ; 0x097b
	textpointer DeliveryName                                       ; 0x097c
	textpointer MantineDescription                                 ; 0x097d
	textpointer SteelixName                                        ; 0x097e
	textpointer TailwindName                                      ; 0x097f
	textpointer HorseaDescription                                 ; 0x0980
	textpointer PatientName                                         ; 0x0981
	textpointer FlamesOfRageName                                           ; 0x0982
	textpointer StarshapeName                                      ; 0x0983
	textpointer SeadraDescription                                  ; 0x0984
	textpointer ScreechName                                        ; 0x0985
	textpointer RecoverName                                        ; 0x0986
	textpointer Discard1WHealAllDamageDesc                         ; 0x0987
	textpointer SweetKissName                                     ; 0x0988
	textpointer IronSnakeName                                     ; 0x0989
	textpointer KingdraDescription                                 ; 0x098a
	textpointer MagikarpName                                       ; 0x098b
	textpointer TackleName                                         ; 0x098c
	textpointer Do10XPerSelfDamageDesc                          ; 0x098d
	textpointer FishName                                           ; 0x098e
	textpointer DragonairDescription                                ; 0x098f
	textpointer GyaradosName                                       ; 0x0990
	textpointer DragonTailName                                     ; 0x0991
	textpointer BubbleShowerName                                     ; 0x0992
	textpointer AtrociousName                                      ; 0x0993
	textpointer MagikarpSDescription                                ; 0x0994
	textpointer ScizorName                                         ; 0x0995
	textpointer Freetext7                          ; 0x0996
	textpointer HappinessName                                      ; 0x0997
	textpointer GyaradosSDescription                                  ; 0x0998
	textpointer VaporeonName                                       ; 0x0999
	textpointer MysticalLeafName                                    ; 0x099a
	textpointer MayDo10toOppsBenchandPRZDesc                             ; 0x099b
	textpointer BubbleJetName                                      ; 0x099c
	textpointer JolteonDescription                           ; 0x099d
	textpointer Freetext8                       ; 0x099e
	textpointer Chinchou1Description                           ; 0x099f
	textpointer OmanyteName                                        ; 0x09a0
	textpointer FossilEggName                               ; 0x09a1
	textpointer OctilleryName                                   ; 0x09a2
	textpointer PrecognitionDescription                            ; 0x09a3
	textpointer Freetext9                        ; 0x09a4
	textpointer SpiralName                                         ; 0x09a5
	textpointer Chinchou2Description                                 ; 0x09a6
	textpointer OmastarName                                        ; 0x09a7
	textpointer Freetext10                        ; 0x09a8
	textpointer Lanturn1Description                                 ; 0x09a9
	textpointer SkiploomName                                       ; 0x09aa
	textpointer IonStormName                                      ; 0x09ab
	textpointer CounterName                                       ; 0x09ac
	textpointer RonaldNewLostText                                ; 0x09ad
	textpointer DivingName                                         ; 0x09ae
	textpointer Lanturn2Description                           ; 0x09af
	textpointer FlowerDanceName                                    ; 0x09b0
	textpointer DarkDescentDesc                             ; 0x09b1
	textpointer MountainCrushName                                      ; 0x09b2
	textpointer SearchFossilEggEffectCommandswnDesc                               ; 0x09b3
	textpointer PichuDescription                           ; 0x09b4
	textpointer PikachuName                                        ; 0x09b5
	textpointer SwineName                                           ; 0x09b6
	textpointer ThunderJoltName                                    ; 0x09b7
	textpointer MayDo10ToSelfDesc                             ; 0x09b8
	textpointer MouseName                                          ; 0x09b9
	textpointer PikachuDescription                            ; 0x09ba
	textpointer SparkName                                          ; 0x09bb
	textpointer Do10To1BenchDesc                                   ; 0x09bc
	textpointer RaichuDescription                            ; 0x09bd
	textpointer GrowlName                                          ; 0x09be
	textpointer ReduceDamageBy10Desc                                   ; 0x09bf
	textpointer ThundershockName                                   ; 0x09c0
	textpointer Mareep1Description                            ; 0x09c1
	textpointer IgglybuffName                                  ; 0x09c2
	textpointer FlyName                                            ; 0x09c3
	textpointer MayPreventAllDamageOrNothingDesc                                     ; 0x09c4
	textpointer Flaaffy1Description                           ; 0x09c5
	textpointer HeracrossName                                 ; 0x09c6
	textpointer SurfName                                           ; 0x09c7
	textpointer Ampharos1Description                          ; 0x09c8
	textpointer RaichuName                                         ; 0x09c9
	textpointer Freetext11                          ; 0x09ca
	textpointer ThunderName                                        ; 0x09cb
	textpointer MayDo30ToSelfDesc                          ; 0x09cc
	textpointer Ampharos2Description                             ; 0x09cd
	textpointer GigashockName                                      ; 0x09ce
	textpointer Do10To3BenchedDesc                               ; 0x09cf
	textpointer ElekidDescription                             ; 0x09d0
	textpointer ChinchouName                                      ; 0x09d1
	textpointer ThunderWaveName                                    ; 0x09d2
	textpointer Freetext12                  ; 0x09d3
	textpointer MysticName                                         ; 0x09d4
	textpointer ElectabuzzDescription                          ; 0x09d5
	textpointer ShinyFeatherName                                  ; 0x09d6
	textpointer ShinyFeatherDescription                           ; 0x09d7
	textpointer RaikouDescription                          ; 0x09d8
	textpointer HoundourName                                       ; 0x09d9
	textpointer Do10ToAllOppBenchDesc              ; 0x09da
	textpointer RaichuSDescription                           ; 0x09db
	textpointer SonicboomName                                      ; 0x09dc
	textpointer DontApplyWRDesc                               ; 0x09dd
	textpointer Do20ToAllBenchThen30ToSelfDesc              ; 0x09de
	textpointer PoliwrathDescription                           ; 0x09df
	textpointer SneaselName                                        ; 0x09e0
	textpointer KissName                                           ; 0x09e1
	textpointer AerodactylDescription                                 ; 0x09e2
	textpointer PiloswineName                                      ; 0x09e3
	textpointer EnergyBoostName                                    ; 0x09e4
	textpointer SearchEnergyAndAttachDesc                             ; 0x09e5
	textpointer SudowoodoDescription                          ; 0x09e6
	textpointer PiercingGazeName                                 ; 0x09e7
	textpointer PsylinkBlastDesc                          ; 0x09e8
	textpointer GligarDescription                          ; 0x09e9
	textpointer ElectabuzzName                                     ; 0x09ea
	textpointer LightScreenName                                    ; 0x09eb
	textpointer OppHalfDamageDesc                             ; 0x09ec
	textpointer OppHalfDamageDescCont                         ; 0x09ed
	textpointer ElectabuzzsMayDo10Plus20Desc                  ; 0x09ee
	textpointer ElectricName                                       ; 0x09ef
	textpointer OnixDescription                         ; 0x09f0
	textpointer ThunderpunchName                                   ; 0x09f1
	textpointer MayDoPlus10or10ToSelfDesc                            ; 0x09f2
	textpointer SteelixDescription                         ; 0x09f3
	textpointer JolteonName                                        ; 0x09f4
	textpointer TripleAttackX30Description                         ; 0x09f5
	textpointer StunNeedleName                                     ; 0x09f6
	textpointer LightningName                                      ; 0x09f7
	textpointer ShuckleDescription                            ; 0x09f8
	textpointer PinMissileName                                     ; 0x09f9
	textpointer QuadrupleAttackX20Description                      ; 0x09fa
	textpointer SwinubDescription                            ; 0x09fb
	textpointer RaikouName                                         ; 0x09fc
	textpointer ThundersquallName                                   ; 0x09fd
	textpointer Freetext13                            ; 0x09fe
	textpointer PiloswineDescription                             ; 0x09ff
	textpointer Discard2FDo10MorePerSelfDamageDesc                           ; 0x0a00
	textpointer ThunderboltName                                    ; 0x0a01
	textpointer DiscardAllEnergyDesc                             ; 0x0a02
	textpointer CorsolaDescription                             ; 0x0a03
	textpointer LightningBurstName                                  ; 0x0a04
	textpointer LightningBurstDescription                           ; 0x0a05
	textpointer BigThunderName                                     ; 0x0a06
	textpointer Do70ToaRandomDesc                              ; 0x0a07
	textpointer Phanpy1Description                             ; 0x0a08
	textpointer HitmontopName                                      ; 0x0a09
	textpointer SandAttackName                                     ; 0x0a0a
	textpointer Phanpy2Description                               ; 0x0a0b
	textpointer MagcargoName                                      ; 0x0a0c
	textpointer TripleAttackX20Description                         ; 0x0a0d
	textpointer Donphan1Description                               ; 0x0a0e
	textpointer ShuckleName                                        ; 0x0a0f
	textpointer NapName                                            ; 0x0a10
	textpointer MudSlapName                                        ; 0x0a11
	textpointer KiteName                                           ; 0x0a12
	textpointer Donphan2Description                                 ; 0x0a13
	textpointer CorsolaName                                        ; 0x0a14
	textpointer EarthquakeName                                     ; 0x0a15
	textpointer Do10ToOwnBenchDesc                              ; 0x0a16
	textpointer TyrogueDescription                                 ; 0x0a17
	textpointer SwinubName                                         ; 0x0a18
	textpointer GazeName                                           ; 0x0a19
	textpointer GazeDescription                                    ; 0x0a1a
	textpointer GazeDescriptionCont                                ; 0x0a1b
	textpointer LandSnakeName                                      ; 0x0a1c
	textpointer HitmonleeDescription                                  ; 0x0a1d
	textpointer SlowkingName                                       ; 0x0a1e
	textpointer EnergyGrowthName                                        ; 0x0a1f
	textpointer MayConfuseSelfDesc                                 ; 0x0a20
	textpointer HitmonchanDescription                                ; 0x0a21
	textpointer PhanpyName                                         ; 0x0a22
	textpointer VolcanoName                                        ; 0x0a23
	textpointer SharpClawName                                     ; 0x0a24
	textpointer HitmontopDescription                                  ; 0x0a25
	textpointer MantineName                                        ; 0x0a26
	textpointer SandstormName                                     ; 0x0a27
	textpointer Minus10PerSelfDamageDesc                              ; 0x0a28
	textpointer SubmissionName                                     ; 0x0a29
	textpointer Do10ToSelfDesc                              ; 0x0a2a
	textpointer LarvitarDescription                                 ; 0x0a2b
	textpointer KingdraName                                        ; 0x0a2c
	textpointer WobblingName                                    ; 0x0a2d
	textpointer WobblingDescription                             ; 0x0a2e
	textpointer WobblingDescriptionCont                         ; 0x0a2f
	textpointer PsylinkBlastName                                    ; 0x0a30
	textpointer PupitarDescription                                 ; 0x0a31
	textpointer BlisseyName                                        ; 0x0a32
	textpointer HiddenPowerName                                   ; 0x0a33
	textpointer Mill2PerHeadsDesc                            ; 0x0a34
	textpointer LavaName                                           ; 0x0a35
	textpointer TyranitarDescription                                 ; 0x0a36
	textpointer WobbuffetName                                       ; 0x0a37
	textpointer ChargeName                                         ; 0x0a38
	textpointer Prevent30orLessDesc                         ; 0x0a39
	textpointer RockThrowName                                      ; 0x0a3a
	textpointer KabutopsSDescription                                ; 0x0a3b
	textpointer EnteiName                                          ; 0x0a3c
	textpointer CutenessName                                      ; 0x0a3d
	textpointer Do10toAllBenchand40ToSelfDesc                      ; 0x0a3e
	textpointer MilkCowName                                        ; 0x0a3f
	textpointer SteelixSDescription                                   ; 0x0a40
	textpointer OnixName                                           ; 0x0a41
	textpointer Freetext15                             ; 0x0a42
	textpointer RockSnakeName                                      ; 0x0a43
	textpointer TyranitarSDescription                                    ; 0x0a44
	textpointer ElekidName                                         ; 0x0a45
	textpointer SnivelName                                         ; 0x0a46
	textpointer ReduceBy20Descr                                  ; 0x0a47
	textpointer Do10MorePerSelfDamageDesc                             ; 0x0a48
	textpointer SymbolName                                         ; 0x0a49
	textpointer GastlyDescription                                  ; 0x0a4a
	textpointer DonphanName                                        ; 0x0a4b
	textpointer LittleBirdName                                     ; 0x0a4c
	textpointer CallforFriendName                                  ; 0x0a4d
	textpointer SearchForTandPutOnBenchDesc                           ; 0x0a4e
	textpointer SinglehornName                                     ; 0x0a4f
	textpointer HaunterDescription                            ; 0x0a50
	textpointer GoldScaleName                                     ; 0x0a51
	textpointer CFDo10toYourOrOppBenchDesc                              ; 0x0a52
	textpointer GrassKnotName                                           ; 0x0a53
	textpointer WailDescription                                    ; 0x0a54
	textpointer GengarDescription                            ; 0x0a55
	textpointer HitmonleeName                                      ; 0x0a56
	textpointer TimeTravelName                                    ; 0x0a57
	textpointer Do30toaBenchDesc                             ; 0x0a58
	textpointer HighJumpKickName                                   ; 0x0a59
	textpointer KickingName                                        ; 0x0a5a
	textpointer MewtwoDescription                               ; 0x0a5b
	textpointer HitmonchanName                                     ; 0x0a5c
	textpointer JabName                                            ; 0x0a5d
	textpointer SpecialPunch                                       ; 0x0a5e
	textpointer PunchingName                                       ; 0x0a5f
	textpointer MewDescription                              ; 0x0a60
	textpointer TyrogueName                                        ; 0x0a61
	textpointer LeerName                                           ; 0x0a62
	textpointer LeerDescription                                    ; 0x0a63
	textpointer ScoutName                                          ; 0x0a64
	textpointer NatuDescription                                 ; 0x0a65
	textpointer CelebiName                                         ; 0x0a66
	textpointer RamName                                            ; 0x0a67
	textpointer SwitchOppActiveand20ToSelfDesc                                     ; 0x0a68
	textpointer SwitchOppActiveand20ToSelfDescCont                                 ; 0x0a69
	textpointer XatuDescription                                  ; 0x0a6a
	textpointer KabutoName                                         ; 0x0a6b
	textpointer PrecognitionName                                    ; 0x0a6c
	textpointer IroncladDesc                             ; 0x0a6d
	textpointer IroncladDescCont                         ; 0x0a6e
	textpointer Espeon1Description                                  ; 0x0a6f
	textpointer KabutopsName                                       ; 0x0a70
	textpointer DrainSlashName                                    ; 0x0a71
	textpointer AbsorbName                                         ; 0x0a72
	textpointer HealHalfDamageDesc                                  ; 0x0a73
	textpointer Heal1DamageifSuccessDesc                              ; 0x0a74
	textpointer Espeon2Description                                ; 0x0a75
	textpointer AerodactylName                                     ; 0x0a76
	textpointer PrimalAuraName                               ; 0x0a77
	textpointer PrimalAuraDesc                        ; 0x0a78
	textpointer FossilName                                         ; 0x0a79
	textpointer UmbreonDescription                              ; 0x0a7a
	textpointer LeafName                                           ; 0x0a7b
	textpointer OwlName                                            ; 0x0a7c
	textpointer MurkrowDescription                                    ; 0x0a7d
	textpointer MiltankName                                        ; 0x0a7e
	textpointer Discard1PHealAllDamageDesc                         ; 0x0a7f
	textpointer SymbolSwarmName                                       ; 0x0a80
	textpointer SlowpokeDescription                                 ; 0x0a81
	textpointer SnubbullName                                       ; 0x0a82
	textpointer DamageSwapName                                     ; 0x0a83
	textpointer DamageSwapDescription                              ; 0x0a84
	textpointer SlowkingDescription                                ; 0x0a85
	textpointer SlowpokeName                                       ; 0x0a86
	textpointer OppCantDo1AttackDesc                        ; 0x0a87
	textpointer DopeyName                                          ; 0x0a88
	textpointer MisdreavusDescription                            ; 0x0a89
	textpointer SoftboiledName                                     ; 0x0a8a
	textpointer SlowbroDescription                              ; 0x0a8b
	textpointer ScavengeName                                       ; 0x0a8c
	textpointer GetTrainerCardDiscard1PDesc                                ; 0x0a8d
	textpointer SlowbroName                                        ; 0x0a8e
	textpointer ProtectiveFlameName                                ; 0x0a8f
	textpointer AltruismDesc                         ; 0x0a90
	textpointer HermitcrabName                                     ; 0x0a91
	textpointer GirafarigDescription                                 ; 0x0a92
	textpointer GastlyName                                         ; 0x0a93
	textpointer SleepPowderName                                    ; 0x0a94
	textpointer MayInflictSleepDescription                         ; 0x0a95
	textpointer DestinyBondName                                    ; 0x0a96
	textpointer MoonlightDescription                             ; 0x0a97
	textpointer GasName                                            ; 0x0a98
	textpointer SmoochumDescription                              ; 0x0a99
	textpointer LickName                                           ; 0x0a9a
	textpointer EnergyConversionName                               ; 0x0a9b
	textpointer Retrieve2DiscardedEnergyDesc                        ; 0x0a9c
	textpointer WobbuffetDescription                             ; 0x0a9d
	textpointer HaunterName                                        ; 0x0a9e
	textpointer PainSplitName                                   ; 0x0a9f
	textpointer Do10MorePerOppRCDesc                           ; 0x0aa0
	textpointer NightmareName                                      ; 0x0aa1
	textpointer UnownADescription                                 ; 0x0aa2
	textpointer HydrocutterName                                     ; 0x0aa3
	textpointer SelfDoubleDamageDesc                              ; 0x0aa4
	textpointer GengarName                                         ; 0x0aa5
	textpointer CurseName                                          ; 0x0aa6
	textpointer CurseDescription                                   ; 0x0aa7
	textpointer DarkMindName                                       ; 0x0aa8
	textpointer DamageAndDo10ToABenchDesc                                ; 0x0aa9
	textpointer ShadowName                                         ; 0x0aaa
	textpointer JynxDescription                                  ; 0x0aab
	textpointer PupitarName                                        ; 0x0aac
	textpointer PoundName                                          ; 0x0aad
	textpointer CelebiDescription                                 ; 0x0aae
	textpointer PichuName                                          ; 0x0aaf
	textpointer ProphecyName                                       ; 0x0ab0
	textpointer ProphecyDescription                                ; 0x0ab1
	textpointer MewtwoSDescription                                   ; 0x0ab2
	textpointer StantlerName                                         ; 0x0ab3
	textpointer MythicalShieldName                                  ; 0x0ab4
	textpointer MythicalShieldDescription                           ; 0x0ab5
	textpointer MythicalShieldDescriptionCont                       ; 0x0ab6
	textpointer MeditateName                                       ; 0x0ab7
	textpointer Do10MorePerOppDamageDesc                         ; 0x0ab8
	textpointer BarrierName                                        ; 0x0ab9
	textpointer MewSDescription                                  ; 0x0aba
	textpointer JynxName                                           ; 0x0abb
	textpointer DoubleAttackX10Description                         ; 0x0abc
	textpointer Freetext16                           ; 0x0abd
	textpointer HumanShapeName                                     ; 0x0abe
	textpointer DratiniDescription                                    ; 0x0abf
	textpointer MewtwoName                                         ; 0x0ac0
	textpointer PsychicName                                        ; 0x0ac1
	textpointer Do10MorePerOppEenergyDesc                                 ; 0x0ac2
	textpointer BarrierDescription                                 ; 0x0ac3
	textpointer GeneticName                                        ; 0x0ac4
	textpointer DragoniteDescription                             ; 0x0ac5
	textpointer EnergyAbsorptionName                               ; 0x0ac6
	textpointer EnergyAbsorptionDescription                        ; 0x0ac7
	textpointer PsyburnName                                        ; 0x0ac8
	textpointer Togepi1Description                             ; 0x0ac9
	textpointer MewName                                            ; 0x0aca
	textpointer NeutralizingShieldName                             ; 0x0acb
	textpointer CutenessDescription                      ; 0x0acc
	textpointer NewSpeciesName                                     ; 0x0acd
	textpointer Togetic1Description                                 ; 0x0ace
	textpointer MysteryAttackName                                  ; 0x0acf
	textpointer MysteryAttackDescription                           ; 0x0ad0
	textpointer FurretDescription                                ; 0x0ad1
	textpointer PsywaveName                                        ; 0x0ad2
	textpointer Do20PerUnownADesc                                 ; 0x0ad3
	textpointer DevolutionBeamName                                 ; 0x0ad4
	textpointer DevolutionBeamDescription                          ; 0x0ad5
	textpointer LedybaName                                         ; 0x0ad6
	textpointer LongBodyName                                       ; 0x0ad7
	textpointer HoothootDescription                                  ; 0x0ad8
	textpointer RemoraidName                                      ; 0x0ad9
	textpointer SteelWingName                                     ; 0x0ada
	textpointer CounterDesc                    ; 0x0adb
	textpointer MoldName                                           ; 0x0adc
	textpointer NoctowlDescription                               ; 0x0add
	textpointer FurretName                                        ; 0x0ade
	textpointer SurpriseBiteName                                    ; 0x0adf
	textpointer Do30ToARandomDesc                             ; 0x0ae0
	textpointer UnownJName                                           ; 0x0ae1
	textpointer SwitchPKMBRandomlyDesc                                    ; 0x0ae2
	textpointer CleffaDescription                                ; 0x0ae3
	textpointer UnknownSpellName                                      ; 0x0ae4
	textpointer IfNoKOThenReturntoHandDesc                               ; 0x0ae5
	textpointer ClefairyDescription                                ; 0x0ae6
	textpointer SuicuneName                                        ; 0x0ae7
	textpointer PigName                                            ; 0x0ae8
	textpointer ClefableDescription                                 ; 0x0ae9
	textpointer SunfloraName                                       ; 0x0aea
	textpointer LowKickName                                      ; 0x0aeb
	textpointer PainSplitDesc                               ; 0x0aec
	textpointer IgglybuffDescription                                ; 0x0aed
	textpointer LedianName                                        ; 0x0aee
	textpointer PeckName                                           ; 0x0aef
	textpointer JigglypuffDescription                      ; 0x0af0
	textpointer WigglytuffDescription                                 ; 0x0af1
	textpointer GligarName                                         ; 0x0af2
	textpointer MayGetImmunityDesc                          ; 0x0af3
	textpointer BlastBurnName                                      ; 0x0af4
	textpointer WoolName                                           ; 0x0af5
	textpointer SentretDescription                                  ; 0x0af6
	textpointer ClefairyName                                       ; 0x0af7
	textpointer SingName                                           ; 0x0af8
	textpointer MetronomeName                                      ; 0x0af9
	textpointer CopyOppAttackDescription                      ; 0x0afa
	textpointer FairyName                                          ; 0x0afb
	textpointer Togetic2Description                                ; 0x0afc
	textpointer ClefableName                                       ; 0x0afd
	textpointer SketchDescription                      ; 0x0afe
	textpointer Do20MorePerOppEnergyDesc                       ; 0x0aff
	textpointer AipomDescription                                ; 0x0b00
	textpointer JigglypuffName                                     ; 0x0b01
	textpointer SpikeBallName                                       ; 0x0b02
	textpointer Heal1DamageDesc                                ; 0x0b03
	textpointer DoubleEdgeName                                     ; 0x0b04
	textpointer BalloonName                                        ; 0x0b06
	textpointer EeveeDescription                         ; 0x0b07
	textpointer FriendshipSongName                                 ; 0x0b08
	textpointer Do10PerOppRCDesc                          ; 0x0b09
	textpointer ExpandName                                         ; 0x0b0a
	textpointer ExpandDescription                                  ; 0x0b0b
	textpointer DunsparceDescription                         ; 0x0b0c
	textpointer LullabyName                                        ; 0x0b0d
	textpointer SnubbullDescription                         ; 0x0b0e
	textpointer WigglytuffName                                     ; 0x0b0f
	textpointer MilkDrinkName                                      ; 0x0b10
	textpointer Do10MorePerYourBenchedDesc                               ; 0x0b11
	textpointer GranbullDescription                              ; 0x0b12
	textpointer HoppipName                                         ; 0x0b13
	textpointer AquaJetName                                       ; 0x0b14
	textpointer Do20x2Description                                ; 0x0b15
	textpointer LittleBearName                                     ; 0x0b16
	textpointer TeddiursaDescription                             ; 0x0b17
	textpointer BeatUpName                                         ; 0x0b18
	textpointer MayDraw1CardDesc                                  ; 0x0b19
	textpointer UrsaringDescription                             ; 0x0b1a
	textpointer CrobatName                                        ; 0x0b1b
	textpointer PounceName                                         ; 0x0b1c
	textpointer PounceDescription                                  ; 0x0b1d
	textpointer TinyMouseName                                      ; 0x0b1e
	textpointer DelibirdDescription                                 ; 0x0b1f
	textpointer MisdreavusName                                      ; 0x0b20
	textpointer AeroblastName                                       ; 0x0b21
	textpointer Do20ToABenchDesc                                ; 0x0b22
	textpointer IroncladName                                       ; 0x0b23
	textpointer ImitationName                                       ; 0x0b24
	textpointer SkarmoryDescription                               ; 0x0b25
	textpointer AipomName                                          ; 0x0b26
	textpointer FoulStenchName                                     ; 0x0b27
	textpointer LiveCoalName                                       ; 0x0b28
	textpointer PorygonDescription                                   ; 0x0b29
	textpointer YanmaName                                         ; 0x0b2a
	textpointer HolyFlameName                                     ; 0x0b2b
	textpointer TailwindDescription                              ; 0x0b2c
	textpointer Heal2DamageDesc                             ; 0x0b2d
	textpointer WaterFishName                                     ; 0x0b2e
	textpointer Porygon2Description                                  ; 0x0b2f
	textpointer UrsaringName                                      ; 0x0b30
	textpointer SacredFireName                                     ; 0x0b31
	textpointer PainterName                                        ; 0x0b32
	textpointer StantlerDescription                               ; 0x0b33
	textpointer ChanseyName                                        ; 0x0b34
	textpointer SketchName                                        ; 0x0b35
	textpointer HeavySlamName                                 ; 0x0b36
	textpointer Do10lessPerOppRCDesc                      ; 0x0b37
	textpointer SmeargleDescription                                 ; 0x0b38
	textpointer ForretressName                                     ; 0x0b39
	textpointer FetchName                                          ; 0x0b3a
	textpointer Draw1CardDesc                                   ; 0x0b3b
	textpointer CometPunchName                                     ; 0x0b3c
	textpointer RoyalName                                         ; 0x0b3d
	textpointer MiltankDescription                              ; 0x0b3e
	textpointer UnownAName                                         ; 0x0b3f
	textpointer RampageName                                        ; 0x0b40
	textpointer Do10PerSelfDamageThenMayConfuse                                 ; 0x0b41
	textpointer LongNeckName                                       ; 0x0b42
	textpointer ChanseyDescription                                  ; 0x0b43
	textpointer MagbyName                                          ; 0x0b44
	textpointer SwiftName                                          ; 0x0b45
	textpointer CFHPARorTCFN                                   ; 0x0b46
	textpointer MayDo20ToEachOppsBenchDesc                               ; 0x0b47
	textpointer LongNoseName                                      ; 0x0b48
	textpointer BlisseyDescription                                   ; 0x0b49
	textpointer TailWagName                                        ; 0x0b4a
	textpointer TailWagDescription                                 ; 0x0b4b
	textpointer EvolutionName                                      ; 0x0b4c
	textpointer LugiaDescription                                   ; 0x0b4d
	textpointer PorygonName                                        ; 0x0b4e
	textpointer DataDistortionName                                    ; 0x0b4f
	textpointer MayChangeWeaknessDesc                             ; 0x0b50
	textpointer Conversion2Name                                    ; 0x0b51
	textpointer Conversion2Description                             ; 0x0b52
	textpointer VirtualName                                        ; 0x0b53
	textpointer NoctowlSDescription                                 ; 0x0b54
	textpointer CleffaName                                        ; 0x0b55
	textpointer DragonSmashName                                   ; 0x0b56
	textpointer PureBodyDescription                            ; 0x0b57
	textpointer BodySlamName                                       ; 0x0b58
	textpointer LongLegName                                       ; 0x0b59
	textpointer SuicuneDescription                                 ; 0x0b5a
	textpointer DratiniName                                        ; 0x0b5b
	textpointer CharizardCDescription                                 ; 0x0b5c
	textpointer DragonairName                                      ; 0x0b5d
	textpointer SlamName                                           ; 0x0b5e
	textpointer LugiaCDescription                               ; 0x0b5f
	textpointer DragoniteName                                      ; 0x0b60
	textpointer HerbalScentName                                    ; 0x0b61
	textpointer SoftboiledDescription                             ; 0x0b62
	textpointer HoohCDescription                          ; 0x0b63
	textpointer StepInName                                         ; 0x0b64
	textpointer StepInDescription                                  ; 0x0b65
	textpointer DoubleAttackX40Description                         ; 0x0b66
	textpointer CelebiCDescription                               ; 0x0b67
	textpointer ProfessorElmName                                   ; 0x0b68
	textpointer ProfessorElmDescription                            ; 0x0b69
	textpointer TeamRocketsEvilDeedsName                           ; 0x0b6a
	textpointer TeamRocketsEvilDeedsDesc                    ; 0x0b6b
	textpointer MailFromBillName                                           ; 0x0b6c
	textpointer MailFromBillDescription                                    ; 0x0b6d
	textpointer ForestGuardianName                                         ; 0x0b6e
	textpointer ForestGuardianDescription                                  ; 0x0b6f
	textpointer SeerName                                           ; 0x0b70
	textpointer SeerDescription                                    ; 0x0b71
	textpointer ShadowLugiaName                                        ; 0x0b72
	textpointer ShadowLugiaDescription                                 ; 0x0b73
	textpointer PokemonFanClubName                                  ; 0x0b74
	textpointer PokemonFanClubDescription                           ; 0x0b75
	textpointer StarPieceName                                 ; 0x0b76
	textpointer StarPieceDescription                          ; 0x0b77
	textpointer PokeDollName                                   ; 0x0b78
	textpointer PokeDollDescription                            ; 0x0b79
	textpointer PokeDollDescriptionCont                        ; 0x0b7a
	textpointer FossilEggDescription                        ; 0x0b7b
	textpointer FossilEggDescriptionCont                    ; 0x0b7c
	textpointer EnergyArkName                                ; 0x0b7d
	textpointer EnergyArkDescription                         ; 0x0b7e
	textpointer SuperEnergyRetrievalName                           ; 0x0b7f
	textpointer SuperEnergyRetrievalDescription                    ; 0x0b80
	textpointer EnergySearchName                                   ; 0x0b81
	textpointer EnergySearchDescription                            ; 0x0b82
	textpointer EnergyRemoval2Name                                  ; 0x0b83
	textpointer EnergyRemoval2Description                           ; 0x0b84
	textpointer MasterBallName                             ; 0x0b85
	textpointer MasterBallDescription                      ; 0x0b86
	textpointer SwitchName                                         ; 0x0b87
	textpointer SwitchDescription                                  ; 0x0b88
	textpointer PokemonNurseName                                  ; 0x0b89
	textpointer PokemonNurseDescription                           ; 0x0b8a
	textpointer PokeBallName                                       ; 0x0b8b
	textpointer PokeBallDescription                                ; 0x0b8c
	textpointer SuperScoopUpName                                        ; 0x0b8d
	textpointer SuperScoopUpDescription                                 ; 0x0b8e
	textpointer PokegearName                                 ; 0x0b8f
	textpointer PokegearDescription                          ; 0x0b90
	textpointer NewPokedexName                                        ; 0x0b91
	textpointer NewPokedexDescription                                 ; 0x0b92
	textpointer StrengthCharmName                                      ; 0x0b93
	textpointer StrengthCharmDescription                               ; 0x0b94
	textpointer CrystalShardName                                       ; 0x0b95
	textpointer CrystalShardDescription                                ; 0x0b96
	textpointer RuinWallName                                     ; 0x0b97
	textpointer RuinWallDescription                              ; 0x0b98
	textpointer PokemonReversalName                                     ; 0x0b99
	textpointer PokemonReversalDescription                              ; 0x0b9a
	textpointer HyperDevolutionSprayName                                ; 0x0b9b
	textpointer HyperDevolutionSprayDescription                         ; 0x0b9c
	textpointer HyperDevolutionSprayDescriptionCont                     ; 0x0b9d
	textpointer PotionName                                         ; 0x0b9e
	textpointer PotionDescription                                  ; 0x0b9f
	textpointer HyperPotionName                                    ; 0x0ba0
	textpointer HyperPotionDescription                             ; 0x0ba1
	textpointer FullHealName                                       ; 0x0ba2
	textpointer FullHealDescription                                ; 0x0ba3
	textpointer MiracleBerryName                                         ; 0x0ba4
	textpointer MiracleBerryDescription                                  ; 0x0ba5
	textpointer BillsMaintenanceName                                    ; 0x0ba6
	textpointer BillsMaintenanceDescription                             ; 0x0ba7
	textpointer PokemonFluteChannelName                                   ; 0x0ba8
	textpointer PokemonFluteChannelDescription                            ; 0x0ba9
	textpointer ArcadeGameName                                        ; 0x0baa
	textpointer ArcadeGameDescription                                 ; 0x0bab
	textpointer OldRodName                                        ; 0x0bac
	textpointer OldRodDescription                                           ; 0x0bad
	textpointer DucklettName                                       ; 0x0bae
	textpointer FlapName                                           ; 0x0baf
	textpointer DucklettDescription                                ; 0x0bb0
	textpointer DuckName
	textpointer CF10ToYourOrOppBenchDesc
	textpointer SleepSeedName
	textpointer VineWhipName
	textpointer BulbasaurDescription
	textpointer BulbasaurName
	textpointer IvysaurName
	textpointer PoisonVineName
	textpointer TangleName
	textpointer IvysaurDescription
	textpointer VenusaurName
	textpointer MysteryPowderName
	textpointer MayInflictRandomStatusDesc
	textpointer VenusaurDescription
	textpointer PonytaName
	textpointer FireHorseName
	textpointer PonytaDescription
	textpointer RapidashName
	textpointer OverrunName
	textpointer GallopName
	textpointer RapidashDescription
	textpointer AttackDraw2Description
	textpointer VulpixName
	textpointer FoxName
	textpointer VulpixDescription
	textpointer NinetalesName
	textpointer MisleadName
	textpointer EtheralFlameName
	textpointer EtheralFlameDesc
	textpointer NinetalesDescription
	textpointer MoltresName
	textpointer MoltresDescription
	textpointer SquirtleName
	textpointer TinyTurtleName
	textpointer SquirtleDescription
	textpointer WartortleName
	textpointer WaveSplashName
	textpointer TurtleName
	textpointer WartortleDescription
	textpointer BlastoiseName
	textpointer JetStreamName
	textpointer BlastoiseDescription
	textpointer ArticunoName
	textpointer QuickfreezeName
	textpointer QuickfreezeDescription
	textpointer BlizzardName
	textpointer FreezeName
	textpointer ArticunoDescription
	textpointer MachopName
	textpointer PunchName
	textpointer FlingName
	textpointer SuperpowerName
	textpointer MachopDescription
	textpointer MachokeName
	textpointer MachokeDescription
	textpointer MachampName
	textpointer TerraformingName
	textpointer ETBMill5Description
	textpointer IronFistName
	textpointer Do10MorePerInjuredPokesDesc
	textpointer MachampDescription
	textpointer RhyhornName
	textpointer SpikesName
	textpointer RhyhornDescription
	textpointer RhydonName
	textpointer HornDrillName
	textpointer CanOnlyUseOnceDesc
	textpointer RhydonDescription
	textpointer DrillName
	textpointer HideName
	textpointer Pikachu2Description
	textpointer Raichu2Description
	textpointer VoltorbName
	textpointer BallName
	textpointer VoltorbDescription
	textpointer ElectrodeName
	textpointer EnergyBurstName
	textpointer Do10xPerYouAndOppEnergyDesc
	textpointer ElectrodeDescription
	textpointer MagnemiteName
	textpointer MagnetismName
	textpointer SwitchOppDesc
	textpointer MagnetName
	textpointer MagnemiteDescription
	textpointer MagnetonName
	textpointer SteelWaveName
	textpointer MagnetonDescription
	textpointer ZapdosName
	textpointer LightningBurnName
	textpointer ZapdosDescription
	textpointer AbraName
	textpointer TeleportName
	textpointer PsiName
	textpointer AbraDescription
	textpointer KadabraName
	textpointer KinesisName
	textpointer MindShockName
	textpointer KadabraDescription
	textpointer AlakazamName
	textpointer PsymimicName
	textpointer AlakazamDescription
	textpointer PsymimicDescription
	textpointer SnorlaxName
	textpointer SleepingName
	textpointer SnorlaxDescription
	textpointer RestName
	textpointer SLPAndHealDescription
	textpointer FossilHuntName
	textpointer SearchForFossilEggDesc
	textpointer DisruptionName
	textpointer ETBNoOPPTrainersDescription
	textpointer VitalThrowName
	textpointer VitalThrowDesc
	textpointer ShockBoltName
	textpointer MorePARIfHPLowDesc
	textpointer GentleFlamesName
	textpointer LessDamageifDFPInjuredDesc
	textpointer HexName
	textpointer MoreDamageifDFPStatusedDesc
	textpointer PhoenixFlareName
	textpointer DeepSleepName
	textpointer FireWingName
	textpointer CF20ToABenchDesc
	textpointer DeepSleepDesc
	textpointer DragOffName
	textpointer Heal10FromAllDesc
	textpointer KingdraSDescription
	textpointer DragonbreathName
	textpointer DracoMeteorName
	textpointer DracoMeteorDesc
	textpointer CrossAttackName
	textpointer CrossAttackDesc
	textpointer CriticalStrikeName
	textpointer CriticalStrikeDesc
	textpointer CombustionName
	textpointer NoRetreatText
	textpointer SpiderBiteName
	textpointer CornerName
	textpointer MoreDamageIfDFPInjuredDesc
	textpointer PesterName
	textpointer ConductivityName
	textpointer ConductivityDesc
	textpointer PollenShieldName
	textpointer DoubleRazorLeafName
	textpointer SweetScentName
	textpointer SweetScentDesc
	textpointer SoothingScentName
	textpointer PoisonSeedName
	textpointer HarvestBountyName
	textpointer StrangeScentName
	textpointer BatonPassName
	textpointer BatonPassDesc
	textpointer ScaryFaceName
	textpointer PoisonBiteDesc
	textpointer CFCFNorSLPDesc
	textpointer StickyNectarName
	textpointer StickyNectarDesc
	textpointer PetalDanceName
	textpointer PetalDanceDesc
	textpointer PoisonPollenName
	textpointer PoisonPollenDesc
	textpointer SweetNectarName
	textpointer SweetNectarDesc
	textpointer Do30MorePerBellossomDesc
	textpointer RollingTackleName
	textpointer GrowthName
	textpointer ShockwaveDesc
	textpointer ShellRuptureName
	textpointer DoubleSpinName
	textpointer SharpSickleName
	textpointer OneSidedLassDesc
	textpointer FinalBlowName
	textpointer FinalBlowDesc
	textpointer FireWindName
	textpointer IncinerateName
	textpointer ChooseAndDiscard3EnergyCardsText
	textpointer FlameWheelDesc
	textpointer SputterName
	textpointer TailSlapName
	textpointer CollectFireName
	textpointer Get1EnergyFromDiscardDesc
	textpointer EerieHowlName
	textpointer HealingWaterName
	textpointer Heal10PerWDesc
	textpointer ConfusionIfAnyHeadsText
	textpointer CF2CFNDesc
	textpointer IfHHealAllDamageFromGText
	textpointer DriveOffDesc
	textpointer DriveOffDesc2
	textpointer ArcNoActiveText
	textpointer StrangeScentDesc
	textpointer EnergyEvolutionName
	textpointer CFGet1EnergyFromDiscardDesc
	textpointer DiscardEIfTailsText
	textpointer WarmUpName
	textpointer BurningFlameName
	textpointer BurningFlamedesc
	textpointer StokeName
	textpointer CowardiceSuccessText
	textpointer BatonPassGDesc
	textpointer TailRapName
	textpointer DamageCF2X10Desc
	textpointer IfT30RecoilText
	textpointer Do20toSelfDesc          
	textpointer ChompName
	textpointer ChompDesc
	textpointer IfHRageEffectText
	textpointer CFMill5Somebody      
	textpointer IfHDiscardEnergyText
	textpointer BubblebeamName
	textpointer GiantWaveName
	textpointer EnergyCannonName
	textpointer DevolutionDesc
	textpointer IfHeadsDevolveText
	textpointer DarkTentacleName
	textpointer BatonPassWDesc
	textpointer BubbleBombName
	textpointer BBDesc
	textpointer HypnoshowerName
	textpointer HypnoshowerDesc
	textpointer CF3X40Desc
	textpointer WashAwayName
	textpointer RolloutName
	textpointer FrogHopName
	textpointer EnergySplashName
	textpointer EnergyTransWDesc
	textpointer SlimeName
	textpointer FishingTailName
	textpointer Get1CardFromDiscardDesc
	textpointer SuctionCupsName
	textpointer UndulateName
	textpointer FloatName
	textpointer ReverseThrustName
	textpointer Do10MorePerWText
	textpointer CFDo10MorePerWaterEnergyDesc
	textpointer WaterBulletName
	textpointer ChooseSwitchAfterDamageDesc
	textpointer FreezeSolidName
	textpointer IceCycloneName
	textpointer AuroraWaveText
	textpointer AuroraWaveDesc
	textpointer ChooseAGyaradosFromDeckText
	textpointer GyaradosText
	textpointer ChooseAGyaradosText
	textpointer DragonBondName
	textpointer SearchGyaradosDesc
	textpointer EverybodyDraw2Desc
	textpointer RageOrNothingText
	textpointer RageOrNothingDesc
	textpointer HydroelectricPowerName
	textpointer HydroelectricPowerDesc
	textpointer FloodlightName
	textpointer PulseGuardName
	textpointer Prevent30PlusDamageDesc
	textpointer EeveelutionDesc
	textpointer ThunderNeedleName
	textpointer ThunderNeedleDesc
	textpointer PositiveIonName
	textpointer TenplusTenDesc
	textpointer NegativeIonName
	textpointer ThunderNeedleText
	textpointer ElectricTackleName
	textpointer ETRecoilText
	textpointer ElectricTackleDesc
	textpointer ZzzapName
	textpointer DischargeCFText
	textpointer DischargeName
	textpointer DischargeDesc
	textpointer ElectricCurrentName
	textpointer ReturnLToHandDesc
	textpointer StaticElectricityName
	textpointer HighVoltageName
	textpointer IfHNoTrainersText
	textpointer StunWaveName
	textpointer CFNoTrainersDesc
	textpointer DiscardAllLDesc
	textpointer PlasmaName
	textpointer SuperDynamoName
	textpointer BounceOffName
	textpointer SwitchRandomlyDesc
	textpointer PlayfulPunchName
	textpointer CF20ToSelfDesc
	textpointer LightningTackleName
	textpointer CorkscrewPunchName
	textpointer StunPoisonName
	textpointer CFHPsnAndCfnDesc
	textpointer Plus20DamageDesc
	textpointer ThickShellName
	textpointer Do10toSelfDesc
	textpointer EndureName
	textpointer TuskTossName
	textpointer TuskTossText
	textpointer ChopName
	textpointer StreamingMantleName
	textpointer ETBMill3Desc
	textpointer CrushingLavaName
	textpointer OneTwoKickName
	textpointer SmashPunchName
	textpointer DodgeName
	textpointer DetectName
	textpointer HornAttackName
	textpointer RetaliateName
	textpointer SkullBashName
	textpointer Do10allbenchDesc
	textpointer DestructiveFireName
	textpointer LCutText
	textpointer WaterSlashText
	textpointer SurroundName
	textpointer SuperPsywaveName
	textpointer SurroundText
	textpointer SurroundDesc
	textpointer MagWaveDesc
	textpointer CallBackName
	textpointer CallBackDesc
	textpointer TelekinesisName
	textpointer DealDamageAnyTargetDesc
	textpointer GougeName
	textpointer MurkrowText
	textpointer Do30AnyTargetDesc
	textpointer CallForFamilyName
	textpointer FindMurkrowDesc
	textpointer FlockText
	textpointer FlockDesc
	textpointer EnergyRecallName
	textpointer UnableToUseTrainerDueMindGamesText
	textpointer FillerText
	textpointer CFPlus10AndCFNDesc
	textpointer MindBlastText
	textpointer PsybeamName
	textpointer AngerName
	textpointer JetStreamDesc
	textpointer FlashSearchName
	textpointer FlashSearchDesc
	textpointer PsychicDamageName
	textpointer ChoosePkmnToGiveDamageText
	textpointer SuperPsywaveDesc
	textpointer ContinuousTumbleName
	textpointer ContinuousTumbleDesc
	textpointer TumbleText
	textpointer ProtectiveWaveName
	textpointer GlaringGazeName
	textpointer ShockwaveText
	textpointer SquaredAttackName
	textpointer PoisonFlameName
	textpointer AquabombName
	textpointer DualBurnName
	textpointer Discard1PDescription
	textpointer Do10ToABenchDesc
	textpointer SquaredanceName
	textpointer SpikeBallTackleName
	textpointer ErrandName
	textpointer SuperMText
	textpointer GlareName
	textpointer IfHeadSwitchPKMNText
	textpointer RagingChargeName
	textpointer RagingChargeDesc
	textpointer SurpriseAttackName
	textpointer HeadpressName
	textpointer CFParOrNothingDesc
	textpointer DoubleLariatName
	textpointer ClawName
	textpointer SharpenName
	textpointer MystifyingHornsName
	textpointer MilkDrinkText
	textpointer GetATrainerCFText
	textpointer SpatialDistortionName
	textpointer SpatialDistortionDesc
	textpointer Do40toSelfDesc
	textpointer SoftboiledText
	textpointer SoftboiledRealDesc
	textpointer EyesEffectText
	textpointer PsywaveDescription
	textpointer MindBendName
	textpointer EmpatheticHealingName
	textpointer EmpHealingDesc
	textpointer ThereIsNoInTheHandText
	textpointer Choose1BasicEnergyCardFromHandText
	textpointer HarvestBountyDesc
	textpointer SynchroblastName
	textpointer LookAtHandDesc
	textpointer RushingMagmaName
	textpointer CFEnergyAbsorptionDescription
	textpointer BellyDrumName
	textpointer BellyDrumDesc
	textpointer MayDiscard1FDesc
	textpointer TailsDiscard1FText
	textpointer DiscardTDesc
	textpointer CF4X30Desc
	textpointer TripleAttackX10NoWRDesc
	textpointer YesOrNoTextNEOtext
	textpointer ScaldingSteamDesc
	textpointer YesOrNoTextCLText
	textpointer FoundCardText
	textpointer LightningBurstDescriptionCont
	textpointer Damage30PerHText
	textpointer NoRetreatAbilityDesc
	textpointer CantRetreatAbilityText