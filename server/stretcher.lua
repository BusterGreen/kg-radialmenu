RegisterNetEvent('kg-radialmenu:server:RemoveStretcher', function(pos, stretcherObject)
    TriggerClientEvent('kg-radialmenu:client:RemoveStretcherFromArea', -1, pos, stretcherObject)
end)

RegisterNetEvent('kg-radialmenu:Stretcher:BusyCheck', function(target, type)
    local src = source
    if not IsCloseToTarget(src, target) then return end
    TriggerClientEvent('kg-radialmenu:Stretcher:client:BusyCheck', target, source, type)
end)

RegisterNetEvent('kg-radialmenu:server:BusyResult', function(isBusy, target, type)
    local src = source
    if not IsCloseToTarget(src, target) then return end
    TriggerClientEvent('kg-radialmenu:client:Result', target, isBusy, type)
end)
