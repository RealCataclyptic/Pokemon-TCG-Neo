This folder is seperated from the main folders because it contains all the assets and information designed to make Mint (Female MC) the playable character of the romhack, much like USC's Mint's Adventure hack. 

This folder contains my version of the overworld and portrait sprites. It also contains backup files for Mark's (Male MC) sprites, just in case. Do the reverse of these intructions to change Mint back into Mark.

===========================================================================================

INSTRUCTIONS FOR ADDING MINT'S GRAPHICS TO THE GAME:

Get the portrait and overworld sprites found in this folder. Then using any art program, get the pictures into it, find the folders specified below and then choose 'Export As' onto the respective pictures (Will NOT work by dragging and dropping!)

SRC -> GFX -> Duelists -> Player for the portrait sprite, replace it with Mint's portrait. Rename this file to 'player' if nessesary.
GFX -> Overworld Sprites -> Player for the overworld srpite, replace it with Mint's OW sprite. Rename this file to 'player' if nessesary.

===========================================================================================

INSTRUCTIONS FOR ADDING MINT'S PALETTES TO THE GAME:

Go to SRC -> Data -> Palettes1 -> Palette29 -> Matrix 5. You will see the following:

	rgb  6, 14, 11
	rgb 30, 27, 24
	rgb 30,  5,  9
	rgb  0,  0,  0

Change it to

	rgb  6, 14, 11
	rgb 30, 27, 24
	rgb  6, 15, 25
	rgb  0,  0,  0

This will change the overworld sprite's colors.

Next, go to SRC -> gfx (asm file, not folder) -> Palette119. You will see the following:

	db 0
	db 1

	rgb 31, 29, 25
	rgb 28, 17, 14
	rgb 30,  5,  9
	rgb  0,  0,  8

Change it to

	db 0
	db 1

	rgb 31, 29, 25
	rgb 28, 17, 14
	rgb 0,  14,  31
	rgb  0,  0,  8

This will change the portrait's colors.

===========================================================================================

INSTRUCTIONS FOR ADDING MINT AS THE DEFAULT PLAYER NAME:

Go to SRC -> Engine -> Menus -> Naming -> Search for "Mark", and just replace it with "Mint". 
