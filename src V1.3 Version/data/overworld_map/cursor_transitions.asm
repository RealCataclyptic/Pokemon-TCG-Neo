OverworldMap_CursorTransitions:
	; unused
	db OWMAP_SCIENCE_CLUB     ; NORTH
	db OWMAP_SCIENCE_CLUB     ; EAST
	db OWMAP_SCIENCE_CLUB     ; SOUTH
	db OWMAP_SCIENCE_CLUB     ; WEST

	; OWMAP_MASON_LABORATORY
	db OWMAP_LIGHTNING_CLUB   ; NORTH
	db OWMAP_FIGHTING_CLUB    ; EAST
	db $00                    ; SOUTH
	db $00                    ; WEST

	; OWMAP_ISHIHARAS_HOUSE
	db $00                    ; NORTH
	db OWMAP_CHALLENGE_HALL   ; EAST
	db OWMAP_ROCK_CLUB        ; SOUTH
	db $00                    ; WEST

	; OWMAP_FIGHTING_CLUB
	db OWMAP_LIGHTNING_CLUB   ; NORTH
	db OWMAP_WATER_CLUB       ; EAST
	db $00                    ; SOUTH
	db OWMAP_MASON_LABORATORY ; WEST

	; OWMAP_ROCK_CLUB
	db OWMAP_ISHIHARAS_HOUSE  ; NORTH
	db OWMAP_POKEMON_DOME     ; EAST
	db OWMAP_LIGHTNING_CLUB   ; SOUTH
	db $00                    ; WEST

	; OWMAP_WATER_CLUB
	db OWMAP_GRASS_CLUB       ; NORTH
	db $00                    ; EAST
	db $00                    ; SOUTH
	db OWMAP_FIGHTING_CLUB    ; WEST

	; OWMAP_LIGHTNING_CLUB
	db OWMAP_ROCK_CLUB        ; NORTH
	db OWMAP_POKEMON_DOME     ; EAST
	db OWMAP_FIGHTING_CLUB    ; SOUTH
	db OWMAP_MASON_LABORATORY ; WEST

	; OWMAP_GRASS_CLUB
	db OWMAP_SCIENCE_CLUB     ; NORTH
	db $00                    ; EAST
	db OWMAP_WATER_CLUB       ; SOUTH
	db OWMAP_PSYCHIC_CLUB     ; WEST

	; OWMAP_PSYCHIC_CLUB
	db OWMAP_FIRE_CLUB        ; NORTH
	db OWMAP_SCIENCE_CLUB     ; EAST
	db OWMAP_GRASS_CLUB       ; SOUTH
	db OWMAP_POKEMON_DOME     ; WEST

	; OWMAP_SCIENCE_CLUB
	db OWMAP_FIRE_CLUB        ; NORTH
	db $00                    ; EAST
	db OWMAP_GRASS_CLUB       ; SOUTH
	db OWMAP_PSYCHIC_CLUB     ; WEST

	; OWMAP_FIRE_CLUB
	db $00                    ; NORTH
	db OWMAP_SCIENCE_CLUB     ; EAST
	db OWMAP_SCIENCE_CLUB     ; SOUTH
	db OWMAP_PSYCHIC_CLUB     ; WEST

	; OWMAP_CHALLENGE_HALL
	db $00                    ; NORTH
	db OWMAP_PSYCHIC_CLUB     ; EAST
	db OWMAP_POKEMON_DOME     ; SOUTH
	db OWMAP_ISHIHARAS_HOUSE  ; WEST

	; OWMAP_POKEMON_DOME
	db OWMAP_CHALLENGE_HALL   ; NORTH
	db OWMAP_PSYCHIC_CLUB     ; EAST
	db OWMAP_FIGHTING_CLUB    ; SOUTH
	db OWMAP_ROCK_CLUB        ; WEST