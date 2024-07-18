local QBCore = exports['qb-core']:GetCoreObject()
local isUIVisible = false
local keybind = 'I'

RegisterCommand('toggleui', function()
    ToggleUI()
end)

function ToggleUI()
    TriggerServerEvent('QBCore:Server:UpdatePlayer')
    isUIVisible = not isUIVisible
    SetNuiFocus(isUIVisible, isUIVisible)
    SendNUIMessage({
        type = 'TOGGLE_UI',
        isVisible = isUIVisible
    })
end

RegisterKeyMapping('toggleui', 'Toggle UI', 'keyboard', keybind)