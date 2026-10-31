##find状态
#显示"正在搜寻"
data modify storage russia:pk body set value [{"text":"正在搜寻"}]
function russia_pk:start/texture/start

##本机房间号
scoreboard players operation #code russia_pk = @s russia_pk

##同一房间号已超过两台（第三人）→ 提示并退回输入状态
scoreboard players set #same russia_pk 0
execute as @e[tag=russia_pk_find] if score @s russia_pk = #code russia_pk run scoreboard players add #same russia_pk 1
execute as @e[tag=russia_pk_ready] if score @s russia_pk = #code russia_pk run scoreboard players add #same russia_pk 1
execute as @e[tag=russia_pk_playing] if score @s russia_pk = #code russia_pk run scoreboard players add #same russia_pk 1
execute if score #same russia_pk matches 3.. run return run function russia_pk:control/find/too_many

##在搜寻状态的机器里找房间号相同的(排除自己)
tag @s add russia_pk_self
tag @e[tag=russia_pk_found] remove russia_pk_found
execute as @e[tag=russia_pk_find,tag=!russia_pk_self] if score @s russia_pk = #code russia_pk run tag @s add russia_pk_found
tag @s remove russia_pk_self

##没找到
execute unless entity @e[tag=russia_pk_found,limit=1] run return 0

##双方进入准备状态
tag @s remove russia_pk_find
tag @s add russia_pk_ready
execute as @e[tag=russia_pk_found] run tag @s remove russia_pk_find
execute as @e[tag=russia_pk_found] run tag @s add russia_pk_ready

##刚进入准备：若这一刻还按着空格，这次按住不算数（松开不会触发准备），必须重新按一次
scoreboard players set #space_las russia_pk 0

##准备值从0开始(记在score.ready里)
data modify storage russia:pk score.ready set value 0
execute as @e[tag=russia_pk_found] run data modify entity @s data.score.ready set value 0

##清理
tag @e[tag=russia_pk_found] remove russia_pk_found
