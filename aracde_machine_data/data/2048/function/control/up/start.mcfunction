##生成临时地图,避免新的数字被合成
data modify storage 2048:mid map_s set from storage 2048:base map
##逐行进行
scoreboard players set #y 2048_cal 0
function 2048:control/up/y

##替换
function 2048:control/replace/anti/start

##结束后,复制到本位
function 2048:start/transpos/anti/start