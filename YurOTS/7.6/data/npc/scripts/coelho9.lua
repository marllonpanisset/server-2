focus = 0
talk_start = 0
target = 0
following = false
attacking = false

function onThingMove(creature, thing, oldpos, oldstackpos)
end

function onCreatureAppear(creature)
end


function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Feliz P�scoa!')
focus = 0
talk_start = 0
end
end

function onCreatureTurn(creature)
end

function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function onCreatureSay(cid, type, msg)
msg = string.lower(msg)

if ((string.find(msg, '(%a*)hi(%a*)')) and (focus == 0)) and getDistanceToCreature(cid) < 4 then
selfSay('Oi ' .. creatureGetName(cid) .. '! Parabens, e feliz P�scoa.')
focus = cid
talk_start = os.clock()
end

if string.find(msg, '(%a*)hi(%a*)') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
selfSay('Ops, ' .. creatureGetName(cid) .. '! Espera s� um Min.')
end


if string.find(msg, '(%a*)e meu presente?(%a*)') and focus == cid and getDistanceToCreature(cid) < 4 then
present = getPlayerStorageValue(cid,2644)
present = getPlayerStorageValue(cid,2355)
if present == -1 then
buy(cid,item,1,0)
setPlayerStorageValue(cid,2644,1)
setPlayerStorageValue(cid,2355,1)
end

if present == 1 then
selfSay('Desculpe, mais vc ja ganhou, FELIZ P�SCOA.')
end
end


if string.find(msg, '(%a*)bye(%a*)') and focus == cid and getDistanceToCreature(cid) < 4 then
selfSay('At� mais, ' .. creatureGetName(cid) .. '!')
focus = 0
talk_start = 0
end
end


function onCreatureChangeOutfit(creature)
end


function onThink()
if (os.clock() - talk_start) > 30 then
if focus > 0 then
selfSay('Feliz P�scoa!')
end
focus = 0
end
if focus ~= 0 then
if getDistanceToCreature(focus) > 3 then
selfSay('Feliz P�scoa!')
focus = 0
end
end
if focus == 0 then
cx, cy, cz = selfGetPosition()
randmove = math.random(1,25)
if randmove == 1 then
nx = cx + 1
end
if randmove == 2 then
nx = cx - 1
end
if randmove == 3 then
ny = cy + 1
end
if randmove == 4 then
ny = cy - 1
end
if randmove >= 5 then
nx = cx
ny = cy
end
moveToPosition(nx, ny, cz)
--summons = 30
--summons2 = 30
end
if focus > 0 then
rand = math.random(1,6)
if rand == 1 then
item = 2644
elseif rand == 2 then
item = 2355
elseif rand == 3 then
item = 2644
elseif rand == 4 then
item = 2355
elseif rand == 5 then
item = 2644
else
item = 2133
end

end

if focus == 0 then
randsay = math.random(1,75)
if randsay == 1 then
selfSay('Feliz P�scoa')
end
if randsay == 2 then
selfSay('Feliz P�scoa')
end
end
end