##转向
data modify storage pac_man:game game.player.facing set from storage pac_man:game game.turn[0]
data remove storage pac_man:game game.turn[0]