API = {}
load(LoadResourceFile('vrp', 'lib/utils.lua'))()
local Proxy = module('lib/Proxy')
local vRP = Proxy.getInterface('vRP')

API.getId = vRP.Passport
API.getBank = function(id)
  local source = vRP.Source(id)
  return vRP.GetBank(source)
end
API.addBank = function(id, amount) vRP.GiveBank(id, amount) end
API.subBank = function(id, amount) vRP.RemoveBank(id, amount) end
API.giveItem = vRP.GiveItem
API.getIdentity = vRP.Identity

local __prepares = {}
function API.prepare(name, query)
  __prepares[name] = query
end

function API.query(name, args)
  local code = __prepares[name]
  return exports.oxmysql:querySync(code, args)
end

API.execute = API.query

config = json.decode(LoadResourceFile(GetCurrentResourceName(), 'config.json'))
assert(config, 'Config com problemas de formatação')

function throw(message)
  error({ __error = message })
end

function assert(test, message) -- lua default assert sucks
  if not test then
    throw(message)
  end
  return test
end

function expose(name, cb)
  Main[name] = function(...)
    local ok, res = pcall(cb, ...)
    if not ok and type(res) == 'string' then
      print('Um erro ocorreu na execução do método '..name)
      print('Argumentos: '..json.encode({...}))
      print('Erro: '..res)
    end
    return res
  end
end

function pusher(source, name, ...)
  assert(name, 'Pusher invalido')
  emitNet('smartphone-jobs:pusher', source, name, ...)
end

function notify(source, app, title, subtitle)
  emitNet('smartphone:pusher', source, 'CUSTOM_NOTIFY', {
    app = app, title = title, subtitle = subtitle
  })
end

function sendSMS(source, text)
  emitNet('smartphone:createSMS', source, '0800 756', text)
end

function table.findBy(t, key, value)
  for _, o in pairs(t) do
    if o[key] == value then
      return o
    end
  end
end

function table.filter(t, callback)
  local res = {}
  for key, val in pairs(t) do
    if callback(val, key) then
      table.insert(res, val)
    end
  end
  return res
end

function table.map(t, callback)
  local o = {}
  for k, v in pairs(t) do
    o[k] = callback(v, k)
  end
  return o
end

function table.reduce(t, cb, initial)
  for k, v in pairs(t) do
    initial = cb(initial, v, k)
  end
  return initial
end

function table.clone(o)
  if type(o) == "table" then
    local r = {}
    
    for k, v in pairs(o) do
      r[k] = table.clone(v)
    end

    return r
  end
  return o
end

function generateId(isTaken)
  local str = ''
  for i=1, 10 do
    if math.random() <= 0.5 then
      str = str .. string.char(math.random(65, 90))
    else
      str = str .. string.char(math.random(48, 57))
    end
  end

  if isTaken(str) then
    str = generateId(isTaken)
  end

  return str
end

function toInt(n)
  return math.floor(tonumber(n))
end

function isPedAlive(ped)
  return GetEntityHealth(ped) > 101
end