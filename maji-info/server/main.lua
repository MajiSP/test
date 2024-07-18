QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Server:UpdatePlayer', function(data)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local age = CalculateAge(Player.PlayerData.charinfo.birthdate)
        local cash = Player.PlayerData.money.cash
        local bank = Player.PlayerData.money.bank
        local phone = Player.PlayerData.charinfo.phone
        local nationality = Player.PlayerData.charinfo.nationality
        local birthdate = Player.PlayerData.charinfo.birthdate
        TriggerClientEvent('maji-info:sendInfo', source, age, cash, bank, phone, nationality, birthdate)
    end
end)

function CalculateAge(birthdate)
    local year, month, day = string.match(birthdate, "(%d+)-(%d+)-(%d+)")
    local birthtime = os.time({year=year, month=month, day=day})
    local currenttime = os.time()
    local playerAge = os.date("*t", currenttime - birthtime).year - 1970
    return playerAge
end