##初始化
data modify storage sneak:mid bfs.n set value [{x:0,y:0,dir:0},{x:0,y:0,dir:0},{x:0,y:0,dir:0},{x:0,y:0,dir:0}]
## 右
data modify storage sneak:mid bfs.n[0].x set compute default integer {type:"add",inputs:[{type:"storage",storage:"sneak:mid",path:"bfs.cen[0]"},{type:"constant",value:1}]}
data modify storage sneak:mid bfs.n[0].y set from storage sneak:mid bfs.cen[1]
## 上
data modify storage sneak:mid bfs.n[1].x set from storage sneak:mid bfs.cen[0]
data modify storage sneak:mid bfs.n[1].y set compute default integer {type:"add",inputs:[{type:"storage",storage:"sneak:mid",path:"bfs.cen[1]"},{type:"constant",value:-1}]}
data modify storage sneak:mid bfs.n[1].dir set value 1
## 左
data modify storage sneak:mid bfs.n[2].x set compute default integer {type:"add",inputs:[{type:"storage",storage:"sneak:mid",path:"bfs.cen[0]"},{type:"constant",value:-1}]}
data modify storage sneak:mid bfs.n[2].y set from storage sneak:mid bfs.cen[1]
data modify storage sneak:mid bfs.n[2].dir set value 2
## 下
data modify storage sneak:mid bfs.n[3].x set from storage sneak:mid bfs.cen[0]
data modify storage sneak:mid bfs.n[3].y set compute default integer {type:"add",inputs:[{type:"storage",storage:"sneak:mid",path:"bfs.cen[1]"},{type:"constant",value:1}]}
data modify storage sneak:mid bfs.n[3].dir set value 3
