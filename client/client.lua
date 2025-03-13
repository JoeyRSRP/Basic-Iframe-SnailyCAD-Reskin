local tablet_open = false

local function close()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        Prop.DeleteProp()
        ClearPedTasksImmediately(PlayerPedId())
    end

    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "close",
    })
    tablet_open = false
end

local function open()
    if tablet_open then
        close()
        Citizen.Wait(1000)
        return
    end

    tablet_open = true

    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        Animation.Play()
        Prop.CreateProp()
    end

    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open",
        url = Config.CAD_URL,
    })
end

local function testCadAnim()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        local animDict, animName = Animation.Play()
        Prop.CreateProp()

        Citizen.CreateThread(function()
            local ped = PlayerPedId()

            while true do
                Citizen.Wait(0)

                local animTime = GetEntityAnimCurrentTime(ped, animDict, animName)

                if animTime == 1.0 or IsPedRunning(ped) or IsPedWalking(ped) then
                    Prop.DeleteProp()
                    break
                end
            end
        end)
    end
end

RegisterCommand(Config.CadCommand, open, false)

if Config.EnableTestCommand then
    RegisterCommand(Config.TestCadAnimCommand, testCadAnim, false)
end

RegisterNUICallback("close", function(data, cb)
    close()
    cb({ ok = true })
end)