module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id, class, value, href)
import Html.Events exposing (onClick)
import List.Extra exposing (getAt)
import Models exposing (Model)
import Msgs exposing (Msg)

view : Model -> Html Msg
view model =
    div []
        [ title model
        , prompt model
        , chartScale model
        , example model
        , navigationBtns model
        , error model
        ]

error : Model -> Html Msg
error model =
    div [ class "error" ] [ text model.error ]

title : Model -> Html Msg
title model =
    let title = List.Extra.getAt model.pageIndex model.titles
                    |> Maybe.withDefault ""
    in
        if model.pageIndex == 11 then
            h2 [ id "title" ] [ text (String.append title (toString model.totalScore)) ]
        else
            h2 [ id "title" ] [ text title ]

prompt : Model -> Html Msg
prompt model =
    let prompt = List.Extra.getAt model.pageIndex model.prompts
                    |> Maybe.withDefault ""
    in
        if model.pageIndex == 11 then
            if model.totalScore < 50 then
                let advice = List.Extra.getAt 0 model.adviceResults
                    |> Maybe.withDefault ""
                in
                    p [ id "prompt" ] [ text advice ]
            else if model.totalScore < 76 then
                let advice = List.Extra.getAt 1 model.adviceResults
                    |> Maybe.withDefault ""
                in
                    p [ id "prompt" ] [ text advice ]
            else
                let advice = List.Extra.getAt 2 model.adviceResults
                    |> Maybe.withDefault ""
                in
                    p [ id "prompt" ] [ text advice ]
        else
            p [ id "prompt" ] [ text prompt ]

example : Model -> Html Msg
example model =
    let example = List.Extra.getAt model.pageIndex model.examples
                    |> Maybe.withDefault ""
    in
        p [ id "example" ] [ text example ]

nextBtn : Model -> Html Msg
nextBtn model =
    let message = Msgs.OnNextClick
    in
        if model.pageIndex == 0 then
            a
                [ href "#"
                , id "nextBtn"
                , class "btn"
                , onClick message
                ] [ text "Begin" ]
        else if model.pageIndex == 10 then
            a
                [ href "#"
                , id "nextBtn"
                , class "btn"
                , onClick message
                ] [ text "Finish" ]
        else if model.pageIndex == 11 then
            let startOver = Msgs.StartOver
            in
                a
                    [ href "#"
                    , id "nextBtn"
                    , class "btn"
                    , onClick startOver
                    ] [ text "Start Over" ]
        else
            a
                [ href "#"
                , id "nextBtn"
                , class "btn"
                , onClick message
                ] [ text "Next" ]

prevBtn : Model -> Html Msg
prevBtn model =
    let message = Msgs.OnPrevClick
    in
        if model.pageIndex == 0 then
            text ""
        else
            a
                [ href "#"
                , id "prevBtn"
                , class "btn"
                , onClick message
                ] [ text "Previous" ]

navigationBtns : Model -> Html Msg
navigationBtns model =
    div [ id "navigation" ]
        [ prevBtn model
        , nextBtn model ]

chartScale : Model -> Html Msg
chartScale model =
    if model.pageIndex > 0 && model.pageIndex < 11 then
            div [ class "chart-scale" ]
                [ button1
                , button2
                , button3
                , button4
                , button5
                , button6
                , button7
                , button8
                , button9
                , button10 ]
    else
        text ""

button1 : Html Msg
button1 =
    let message = Msgs.OnScaleSelect 1
    in
        a
            [ id "btn-scale-1"
            , href "#btn-scale-1"
            , class "btn btn-scale"
            , onClick message] [ text "1" ]

button2 : Html Msg
button2 =
    let message = Msgs.OnScaleSelect 2
    in
        a
            [ id "btn-scale-2"
            , href "#btn-scale-2"
            , class "btn btn-scale"
            , onClick message] [ text "2" ]

button3 : Html Msg
button3 =
    let message = Msgs.OnScaleSelect 3
    in
        a
            [ id "btn-scale-3"
            , href "#btn-scale-3"
            , class "btn btn-scale"
            , onClick message] [ text "3" ]

button4 : Html Msg
button4 =
    let message = Msgs.OnScaleSelect 4
    in
        a
            [ id "btn-scale-4"
            , href "#btn-scale-4"
            , class "btn btn-scale"
            , onClick message] [ text "4" ]

button5 : Html Msg
button5 =
    let message = Msgs.OnScaleSelect 5
    in
        a
            [ id "btn-scale-5"
            , href "#btn-scale-5"
            , class "btn btn-scale"
            , onClick message] [ text "5" ]

button6 : Html Msg
button6 =
    let message = Msgs.OnScaleSelect 6
    in
        a
            [ id "btn-scale-6"
            , href "#btn-scale-6"
            , class "btn btn-scale"
            , onClick message] [ text "6" ]

button7 : Html Msg
button7 =
    let message = Msgs.OnScaleSelect 7
    in
        a
            [ id "btn-scale-7"
            , href "#btn-scale-7"
            , class "btn btn-scale"
            , onClick message] [ text "7" ]

button8 : Html Msg
button8 =
    let message = Msgs.OnScaleSelect 8
    in
        a
            [ id "btn-scale-8"
            , href "#btn-scale-8"
            , class "btn btn-scale"
            , onClick message] [ text "8" ]

button9 : Html Msg
button9 =
    let message = Msgs.OnScaleSelect 9
    in
        a
            [ id "btn-scale-9"
            , href "#btn-scale-9"
            , class "btn btn-scale"
            , onClick message] [ text "9" ]

button10 : Html Msg
button10 =
    let message = Msgs.OnScaleSelect 10
    in
        a
            [ id "btn-scale-10"
            , href "#btn-scale-10"
            , class "btn btn-scale"
            , onClick message] [ text "10" ]
