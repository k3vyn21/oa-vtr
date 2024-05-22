--
-- Var
--
Money = math.random(40000, 50000)

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterServerCallback('oa-vtr:giveItem', function(source, cb, item, count)
    local user = ESX.GetPlayerFromId(source)
    user.addInventoryItem(item, count)
end)

ESX.RegisterServerCallback('oa-vtr:removeItem', function(source, cb, item, count)
    local user = ESX.GetPlayerFromId(source)
    user.removeInventoryItem(item, count)
end)

ESX.RegisterServerCallback('oa-vtr:addMoney', function(source, cb)
    local user = ESX.GetPlayerFromId(source)
    user.addMoney(Money)
    --TriggerClientEvent('chatMessage', user.source, 'VTR', {255, 0, 0}, ' Has recibido '..Money.."$")
    TriggerClientEvent("pNotify:SendNotification", user.source, {text = "<center><strong><b style='color:#9e66f2'>VTR</b><strong><br /> <br /> Toma aqui tienes tu dinero $ "..Money.." <center>", type = "info", queue = "global", timeout = 5000, layout = "centerRight" })
end)