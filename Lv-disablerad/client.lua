CreateThread(function()
    local wasInVehicle = false
    while true do
        local playerPed = PlayerPedId()
        local isInVehicle = IsPedInAnyVehicle(playerPed, false)
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if isInVehicle then
            -- Disable radio controls and vehicle radio
            SetUserRadioControlEnabled(false)
            SetVehicleRadioEnabled(vehicle, false)
            SetVehRadioStation(vehicle, "OFF")
        else
            if wasInVehicle then
                SetUserRadioControlEnabled(true)
            end
        end

        wasInVehicle = isInVehicle
        Wait(50) -- Check more frequently to reduce delay
    end
end)