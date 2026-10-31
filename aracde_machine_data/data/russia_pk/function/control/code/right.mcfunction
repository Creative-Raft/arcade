##光标右移一位，越过最右回到最左
scoreboard players add @s russia_pk 1
execute if score @s russia_pk matches 4.. run scoreboard players set @s russia_pk 0
