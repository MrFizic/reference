# Относительне (для исполнителя) координаты (прибавить/отнять к относителльным координатам)
    ~
    ~1
    ~-1
# Пример (координаты исполнителя 0 0 0)
    ~ ~3 ~-2
# будут читатся как (0 0+3 0-2)=(0 3 -2)

# Селекторы сущьностей

@a - Все игроки
@p - Ближайший игрок
@r - Случайный игрок
@s - Исполнитель
@e - Все entity (Животные, Лежащие предметы, Игроки, Вагонетки, Лодки)

[
    type=minecraft:pig
    type=!minecraft:player
    r=10

    tag=friend
    sort=nearest
    limit=1

    scores={IQ=1}
    scores={IQ=1..2}
    scores={IQ=1..}
]

gamemode creative @a
weather clear

setworldspawn
spawnpoint

effect
enchant

time set day
time query

team
tag

setblock [x] [y] [z] minecraft:diamond_block

fill [x] [y] [z] [x2] [y2] [z2] minecraft:dirt
fill [x] [y] [z] [x2] [y2] [z2] minecraft:dirt 0 hollow
fill [x] [y] [z] [x2] [y2] [z2] minecraft:dirt 0 replace minecraft:air

particle

say
me

title @a title "Hello"
title @a title [{"text":"Red","color":"red"}{"text":"Red","color":"red"}]

bossbar



# Scorebord
scoreboard objectives add IQ dummy
scoreboard objectives setdisplay sidebar IQ
scoreboard players set @p IQ 1
scoreboard players add @p IQ 1
scoreboard players remove @p IQ 1
scoreboard players reset @p IQ
scoreboard players list @p

scoreboard players test @p IQ 1 80

scoreboard players operation @p Money -= @p Price

scoreboard objectives add trig trigger
scoreboard players enable trig

trigger add 10
trigger set 11



# Execute
execute at @p run setblock ~ ~ ~ minecraft:diamond_block
execute as @p run clear @s
execute as @p at @s run say 123

execute if block ~ ~1 ~ minecraft:stone run say OK
execute if entity @e run say OK
execute if blocks [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] all run say OK
execute if blocks [x1] [y1] [z1] [x2] [y2] [z2] [x] [y] [z] masked run say OK
execute if score @p Name >= @a Name
execute if score @p Name matches 2..5 run say OK

execute unless block ~ ~1 ~ minecraft:glass

execute positioned ~1 ~ ~ run setblock ~ ~ ~ minecraft:dirt

execute at @p align z run say OK
execute at @p align xyz run say OK

execute store result score @p Name run say OK
execute store result entity @p Name int 10 run say OK
execute store success



# Data
data get block ~ ~ ~
data merge block ~ ~1 ~

data get entity @e
data merge entity @e

data remove entity @e Item.tag.Enchantments

data modify block entity @e[limit=1b] Item.tag.Enchantments append value {id:"...", lvl:1}
data modify block entity @e[limit=1b] Item.tag.Enchantments preend value {id:"...", lvl:1}
data modify block entity @e[limit=1b] Item.tag.Enchantments set value {id:"...", lvl:1}
data modify block entity @e[limit=1b] Item.tag.Enchantments insert value {id:"...", lvl:1}

data modify block entity @e[limit=1b] Health prepend from @s Health

data get entity @e Comp.Tag.mytag
data get entity @e Comp.Tag.mytag[0]
data get entity @e Comp.Tag.mytag[{Slot:1b}]

# Удалить знания о крафтах из NBT
    recipe take @s



# NBT
    Item: {id:"",count:10b,tag:{Enchantments:[{lvl:2s, id:"..."}]}}

    # Скелет, Зомби, арморстенд
        ArmorItems:[{id:""},{id:""},{id:""},{id:""}],
        HandItems:[{id:""},{id:""}]

    # Все мобы
        Time: 1b
        Motion: [1.0d,1.0d,1.0d]
        Health: 20f

        # Дать эффект
            ActiveEffects:[{id:8,amplifier:1,duration:10}]
        # Неуязвимость
            Invulnerable: 1b;

        # Стоять на месте
            NoAI: 1b;

    # Слайм
        Size: 1;

    # Свинья
        Saddle: 1b;

    # Player
    scoreboard players tag @a add frost {
        SelectedItem:{count:1 id:"minecraft:ise"},
        SelectedItemSlot: 0
    }

    # Armor Stand
    summon armor_stand ~ ~ ~ {
        Invisible: 1b,
        Invulnerable: 1b,
        NoBasePlate: 1b,
        NoGravity: 1b,
        ShowArms: 1b,
        Small: 1b,

        CustomName:"{
            \"text\":\"Hell\",
            \"color\":\"black\",
            \"bold\":\"true\",
            \"italic\":\"true\",
            \"obfuscated\":\"true\",
            \"strikethrough\":\"true\"
        }",

        CustomNameVisible:1b

        Rotation: [11f],
        Pose: {
            Body: [45f, 45f, 45f],
            Head: [45f, 45f, 45f],

            LeftArm: [45f, 45f, 45f],
            RightArm:  [45f, 45f, 45f],

            LeftLeg: [45f, 45f, 45f],
            RightLeg: [45f, 45f, 45f]
        }
    }

# Функции
# Для функций сохратить в world\function\myfunc\walk.mcfunction

reload

datapack list

function myfunc:walk
function myfunc:walk if @a[name=friend]
function myfunc:walk unless @a[name=friend]

gamerule gameLoopFunction myfunc:walk
