Animation = {}

function Animation.Play()
    local ped = PlayerPedId()

    local animationDuration = -1
    local animationFlag = 1

    local animationDictionary = Config.AnimationDictionary
    local animation = Config.AnimationName

    RequestAnimDict(animationDictionary)

    while not HasAnimDictLoaded(animationDictionary) do
        Citizen.Wait(0)
    end

    TaskPlayAnim(ped, animationDictionary, animation, 8.0, -8.0, animationDuration, animationFlag, 0, false, false, false)

    return animationDictionary, animation
end