# 街机数据包（Arcade）

一个 Minecraft Java 版数据包 + 配套资源包，在一台"街机机器"上同时提供多款小游戏：

| 命名空间 | 游戏 |
| --- | --- |
| `pac_man` | 吃豆人 |
| `2048` | 2048 |
| `sneak` | 贪吃蛇 |
| `russia` | 俄罗斯方块 |
| `russia_pk` | 俄罗斯方块对战大厅 |

所有 `load` / `tick` 挂载在 `minecraft` 命名空间的函数标签里，五个命名空间并行运行。

---

## 目录结构

```text
arcade_machine/
├── pack.mcmeta
├── README.md
└── data/
    ├── minecraft/tags/function/{load,tick}.json   # 并行挂载五个命名空间
    ├── arcade_machine/function/                   # 街机外壳（无宏，纯胶水）
    │   ├── load / tick
    │   ├── summon/{start,summon}                  # 投放机器
    │   ├── choose/{start,left,right,game}         # 选择游戏（光标存在机器物品 custom_model_data）
    │   ├── pair/start                             # 按 arcade_machine_pair 成组
    │   └── normal_int/{start,sit,des,sit_mid,des_mid,away}  # 落座/离座回收
    ├── pac_man/function/  {load,tick,mid,end,base_set/,control/,move/,start/}
    ├── 2048/function/     {load,tick,end,base_set/,control/,start/}
    ├── sneak/function/    {load,tick,mid,end,base_set/,control/,move/,start/}
    ├── russia/function/   {load,tick,mid,end,base_set/,control/,move/,start/}
    └── russia_pk/function/
        ├── load / tick / mid / end                # 大厅状态机（code → find → ready → playing）
        ├── start/{init,summon,texture/start}      # 房间号显示板
        ├── control/{start, code/*, find/*, ready/*}
        ├── rubbish/{send,insert,row,hole,lift}    # 垃圾行
        └── result/{lose,win,opponent}             # 胜负
```

配套资源包放在 `resourcepacks`内，提供各游戏的字体与字形：
`2048:2048`、`sneak:sneak`、`russia:russia`、`pac_man:pac_man*`、`arcade_machine` 的物品模型。

---

## 安装

1. 把 `arcade_machine_data` 目录放进存档的 `datapacks/` 下；
2. 把配套资源包 `arcade_machine_resource` 放进 `resourcepacks/`，并在游戏内启用（**必须启用**，否则字形缺失）；
3. 执行 `/reload`，然后检查日志里没有 `Failed to load function`；
4. 街机机器需要通过：`/loot give @s loot arcade_machine:arcade_machine`获得并放下（或使用存档内已有的机器）。

---

## 游玩

- 每台街机是一个实体（载具）。玩家**坐上去**即进入机器，**潜行键离座**即退出；
- 未选游戏时：**左右方向键**切换游戏，**空格**开始；
- 对局中方向键/空格操作，界面上会有操作提示。

| 游戏 | 操作 |
| --- | --- |
| 吃豆人 | 方向键移动；空格 暂停/继续 |
| 2048 | 方向键 移动并合并 |
| 贪吃蛇 | 方向键 转向；空格 开始/暂停 |
| 俄罗斯方块 | ←→ 左右移动，↑ 旋转，↓ 软降，空格 硬降/开始，潜行 退出 |
| 俄罗斯方块 PK | 开局前：←→ 选择位数，↑↓ 修改数字，空格确认 4 位房间号；双方都按空格准备后开局。对局操作同上 |

### 俄罗斯方块 PK 规则

1. 两台机器输入**相同 4 位房间号** → 双方显示"正在搜寻" → 匹配成功进入准备；
2. 双方都按空格（`[2/2]`）→ 各自进入俄罗斯方块；
3. 对局中**不显示分数板**，基础下落更快（`#pace` 基础 12，每 2000 分减 1）；
4. 每累计消除 **4 行**（不含含垃圾格的行）→ 给对方底部推送 **2 行**垃圾行（各自随机 1 个缺口，`map` 中记为 `8`）；
5. 消除**含垃圾格的行**时额外计分（PK 不显示分数，实际效果是**方块下落速度变快**），且不计入上面那个 4 行累计；
6. 垃圾行插入时若与当前下落方块重合 → 方块上升一格并立即固定；若已在最顶行 → 直接判负；
7. 一方顶死或离座 → 另一方显示绿色 `YOU WIN!`，自己显示红色 `YOU LOSE`，双方停住；
8. 同一房间号超过两人时，第三人会被提示"该房间号已被占用"并退回房间号输入状态。

---

## 技术约定（改代码前必读）

### 数据分区

每个命名空间使用三段命令存储：

| 段 | 内容 |
| --- | --- |
| `<ns>:base` | 静态预设：`map` 关卡网格、`texture` 字形表、`game` 初始实体状态（只读） |
| `<ns>:game` | 实时存档：`game.map`（逻辑）、`game.map_all`（渲染）、`game.body`（渲染缓存）、`game.score`、各实体状态 |
| `<ns>:mid` | 宏参数载体 + 临时变量 |

### 状态存在座位上

每个 tick 各游戏的 `mid` 都会：

```text
data modify storage <ns>:game game  set from entity @s data.game
data modify storage <ns>:game score set from entity @s data.score
... 跑逻辑 ...
data modify entity @s data.game  set from storage <ns>:game game
data modify entity @s data.score set from storage <ns>:game score
```

因此**多台机器互不干扰**。

### 渲染管线

```text
game.map_all（二维整数网格）
  → start/texture/start   （取第 0 行）
  → start/texture/y       （行末补一个换行组件）
  → start/texture/x       （取行内第 0 格）
  → start/texture/append  （值 → base texture[n]）
  → game.body（文本组件列表）
  → data modify entity @e[tag=<game>_for,...] text set from storage <ns>:game body
```

### 实体标签

| 标签 | 含义 |
| --- | --- |
| `<game>_player` | 机器本体（座位实体，挂 `data.game`/`data.score`） |
| `<game>_for / score / pause / next / item / life` | 各类屏幕 |
| `<game>_pair` | **临时**：本次调用中"属于本机"的实体 |
| `<game>_all` | 该游戏的全部实体（用于筛选，避免裸 `@e`） |
| `arcade_all` | 全部街机相关实体（外壳用） |

### 计分板

- 每个命名空间一个 `*_cal` 目标（`pac_man_cal` / `2048_cal` / `sneak_cal` / `russia_cal` / `russia_pk` / `arcade_machine_cal`）；
- `#` 前缀假玩家做全局寄存器（`#score`、`#pace`、`#over`、`#lines`、`#count`、`#pair` 等）；
- 实体分数用 `arcade_machine_pair` 表示"属于哪台机器"。

### 多实例（多人）注意事项

- 跨机器操作必须"**谁的数据谁自己改**"：先把对方 `data.game` 读进 `<ns>:game`，改完写回，否则全局假玩家分数会互相污染；
- 选择实体一律带 `tag=` 与 `arcade_machine_pair` 过滤，**禁止裸 `@e`**；
- 召唤时的配对用 `execute at @s rotated ~ 0 positioned <召唤点> run … @e[tag=…_new,distance=..0.1] …`，避免两台机器同一 tick 开局互相配错；
- 修改后需要**重启一次机器**（离座再坐），让新实体带上 `<game>_all` / `arcade_all` 标记。
- `data merge entity` / `data modify entity` / `data get entity` **只接受单个实体**：选择器必须带 `limit=1`（`@s` 天然满足），否则函数会在**加载阶段**报"只允许一个实体，但提供的选择器允许多个实体"，整个函数不可用。

---

## 已知限制

- 街机外壳的选游戏上限写死为 5 项（`arcade_machine:choose/right` 的 `matches 6..`、`choose/game` 的 `matches 1..5`、机器物品的 `custom_model_data`）；新增游戏需要同步改这三处。
- `sneak` 的 `#pace` 若因命令链超限被截断，会停在 ≤0 导致整局不动（`over`/`pause` 都是 0）。救法：`/scoreboard players set #pace sneak_cal 4`。BFS 已加 100 格熔断以降低触发概率。
- 俄罗斯方块的垃圾行/对方盘面操作依赖"延迟插入"（`data.game.pending`），不要在发垃圾方直接改对方盘面。

---

## 调试

```mcfunction
/data get storage russia:game game.map          ## 看盘面（应渲染为 20 行，命令存储内为 22 行，行数变了说明有幽灵行）
/data get storage russia:pk rubbish             ## 看上一行垃圾行的内容（含 8 的值）
/data get storage sneak:mid wander              ## 看游走权重 ray/w/total/dir
/scoreboard players get #lines russia_cal       ## 累计消除行数（满 4 发垃圾）
/scoreboard players get #pace sneak_cal         ## ≤0 说明命令链曾被截断
/data get storage russia:pk code                ## 看大厅房间号
```
