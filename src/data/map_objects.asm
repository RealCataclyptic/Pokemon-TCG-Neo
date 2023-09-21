; Objects around maps that can be interacted with but are not represented
; by NPCs. Things like Deck Machines and the PCs.
; Format:
; Direction you need to face, X coord, Y coord
; Routine that gets called when you hit A in front of it
; Object Name, and Object default Text
MasonLabObjects: ; 13b04 (3:7b04)
	db NORTH, 18, 2
	dw PrintInteractableObjectText
	tx Text04a0
	tx WhatIsADeckText

	db NORTH, 20, 2
	dw PrintInteractableObjectText
	tx Text04a2
	tx Text04a1

	db NORTH, 22, 2
	dw PrintInteractableObjectText
	tx Text04a4
	tx Text04a3

	db NORTH, 24, 2
	dw PrintInteractableObjectText
	tx Text04a6
	tx Text04a5

	db NORTH, 20, 14
	dw PrintInteractableObjectText
	tx Text04a8
	tx Text04a7

	db NORTH, 22, 14
	dw PrintInteractableObjectText
	tx Text04aa
	tx Text04a9

	db NORTH, 24, 14
	dw PrintInteractableObjectText
	tx Text04ac
	tx Text04ab

	db NORTH, 2, 2
	dw PCMenu
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db $ff


DeckMachineRoomObjects: ; 13b4d (3:7b4d)
	db NORTH, 2, 2
	dw Script_d932
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 4, 2
	dw Script_d932
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 6, 2
	dw Script_d93f
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 8, 2
	dw Script_d93f
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 10, 2
	dw Script_d995
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 12, 2
	dw Script_d995
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 14, 2
	dw Script_d9c2
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 16, 2
	dw Script_d9c2
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 18, 2
	dw Script_d9ef
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 20, 2
	dw Script_d9ef
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 14, 10
	dw Script_da1c
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 16, 10
	dw Script_da1c
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 18, 10
	dw Script_da49
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 20, 10
	dw Script_da49
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 14, 18
	dw Script_da76
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 16, 18
	dw Script_da76
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 18, 18
	dw Script_daa3
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 20, 18
	dw Script_daa3
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 2, 18
	dw Script_dad0
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 4, 18
	dw Script_dad0
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db $ff


IshiharasHouseObjects: ; 13c02 (3:7c02)
	db NORTH, 6, 2
	dw PrintInteractableObjectText
	tx Text04ae
	tx Text04ad

	db NORTH, 8, 2
	dw PrintInteractableObjectText
	tx Text04b0
	tx Text04af

	db NORTH, 10, 2
	dw PrintInteractableObjectText
	tx Text04b2
	tx Text04b1

	db NORTH, 12, 2
	dw PrintInteractableObjectText
	tx Text04b4
	tx Text04b3

	db NORTH, 14, 2
	dw PrintInteractableObjectText
	tx Text04b6
	tx Text04b5

	db NORTH, 16, 2
	dw PrintInteractableObjectText
	tx Text04b8
	tx Text04b7

	db NORTH, 2, 12
	dw PrintInteractableObjectText
	tx Text04ba
	tx Text04b9

	db NORTH, 4, 12
	dw PrintInteractableObjectText
	tx Text04bc
	tx Text04bb

	db NORTH, 6, 12
	dw PrintInteractableObjectText
	tx Text04be
	tx Text04bd

	db NORTH, 12, 12
	dw PrintInteractableObjectText
	tx Text04c0
	tx Text04bf

	db NORTH, 14, 12
	dw PrintInteractableObjectText
	tx Text04c2
	tx Text04c1

	db NORTH, 16, 12
	dw PrintInteractableObjectText
	tx Text04c4
	tx Text04c3

	db $ff


FightingClubLobbyObjects: ; 13c6f (3:7c6f)
	db NORTH, 20, 2
	dw PrintInteractableObjectText
	tx Text04c6
	tx Text04c5

	db NORTH, 22, 2
	dw PrintInteractableObjectText
	tx Text04c8
	tx Text04c7

	db NORTH, 24, 2
	dw PrintInteractableObjectText
	tx Text04ca
	tx Text04c9

	db NORTH, 2, 8
	dw PCMenu
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 6, 6
	dw Script_fc52
	tx PlaceholderMessageText
	tx ClerkNPCName

	db NORTH, 10, 6
	dw Func_fc7a
	tx PlaceholderMessageText
	tx ClerkNPCName

	db $ff


RockClubLobbyObjects: ; 13ca6 (3:7ca6)
	db NORTH, 20, 2
	dw PrintInteractableObjectText
	tx Text04cc
	tx Text04cb

	db NORTH, 22, 2
	dw PrintInteractableObjectText
	tx Text04ce
	tx Text04cd

	db NORTH, 24, 2
	dw PrintInteractableObjectText
	tx Text04d0
	tx Text04cf

	db NORTH, 2, 8
	dw PCMenu
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 6, 6
	dw Script_fc52
	tx PlaceholderMessageText
	tx ClerkNPCName

	db NORTH, 10, 6
	dw Func_fc7a
	tx PlaceholderMessageText
	tx ClerkNPCName

	db $ff


WaterClubLobbyObjects: ; 13cdd (3:7cdd)
	db NORTH, 20, 2
	dw PrintInteractableObjectText
	tx Text04d2
	tx Text04d1

	db NORTH, 22, 2
	dw PrintInteractableObjectText
	tx Text04d4
	tx Text04d3

	db NORTH, 24, 2
	dw PrintInteractableObjectText
	tx Text04d6
	tx Text04d5

	db NORTH, 2, 8
	dw PCMenu
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 6, 6
	dw Script_fc52
	tx PlaceholderMessageText
	tx ClerkNPCName

	db NORTH, 10, 6
	dw Func_fc7a
	tx PlaceholderMessageText
	tx ClerkNPCName

	db $ff


LightningClubLobbyObjects: ; 13d14 (3:7d14)
	db NORTH, 20, 2
	dw PrintInteractableObjectText
	tx Text04d8
	tx Text04d7

	db NORTH, 22, 2
	dw PrintInteractableObjectText
	tx Text04da
	tx Text04d9

	db NORTH, 24, 2
	dw PrintInteractableObjectText
	tx Text04dc
	tx Text04db

	db NORTH, 2, 8
	dw PCMenu
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 6, 6
	dw Script_fc52
	tx PlaceholderMessageText
	tx ClerkNPCName

	db NORTH, 10, 6
	dw Func_fc7a
	tx PlaceholderMessageText
	tx ClerkNPCName

	db $ff


GrassClubLobbyObjects: ; 13d4b (3:7d4b)
	db NORTH, 20, 2
	dw PrintInteractableObjectText
	tx Text04de
	tx Text04dd

	db NORTH, 22, 2
	dw PrintInteractableObjectText
	tx Text04e0
	tx Text04df

	db NORTH, 24, 2
	dw PrintInteractableObjectText
	tx Text04e2
	tx Text04e1

	db NORTH, 2, 8
	dw PCMenu
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 6, 6
	dw Script_fc52
	tx PlaceholderMessageText
	tx ClerkNPCName

	db NORTH, 10, 6
	dw Func_fc7a
	tx PlaceholderMessageText
	tx ClerkNPCName

	db $ff


PsychicClubLobbyObjects: ; 13d82 (3:7d82)
	db NORTH, 20, 2
	dw PrintInteractableObjectText
	tx Text04e4
	tx Text04e3

	db NORTH, 22, 2
	dw PrintInteractableObjectText
	tx Text04e6
	tx Text04e5

	db NORTH, 24, 2
	dw PrintInteractableObjectText
	tx Text04e8
	tx Text04e7

	db NORTH, 2, 8
	dw PCMenu
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 6, 6
	dw Script_fc52
	tx PlaceholderMessageText
	tx ClerkNPCName

	db NORTH, 10, 6
	dw Func_fc7a
	tx PlaceholderMessageText
	tx ClerkNPCName

	db $ff


ScienceClubLobbyObjects: ; 13db9 (3:7db9)
	db NORTH, 20, 2
	dw PrintInteractableObjectText
	tx Text04ea
	tx Text04e9

	db NORTH, 22, 2
	dw PrintInteractableObjectText
	tx Text04ec
	tx Text04eb

	db NORTH, 24, 2
	dw PrintInteractableObjectText
	tx Text04ee
	tx Text04ed

	db NORTH, 2, 8
	dw PCMenu
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 6, 6
	dw Script_fc52
	tx PlaceholderMessageText
	tx ClerkNPCName

	db NORTH, 10, 6
	dw Func_fc7a
	tx PlaceholderMessageText
	tx ClerkNPCName

	db $ff


FireClubLobbyObjects: ; 13df0 (3:7df0)
	db NORTH, 20, 2
	dw PrintInteractableObjectText
	tx Text04f0
	tx Text04ef

	db NORTH, 22, 2
	dw PrintInteractableObjectText
	tx Text04f2
	tx Text04f1

	db NORTH, 24, 2
	dw PrintInteractableObjectText
	tx Text04f4
	tx Text04f3

	db NORTH, 2, 8
	dw PCMenu
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 6, 6
	dw Script_fc52
	tx PlaceholderMessageText
	tx ClerkNPCName

	db NORTH, 10, 6
	dw Func_fc7a
	tx PlaceholderMessageText
	tx ClerkNPCName

	db $ff


ChallengeHallLobbyObjects: ; 13e27 (3:7e27)
	db NORTH, 20, 2
	dw PrintInteractableObjectText
	tx Text04f6
	tx Text04f5

	db NORTH, 22, 2
	dw PrintInteractableObjectText
	tx Text04f8
	tx Text04f7

	db NORTH, 24, 2
	dw PrintInteractableObjectText
	tx Text04fa
	tx Text04f9

	db NORTH, 2, 8
	dw PCMenu
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 6, 6
	dw Script_fc52
	tx PlaceholderMessageText
	tx ClerkNPCName

	db NORTH, 10, 6
	dw Func_fc7a
	tx PlaceholderMessageText
	tx ClerkNPCName

	db $ff


PokemonDomeEntranceObjects: ; 13e5e (3:7e5e)
	db NORTH, 2, 2
	dw PrintInteractableObjectText
	tx Text04fc
	tx Text04fb

	db NORTH, 4, 2
	dw PrintInteractableObjectText
	tx Text04fe
	tx Text04fd

	db NORTH, 6, 2
	dw PrintInteractableObjectText
	tx Text0500
	tx Text04ff

	db NORTH, 2, 8
	dw PrintInteractableObjectText
	tx Text0502
	tx Text0501

	db NORTH, 4, 8
	dw PrintInteractableObjectText
	tx Text0504
	tx Text0503

	db NORTH, 6, 8
	dw PrintInteractableObjectText
	tx Text0506
	tx Text0505

	db NORTH, 18, 0
	dw Script_f631
	tx Text0508
	tx Text0507

	db NORTH, 20, 0
	dw Script_f631
	tx Text0508
	tx Text0507

	db NORTH, 22, 0
	dw Script_f6af
	tx Text0558
	tx Text0509

	db NORTH, 24, 0
	dw Script_f6af
	tx Text0558
	tx Text0509

	db NORTH, 28, 2
	dw PCMenu
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db $ff


HallOfHonorObjects: ; 13ec2 (3:7ec2)
	; Legendary Cards
	db NORTH, 10, 10
	dw Script_fbf1
	dw NULL
	dw NULL

	; Legendary Cards
	db NORTH, 12, 10
	dw Script_fbf1
	dw NULL
	dw NULL

	db NORTH, 10, 2
	dw Script_fbe1
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db NORTH, 12, 2
	dw Script_fbe1
	tx PlaceholderMessageText
	tx PokemonTradingCards101Text

	db $ff
