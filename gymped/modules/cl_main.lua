local QBCore = exports['qb-core']:GetCoreObject()
local pedCoords = vec3(258.89, -269.9, 53.00)
local pedModel = 'a_f_m_bodybuild_01'

RequestModel(pedModel)
while not HasModelLoaded(pedModel) do
    Wait(1)
end

local gymPed = CreatePed(4, pedModel, pedCoords.x, pedCoords.y, pedCoords.z, 0.0, false, true)

SetEntityAsMissionEntity(gymPed, true, true)
FreezeEntityPosition(gymPed, true)
SetBlockingOfNonTemporaryEvents(gymPed, true)
SetPedDiesWhenInjured(gymPed, false)

exports.ox_target:addLocalEntity(gymPed, {
    {
        name = 'gymstats',
        icon = 'fas fa-dumbbell',
        label = 'Sjekk statistikk',
        onSelect = function(data)
            ExecuteCommand("gymstats")
        end,
        canInteract = function(entity, distance, coords, name)
            return true
        end
    }
})

RegisterCommand("gymstats", function(source, args, rawCommand)
    print("Åpner statistikkliste") 
end, false)
