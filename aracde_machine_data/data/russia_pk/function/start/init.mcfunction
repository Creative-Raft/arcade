##分数
scoreboard players set @s russia_pk 0
##设置
data modify storage russia:pk code set value [0,0,0,0]
data modify storage russia:pk body set value [{"text":"0","color":"#00ff00"},{"text":"0","color":"#ffffff"}\
,{"text":"0","color":"#ffffff"},{"text":"0","color":"#ffffff"}]
data modify storage russia:pk score set value {\
    left:0,\
    right:0,\
    forward:0,\
    back:0,\
    space:0,\
    ready:0\
}

function russia_pk:start/summon