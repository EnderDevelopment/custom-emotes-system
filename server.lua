local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('custom_emotes:getEmotes', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM ' .. Config.Database.table, {}, function(result)
        cb(result)
    end)
end)

RegisterCommand('addemote', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'admin' then
        if #args == 4 then
            MySQL.Async.execute('INSERT INTO ' .. Config.Database.table .. ' (name, dict, anim, category) VALUES (@name, @dict, @anim, @category)', {
                ['@name'] = args[1],
                ['@dict'] = args[2],
                ['@anim'] = args[3],
                ['@category'] = args[4]
            }, function(rowsChanged)
                TriggerClientEvent('esx:showNotification', source, 'Emote added successfully!')
            end)
        else
            TriggerClientEvent('esx:showNotification', source, 'Usage: /addemote [name] [dict] [anim] [category]')
        end
    else
        TriggerClientEvent('esx:showNotification', source, 'You do not have permission to use this command!')
    end
end, false)