##光标左移一位，越过最左回到最右
scoreboard players remove @s russia_pk 1
execute if score @s russia_pk matches ..-1 run scoreboard players set @s russia_pk 3
