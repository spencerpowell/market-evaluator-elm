module Update exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnNextClick  ->
            if model.pageIndex > 0 && model.selectedRating == 0 then
                ( { model | error = "Pick a number on the scale before proceeding!" }, Cmd.none )
            else if model.pageIndex == 10 then
                ( { model | pageIndex = model.pageIndex + 1,
                            totalScore = (List.sum model.scores) + model.selectedRating,
                            selectedRating = 0,
                            scores = model.selectedRating :: model.scores }, Cmd.none )
            else
                ( { model | pageIndex = model.pageIndex + 1,
                            selectedRating = 0,
                            scores = model.selectedRating :: model.scores }, Cmd.none )
        Msgs.OnPrevClick ->
            ( { model | pageIndex = model.pageIndex - 1,
                        selectedRating = 0,
                        scores = List.drop 1 model.scores,
                        error = "" }, Cmd.none )
        Msgs.OnScaleSelect rating ->
            ( { model | selectedRating = rating,
                        error = "" }, Cmd.none )
        Msgs.StartOver ->
            ( { model | selectedRating = 0,
                        pageIndex = 0,
                        totalScore = 0,
                        scores = [] }, Cmd.none )
