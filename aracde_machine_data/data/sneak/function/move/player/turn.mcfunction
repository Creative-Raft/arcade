##转向
data modify storage sneak:game game.player.facing set from storage sneak:game game.turn[0]
data remove storage sneak:game game.turn[0]