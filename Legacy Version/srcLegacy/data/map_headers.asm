MapHeaders:
; sgb tilemap, cgb tilemap, initial cgb palette (always 0), sgb palette, final cgb palette, song
	table_width 6, MapHeaders
	db TILEMAP_OVERWORLD_MAP,           TILEMAP_OVERWORLD_MAP_CGB,           PALETTE_0, MAP_SGB_PALS_1,  PALETTE_1,  MUSIC_OVERWORLD     ; OVERWORLD_MAP
	db TILEMAP_MASON_LABORATORY,        TILEMAP_MASON_LABORATORY_CGB,        PALETTE_0, MAP_SGB_PALS_2,  PALETTE_2,  MUSIC_OVERWORLD     ; MASON_LABORATORY
	db TILEMAP_DECK_MACHINE_ROOM,       TILEMAP_DECK_MACHINE_ROOM_CGB,       PALETTE_0, MAP_SGB_PALS_2,  PALETTE_2,  MUSIC_OVERWORLD     ; DECK_MACHINE_ROOM
	db TILEMAP_ISHIHARA,                TILEMAP_ISHIHARA_CGB,                PALETTE_0, MAP_SGB_PALS_3,  PALETTE_3,  MUSIC_OVERWORLD     ; ISHIHARAS_HOUSE
	db TILEMAP_FIGHTING_CLUB_ENTRANCE,  TILEMAP_FIGHTING_CLUB_ENTRANCE_CGB,  PALETTE_0, MAP_SGB_PALS_3,  PALETTE_4,  MUSIC_OVERWORLD     ; FIGHTING_CLUB_ENTRANCE
	db TILEMAP_CLUB_LOBBY,              TILEMAP_CLUB_LOBBY_CGB,              PALETTE_0, MAP_SGB_PALS_3,  PALETTE_12, MUSIC_OVERWORLD     ; FIGHTING_CLUB_LOBBY
	db TILEMAP_FIGHTING_CLUB,           TILEMAP_FIGHTING_CLUB_CGB,           PALETTE_0, MAP_SGB_PALS_4,  PALETTE_13, MUSIC_CLUB_3        ; FIGHTING_CLUB
	db TILEMAP_ROCK_CLUB_ENTRANCE,      TILEMAP_ROCK_CLUB_ENTRANCE_CGB,      PALETTE_0, MAP_SGB_PALS_3,  PALETTE_5,  MUSIC_OVERWORLD     ; ROCK_CLUB_ENTRANCE
	db TILEMAP_CLUB_LOBBY,              TILEMAP_CLUB_LOBBY_CGB,              PALETTE_0, MAP_SGB_PALS_3,  PALETTE_12, MUSIC_OVERWORLD     ; ROCK_CLUB_LOBBY
	db TILEMAP_ROCK_CLUB,               TILEMAP_ROCK_CLUB_CGB,               PALETTE_0, MAP_SGB_PALS_4,  PALETTE_14, MUSIC_CLUB_2        ; ROCK_CLUB
	db TILEMAP_WATER_CLUB_ENTRANCE,     TILEMAP_WATER_CLUB_ENTRANCE_CGB,     PALETTE_0, MAP_SGB_PALS_3,  PALETTE_6,  MUSIC_OVERWORLD     ; WATER_CLUB_ENTRANCE
	db TILEMAP_CLUB_LOBBY,              TILEMAP_CLUB_LOBBY_CGB,              PALETTE_0, MAP_SGB_PALS_3,  PALETTE_12, MUSIC_OVERWORLD     ; WATER_CLUB_LOBBY
	db TILEMAP_WATER_CLUB,              TILEMAP_WATER_CLUB_CGB,              PALETTE_0, MAP_SGB_PALS_2,  PALETTE_15, MUSIC_CLUB_2        ; WATER_CLUB
	db TILEMAP_LIGHTNING_CLUB_ENTRANCE, TILEMAP_LIGHTNING_CLUB_ENTRANCE_CGB, PALETTE_0, MAP_SGB_PALS_3,  PALETTE_7,  MUSIC_OVERWORLD     ; LIGHTNING_CLUB_ENTRANCE
	db TILEMAP_CLUB_LOBBY,              TILEMAP_CLUB_LOBBY_CGB,              PALETTE_0, MAP_SGB_PALS_3,  PALETTE_12, MUSIC_OVERWORLD     ; LIGHTNING_CLUB_LOBBY
	db TILEMAP_LIGHTNING_CLUB,          TILEMAP_LIGHTNING_CLUB_CGB,          PALETTE_0, MAP_SGB_PALS_5,  PALETTE_16, MUSIC_CLUB_1        ; LIGHTNING_CLUB
	db TILEMAP_GRASS_CLUB_ENTRANCE,     TILEMAP_GRASS_CLUB_ENTRANCE_CGB,     PALETTE_0, MAP_SGB_PALS_3,  PALETTE_8,  MUSIC_OVERWORLD     ; GRASS_CLUB_ENTRANCE
	db TILEMAP_CLUB_LOBBY,              TILEMAP_CLUB_LOBBY_CGB,              PALETTE_0, MAP_SGB_PALS_3,  PALETTE_12, MUSIC_OVERWORLD     ; GRASS_CLUB_LOBBY
	db TILEMAP_GRASS_CLUB,              TILEMAP_GRASS_CLUB_CGB,              PALETTE_0, MAP_SGB_PALS_6,  PALETTE_17, MUSIC_CLUB_1        ; GRASS_CLUB
	db TILEMAP_PSYCHIC_CLUB_ENTRANCE,   TILEMAP_PSYCHIC_CLUB_ENTRANCE_CGB,   PALETTE_0, MAP_SGB_PALS_3,  PALETTE_9,  MUSIC_OVERWORLD     ; PSYCHIC_CLUB_ENTRANCE
	db TILEMAP_CLUB_LOBBY,              TILEMAP_CLUB_LOBBY_CGB,              PALETTE_0, MAP_SGB_PALS_3,  PALETTE_12, MUSIC_OVERWORLD     ; PSYCHIC_CLUB_LOBBY
	db TILEMAP_PSYCHIC_CLUB,            TILEMAP_PSYCHIC_CLUB_CGB,            PALETTE_0, MAP_SGB_PALS_7,  PALETTE_18, MUSIC_CLUB_2        ; PSYCHIC_CLUB
	db TILEMAP_SCIENCE_CLUB_ENTRANCE,   TILEMAP_SCIENCE_CLUB_ENTRANCE_CGB,   PALETTE_0, MAP_SGB_PALS_3,  PALETTE_10, MUSIC_OVERWORLD     ; SCIENCE_CLUB_ENTRANCE
	db TILEMAP_CLUB_LOBBY,              TILEMAP_CLUB_LOBBY_CGB,              PALETTE_0, MAP_SGB_PALS_3,  PALETTE_12, MUSIC_OVERWORLD     ; SCIENCE_CLUB_LOBBY
	db TILEMAP_SCIENCE_CLUB,            TILEMAP_SCIENCE_CLUB_CGB,            PALETTE_0, MAP_SGB_PALS_6,  PALETTE_19, MUSIC_CLUB_3        ; SCIENCE_CLUB
	db TILEMAP_FIRE_CLUB_ENTRANCE,      TILEMAP_FIRE_CLUB_ENTRANCE_CGB,      PALETTE_0, MAP_SGB_PALS_3,  PALETTE_11, MUSIC_OVERWORLD     ; FIRE_CLUB_ENTRANCE
	db TILEMAP_CLUB_LOBBY,              TILEMAP_CLUB_LOBBY_CGB,              PALETTE_0, MAP_SGB_PALS_3,  PALETTE_12, MUSIC_OVERWORLD     ; FIRE_CLUB_LOBBY
	db TILEMAP_FIRE_CLUB,               TILEMAP_FIRE_CLUB_CGB,               PALETTE_0, MAP_SGB_PALS_8,  PALETTE_20, MUSIC_CLUB_3        ; FIRE_CLUB
	db TILEMAP_CHALLENGE_HALL_ENTRANCE, TILEMAP_CHALLENGE_HALL_ENTRANCE_CGB, PALETTE_0, MAP_SGB_PALS_3,  PALETTE_4,  MUSIC_OVERWORLD     ; CHALLENGE_HALL_ENTRANCE
	db TILEMAP_CLUB_LOBBY,              TILEMAP_CLUB_LOBBY_CGB,              PALETTE_0, MAP_SGB_PALS_3,  PALETTE_12, MUSIC_OVERWORLD     ; CHALLENGE_HALL_LOBBY
	db TILEMAP_CHALLENGE_HALL,          TILEMAP_CHALLENGE_HALL_CGB,          PALETTE_0, MAP_SGB_PALS_9,  PALETTE_21, MUSIC_OVERWORLD     ; CHALLENGE_HALL
	db TILEMAP_POKEMON_DOME_ENTRANCE,   TILEMAP_POKEMON_DOME_ENTRANCE_CGB,   PALETTE_0, MAP_SGB_PALS_10, PALETTE_22, MUSIC_OVERWORLD     ; POKEMON_DOME_ENTRANCE
	db TILEMAP_POKEMON_DOME,            TILEMAP_POKEMON_DOME_CGB,            PALETTE_0, MAP_SGB_PALS_10, PALETTE_23, MUSIC_POKEMON_DOME  ; POKEMON_DOME
	db TILEMAP_HALL_OF_HONOR,           TILEMAP_HALL_OF_HONOR_CGB,           PALETTE_0, MAP_SGB_PALS_10, PALETTE_24, MUSIC_HALL_OF_HONOR ; HALL_OF_HONOR
	assert_table_length NUM_MAPS