local ESX = nil
local emotes = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    RegisterCommand(Config.Command, function()
        ESX.TriggerServerCallback('custom_emotes:getEmotes', function(emotesList)
            emotes = emotesList
            SetNuiFocus(true, true)
            SendNUIMessage({
                type = 'open',
                emotes = emotes
            })
        end)
    end, false)

    RegisterNUICallback('close', function(data, cb)
        SetNuiFocus(false, false)
        cb('ok')
    end)

    RegisterNUICallback('playEmote', function(data, cb)
        local emote = emotes[data.id]
        if emote then
            RequestAnimDict(emote.dict)
            while not HasAnimDictLoaded(emote.dict) do
                Citizen.Wait(0)
            end
            TaskPlayAnim(PlayerPedId(), emote.dict, emote.anim, 8.0, -8.0, -1, 0, 0, false, false, false)
        end
        cb('ok')
    end)
end)