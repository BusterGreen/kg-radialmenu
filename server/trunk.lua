local KGCore = exports['kg-core']:GetCoreObject()
local trunkBusy = {}

function IsCloseToTarget(source, target)
    if not DoesPlayerExist(target) then return false end
    return #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 2.0
end

RegisterNetEvent('kg-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('kg-radialmenu:trunk:client:Door', -1, plate, door, open)
end)

RegisterNetEvent('kg-trunk:server:setTrunkBusy', function(plate, busy)
    trunkBusy[plate] = busy
end)

RegisterNetEvent('kg-trunk:server:KidnapTrunk', function(target, closestVehicle)
    local src = source
    if not IsCloseToTarget(src, target) then return end
    TriggerClientEvent('kg-trunk:client:KidnapGetIn', target, closestVehicle)
end)

KGCore.Functions.CreateCallback('kg-trunk:server:getTrunkBusy', function(_, cb, plate)
    if trunkBusy[plate] then
        cb(true)
        return
    end
    cb(false)
end)

KGCore.Commands.Add('getintrunk', Lang:t('general.getintrunk_command_desc'), {}, false, function(source)
    TriggerClientEvent('kg-trunk:client:GetIn', source)
end)

KGCore.Commands.Add('putintrunk', Lang:t('general.putintrunk_command_desc'), {}, false, function(source)
    TriggerClientEvent('kg-trunk:server:KidnapTrunk', source)
end)
