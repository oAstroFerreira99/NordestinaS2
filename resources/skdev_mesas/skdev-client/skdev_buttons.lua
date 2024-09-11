function setupScaleform(scaleform)
    local sf = RequestScaleformMovie(scaleform)

    while not HasScaleformMovieLoaded(sf) do
        Citizen.Wait(1)
    end

    PushScaleformMovieFunction(sf, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(sf, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieMethodParameterButtonName(GetControlInstructionalButton(0, 191, true))
    PushScaleformMovieFunctionParameterString("Colocar Mesa")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(sf, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    PushScaleformMovieMethodParameterButtonName(GetControlInstructionalButton(0, 45, true))
    PushScaleformMovieFunctionParameterString("Rotacionar a Mesa")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(sf, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    PushScaleformMovieMethodParameterButtonName(GetControlInstructionalButton(0, 177, true))
    PushScaleformMovieFunctionParameterString("Cancelar")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(sf, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    return sf
end